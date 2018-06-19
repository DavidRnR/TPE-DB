<?php
require_once dirname(__DIR__).'/models/Model.php';

class DepartamentosModel extends Model {
    
    function __construct() {
        parent::__construct();
    }

    /**
     * Get All Ciudades
     */
    function getCiudades() {
        $ciudades = $this->db->prepare("SELECT * FROM GR08_Ciudad");
        $ciudades->execute();
        return $ciudades->fetchAll(PDO::FETCH_ASSOC);
    }
   

    /**
     * Get All Departamentos
     */
    function getDepartamentos() {
        $departamentos = $this->db->prepare("SELECT * FROM GR08_DEPARTAMENTOS_ORDERBY_CIUDAD_RATING");
        $departamentos->execute();
        return $departamentos->fetchAll(PDO::FETCH_ASSOC);
    }

     /**
     * Get All Departamentos by Ciudad
     */
    function getDepartamentosByCiudad($ciudad) {
        $departamentos = $this->db->prepare("SELECT * FROM GR08_DEPARTAMENTOS_ORDERBY_CIUDAD_RATING
                                                      WHERE cod_postal = $ciudad");
        $departamentos->execute();
        return $departamentos->fetchAll(PDO::FETCH_ASSOC);
    }

    /**
     * Get Departamento by ID
     */
    function getDepartamentoById($deptoID) {
        $departamento = $this->db->prepare("SELECT * FROM GR08_DEPARTAMENTOS_ORDERBY_CIUDAD_RATING
                                                     WHERE id_dpto = $deptoID");
        $departamento->execute();
        return $departamento->fetch(PDO::FETCH_ASSOC);
    }

    /**
     * Get Reserva by Depto ID and included in a Month
     */
    function getReservasByDeptoByMonth($deptoID, $month, $year) {
        $reservas = $this->db->prepare("SELECT * FROM TRFN_GR08_DEPARTAMENTO_FECHAS_DISPONIBLES($deptoID, $month, $year)");
        $reservas->execute();
        return $reservas->fetchAll(PDO::FETCH_ASSOC);
    }
}
?>