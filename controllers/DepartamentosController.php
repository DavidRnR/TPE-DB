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
        $departamentos = $this->getDepartamentos();
        $this->view->getHome($departamentos);
    }

    function getDepartamentos() {
        return $this->model->getDepartamentos();
    }
}
?>