<?php 
session_start();
    class database{
        public $que;
        private $servername='localhost';
        private $username='root';
        private $password='######';
        private $dbname='cs4125db';
        private $result=array();
        private $mysqli='';

        public function __construct(){
            $this->mysqli = new mysqli($this->servername,$this->username,$this->password,$this->dbname);
        }

        public function insert($table,$para=array()){
            $table_columns = implode(',', array_keys($para));
            $table_value = implode("','", $para);
            $sql="INSERT INTO $table($table_columns) VALUES('$table_value')";
            
            $f = fopen("debug.txt", 'a');
            $debug_var[0] = $sql;
            $debug_var[1] = "test2";
            $tmp = print_r($debug_var, true);
            fwrite($f, $tmp);
            $txt = "\n";
            fwrite($f, $txt);
            fclose($f);                   
            
            $result = $this->mysqli->query($sql);
        }

        public function update($table,$para=array(),$id){
            $args = array();

            foreach ($para as $key => $value) {
                $args[] = "$key = '$value'"; 
            }

            $sql="UPDATE  $table SET " . implode(',', $args);

            $sql .=" WHERE $id";

            $result = $this->mysqli->query($sql);
        }

        public function delete($table,$id){
            $sql="DELETE FROM $table";
            $sql .=" WHERE $id ";
            $sql;
            $result = $this->mysqli->query($sql);
        }

        public $sql;

        public function select($table,$rows="*",$where = null){
            if ($where != null) {
                $sql="SELECT $rows FROM $table WHERE $where";
            }else{
                $sql="SELECT $rows FROM $table";
            } 

            $this->sql = $result = $this->mysqli->query($sql);
        }

        public function __destruct(){
            $this->mysqli->close();
        }
    }
?>