<div class="row col-12 search-bar" id="search-bar">
    <div class="col-12 logo-home">
        <!-- Contains logo -->
    </div>
    <div class="col-12 text-center title-home">
        <h1>DGest</h1>
        <div class="col-12">Encuentra tu Departamento</div>
    </div>
    <div class="col-5 form-search-depto">
        <form class="form-inline" id="search-depto">
            <div class="col-1 mb-2">
                <label>Ciudad</label>
            </div>
            <div class="col-10 mb-2">
                <select name="ciudad">
                    <option value="0" selected>Todas</option>
                    {foreach from=$ciudades key=index item=ciudad}
                    <option value="{$ciudad.cod_postal}">{$ciudad.ciudad}</option>
                    {/foreach}
                </select>
            </div>
            <div class="col-1">
                <button type="submit" class="btn btn-primary mb-2">
                    <i class="fas fa-search" aria-hidden="true"></i>
                </button>
            </div>
        </form>
    </div>
</div>


