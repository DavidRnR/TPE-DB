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
        $this->view->getHome();
    }

    function getDepartamentos() {
        $departamentos =  $this->model->getDepartamentos();
        $this->view->getDepartamentos($departamentos);
    }
}
?>