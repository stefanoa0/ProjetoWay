<?php

class AdminController extends Zend_Controller_Action {

    
    public function init() {
        if (Zend_Auth::getInstance()->hasIdentity()) {
            $this->_helper->layout->setLayout('admin');
        }
        
        else{
            $this->_redirect('index');
        }
        $this->usuarioLogado = Zend_Auth::getInstance()->getIdentity();
        $this->view->usuarioLogado = $this->usuarioLogado;
        
        
    }

    public function indexAction() {
        // action body
    }
    public function logoutAction() {
        Zend_Auth::getInstance()->clearIdentity();

        $this->_redirect('index');
    }

}
