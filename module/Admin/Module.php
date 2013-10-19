<?php
namespace Admin;

use Zend\Mvc\ModuleRouteListener;
use Zend\Mvc\MvcEvent;

use Admin\Event\AuthenticationListener;

use Zend\View\HelperPluginManager;

use Zend\Permissions\Acl\Acl as Acl;
use Zend\Permissions\Acl\Role\GenericRole as Role;
use Zend\Permissions\Acl\Resource\GenericResource as Resource;

class Module{

    public function onBootstrap($e){
        $eventManager  = $e->getApplication()->getEventManager();
        $authListener  = new AuthenticationListener();
        $authListener->attach($eventManager);

       $this->initAcl($e);
        //$eventManager->attach('route', array($this, 'checkAcl')); 
    }

    public function getConfig(){
        return include __DIR__ . '/config/module.config.php';
    }

    public function getAutoloaderConfig(){
        return array(
            'Zend\Loader\StandardAutoloader' => array(
                'namespaces' => array(
                    __NAMESPACE__ => __DIR__ . '/src/' . __NAMESPACE__,
                ),
            ),
        );
    }


    public function getViewHelperConfig(){
        
        return array(
            'factories' => array(
                // This will overwrite the native navigation helper
                'navigation' => function(HelperPluginManager $pm) {
                    $sm = $pm->getServiceLocator();
                    $config = $sm->get('Config');
    
                    $acl = new \Admin\Acl\Acl($config);
                    
                    $auth = $sm->get('Zend\Authentication\AuthenticationService');
                    $role = \Admin\Acl\Acl::DEFAULT_ROLE; // The default role is guest $acl

                    if ($auth->hasIdentity()) {
                        $user = $auth->getIdentity();
                        $usrlId = $user->getUsrlId(); // Use a view to get the name of the role
                        // TODO we don't need that if the names of the roles are comming from the DB
                        switch ($usrlId) {
                            case 1 :
                                $role = \Admin\Acl\Acl::DEFAULT_ROLE; // guest
                                break;
                            case 2 :
                                $role = 'member';
                                break;
                            case 3 :
                                $role = 'admin';
                                break;
                            default :
                                $role = \Admin\Acl\Acl::DEFAULT_ROLE; // guest
                                break;
                        }
                    }                   
                    
                    $navigation = $pm->get('Zend\View\Helper\Navigation');
                 
                    $navigation->setAcl($acl);
                    /*   $navigation->($acl)->setRole($role); // 'member'*/

                    return $navigation;
                }
            )
        );
    }

    public function initAcl(MvcEvent $e) {
        $acl = new Acl();

        $dbAdapter = $e->getApplication()->getServiceManager()->get('Zend\Db\Adapter\Adapter');
        $rs_roles = $dbAdapter->query('SELECT * FROM roles')->execute();

        for($i=0;$i<$rs_roles->count();$i++){
            $row = $rs_roles->current();
            $acl->addRole(new Role($row['nombre_rol'])); 
        }



        //$acl->addRole(new Role('someUser'), $parents);

/*
        $allResources = array();
        foreach ($roles as $role => $resources) {
            $role = new \Zend\Permissions\Acl\Role\GenericRole($role);
            $acl->addRole($role);
     
            $allResources = array_merge($resources, $allResources);
            //adding resources
            foreach ($resources as $resource) {
                if(!$acl->hasResource($resource))
                    $acl->addResource(new \Zend\Permissions\Acl\Resource\GenericResource($resource));
            }
            //adding restrictions
            foreach ($allResources as $resource) {
                $acl->allow($role, $resource);
            }
        }*/

      //  $e->getViewModel()->acl = $acl;
     
    }
 
    public function checkAcl(MvcEvent $e) {
        $route = $e->getRouteMatch()->getMatchedRouteName();
        //you set your role
        $userRole = 'guest';

        if (!$e->getViewModel()->acl->isAllowed($userRole, $route)) {
            $response = $e->getResponse();
            //location to page or what ever
            $response->getHeaders()->addHeade5rLine('Location', $e->getRequest()->getBaseUrl().'/404');
            $response->setStatusCode(303);
        }
    }  

 

}