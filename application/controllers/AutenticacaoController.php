<?php

class AutenticacaoController extends Zend_Controller_Action {

    public function init() {
        /* Initialize action controller here */
    }

    public function indexAction() {
        // action body
    }
    public function falhaAction(){
        
    }

    public function loginAction() {
        $login = $this->_getParam('LO_Login');
        $senha = $this->_getParam('LO_Senha');

        if (empty($login) || empty($senha)) {
            $this->view->mensagem = "Preencha o formulário corretamente.";
        } else {
            $this->_helper->viewRenderer->setNoRender();

            $dbAdapter = Zend_Db_Table_Abstract::getDefaultAdapter();
            $authAdapter = new Zend_Auth_Adapter_DbTable($dbAdapter);

            $authAdapter->setTableName('login')->setIdentityColumn('LO_Login')->setCredentialColumn('LO_Senha');

            $authAdapter->setIdentity($login)->setCredential(sha1($senha));

            $result = $authAdapter->authenticate();

            if ($result->isValid()) {
                $usuario = $authAdapter->getResultRowObject();

                $storage = Zend_Auth::getInstance()->getStorage();
                $storage->write($usuario);
                $this->_redirect('admin/index');
            } else {
                $this->_redirect('autenticacao/falha');
            }
        }
    }

    

}

