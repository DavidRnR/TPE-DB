// App Loader
var appLoader = document.querySelector('#dinamic-container');
var formSearchDepto = document.querySelector('#search-depto');

// Home Nav
var homeNav = document.querySelector('#home-nav');
homeNav.addEventListener('click', () => {
    location.reload();
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

    // Build Body Data
    let formData = new FormData();
    formData.append('ciudad', event.target["ciudad"].value);

    let options = {
        method: 'POST',
        headers: headers,
        body: formData,
        mode: 'no-cors',
        cache: 'default'
    };
    let myRequest = new Request('getDepartamentos', options);

    // Show Spinner
    appLoader.innerHTML = '';
    appLoader.appendChild(getSpinner());

    setTimeout(() => {
        fetch(myRequest).then((data) => {
            return data.text();
        }).then((data) => {

            // Show Search Bar small
            setSearchbarSmall();
            // Render Data
            appLoader.className += " fadeIn";
            appLoader.innerHTML = data;
        });
    }, 1000);

});

function getData(param, action, renderFunction = null, api = false) {
    event.preventDefault();

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

    if(api) {
        endpoint = 'api/' + param;
    }
    let myRequest = new Request(endpoint, options);

    setTimeout(() => {
        fetch(myRequest).then((data) => {
            if(api) {
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

            if (!vanillaCalendar) {
                createCalendar();
            }

        });
    }, 1000);
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
            calendarDate.setHours(0,0,0,0);

            for (let i = 0; i < reservas.length; i++) {
                // Parse Dates
                var d = reservas[i].fecha_desde.split("-");
                var desde = new Date(d[0], d[1] - 1, d[2]);
                var h = reservas[i].fecha_hasta.split("-");
                var hasta = new Date(h[0], h[1] - 1, h[2]);

                // Apply Style to Calendar
                if ( calendarDate >= desde && calendarDate <= hasta ) {
                    vanillaCalendar.month.children[index].className += ' day-reserved';
                }
                
            }
        }
    }

}

/**
 * Get Info Departamento
 * @param {*} param 
 * @param {*} action 
 */
function getDepto(param, action) {

    // Save Current Depto 
    deptoID = param;

    getData(param, action);
}

/**
 * Set Search Bar small
 */
function setSearchbarSmall() {
    searchBar.className += ' search-bar-small';
    // Logo 
    searchBar.children[0].className = 'col-3 logo-home logo-home-small';
    // Form
    searchBar.children[1].className = 'col-5 form-search-depto form-search-depto-small';
    searchBar.children[1].children[0].children[1].className = 'col-6 mb-2';
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