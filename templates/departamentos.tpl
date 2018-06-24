<div class="row">
    {if !empty($departamentos)}
    <div class="col-12">
        <div class="card-columns">
            {foreach from=$departamentos key=index item=depto}
            <div class="card mb-4">
                <div id="carousel-depto-{$depto.id_dpto}" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">
                        {foreach from=$depto.images key=ind item=imageDepto} 
                        {if $ind == 0}
                        <div class="carousel-item active">
                            <img class="d-block w-100" src="{$imageDepto}" alt="Departamento Image">
                        </div>
                        {else}
                        <div class="carousel-item">
                            <img class="d-block w-100" src="{$imageDepto}" alt="Departamento Image">
                        </div>
                        {/if} 
                        {/foreach}
                    </div>
                    <a class="carousel-control-prev" href="#carousel-depto-{$depto.id_dpto}" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carousel-depto-{$depto.id_dpto}" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
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