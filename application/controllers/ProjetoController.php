<?php

class ProjetoController extends Zend_Controller_Action {

    public function init() {
        $this->modelPrazo = new Application_Model_Prazo();
        $this->modelProjeto = new Application_Model_Projeto();

        if (Zend_Auth::getInstance()->hasIdentity()) {
            $this->_helper->layout->setLayout('admin');
        } else {
            $this->_redirect('index');
        }
        $this->usuarioLogado = Zend_Auth::getInstance()->getIdentity();
        $this->view->usuarioLogado = $this->usuarioLogado;
    }

    public function indexAction() {
        //id do projeto para exibir o projeto correto
        $idProjeto = $this->_getParam('id');
        $modelProjeto = new Application_Model_Projeto();
        $projeto = $modelProjeto->select("PRJ_ID = $idProjeto");
        $this->view->assign("projeto", $projeto);
    }

    public function novoAction() {
        
    }

    public function criarAction() {
        $this->modelProjeto->insert($this->_getAllParams());

        $this->redirect('admin/index');
    }

    public function updateAction() {
        
    }

    public function editarAction() {
        
    }

    public function deleteAction() {
        
    }

}
