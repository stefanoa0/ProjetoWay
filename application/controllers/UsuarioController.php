<?php

class UsuarioController extends Zend_Controller_Action
{

    public function init()
    {
        if (Zend_Auth::getInstance()->hasIdentity()) {
            $this->_helper->layout->setLayout('admin');
        } else {
            $this->_redirect('index');
        }
        
        $this->modelUsuario = new Application_Model_Usuario();
    }

    public function indexAction()
    {
        // action body
    }

    public function novoAction()
    {
        // action body
    }

    public function usuarioEquipeAction()
    {
        //id da equipe
        $this->modelEquipe = new Application_Model_Equipe();
        $idEquipe = $this->_getParam('id');
        $equipe = $this->modelEquipe->findEquipe($idEquipe);
        
        $this->view->assign("equipe", $equipe);
        //Exibir os usuarios para selecionar
        $usuarios = $this->modelUsuario->select();
        $this->view->assign("usuarios",$usuarios);
        
        //Exibir todos os usuarios na equipe
        
        /*$modelUsuarioTrabalhaEquipe = new Application_Model_UsuarioTrabalhaEquipe();        
        $usuariosNaEquipe = $modelUsuarioTrabalhaEquipe->select("Equipe_EQ_ID = $idEquipe");
        $this->view->assign("usuariosNaEquipe",$usuariosNaEquipe);*/
        //$this->view->usuariosNaEquipe = $usuariosNaEquipe;
    }

    public function adicionanaequipeAction()
    {
       $usuarioTrabalhaEquipe = $this->getAllParams();
       $this->modelUsuario->insertUsuarioEquipe($usuarioTrabalhaEquipe);
       $this->redirect('equipe/index');
       
    }


}







