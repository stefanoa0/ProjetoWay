<?php

class CategoriaController extends Zend_Controller_Action
{

    public function init()
    {
       $this->modelProjeto = new Application_Model_Projeto();

        if (Zend_Auth::getInstance()->hasIdentity()) {
            $this->_helper->layout->setLayout('admin');
        } else {
            $this->_redirect('index');
        }
    }

    public function indexAction()
    {
        // action body
    }
    public function novoAction(){
        
    }

}

