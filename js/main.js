// App Loader
var appLoader = document.getElementById('dinamic-container');
var formSearchDepto = document.querySelector('#search-depto');

formSearchDepto.addEventListener('submit', (event) => {
    event.preventDefault();
    let headers = new Headers();
    headers.append("Accept", "application/json");
    headers.append("Content-Type", "application/json");
   
    let options = {
        method: 'POST',
        headers: headers,
        mode: 'no-cors',
        cache: 'default'
    };
    let myRequest = new Request('getDepartamentos', options);

    // Show Spinner
    appLoader.appendChild(getSpinner());

    setTimeout( ()=> {
        fetch(myRequest).then((data) => {
            return data.text();
        }).then( (data) => {
            console.log(data);
            appLoader.innerHTML = data;
        });
    }

    , 2000);
  
});


function getSpinner () {
    let containerSpinner = document.createElement('div');
    containerSpinner.className = 'row justify-content-center';
    let loadingSpinner = document.createElement('i');
    loadingSpinner.className = 'fa fa-spinner fa-spin fa-2x';
    containerSpinner.appendChild(loadingSpinner);

    console.dir(containerSpinner);
return containerSpinner;
}