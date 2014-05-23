<?php

class Application_Model_Login
{
    
    private $dbtableLogin; //Instancia uma variável para o DBTABLE do model referido

    public function select($where = null, $order = null, $limit = null) //função Select padrão
    {
        $this->dbtableLogin = new Application_Model_DbTable_Login(); //Instancia o Db table em sí
        $select = $this->dbtableLogin->select() //padrão para todos
                ->from($this->dbtableLogin)->order($order)->limit($limit); //padrão para todos

        if(!is_null($where)){
            $select->where($where);
        } //padrão

        return $this->dbtableLogin->fetchAll($select)->toArray(); //padrão
    }
    
    public function find($id) //Função Find para buscar na tabela 
    {
        $this->dbtableLogin = new Application_Model_DbTable_Login(); 
        $arr = $this->dbtableLogin->find($id)->toArray();
        return $arr[0];
    }
    
    public function insert(array $request) // Função insert
    {
        $this->dbtableLogin = new Application_Model_DbTable_Login();
        
        $senhaCriptografada = sh1($request['']);
        
        
        $dadosLogin = array(
            'LO_Login' => $request[''],
            'LO_Senha' => $senhaCriptografada//Esperar formulários de Raul/Maurício/Cláudio
        );
        
        $this->dbtableLogin->insert($dadosLogin); //Insere o cargo

        return;
    }
    
    public function update(array $request) //Função update padrão
    {
        $this->dbtableLogin = new Application_Model_DbTable_Login();
        
        $dadosLogin = array(
            'NomeTupla' => $request['Nome do campo de formulário']
        );
        
        $whereLogin= $this->dbtableLogin->getAdapter()
                ->quoteInto('"us_id" = ?', $request['Campo de formulário']); //busca pelo ID
        
        $this->dbtableLogin->update($dadosLogin, $whereLogin);
    }
    
    public function delete($idLogin) //Função Delete padrão
    {
        $this->dbtableLogin = new Application_Model_DbTable_Login();       
                
        $whereLogin= $this->dbtableLogin->getAdapter()
                ->quoteInto('"us_id" = ?', $idLogin); // Deleta pelo ID
        
        $this->dbtableCargo->delete($whereLogin);
    }

}

