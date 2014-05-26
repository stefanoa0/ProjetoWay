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
        $idEquipe = $this->_getParam('id');
        $this->view->idEquipe = $idEquipe;
        
        //Exibir os usuarios para selecionar
        $this->modelUsuario = new Application_Model_Usuario();
        $usuarios = $this->modelUsuario->select();
        $this->view->assign("usuarios",$usuarios);
        
        //Exibir todos os usuarios na equipe
        $modelUsuarioTrabalhaEquipe = new Application_Model_UsuarioTrabalhaEquipe();        
        $usuariosNaEquipe = $modelUsuarioTrabalhaEquipe->select("Equipe_EQ_ID = $idEquipe");
        $this->view->assign("usuariosNaEquipe",$usuariosNaEquipe);
        //$this->view->usuariosNaEquipe = $usuariosNaEquipe;
    }

    public function adicionaNaEquipeAction()
    {
        $usuarioTrabalhaEquipe = new Application_Model_DbTable_UsuarioTrabalhaEquipe();
        $dadosUsuario =  array(
            'Equipe_EQ_ID' => $this->_getParam('idEquipe'),
            'Usuário_US_ID' => $this->_getParam('Usuario1')
        );
        $usuarioTrabalhaEquipe->insert($dadosUsuario);
        $this->_redirect('equipe');
    }


}







