<?php

class Application_Model_AlteracaoSenha
{
    public function solicitar($idUsuario, $token)
    {
        date_default_timezone_set('America/Bahia');
        $dados = array(
            "AS_Token"           => $token,
            "US_ID"               => $idUsuario
        );
        
        $dbTableAlteracaoSenha = new Application_Model_DbTable_AlteracaoSenha();
        return $dbTableAlteracaoSenha->insert($dados);
    }
    
    public function find($token)
    {
        $dao = new Application_Model_DbTable_AlteracaoSenha();
        $arr = $dao->find($token)->toArray();
        return $arr;
    }
    
    public function update($token)
    {
        $dbTableAlteracaoSenha = new Application_Model_DbTable_AlteracaoSenha();
        
        $where = $dbTableAlteracaoSenha->getAdapter()->quoteInto('"tas_token" = ?', $token);
        return $dbTableAlteracaoSenha->update($dados, $where);
    }
}

