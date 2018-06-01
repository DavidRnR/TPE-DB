<?php

include_once "models/Model.php";

class DepartamentosModel extends Model {
    
    function __construct() {
        parent::__construct();
    }

    /**
     * Get All Departamentos
     */
    function getDepartamentos() {
        $departamentos = $this->db->prepare("SELECT * FROM GRXX_Departamento d JOIN GRXX_Ciudad c ON (d.cod_postal = c.cod_postal)");
        $departamentos->execute();
        return $departamentos->fetchAll(PDO::FETCH_ASSOC);
    }
   
}
?>