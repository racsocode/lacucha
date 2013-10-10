<?php
namespace Admin\Form;
 
use Zend\Form\Form;
 
class ProfileForm extends Form{

    public function __construct ($name = null, $options = array()){
        
        parent::__construct('loginform');
         
   
    
         
        // Nombre de usuario
        $this->add(array(
            'type' => 'Zend\Form\Element\Text',
            'name' => 'username',

            'options' => array(
                'required' => true,
               /* 'filters'  => array(
                    array('name' => 'StripTags'),
                    array('name' => 'StringTrim'),
                )*/
            ),

            'attributes'=>array(
                'value' => '',
                'tabindex' => '1',
            ),    
           /* 'filters' => array(
                'StringTrim', 
                'StringToLower'
            ), 
            'validators' => array(
                'NotEmpty',
                'Alnum',
                array(
                    'Regex',
                    false,
                    array('/^[a-z][a-z0-9]{2,}$/'))
                ),*/
             
        ));

 
         
        // Contraseña
        $this->add(array(
            'type' => 'Zend\Form\Element\Password',
            'name' => 'password',
             
            'options' => array(
                'required' => true,
                'filters'  => array(
                    array('name' => 'StringTrim'),
                )
            ),
            'attributes'=>(array(
                'value' => '',
                'tabindex' => '2',
            )),   

        ));
         
        // Proteccion CSRF
        $this->add(array(
             'type' => 'Zend\Form\Element\Csrf',
             'name' => 'csrfcheck',
             'options' => array(
                     'csrf_options' => array(
                             'timeout' => 600
                     )
             )
         ));        

        //checkbox
        $this->add(array(
            'type' => 'Zend\Form\Element\Checkbox',
            'name' => 'rememberme',
            'options' => array(
                //'use_hidden_element' => true,
                //'checked_value' => 'good',
                //'unchecked_value' => 'bad'
            ),
            'attributes'=>(array(
                'value' => 'si',
                'tabindex' => '3',
            )),             
        ));        
         
        // Botón submit
        $this->add(array(
                'type' => 'Zend\Form\Element\Submit',
                'name' => 'submit',
                'attributes' => array(
                                    'type'    => 'submit',
                                    'value'   => 'Submit',
                                    'id'      => 'submitButton'
                                ),
            )
        );        

        $this->add(array(
            'type' => 'Zend\Form\Element\Select',
            'name' => 'gender',
            'options' => array(
                'label' => 'Gender',
                'value_options' => array(
                    '1' => 'Select your gender',
                    '2' => 'Female',
                    '3' => 'Male'
                ),
            ),
            'attributes' => array(
                'value' => '1' //set selected to '1'
            )
        ));
         
        $this->add(array(
            'type' => 'Zend\Form\Element\MultiCheckbox',
            'name' => 'hobby',
            'options' => array(
                'label' => 'Please choose one/more of the hobbies',
                'value_options' => array(
                    '1' =>'Cooking',
                    '2'=>'Writing',
                    '3'=>'Others'
                ),
            ),
            'attributes' => array(
                'value' => '1' //set checked to '1'
            )
        ));
         
        $this->add(array(
            'type' => 'Zend\Form\Element\Email',
            'name' => 'email',
            'options' => array(
                'label' => 'Email'
            ),
            'attributes' => array(
                'placeholder' => 'you@domain.com'
            )
        ));

        $this->add(array(
            'type' => 'Zend\Form\Element\Radio',
            'name' => 'direction',
            'options' => array(
                'label' => 'Please choose one of the directions',
                'value_options' => array(
                    '1' => 'Programming',
                    '2' => 'Design',
                ),
            ),
            'attributes' => array(
                'value' => '1' //set checked to '1'
            )
        ));

        $this->add(array(
            'type' => 'Zend\Form\Element\Date',
            'name' => 'birth',
            'options' => array(
                'label' => 'Birth'
            )
        ));




    }
}