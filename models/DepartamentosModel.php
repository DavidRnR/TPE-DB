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
        $departamentos = $this->db->prepare("SELECT * FROM GR08_Departamento d JOIN GR08_Ciudad c ON (d.cod_postal = c.cod_postal)");
        $departamentos->execute();
        return $departamentos->fetchAll(PDO::FETCH_ASSOC);
    }

     /**
     * Get All Departamentos by Ciudad
     */
    function getDepartamentosByCiudad($ciudad) {
        $departamentos = $this->db->prepare("SELECT * FROM GR08_Departamento d JOIN GR08_Ciudad c ON (d.cod_postal = c.cod_postal) WHERE c.cod_postal = $ciudad");
        $departamentos->execute();
        return $departamentos->fetchAll(PDO::FETCH_ASSOC);
    }

    /**
     * Get Departamento by ID
     */
    function getDepartamentoById($deptoID) {
        $departamento = $this->db->prepare("SELECT * FROM GR08_Departamento d JOIN GR08_Ciudad c ON (d.cod_postal = c.cod_postal) WHERE d.id_dpto = $deptoID");
        $departamento->execute();
        return $departamento->fetch(PDO::FETCH_ASSOC);
    }

    /**
     * Get Reserva by Depto ID and include in a Month
     */
    function getReservasByDeptoByMonth($deptoID, $month, $year) {
        $reservas = $this->db->prepare("SELECT * FROM GR08_Reserva r WHERE r.id_dpto = $deptoID 
                                        AND (extract(month from r.fecha_desde) = $month 
                                        OR extract(month from r.fecha_hasta) = $month) 
                                        AND (extract(year from r.fecha_desde) = $year 
                                        OR extract(year from r.fecha_hasta) = $year)");
                                        
        $reservas->execute();
        return $reservas->fetchAll(PDO::FETCH_ASSOC);
    }
}
?>