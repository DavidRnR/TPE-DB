<div class="row">
    {if !empty($departamentos)}
    <div class="col-12">
        <div class="card-columns">
            {foreach from=$departamentos key=index item=depto}
            <div class="card">
                <img class="card-img-top" src="img/deptoTest.jpg" alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title">Departamento</h5>
                    <p class="card-text">{$depto.descripcion}</p>
                    <p class="card-text">Superficie: {$depto.superficie}m<sup>2</sup></p>
                    <p class="card-text">Ubicación: {$depto.ciudad}</p>
                    <a href="#" class="btn btn-primary" onClick="getData('{$depto.id_dpto}','getDepartamento')">Disponibilidad</a>
                </div>
            </div>
            {/foreach}
        </div>
    </div>
    {else}
    <div class="col-12 text-center">
        <p>No se encontraron resultados</p>
    </div>
    {/if}
</div>