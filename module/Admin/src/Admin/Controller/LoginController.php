<?php

namespace Admin\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

class LoginController extends AbstractActionController{
    
    public function indexAction(){
        $view = new ViewModel(array(
        	'testvar' => 'bla',
    	));
        $this->layout("layout/login"); 
        return $view ;
    }

    public function recuperarAction(){
        $view = new ViewModel(array(
        	'testvar' => 'bla',
    	));
        $this->layout("layout/login"); 
        return $view ;
    }


}