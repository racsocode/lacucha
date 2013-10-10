<?php
 
namespace Admin\Controller;


use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Admin\Form\ProfileForm; 
use Admin\Form\LoginFilter; 



class AccountController extends AbstractActionController{
    protected $storage;
    protected $authservice;
    protected $form;

    public function indexAction(){

        $this->layout("layout/login"); 

        $valores=array(

        );
        return new ViewModel($valores); ;        
    }    

    public function loginAction(){
        if ($this->getAuthService()->hasIdentity()){
            return $this->redirect()->toRoute('admin');
        }
                 
        $this->form = $this->getForm();
        $this->layout("layout/login"); 

        $valores=array(
            'form'      => $this->form,
            'messages'  => $this->flashmessenger()->getMessages()
        );
        return new ViewModel($valores); ;        
    }


    public function validarAction(){   
        $redirect = 'login';
        $request = $this->getRequest(); 

        $this->form = $this->getForm();
        //Si el usuario ha enviado el formulario
        if ($request->isPost()){
            $filter = new LoginFilter();
            $this->form->setInputFilter($filter->getInputFilter());
            $this->form->setData($request->getPost());


            if (!$this->form->isValid()){

                $this->getAuthService()->getAdapter()
                                       ->setIdentity($request->getPost('username'))
                                       ->setCredential($request->getPost('password'));

                $result = $this->getAuthService()->authenticate();

                /*foreach($result->getMessages() as $message){
                    echo "$message ".$message;
                    $this->flashmessenger()->addMessage($message);
                }*/
                if ($result->isValid()) {
                    echo "result valido true"; 

                    $redirect = 'admin';
                    //check if it has rememberMe :
                    if ($request->getPost('rememberme') == 1 ) {
                        $this->getSessionStorage()->setRememberMe(1);
                        $this->getAuthService()->setStorage($this->getSessionStorage());
                    }
                    $this->getAuthService()->getStorage()->write($request->getPost('username'));
                }
            }else{
                $messages = $this->form->getMessages();


                echo "no es valido el formulario"; 
            }
        }
        echo "redirect  ".$redirect; 
        return $this->redirect()->toRoute($redirect);

    }

    public function recuperarAction(){   
        $view = new ViewModel(array(
            'testvar' => 'bla',
        ));
        $this->layout("layout/login"); 
        return $view ;
    }    
     
    public function logoutAction(){
        $this->getSessionStorage()->forgetMe();
        $this->getAuthService()->clearIdentity();
        $this->flashmessenger()->addMessage("sesión cerrada");
        return $this->redirect()->toRoute('login');
    }

        public function getForm(){
            if (!$this->form) {
                $this->form = new ProfileForm();
            }
           
            return $this->form;
        }
        public function getAuthService(){
            if (! $this->authservice) {
                $this->authservice = $this->getServiceLocator()->get('AuthService');
            }
            return $this->authservice;
        }
         
        public function getSessionStorage(){
            if (! $this->storage) {
                $this->storage = $this->getServiceLocator()->get('SanAuth\Model\MyAuthStorage');
            }
            return $this->storage;
        }    

}