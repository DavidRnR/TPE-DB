<?php

require_once dirname(__DIR__).'/dbConfig.php';

abstract class Model {
    protected $db;
    function __construct() {
        try {
            $this->db = new PDO('pgsql:host=' . HOST . ';port=' . PORT .';dbname=' . DBNAME, USER, DBPASS);
            $this->db->exec('SET search_path TO unc_245754');
        } catch (PDOException $e) {
            echo "ERROR: Trying to connect to the Database";
            die();
        }
    }
}
?>