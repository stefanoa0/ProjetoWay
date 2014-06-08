<?php

class ProjetoController extends Zend_Controller_Action {

    public function init() {
        $this->modelPrazo = new Application_Model_Prazo();
        $this->modelProjeto = new Application_Model_Projeto();
        $this->modelEquipe = new Application_Model_Equipe();  
        $this->modelRequisito = new Application_Model_Requisito();
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
        //projeto
        $projeto = $this->modelProjeto->find($idProjeto);
        $equipe = $this->modelEquipe->find($idProjeto);
        $requisitos = $this->modelRequisito->find($idProjeto);
        
        $idEquipe = $equipe['EQ_ID'];
        $usuarios = $this->modelEquipe->findUsuarios($idEquipe);
        
        $this->view->assign("usuarios", $usuarios);
        $this->view->assign("requisitos", $requisitos);
        $this->view->assign("projeto", $projeto);
        $this->view->assign("equipe", $equipe);
        //requisitos do projeto
        //$modelRequisito = new Application_Model_Requisito();
        //$requisitos = $
        
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
