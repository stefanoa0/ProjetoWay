<?php

class IndexController extends Zend_Controller_Action
{

    public function init()
    {
        
        $this->modelCargo = new Application_Model_Cargo();
        $this->modelUsuario = new Application_Model_Usuario();
    }

    public function indexAction()
    {
        // action body
    }
    public function novoAction(){
        
        $cargos =  $this->modelCargo->select();
        
        $this->view->assign("cargos", $cargos);
        
    }
    public function criarAction(){
       
        $this->modelUsuario->insert($this->_getAllParams());
        
        $this->_redirect('index/index');
    }

}

