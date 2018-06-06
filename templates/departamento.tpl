<div class="row">
    <div class="col-5">

        <div class="card">
            <img class="card-img-top" src="img/deptoTest.jpg" alt="Card image cap">
            <div class="card-body">
                <h5 class="card-title">Departamento</h5>
                <p class="card-text">{$departamento.descripcion}</p>
                <p class="card-text">Superficie: {$departamento.superficie}m
                    <sup>2</sup>
                </p>
                <p class="card-text">Ubicación: {$departamento.ciudad}</p>
            </div>
        </div>

    </div>
    <div class="row col-7 d-flex justify-content-center align-self-center">
		<div class="col-8" id="v-cal">
			<div class="vcal-header">
				<button class="vcal-btn" data-calendar-toggle="previous">
					<svg height="24" version="1.1" viewbox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
						<path d="M20,11V13H8L13.5,18.5L12.08,19.92L4.16,12L12.08,4.08L13.5,5.5L8,11H20Z"></path>
					</svg>
				</button>

				<div class="vcal-header__label" data-calendar-label="month">
					March 2017
				</div>


				<button class="vcal-btn" data-calendar-toggle="next">
					<svg height="24" version="1.1" viewbox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
						<path d="M4,11V13H16L10.5,18.5L11.92,19.92L19.84,12L11.92,4.08L10.5,5.5L16,11H4Z"></path>
					</svg>
				</button>
			</div>
			<div class="vcal-week">
				<span>Lun</span>
				<span>Mar</span>
				<span>Mie</span>
				<span>Jue</span>
				<span>Vie</span>
				<span>Sab</span>
				<span>Dom</span>
			</div>
			<div class="vcal-body" data-calendar-area="month"></div>
		</div>
		<div class="row col-8 legend-months">
			<p><i class="fas fa-square fa-fw"></i>Reservado</p>
		</div>
    </div>
</div>