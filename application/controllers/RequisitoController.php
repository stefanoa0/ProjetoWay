<?php

class RequisitoController extends Zend_Controller_Action
{

    public function init()
    {
        if (Zend_Auth::getInstance()->hasIdentity()) {
            $this->_helper->layout->setLayout('admin');
        } else {
            $this->_redirect('index');
        }
        $this->modelRequisito = new Application_Model_Requisito();
        $this->modelProjeto = new Application_Model_Projeto();
        
    }

    public function indexAction()
    {
        // action body
    }
    
    public function novoAction(){
        $idProjeto = $this->modelProjeto->find($this->_getParam('id'));
       
        $this->view->assign('projeto', $idProjeto);
    }
    
    public function criarAction(){
        $this->modelRequisito->insert($this->_getAllParams());
        
        $this->redirect('admin/index');
    }
    public function updateAction(){
        
    }
    
    public function editarAction(){
        
    }
    
    public function deleteAction(){
        
    }


}

