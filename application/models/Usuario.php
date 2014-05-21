<?php

class Application_Model_Usuario
{
    
    private $dbtableUsuario; //Instancia uma variável para o DBTABLE do model referido

    public function select($where = null, $order = null, $limit = null) //função Select padrão
    {
        $this->dbtableUsuario = new Application_Model_DbTable_Usuario(); //Instancia o Db table em sí
        $select = $this->dbtableUsuario->select() //padrão para todos
                ->from($this->dbtableUsuario)->order($order)->limit($limit); //padrão para todos

        if(!is_null($where)){
            $select->where($where);
        } //padrão

        return $this->dbtableUsuario->fetchAll($select)->toArray(); //padrão
    }
    
    public function find($id) //Função Find para buscar na tabela 
    {
        $this->dbtableUsuario = new Application_Model_DbTable_Usuario(); 
        $arr = $this->dbtableUsuario->find($id)->toArray();
        return $arr[0];
    }
    
    public function insert(array $request) // Função insert
    {
        $this->dbtableUsuario = new Application_Model_DbTable_Usuario();
        
        $dadosUsuario = array(
            'NomeTupla' => $request['Nome do campo de formulário'] //Esperar formulários de Raul/Maurício/Cláudio
        );
        
        $this->dbtableUsuario->insert($dadosUsuario); //Insere o cargo

        return;
    }
    
    public function update(array $request) //Função update padrão
    {
        $this->dbtableUsuario = new Application_Model_DbTable_Usuario();
        
        $dadosUsuario = array(
            'NomeTupla' => $request['Nome do campo de formulário']
        );
        
        $whereUsuario= $this->dbtableUsuario->getAdapter()
                ->quoteInto('"us_id" = ?', $request['Campo de formulário']); //busca pelo ID
        
        $this->dbtableUsuario->update($dadosUsuario, $whereUsuario);
    }
    
    public function delete($idUsuario) //Função Delete padrão
    {
        $this->dbtableUsuario = new Application_Model_DbTable_Usuario();       
                
        $whereUsuario= $this->dbtableUsuario->getAdapter()
                ->quoteInto('"us_id" = ?', $idUsuario); // Deleta pelo ID
        
        $this->dbtableCargo->delete($whereUsuario);
    }

}

