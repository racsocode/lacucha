<?php

namespace Admin\Model;

use Zend\Db\TableGateway\TableGateway;
use Zend\Db\Adapter\Adapter;

class Settings extends TableGateway{

    public function __construct(Adapter $adapter = null, $databaseSchema = null, ResultSet $selectResultPrototype = null){
        return parent::__construct('configuracion', $adapter, $databaseSchema,$selectResultPrototype);
    }

    public function getSetting(){
        $datos = $this->select();
        return $datos->toArray();
    }

    public function getSettingPorId($id){
        $id  = (int) $id;
        
        $rowset = $this->select(array('id_configuracion' => $id));

        $row = $rowset->current();
       // echo $row;
        
        if (!$row) {
            throw new \Exception("No hay registros asociados al valor $id");
        }
        
        return $row;
    }

    public function addUsuario($data=array()){
           $this->insert($data);
    }

    public function updateSetting($id, $data=array()){
        $this->update($data, array('id' => $id));
    }

    public function deleteUsuario($id){
        $this->delete(array('id' => $id));
    }


/*
    $this->isInitialized();
    $this->initialize();
    $this->getTable();
    $this->getAdapter();
    $this->getColumns();
    $this->getFeatureSet();
    $this->getResultSetPrototype();
    $this->getSql();
    $this->select($where = null);
    $this->selectWith(Select $select);
    $this->insert($set);
    $this->insertWith(Insert $insert);
    $this->update($set, $where = null);
    $this->updateWith(Update $update);
    $this->delete($where);
    $this->deleteWith(Delete $delete);
    $this->getLastInsertValue(); 

$rowset = $artistTable->select(function (Select $select) {
     $select->where->like('name', 'Brit%');
     $select->order('name ASC')->limit(2);
});


     */  
}