<?php

namespace Admin\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Zend\Db\Adapter\Adapter;

use Admin\Model\Settings;

class SettingsController extends AbstractActionController{
    public $dbAdapter;


    public function indexAction(){
		$this->dbAdapter=$this->getServiceLocator()->get('Zend\Db\Adapter\Adapter');
        $u = new Settings($this->dbAdapter);

        $valores=array(
            "titulo"    =>  "Mostrando datos desde TableGateway",
            'datos'     =>  $u->getSetting(),
        );

        $this->layout("layout/admin"); 
        return new ViewModel($valores);
    }

    public function editAction(){
        $this->dbAdapter=$this->getServiceLocator()->get('Zend\Db\Adapter\Adapter');
        $u=new Settings($this->dbAdapter);
        $id = (int) $this->params()->fromRoute('id', 0);

        $valores=array(
            "titulo"    =>  "Mostrando Detalle del usuario",
            'dato'     =>  $u->getSettingPorId($id)
        );
        $this->layout("layout/admin"); 
        return new ViewModel($valores);
    }

    public function updateAction(){
        $this->dbAdapter=$this->getServiceLocator()->get('Zend\Db\Adapter\Adapter');
        $u=new Settings($this->dbAdapter);
        $id = (int) $this->params()->fromRoute('id', 0);

        $data=array(
            "nombre_configuracion"=>$this->params()->fromPost('nombre_sitio'),
            "valor_configuracion"=>$this->params()->fromPost('email_contactenos')
        );
       // echo "$this->params()->fromPost('nombre_sitio')  ".$this->params()->fromPost('nombre_sitio'),

      //  $u->updateSetting($id,$data);

            
        return  $this->redirect()->toUrl('http://localhost:8080/lacucha/public/admin/configuracion/');
    }    

    public function verAction(){
        $this->dbAdapter=$this->getServiceLocator()->get('Zend\Db\Adapter\Adapter');
        $u=new Settings($this->dbAdapter);
        $id = (int) $this->params()->fromRoute('id', 0);
        $valores=array(
            "titulo"    =>  "Mostrando Detalle del usuario",
            'datos'     =>  $u->getUsuarioPorId($id)
        );
        return new ViewModel($valores);
    }

    public function addAction(){
        $this->dbAdapter=$this->getServiceLocator()->get('Zend\Db\Adapter');
        $u=new Settings($this->dbAdapter);
        $data=array(
            "nombre"=>"Cristian Vega Zapata",
            "correo"=>"cristian@hotmail.com"
        );
        //$u->addUsuario($data);
        //$u->updateUsuario("17",$data);
        $u->deleteUsuario('15');
        $valores=array(
            "titulo"    =>  "Mostrando datos desde TableGateway",
            'datos'     =>  $u->getUsuarios()
        );
        return new ViewModel($valores);
    }



/*
$this->params()->fromPost('paramname');   // From POST
$this->params()->fromQuery('paramname');  // From GET
$this->params()->fromRoute('paramname');  // From RouteMatch
$this->params()->fromHeader('paramname'); // From header
$this->params()->fromFiles('paramname');  // From file being uploaded

*/


}