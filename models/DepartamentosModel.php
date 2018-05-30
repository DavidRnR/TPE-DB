<?php

include_once "models/Model.php";

class DepartamentosModel extends Model {
    
    function __construct() {
        parent::__construct();
    }

    function getDepartamentos() {
        // $deportistas = $this->db->prepare("SELECT d.*, p.nombre, p.apellido FROM gr18_deportista d NATURAL JOIN gr18_persona p");
        // $deportistas->execute();
        // return $deportistas->fetchAll(PDO::FETCH_ASSOC);
    }
   
}
?>