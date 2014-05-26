<?php

class RecursoController extends Zend_Controller_Action
{

    public function init()
    {
       if (Zend_Auth::getInstance()->hasIdentity()) {
            $this->_helper->layout->setLayout('admin');
        } else {
            $this->_redirect('index');
        }
        $this->modelCategoria = new Application_Model_Categoria();
        $this->modelRecurso = new Application_Model_Recurso();
        $this->modelProjeto = new Application_Model_Projeto();
    }

    public function indexAction()
    {
        // action body
    }
    
    public function novoAction(){
        $idProjeto = $this->modelProjeto->find($this->_getParam('id'));
        $categorias = $this->modelCategoria->select();
        
        $this->view->assign('categorias', $categorias);
        $this->view->assign('projeto', $idProjeto);
    }
    public function criarAction(){
        
        $this->modelRecurso->insert($this->_getAllParams());
        
        $this->redirect('admin/index');
    }
    
    public function updateAction(){
        
    }
    
    public function editarAction(){
        
    }
    
    public function deleteAction(){
        
    }
    


}

