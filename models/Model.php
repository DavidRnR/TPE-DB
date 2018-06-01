<?php

include_once 'dbConfig.php';

abstract class Model {
    protected $db;
    function __construct() {
        try {
            $this->db = new PDO('pgsql:host=' . HOST . ';port=' . PORT .';dbname=' . DBNAME, USER, DBPASS);
            //  $this->db = new PDO("pgsql:host=dbases.exa.unicen.edu.ar;port=6432;dbname=cursada", '', '');
            $this->db->exec('SET search_path TO public');
        } catch (PDOException $e) {
            echo "ERROR: Trying to connect to the Database";
            die();
        }
    }
}
?>