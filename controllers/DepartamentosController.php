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

        if (isset($_POST['ciudad'])) {
            $ciudad = $_POST['ciudad'];
        }

        if ($ciudad) {
            // Find by Ciudad
            $departamentos = $this->model->getDepartamentosByCiudad($ciudad);
        } else {
            // Find All
            $departamentos = $this->model->getDepartamentos();
        }
        $this->view->getDepartamentos($departamentos);
    }

    function getDepartamento() {

        if (isset($_GET['id_depto'])) {
            $deptoId = $_GET['id_depto'];
            $departamento = $this->model->getDepartamentoById($deptoId);
            $this->view->getDepartamento($departamento);
        }
    }
}
?>