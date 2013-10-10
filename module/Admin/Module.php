<?php
namespace Admin;

use Zend\Mvc\ModuleRouteListener;
use Zend\Mvc\MvcEvent;

use Admin\Event\AuthenticationListener;

use Zend\View\HelperPluginManager;
use Zend\Permissions\Acl\Acl;
use Zend\Permissions\Acl\Role\GenericRole;
use Zend\Permissions\Acl\Resource\GenericResource;

class Module{

    public function onBootstrap($e){
        $eventManager  = $e->getApplication()->getEventManager();
        $authListener  = new AuthenticationListener();
        $authListener->attach($eventManager);
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
                    echo "$config  ".$config;
    
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
                    
                    $navigation->setAcl($acl)
                               ->setRole($role); // 'member'

                    return $navigation;
                }
            )
        );
    }

}