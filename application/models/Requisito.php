<?php

class Application_Model_Requisito
{
    private $dbtableRequisito; //Instancia uma variável para o DBTABLE do model referido

    public function select($where = null, $order = null, $limit = null) //função Select padrão
    {
        $this->dbtableRequisito = new Application_Model_DbTable_Requisito(); //Instancia o Db table em sí
        $select = $this->dbtableRequisito->select() //padrão para todos
                ->from($this->dbtableRequisito)->order($order)->limit($limit); //padrão para todos

        if(!is_null($where)){
            $select->where($where);
        } //padrão

        return $this->dbtableRequisito->fetchAll($select)->toArray(); //padrão
    }
    
    public function find($id) //Função Find para buscar na tabela 
    {
        $this->dbtableRequisito = new Application_Model_DbTable_Requisito(); 
        $arr = $this->dbtableRequisito->find($id)->toArray();
        return $arr[0];
    }
    
    public function insert(array $request) // Função insert
    {
        $this->dbtableRequisito = new Application_Model_DbTable_Requisito();
        
        $dadosRequisito = array(
            'NomeTupla' => $request['Nome do campo de formulário'] //Esperar formulários de Raul/Maurício/Cláudio
        );
        
        $this->dbtableRequisito->insert($dadosRequisito); //Insere o cargo

        return;
    }
    
    public function update(array $request) //Função update padrão
    {
        $this->dbtableRequisito = new Application_Model_DbTable_Requisito();
        
        $dadosRequisito = array(
            'NomeTupla' => $request['Nome do campo de formulário']
        );
        
        $whereRequisito= $this->dbtableRequisito->getAdapter()
                ->quoteInto('"req_id" = ?', $request['Campo de formulário']); //busca pelo ID
        
        $this->dbtableRequisito->update($dadosRequisito, $whereRequisito);
    }
    
    public function delete($idRequisito) //Função Delete padrão
    {
        $this->dbtableRequisito = new Application_Model_DbTable_Requisito();       
                
        $whereRequisito= $this->dbtableRequisito->getAdapter()
                ->quoteInto('"req_id" = ?', $idRequisito); // Deleta pelo ID
        
        $this->dbtableRequisito->delete($whereRequisito);
    }

}
