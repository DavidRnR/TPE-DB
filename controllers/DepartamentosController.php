<?php
include_once "models/DepartamentosModel.php";
include_once "views/DepartamentosView.php";

class DepartamentosController {

    private $model;
    private $view;

    function __construct() {
        $this->model = new DepartamentosModel();
        $this->view = new DepartamentosView();
    }

    function start() {
        $ciudades = $this->model->getCiudades();
        $this->view->getHome($ciudades);
    }

    function getDepartamentos() {
        // All Ciudades by Default
        $ciudad = null;

        if (isset($_GET['ciudad'])) {
            $ciudad = $_GET['ciudad'];
        }

        if ($ciudad) {
            // Find by Ciudad
            $departamentos = $this->model->getDepartamentosByCiudad($ciudad);
        } else {
            // Find All
            $departamentos = $this->model->getDepartamentos();
        }
        
        // Set Images as Array
        for ($i=0; $i < count($departamentos) ; $i++) { 
            $images = $this->postgres_to_php_array($departamentos[$i]['images']);
            $departamentos[$i]['images'] = $images;
        }

        $this->view->getDepartamentos($departamentos);
    }

    /**
     * Get Depto by ID
     */
    function getDepartamento() {

        if (isset($_GET['id_depto'])) {
            $deptoId = $_GET['id_depto'];
            $departamento = $this->model->getDepartamentoById($deptoId);

            // Set Images as Array
            $images = $this->postgres_to_php_array($departamento['images']);
            $departamento['images'] = $images;
        
            $this->view->getDepartamento($departamento);
        }
    }

    /**
     * Convert Postgres Array to PHP Array
     */
    private function postgres_to_php_array($postgresArray){

        $postgresStr = trim($postgresArray, "{}");
        $elmts = explode(",",$postgresStr);
        return $elmts;
        
    }
}
?>