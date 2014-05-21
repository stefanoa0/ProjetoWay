<?php

class Application_Model_Projeto
{
    private $dbtableProjeto; //Instancia uma variável para o DBTABLE do model referido

    public function select($where = null, $order = null, $limit = null) //função Select padrão
    {
        $this->dbtableProjeto = new Application_Model_DbTable_Projeto(); //Instancia o Db table em sí
        $select = $this->dbtableProjeto->select() //padrão para todos
                ->from($this->dbtableProjeto)->order($order)->limit($limit); //padrão para todos

        if(!is_null($where)){
            $select->where($where);
        } //padrão

        return $this->dbtableProjeto->fetchAll($select)->toArray(); //padrão
    }
    
    public function find($id) //Função Find para buscar na tabela 
    {
        $this->dbtableProjeto = new Application_Model_DbTable_Projeto(); 
        $arr = $this->dbtableProjeto->find($id)->toArray();
        return $arr[0];
    }
    
    public function insert(array $request) // Função insert
    {
        $this->dbtableProjeto = new Application_Model_DbTable_Projeto();
        
        $dadosProjeto = array(
            'NomeTupla' => $request['Nome do campo de formulário'] //Esperar formulários de Raul/Maurício/Cláudio
        );
        
        $this->dbtableProjeto->insert($dadosProjeto); //Insere o cargo

        return;
    }
    
    public function update(array $request) //Função update padrão
    {
        $this->dbtableProjeto = new Application_Model_DbTable_Projetojeto();
        
        $dadosProjeto = array(
            'NomeTupla' => $request['Nome do campo de formulário']
        );
        
        $whereProjeto = $this->dbtableProjeto->getAdapter()
                ->quoteInto('"pro_id" = ?', $request['Campo de formulário']); //busca pelo ID
        
        $this->dbtableCargo->update($dadosProjeto, $whereProjeto);
    }
    
    public function delete($idProjeto) //Função Delete padrão
    {
        $this->dbtableProjeto = new Application_Model_DbTable_Projeto();       
                
        $whereProjeto= $this->dbtableProjeto->getAdapter()
                ->quoteInto('"pro_id" = ?', $idProjeto); // Deleta pelo ID
        
        $this->dbtableProjeto->delete($whereProjeto);
    }

}

