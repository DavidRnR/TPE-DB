<div class="row">
    {if !empty($departamentos)}
    <div class="col-12">
        <div class="card-columns">
            {foreach from=$departamentos key=index item=depto}
            <div class="card mb-4">
                <img class="card-img-top" src="{$depto.path}" alt="Card image cap">
                <div class="card-body">
                    <div class="departamento-header">
                        <h5 class="card-title">Departamento</h5>
                        <fieldset class="col-12 rating" data-rating="{$depto.rating}">
                            <!-- Rating made it by JS -->
                        </fieldset>
                    </div>
                    <p class="card-text">{$depto.descripcion}</p>
                    <p class="card-text">Superficie: {$depto.superficie}m
                        <sup>2</sup>
                    </p>
                    <p class="card-text">Ubicación: {$depto.ciudad}</p>
                    <a href="#" class="btn btn-primary" onClick="getDepto('{$depto.id_dpto}','getDepartamento')">Disponibilidad</a>
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