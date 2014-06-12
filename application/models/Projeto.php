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
        $this->dbtableProjeto = new Application_Model_DbTable_VProjetoTotal(); 
        $arr = $this->dbtableProjeto->find($id)->toArray();
        return $arr[0];
    }
    
    public function insert(array $request) // Função insert
    {
        $this->dbtableProjeto = new Application_Model_DbTable_Projeto();
        $dbtablePrazo = new Application_Model_DbTable_Prazo();
        $dbtableCusto = new Application_Model_DbTable_Custo();
        
        $dadosCusto = array(
          'CT_Inicial' => $request['CT_Inicial']
        );
        
        $idCusto = $dbtableCusto->insert($dadosCusto);
        
        $dadosPrazo = array(
            'PRZ_DataInicial' => $request['PRZ_Datainicial'],
            'PRZ_DataFinal' => $request['PRZ_Datafinal']//Esperar formulários de Raul/Maurício/Cláudio
        );
        
        $idPrazo = $dbtablePrazo->insert($dadosPrazo);
        
        $dadosProjeto = array(
            'PRJ_Nome' => $request['PRJ_Nome'],
            'PRJ_Descricao' => $request['PRJ_Descricao'],//Esperar formulários de Raul/Maurício/Cláudio
            'Prazo_PRZ_ID' => $idPrazo,
            'Custo_CT_ID' => $idCusto
            
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
    
    public function insertEquipeProjeto(array $request){
        $this->dbtableProjeto = new Application_Model_DbTable_EquipeTrabalhaProjeto();
        
        $dadosEquipe = array(
            'Projeto_PRJ_ID' => $request['Projeto1'],
            'Equipe_EQ_ID' => $request['idEquipe']
        );
        
        
        $this->dbtableProjeto->insert($dadosEquipe);
    }

}

