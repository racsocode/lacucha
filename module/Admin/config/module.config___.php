<?php
use Zend\Authentication\AuthenticationService;
use Admin\Adapter\DbTableBcrypt;

return array(
    'controllers' => array(
        'invokables' => array(
           // 'Admin\Controller\Account' => 'Admin\Controller\AccountController',
            //'Admin\Controller\Index' => 'Admin\Controller\IndexController',
           // 'Admin\Controller\Login' => 'Admin\Controller\LoginController',
            'Admin\Controller\Settings' => 'Admin\Controller\SettingsController',
            'Admin\Controller\Usuarios' => 'Admin\Controller\UsuariosController'
        ),
    ),

    // The following section is new and should be added to your file
    'router' => array(
        'routes' => array(
        
                
            'settings' => array(
                'type'    => 'literal',
                'options' => array(
                    'route'    => '/admin/configuracion',
                    'defaults' => array(
                        'controller' => 'Admin\Controller\Settings',
                        'action'     => 'index',
                    ),
                ),
            ),


            'usuarios' => array(
                'type'    => 'segment',
                'options' => array(
                    'route'    => '/admin/usuarios[/][:action][/:id]',
                    'constraints' => array(
                        'action' => '[a-zA-Z][a-zA-Z0-9_-]*',
                        'id'     => '[0-9]+',
                    ),
                    'defaults' => array(
                        'controller' => 'Admin\Controller\Usuarios',
                        'action'     => 'index',
                    ),
                ),
            ),                                   

        ),
    ),

    'service_manager' => array(
        'factories' => array(

            'Admin\Model\MyAuthStorage' => function($sm){
                return new \Admin\Model\MyAuthStorage('zf_tutorial');  
            },

            'AuthService' => function($sm) {      
                //Obtenemos el adaptador de Base de datos
                $dbAdapter = $sm->get('Zend\Db\Adapter\Adapter');
                 
                //Configuramos el adaptador auth
                $authAdapter = new DbTableBcrypt($dbAdapter);
                $authAdapter->setTableName('usuarios')
                            ->setIdentityColumn('login_usuario')
                            ->setCredentialColumn('password_usuario');
                 
                // Y se lo pasamos a nuestro servicio
                $authServiceManager = new AuthenticationService();           
                $authServiceManager->setAdapter($authAdapter);
                $authServiceManager->setStorage($sm->get('Admin\Model\MyAuthStorage'));
                return $authServiceManager;
            }
        )
    ),

    'view_manager' => array(
        'display_not_found_reason' => true,
        'display_exceptions'       => true,
        'doctype'                  => 'HTML5',
        'not_found_template'       => 'error/404',
        'exception_template'       => 'error/index',  
        'template_map' => array(
            'layout/admin'         => __DIR__ . '/../view/layout/admin.phtml',
            'layout/login'         => __DIR__ . '/../view/layout/login.phtml',           
        ),

        'template_path_stack' => array(
            __DIR__ . '/../view',
        ),
    ),

);