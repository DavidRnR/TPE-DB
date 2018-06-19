// App Loader
var appLoader = document.querySelector('#dinamic-container');
var formSearchDepto = document.querySelector('#search-depto');

// Footer
var footer = document.querySelector('.footer');

// Home Nav
var homeNav = document.querySelector('#home-nav');
homeNav.addEventListener('click', () => {
    location.reload();
});

// Contacto
var contacto = document.querySelector('#contacto');
contacto.addEventListener('click', (event) => {
    event.preventDefault();
    getData(null, 'html/contacto.html', renderContacto);
});

// Search Bar
var searchBar = document.querySelector('#search-bar');

// Calendar
var vanillaCalendar;

// Current Depto
var deptoID;

formSearchDepto.addEventListener('submit', (event) => {
    event.preventDefault();

    // Restore Calendar
    vanillaCalendar = null;

    let headers = new Headers();
    headers.append("Accept", "application/json");
    headers.append("Content-Type", "application/json");

    let options = {
        headers: headers,
        mode: 'no-cors',
        cache: 'default'
    };

    // By Default
    let endpoint = 'getDepartamentos&ciudad=' + event.target["ciudad"].value;

    let myRequest = new Request(endpoint, options);

    // Show Spinner
    appLoader.innerHTML = '';
    appLoader.appendChild(getSpinner());

    fetch(myRequest).then((data) => {
        return data.text();
    }).then((data) => {

        // Show Search Bar small
        setSearchbarSmall();

        // Hide Footer
        footer.style.display = 'none';
        // Render Data
        appLoader.className += " fadeIn";
        appLoader.innerHTML = data;
        setRating();
    });

});

function getData(param, action, renderFunction = null, api = false) {

    let headers = new Headers();
    headers.append("Accept", "application/json");
    headers.append("Content-Type", "application/json");

    let options = {
        headers: headers,
        mode: 'no-cors',
        cache: 'default'
    };

    // By Default
    let endpoint = action + '&id_depto=' + param;

    if (api) {
        endpoint = 'api/' + param;
    }
    else if (param === null) {
        endpoint = action;
    }

    let myRequest = new Request(endpoint, options);

    fetch(myRequest).then((data) => {
        if (api) {
            return data.json();
        }
        else {
            return data.text();
        }
    }).then((data) => {

        // Render Data
        if (!renderFunction) {
            appLoader.innerHTML = data;
        }
        else {
            renderFunction(data);
        }

    });

}

/**
 * Create Calendar
 */
function createCalendar() {

    vanillaCalendar = getCalendar();

    vanillaCalendar.afterNext = getCurrentDate;
    vanillaCalendar.afterPrevious = getCurrentDate;

    vanillaCalendar.init({
        disablePastDays: false
    });

}

/**
 * Get Current Date from Calendar
 */
function getCurrentDate() {
    // getMonth() return 0 to 11 -  So plus 1 and make it 1 to 12 Months
    let month = parseInt(vanillaCalendar.date.getMonth()) + 1;

    let endpointParams = 'reservas/' + deptoID + '&month=' + month + ' &year=' + vanillaCalendar.date.getFullYear();
    //Hidden Month Until Update Reservas and show Spinner
    vanillaCalendar.clearCalendar();
    vanillaCalendar.month.appendChild(getSpinner('spinner-calendar'));
    // Get Data from API REST
    getData(endpointParams, null, updateReservasCalendar, true);
}

/**
 * Set in Calendar Days reserved
 * @param {*} reservas 
 */
function updateReservasCalendar(reservas) {
    // Append Month - Days
    vanillaCalendar.clearCalendar();
    vanillaCalendar.createMonth();

    if (reservas && reservas.length > 0) {
        for (let index = 0; index < vanillaCalendar.month.children.length; index++) {
            // Get Day from the Calendar and set Hours to Midnight
            calendarDate = new Date(vanillaCalendar.month.children[index].getAttribute('data-calendar-date'));
            calendarDate.setHours(0, 0, 0, 0);

            for (let i = 0; i < reservas.length; i++) {
                // Parse Dates
                var d = reservas[i].fecha_desde.split("-");
                var desde = new Date(d[0], d[1] - 1, d[2]);
                var h = reservas[i].fecha_hasta.split("-");
                var hasta = new Date(h[0], h[1] - 1, h[2]);

                // Apply Style to Calendar
                if (calendarDate >= desde && calendarDate <= hasta) {
                    vanillaCalendar.month.children[index].className += ' day-reserved';
                }

            }
        }
    }

}

/**
 * Render Depto
 * @param {*} data 
 */
function renderDepto(data) {
    appLoader.innerHTML = data;
    createCalendar();
    getCurrentDate();
    setRating();
}

/**
 * Get Info Departamento
 * @param {*} param 
 * @param {*} action 
 */
function getDepto(param, action) {

    // Save Current Depto 
    deptoID = param;

    getData(param, action, renderDepto);
}

function renderContacto(data) {
    document.querySelector('.container-fluid').innerHTML = data;
}

/**
 * Set Search Bar small
 */
function setSearchbarSmall() {

    searchBar.className += ' search-bar-small';
    // Logo 
    searchBar.children[0].className = 'col-3 logo-home logo-home-small';
    // Title
    searchBar.children[1].style.display = 'none';
    // Form
    searchBar.children[2].className = 'col-5 form-search-depto form-search-depto-small';
    searchBar.children[2].children[0].children[1].className = 'col-6 mb-2';
}

/**
 * Get Spinner - Loading
 */
function getSpinner(customClass = null) {
    let containerSpinner = document.createElement('div');
    containerSpinner.className = (customClass) ? customClass : 'row justify-content-center';
    let loadingSpinner = document.createElement('i');
    loadingSpinner.className = 'fa fa-spinner fa-spin fa-2x';
    containerSpinner.appendChild(loadingSpinner);

    return containerSpinner;
}

/**
 * Set Rating - Stars
 */
function setRating() {
    let fieldsRating = document.querySelectorAll('.rating');

    // Build Rating for each Departamento
    fieldsRating.forEach(element => {
        let rating = element.getAttribute('data-rating');

        let n = Math.floor(rating);
        let nAux = rating % 1;
        for (let index = 0; index < n; index++) {
            let star = document.createElement('i');
            star.className = 'fas fa-star fa-fw';
            element.appendChild(star);
        }
        // Half Star
        if (nAux && nAux > 0) {
            let halfStar = document.createElement('i');
            halfStar.className = 'fa fa-star-half';
            element.appendChild(halfStar);

            // Complete Rating Until 5 Stars
            for (let index = 0; index < 4 - n; index++) {
                let star = document.createElement('i');
                star.className = 'far fa-star fa-fw';
                element.appendChild(star);
            }
        }
        else {
            for (let index = 0; index < 5 - n; index++) {
                let star = document.createElement('i');
                star.className = 'far fa-star fa-fw';
                element.appendChild(star);
            }
        }

    });
}