<?php
// require_once '../models/DepartamentosModel.php';
require_once dirname(__DIR__).'/models/DepartamentosModel.php';
require_once 'api.php';

class ReservasApi extends Api {
  private $model;
  
  public function __construct($request)
  {
    parent::__construct($request);
    $this->model = new DepartamentosModel();
  }
  protected function reservas($argumentos){
    switch ($this->method) {
      case 'GET':
      if(count($argumentos)>0){
        
        if (isset($_GET['month']) && isset($_GET['year'])) {
            $deptoID = $argumentos[0];
            $month = $_GET['month'];
            $year = $_GET['year'];
  
            return $reservas = $this->model->getReservasByDeptoByMonth($deptoID, $month, $year);
  
        }
        $error['Error'] = "No exiten Reservas";
        return $argumentos;
      }
      break;
      case 'DELETE':
      $error['Error'] = "Se ha denegado el acceso";
      return $error;
      break;
      case 'POST':
      $error['Error'] = "Se ha denegado el acceso";
      return $error;
      break;
      default:
      return "Only accepts GET";
      break;
    }
  }

}
?>