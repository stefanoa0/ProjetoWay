<?php

class Application_Model_Vusuariosequipe
{
    private $dbtableUsuarioTrabalhaEquipe; //Instancia uma variável para o DBTABLE do model referido
    
    public function select($where = null, $order = null, $limit = null) { //função Select padrão
        $this->dbtableUsuarioTrabalhaEquipe = new Application_Model_DbTable_Vusuariosequipe(); //Instancia o Db table em sí
        $select = $this->dbtableUsuarioTrabalhaEquipe->select() //padrão para todos
                        ->from($this->dbtableUsuarioTrabalhaEquipe)->order($order)->limit($limit); //padrão para todos

        if (!is_null($where)) {
            $select->where($where);
        } //padrão

        return $this->dbtableUsuarioTrabalhaEquipe->fetchAll($select)->toArray(); //padrão
    }
    
    public function find($id) //Função Find para buscar na tabela 
    {
        $dbtableUsuarioTrabalhaEquipe = new Application_Model_DbTable_Vusuariosequipe(); 
        $arr = $dbtableUsuarioTrabalhaEquipe->find($id)->toArray();
        return $arr;
    }

}

