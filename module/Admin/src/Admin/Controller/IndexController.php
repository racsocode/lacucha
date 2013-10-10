<?php

namespace Admin\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

class IndexController extends AbstractActionController{
    
    public function indexAction(){
        $view = new ViewModel(array(
        	'testvar' => 'bla',
    	));
        $this->layout("layout/admin"); 
        return $view ;
    }
   
}