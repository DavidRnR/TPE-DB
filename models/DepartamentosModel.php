<?php

include_once "models/Model.php";

class DepartamentosModel extends Model {
    
    function __construct() {
        parent::__construct();
    }

    /**
     * Get All Ciudades
     */
    function getCiudades() {
        $ciudades = $this->db->prepare("SELECT * FROM GRXX_Ciudad");
        $ciudades->execute();
        return $ciudades->fetchAll(PDO::FETCH_ASSOC);
    }
   

    /**
     * Get All Departamentos
     */
    function getDepartamentos() {
        $departamentos = $this->db->prepare("SELECT * FROM GRXX_Departamento d JOIN GRXX_Ciudad c ON (d.cod_postal = c.cod_postal)");
        $departamentos->execute();
        return $departamentos->fetchAll(PDO::FETCH_ASSOC);
    }

     /**
     * Get All Departamentos by Ciudad
     */
    function getDepartamentosByCiudad($ciudad) {
        $departamentos = $this->db->prepare("SELECT * FROM GRXX_Departamento d JOIN GRXX_Ciudad c ON (d.cod_postal = c.cod_postal) WHERE c.cod_postal = $ciudad");
        $departamentos->execute();
        return $departamentos->fetchAll(PDO::FETCH_ASSOC);
    }

    /**
     * Get Departamento by ID
     */
    function getDepartamentoById($deptoID) {
        $departamento = $this->db->prepare("SELECT * FROM GRXX_Departamento d JOIN GRXX_Ciudad c ON (d.cod_postal = c.cod_postal) WHERE d.id_dpto = $deptoID");
        $departamento->execute();
        return $departamento->fetch(PDO::FETCH_ASSOC);
    }
}
?>