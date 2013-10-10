<?php

namespace Admin\Model;

use Zend\Db\TableGateway\TableGateway;
use Zend\Db\Adapter\Adapter;

class Usuarios extends TableGateway{

    public function __construct(Adapter $adapter = null, $databaseSchema = null, ResultSet $selectResultPrototype = null){
        return parent::__construct('usuarios', $adapter, $databaseSchema,$selectResultPrototype);
    }

    public function getResult(){
        $datos = $this->select();
        return $datos->toArray();
    }

    public function getResultPorId($id){
        $id  = (int) $id;
        
        $rowset = $this->select(array('id_usuario' => $id));

        $row = $rowset->current();
       // echo $row;
        
        if (!$row) {
            throw new \Exception("No hay registros asociados al valor $id");
        }
        
        return $row;
    }

    public function addResult($data=array()){
           $this->insert($data);
    }

    public function updateResult($id, $data=array()){
        $this->update($data, array('id' => $id));
    }

    public function deleteResult($id){
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