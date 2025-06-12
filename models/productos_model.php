<?php

include ("../config/conexion.php");


class Productos extends Database
{

  //CONSULTA A LOS PRODUCTOS DE LA BASES DE DATOS
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
    
    //CONSULTA A LOS PRODUCTOS DE LA BASES DE DATOS POR SU ID
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

    public function insert_productos($productoNombre){

      $con = $this->Conexion();

      try {
        //code...


        $stmt = $con->prepare('SP_Registrar_productos(?)');

        $stmt->bindParam(1,$productoNombre);

        $stmt->execute();

        return $data = true;

      } catch (\Throwable $th) {
        //throw $th;

        return $data = true;


      }

    }

    public function eliminar_productos($id_producto){

      $con = $this->Conexion();

      try {
        //code...


        $stmt = $con->prepare('SP_Borrar_productos(?)');

        $stmt->bindParam(1,$id_producto);

        $stmt->execute();

        return $data = true;

      } catch (\Throwable $th) {
        //throw $th;

        return $data = true;


      }

    }

     public function actualizar_productos($id_producto,$nombre_producto){

      $con = $this->Conexion();

      try {
        //code...


        $stmt = $con->prepare('SP_Actualizar_productos(?,?)');

        $stmt->bindParam(1,$id_producto);
        $stmt->bindParam(2,$nombre_producto);

        $stmt->execute();

        return $data = true;

      } catch (\Throwable $th) {
        //throw $th;

        return $data = true;


      }

    }
}
