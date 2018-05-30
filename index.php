<?php
require 'config/ConfigApp.php';
require 'controllers/DepartamentosController.php';

$controllerDepartamentos = new DepartamentosController();

$controllers = ['Departamentos' => $controllerDepartamentos];

// Routing - Default Departamentos
if (array_key_exists(ConfigApp::$ACTION, $_REQUEST) && array_key_exists($_REQUEST[ConfigApp::$ACTION], ConfigApp::$ACTIONS)) {
    $action = $_REQUEST[ConfigApp::$ACTION];
    $nombreController = ConfigApp::$ACTIONS[$action];
    $controllers[$nombreController]->{$action}();
} else {
    $controllerDepartamentos->start();
}
