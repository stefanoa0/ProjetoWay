<?php

class Application_Model_Categoria
{
   private $dbtableCategoria; //Instancia uma variável para o DBTABLE do model referido

    public function select($where = null, $order = null, $limit = null) //função Select padrão
    {
        $this->dbtableCategoria = new Application_Model_DbTable_Categoria(); //Instancia o Db table em sí
        $select = $this->dbtableCategoria->select() //padrão para todos
                ->from($this->dbtableCategoria)->order($order)->limit($limit); //padrão para todos

        if(!is_null($where)){
            $select->where($where);
        } //padrão

        return $this->dbtableCategoria->fetchAll($select)->toArray(); //padrão
    }
    
    public function find($id) //Função Find para buscar na tabela 
    {
        $this->dbtableCategoria = new Application_Model_DbTable_Categoria(); 
        $arr = $this->dbtableCategoria->find($id)->toArray();
        return $arr[0];
    }
    
    public function insert(array $request) // Função insert
    {
        $this->dbtableCategoria = new Application_Model_DbTable_Categoria();
        
        $dadosCategoria = array(
            'CAT_Nome' => $request[''],
            'CAT_Descricao' => $request['']
            //Esperar formulários de Raul/Maurício/Cláudio
        );
        
        $this->dbtableCategoria->insert($dadosCategoria); //Insere o cargo

        return;
    }
    
    public function update(array $request) //Função update padrão
    {
        $this->dbtableCategoria = new Application_Model_DbTable_Categoria();
        
        $dadosCategoria = array(
            'NomeTupla' => $request['Nome do campo de formulário']
        );
        
        $whereCategoria= $this->dbtableCargo->getAdapter()
                ->quoteInto('"cat_id" = ?', $request['Campo de formulário']); //busca pelo ID
        
        $this->dbtableCargo->update($dadosCategoria, $whereCategoria);
    }
    
    public function delete($idCategoria) //Função Delete padrão
    {
        $this->dbtableCategoria = new Application_Model_DbTable_Categoria();       
                
        $whereCategoria= $this->dbtableCategoria->getAdapter()
                ->quoteInto('"cat_id" = ?', $idCategoria); // Deleta pelo ID
        
        $this->dbtableCargo->delete($whereCategoria);
    }

}

