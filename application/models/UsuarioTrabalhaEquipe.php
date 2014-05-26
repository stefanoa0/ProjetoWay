<?php

class Application_Model_UsuarioTrabalhaEquipe {

    private $dbtableUsuarioTrabalhaEquipe; //Instancia uma variável para o DBTABLE do model referido

    public function select($where = null, $order = null, $limit = null) { //função Select padrão
        $this->dbtableUsuarioTrabalhaEquipe = new Application_Model_DbTable_UsuarioTrabalhaEquipe(); //Instancia o Db table em sí
        $select = $this->dbtableUsuarioTrabalhaEquipe->select() //padrão para todos
                        ->from($this->dbtableUsuarioTrabalhaEquipe)->order($order)->limit($limit); //padrão para todos

        if (!is_null($where)) {
            $select->where($where);
        } //padrão

        return $this->dbtableUsuarioTrabalhaEquipe->fetchAll($select)->toArray(); //padrão
    }

}
