<?php
include_once 'views/View.php';

class DepartamentosView extends View {

    function __construct() {
        parent::__construct();
    }

    function getHome($ciudades) {
        $this->smarty->assign('ciudades',$ciudades);
        $this->smarty->display("index.tpl");
    }

    function getDepartamentos($departamentos) {
        $this->smarty->assign('departamentos',$departamentos);
        $this->smarty->display("departamentos.tpl");
    }

    function getDepartamento($departamento) {
        $this->smarty->assign('departamento',$departamento);
        $this->smarty->display("departamento.tpl");
    }
}
?>