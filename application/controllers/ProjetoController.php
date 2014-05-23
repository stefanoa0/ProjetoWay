<?php

class ProjetoController extends Zend_Controller_Action
{

    public function init()
    {
        $this->modelProjeto = new Application_Model_Projeto();

        if (Zend_Auth::getInstance()->hasIdentity()) {
            $this->_helper->layout->setLayout('admin');
        } else {
            $this->_redirect('index');
        }
        $this->usuarioLogado = Zend_Auth::getInstance()->getIdentity();
        $this->view->usuarioLogado = $this->usuarioLogado;
    }

    public function indexAction()
    {
        // action body
    }
    
    public function novoAction(){
        
    }
    
    public function updateAction(){
        
    }
    
    public function editarAction(){
        
    }
    
    public function deleteAction(){
        
    }


}

