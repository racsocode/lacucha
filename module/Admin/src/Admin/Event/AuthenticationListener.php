<?php
namespace Admin\Event;
 
use Zend\Mvc\Router\RouteMatch;
use Zend\Mvc\MvcEvent;
use Zend\EventManager\EventManagerInterface;
use Zend\EventManager\ListenerAggregateInterface;
 
class AuthenticationListener implements ListenerAggregateInterface{

    protected $listeners = array();


    /* Ahora parte por parte, primero registramos el listener, y asignamos una prioridad alta,
    para que se ejecute lo antes posible dentro del stack de listeners registrados en el evento.*/
    public function attach(EventManagerInterface $events, $priority = 1000){
        $this->listeners[] = $events->attach(MvcEvent::EVENT_DISPATCH, array($this, 'onDispatch'), $priority);
    }
 
    //El método detach() lo único que haces es remover el listener del evento.
    public function detach(EventManagerInterface $events){
        
        foreach ($this->listeners as $index => $listener){
            if ($events->detach($listener)) {
                unset($this->listeners[$index]);
            }
        }
    }
 
    public function onDispatch(MvcEvent $e){
        //Finalmente el código de nuestro listener, primero obtengo el servicio Auth, y el match hecho por mi router
        $authService = $e->getApplication()->getServiceManager()->get('AuthService');
        $matches = $e->getRouteMatch();
        //Luego obtengo el nombre del controlador y la accion actual que hicieron match en mi router,
        if (!$matches instanceof RouteMatch) {
            //si estoy en la pagina de inicio de sesión no es necesario hacer nada mas, por que quiere decir que el usuario quiere logearse.
            return;
        }
         
        $controller = $matches->getParam('controller');
        $action     = $matches->getParam('action');
       /*  
        if ($controller == 'Admin\Controller\Auth' && $action == 'login'){
            //Luego si el usuario ya inicio sesión, no es necesario hacerlo de nuevo.
            return;
        }
         
        if ($authService->hasIdentity()) {
            // Por último, si el usuario no ha iniciado sesión y esta intentando acceder a una página de la aplicación sin logearse, entonces lo redirigimos a la página de login.
            return;
        }
         
        // Si lo anterior no se da, debemos iniciar sesion
        $matches->setParam('controller', 'Admin\Controller\Account');
        $matches->setParam('action', 'login');*/
    }
}