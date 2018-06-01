<?php
include_once 'views/View.php';

class DepartamentosView extends View {

    function __construct() {
        parent::__construct();
    }

    function getHome($departamentos) {
        $this->smarty->assign('departamentos',$departamentos);
        $this->smarty->display("index.tpl");
    }
}
?>