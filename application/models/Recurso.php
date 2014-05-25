<?php

class Application_Model_Recurso
{
    private $dbtableRecurso; //Instancia uma variável para o DBTABLE do model referido

    public function select($where = null, $order = null, $limit = null) //função Select padrão
    {
        $this->dbtableRecurso = new Application_Model_DbTable_Recurso(); //Instancia o Db table em sí
        $select = $this->dbtableRecurso->select() //padrão para todos
                ->from($this->dbtableRecurso)->order($order)->limit($limit); //padrão para todos

        if(!is_null($where)){
            $select->where($where);
        } //padrão

        return $this->dbtableRecurso->fetchAll($select)->toArray(); //padrão
    }
    
    public function find($id) //Função Find para buscar na tabela 
    {
        $this->dbtableRecurso = new Application_Model_DbTable_Recurso(); 
        $arr = $this->dbtableRecurso->find($id)->toArray();
        return $arr[0];
    }
    
    public function insert(array $request) // Função insert
    {
        $this->dbtableRecurso = new Application_Model_DbTable_Recurso();
        
        $dadosRecurso = array(
            'REC_Nome' => $request['REC_Nome'],
            'REC_Quantidade' => $request['REC_quantidade'],
            'REC_Valor' => $request['REC_valor'],
            'Projeto_PRJ_ID' => $request['id'],
            'Categoria_CAT_ID' => $request['categoria']
            
        );
        
        $this->dbtableCargo->insert($dadosRecurso); //Insere o cargo

        return;
    }
    
    public function update(array $request) //Função update padrão
    {
        $this->dbtableRecurso = new Application_Model_DbTable_Recurso();
        
        $dadosRecurso = array(
            'NomeTupla' => $request['Nome do campo de formulário']
        );
        
        $whereRecurso= $this->dbtableRecurso->getAdapter()
                ->quoteInto('"rec_id" = ?', $request['Campo de formulário']); //busca pelo ID
        
        $this->dbtableCargo->update($dadosRecurso, $whereRecurso);
    }
    
    public function delete($idRecurso) //Função Delete padrão
    {
        $this->dbtableRecurso = new Application_Model_DbTable_Recurso();       
                
        $whereRecurso= $this->dbtableCargo->getAdapter()
                ->quoteInto('"rec_id" = ?', $idRecurso); // Deleta pelo ID
        
        $this->dbtableCargo->delete($whereRecurso);
    }

}

