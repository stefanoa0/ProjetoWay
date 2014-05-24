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


}

