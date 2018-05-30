<?php
include_once 'views/View.php';

class DepartamentosView extends View {

    function __construct() {
        parent::__construct();
    }

    function getHome() {
        $this->smarty->display("index.tpl");
    }
}
?>