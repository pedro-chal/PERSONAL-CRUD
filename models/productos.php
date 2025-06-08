<?php

include ("../config/conexion.php");


class productos extends Database
{
    public function getProducto()
    {
            //conecion
           $conec = $this->Conexion();  

           try {
             $stmt = $conec->prepare("CALL SP_Listar_productos()");
            $stmt->execute();

            $data = $stmt->FetchAll(PDO::FETCH_ASSOC);
           } catch (\Throwable $th) {
            $data = [];
           }
           return $data;
    }
    

    public function getProductor_x_id($id_producto){

        $conec = $this->Conexion();  

        try {
            //code...
             $stmt = $conec->prepare("CALL SP_productos_Por_Codigo(?)");
             $stmt->bindParam(1,$id_producto);
             $stmt->execute();

             $data = $stmt->FetchAll(PDO::FETCH_ASSOC);

        } catch (\Throwable $th) {
          $data = [];
        }
         return $data;

    }
}
