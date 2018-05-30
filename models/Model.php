<?php

include_once 'dbConfig.php';

abstract class Model {
    protected $db;
    function __construct() {
        try {
            $this->db = new PDO('pgsql:host=' . HOST . ';port=' . PORT .';dbname=' . DBNAME, USER, DBPASS);
            // $this->db = new PDO("pgsql:host=$host;port=6432;dbname=cursada", 'unc_248624', '248624');
            $this->db->exec('SET search_path TO public');
        } catch (PDOException $e) {
            echo "ERROR: Trying to connect to the Database";
            echo $db;
            die();
        }
    }
}
?>