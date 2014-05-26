<?php

class EquipeController extends Zend_Controller_Action
{

    public function init()
    {
        $this->modelProjeto = new Application_Model_Projeto();
        $this->modelUsuario = new Application_Model_Usuario();
        $this->modelEquipe = new Application_Model_Equipe();
        if (Zend_Auth::getInstance()->hasIdentity()) {
            $this->_helper->layout->setLayout('admin');
        } else {
            $this->_redirect('index');
        }
    }

    public function indexAction()
    {
        $equipes = $this->modelEquipe->select();
        $this->view->assign("equipes",$equipes);
    }
    
    public function novoAction(){
        $projetos = $this->modelProjeto->select();
        $this->view->assign("projetos", $projetos);
                

        $usuarios = $this->modelUsuario->select();
        $this->view->assign("usuarios",$usuarios);
        
        
        
    }
    public function criarAction(){
        /*$idProjeto = $this->_getParam('id');
        $usuario = $this->_getParam('Usuario1');
        $nomeEquipe = $this->_getParam('EQ_Nome');
        $custoEquipe = $this->_getParam('EQ_CustoEquipe');
        //$this->modelUsuario->insert();
        $allParam = array ($usuario, $nomeEquipe, $custoEquipe, $idProjeto);*/
        
        $this->modelEquipe->insert($this->_getAllParams());
        $this->redirect('admin/index');
    }
    
    public function updateAction(){
        
    }
    
    public function editarAction(){
        
    }
    
    public function deleteAction(){
        
    }


}

