<?php
    //Mysqli, sqlsrv, Pdo_Sqlite, pdo_mysql, Pdo = OtherPdoDriver

return array(
   'service_manager' => array(
        'factories' => array(
            'Zend\Db\Adapter\Adapter' => 'Zend\Db\Adapter\AdapterServiceFactory',
        ),
        'aliases' => array(
            'db' => 'Zend\Db\Adapter\Adapter',
        ),
    ),
    'db' => array(
        'driver'      => 'Pdo',
        'dsn'         => 'mysql:dbname=lacucha;host=localhost',
        'driver_options' => array(
            PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES \'UTF8\''
        ),
    ),
     
);