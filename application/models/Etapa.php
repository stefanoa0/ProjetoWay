<?php

class Application_Model_Etapa
{
    private $dbtableEtapa; //Instancia uma variável para o DBTABLE do model referido

    public function select($where = null, $order = null, $limit = null) //função Select padrão
    {
        $this->dbtableEtapa = new Application_Model_DbTable_Etapa(); //Instancia o Db table em sí
        $select = $this->dbtableEtapa->select() //padrão para todos
                ->from($this->dbtableEtapa)->order($order)->limit($limit); //padrão para todos

        if(!is_null($where)){
            $select->where($where);
        } //padrão

        return $this->dbtableEtapa->fetchAll($select)->toArray(); //padrão
    }
    
    public function find($id) //Função Find para buscar na tabela 
    {
        $this->dbtableEtapa = new Application_Model_DbTable_Etapa(); 
        $arr = $this->dbtableEtapa->find($id)->toArray();
        return $arr[0];
    }
    
    public function insert(array $request) // Função insert
    {
        $this->dbtableEtapa = new Application_Model_DbTable_Etapa();
        
        $dadosEtapa = array(
            'ET_Nome' => $request[''],
            'ET_Descricao' => $request[''],
            'Projeto_PRJ_ID' => $request['']//Esperar formulários de Raul/Maurício/Cláudio
        );
        
        $this->dbtableEtapa->insert($dadosEtapa); //Insere o cargo

        return;
    }
    
    public function update(array $request) //Função update padrão
    {
        $this->dbtableEtapa = new Application_Model_DbTable_Etapa();
        
        $dadosEtapa = array(
            'NomeTupla' => $request['Nome do campo de formulário']
        );
        
        $whereEtapa = $this->dbtableEtapa->getAdapter()
                ->quoteInto('"et_id" = ?', $request['Campo de formulário']); //busca pelo ID
        
        $this->dbtableEtapa->update($dadosEtapa, $whereEtapa);
    }
    
    public function delete($idEtapa) //Função Delete padrão
    {
        $this->dbtableEtapa = new Application_Model_DbTable_Etapa();       
                
        $whereEtapa= $this->dbtableEtapa->getAdapter()
                ->quoteInto('"et_id" = ?', $idEtapa); // Deleta pelo ID
        
        $this->dbtableCargo->delete($whereEtapa);
    }

}

