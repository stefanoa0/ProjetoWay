<?php

class Application_Model_Cargo
{
    private $dbtableCargo; //Instancia uma variável para o DBTABLE do model referido

    public function select($where = null, $order = null, $limit = null) //função Select padrão
    {
        $this->dbtableCargo = new Application_Model_DbTable_Cargo(); //Instancia o Db table em sí
        $select = $this->dbtableCargo->select() //padrão para todos
                ->from($this->dbtableCargo)->order($order)->limit($limit); //padrão para todos

        if(!is_null($where)){
            $select->where($where);
        } //padrão

        return $this->dbtableCargo->fetchAll($select)->toArray(); //padrão
    }
    
    public function find($id) //Função Find para buscar na tabela 
    {
        $this->dbtableCargo = new Application_Model_DbTable_Cargo(); 
        $arr = $this->dbtableCargo->find($id)->toArray();
        return $arr[0];
    }
    
    public function insert(array $request) // Função insert
    {
        $this->dbtableCargo = new Application_Model_DbTable_Cargo();
        
        $dadosCargo = array(
            'NomeTupla' => $request['Nome do campo de formulário'] //Esperar formulários de Raul/Maurício/Cláudio
        );
        
        $this->dbtableCargo->insert($dadosCargo); //Insere o cargo

        return;
    }
    
    public function update(array $request) //Função update padrão
    {
        $this->dbtableCargo = new Application_Model_DbTable_Cargo();
        
        $dadosCargo = array(
            'NomeTupla' => $request['Nome do campo de formulário']
        );
        
        $whereCargo= $this->dbtableCargo->getAdapter()
                ->quoteInto('"ca_id" = ?', $request['Campo de formulário']); //busca pelo ID
        
        $this->dbtableCargo->update($dadosCargo, $whereCargo);
    }
    
    public function delete($idCargo) //Função Delete padrão
    {
        $this->dbtableCargo = new Application_Model_DbTable_Cargo();       
                
        $whereCargo= $this->dbtableCargo->getAdapter()
                ->quoteInto('"ca_id" = ?', $idCargo); // Deleta pelo ID
        
        $this->dbtableCargo->delete($whereCargo);
    }

}

