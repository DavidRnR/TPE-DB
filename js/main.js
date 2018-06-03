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

formSearchDepto.addEventListener('submit', (event) => {
    event.preventDefault();
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

function getData(param, action) {
    event.preventDefault()
    let headers = new Headers();
    headers.append("Accept", "application/json");
    headers.append("Content-Type", "application/json");

    let options = {
        headers: headers,
        mode: 'no-cors',
        cache: 'default'
    };
    let myRequest = new Request(action + '&id_depto=' + param, options);

    setTimeout(() => {
        fetch(myRequest).then((data) => {
            return data.text();
        }).then((data) => {
           
            // Render Data
            appLoader.innerHTML = data;

            vanillaCalendar = getCalendar();

            console.dir(vanillaCalendar);
            vanillaCalendar.init({
                disablePastDays: false
            });
           
        });
    }, 1000);
}

/**
 * Set Search Bar small
 */
function setSearchbarSmall() {
    console.dir(searchBar);
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
function getSpinner() {
    let containerSpinner = document.createElement('div');
    containerSpinner.className = 'row justify-content-center';
    let loadingSpinner = document.createElement('i');
    loadingSpinner.className = 'fa fa-spinner fa-spin fa-2x';
    containerSpinner.appendChild(loadingSpinner);

    return containerSpinner;
}