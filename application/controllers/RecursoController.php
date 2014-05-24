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
    }

    public function indexAction()
    {
        // action body
    }
    
    public function novoAction(){
        
    }
    
    public function updateAction(){
        
    }
    
    public function editarAction(){
        
    }
    
    public function deleteAction(){
        
    }


}

