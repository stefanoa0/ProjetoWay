<?php

class Application_Model_Prazo
{
    private $dbtablePrazo; //Instancia uma variável para o DBTABLE do model referido

    public function select($where = null, $order = null, $limit = null) //função Select padrão
    {
        $this->dbtablePrazo = new Application_Model_DbTable_Prazo(); //Instancia o Db table em sí
        $select = $this->dbtablePrazo->select() //padrão para todos
                ->from($this->dbtablePrazo)->order($order)->limit($limit); //padrão para todos

        if(!is_null($where)){
            $select->where($where);
        } //padrão

        return $this->dbtablePrazo->fetchAll($select)->toArray(); //padrão
    }
    
    public function find($id) //Função Find para buscar na tabela 
    {
        $this->dbtablePrazo = new Application_Model_DbTable_Prazo(); 
        $arr = $this->dbtablePrazo->find($id)->toArray();
        return $arr[0];
    }
    
    public function insert(array $request) // Função insert
    {
        $this->dbtablePrazo = new Application_Model_DbTable_Prazo();
        
        $dadosPrazo = array(
            'PRZ_DataInicial' => $request[''],
            'PRJ_DataFinal' => $request['']//Esperar formulários de Raul/Maurício/Cláudio
        );
        
        $this->dbtablePrazo->insert($dadosPrazo); //Insere o cargo

        return;
    }
    
    public function update(array $request) //Função update padrão
    {
        $this->dbtablePrazo = new Application_Model_DbTable_Prazo();
        
        $dadosPrazo = array(
            'NomeTupla' => $request['Nome do campo de formulário']
        );
        
        $wherePrazo= $this->dbtablePrazo->getAdapter()
                ->quoteInto('"pra_id" = ?', $request['Campo de formulário']); //busca pelo ID
        
        $this->dbtablePrazo->update($dadosPrazo, $wherePrazo);
    }
    
    public function delete($idPrazo) //Função Delete padrão
    {
        $this->dbtablePrazo = new Application_Model_DbTable_Prazo();       
                
        $wherePrazo= $this->dbtablePrazo->getAdapter()
                ->quoteInto('"pra_id" = ?', $idPrazo); // Deleta pelo ID
        
        $this->dbtablePrazo->delete($wherePrazo);
    }

}
