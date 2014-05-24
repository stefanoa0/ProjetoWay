<?php

class Application_Model_Equipe
{
    private $dbtableEquipe; //Instancia uma variável para o DBTABLE do model referido

    public function select($where = null, $order = null, $limit = null) //função Select padrão
    {
        $this->dbtableEquipe = new Application_Model_DbTable_Equipe(); //Instancia o Db table em sí
        $select = $this->dbtableEquipe->select() //padrão para todos
                ->from($this->dbtableEquipe)->order($order)->limit($limit); //padrão para todos

        if(!is_null($where)){
            $select->where($where);
        } //padrão

        return $this->dbtableEquipe->fetchAll($select)->toArray(); //padrão
    }
    
    public function find($id) //Função Find para buscar na tabela 
    {
        $this->dbtableEquipe = new Application_Model_DbTable_Equipe(); 
        $arr = $this->dbtableEquipe->find($id)->toArray();
        return $arr[0];
    }
    
    public function insert(array $request) // Função insert
    {
        $this->dbtableEquipe = new Application_Model_DbTable_Equipe();
        $equipeTrabalhaProjeto = new Application_Model_DbTable_EquipeTrabalhaProjeto();
        
        $dadosEquipe = array(
            'EQ_Nome' => $request['EQ_Nome'],
            'EQ_CustoEquipe' => $request['EQ_CustoEquipe']//Esperar formulários de Raul/Maurício/Cláudio
        );
        $idEquipe = $this->dbtableEquipe->insert($dadosEquipe);
        
        $dadosEquipeTrabalhaProjeto = array(
                'Equipe_EQ_ID' => $idEquipe,
                'Projeto_PRJ_ID' => $request['id']
        );
        
        $equipeTrabalhaProjeto->insert($dadosEquipeTrabalhaProjeto);

        return;
    }
    
    public function update(array $request) //Função update padrão
    {
        $this->dbtableEquipe = new Application_Model_DbTable_Equipe();
        
        $dadosEquipe = array(
            'NomeTupla' => $request['Nome do campo de formulário']
        );
        
        $whereEquipe= $this->dbtableEquipe->getAdapter()
                ->quoteInto('"eq_id" = ?', $request['Campo de formulário']); //busca pelo ID
        
        $this->dbtableEquipe->update($dadosEquipe, $whereEquipe);
    }
    
    public function delete($idEquipe) //Função Delete padrão
    {
        $this->dbtableCargo = new Application_Model_DbTable_Cargo();       
                
        $whereEquipe = $this->dbtableCargo->getAdapter()
                ->quoteInto('"eq_id" = ?', $idEquipe); // Deleta pelo ID
        
        $this->dbtableCargo->delete($whereEquipe);
    }

}

