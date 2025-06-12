<?php
    // require_once("../config/conexion.php");
    require_once("../models/productos_model.php");
    $productos= new Productos;


        switch ($_GET['op']) {
            case 'listar':
               
                $datos = $productos->getProducto();

                // $data = [];


                // foreach ($datos as $key => $value) {
                   
                //         $sub_arrya = [];
                //         $sub_arrya [] = $value['nombre_producto'] ;
                //         $sub_arrya [] = "boton 1 {$value['id_producto']} ";
                //         $sub_arrya [] = "boton 2 {$value['id_producto']} ";
                //          $data[] =   $sub_arrya;


                // }

                // ESTA ES LA FORMA QUE SE ME OCURRIO UTILIZANDO EL ARRAY ASOCIATIVO QUE YA TENEMOS
                // AGREGARLE 2 ELEMEMENTOS MAS QUE SERIAN LOS 2 BOTONES, SIMPLEMENTE RECORRIENDO EL ARREGLO
                // QUE VIENE DE LA BASES DE DATOS Y AGREGANDOLE UNO NUEVO
                //  foreach ($datos as $key => $value) {
                   
                //         $datos[$key]['Boton 1'] = 'html del boton';
                //         $datos[$key]['Boton 2'] = 'html del boton';


                // }

                $results = [
                    "sEcho" => 1,
                    "iTotalRecords"=>count($datos),
                    "iTotalDisplayRecords"=>count($datos),
                    "aaData" =>   $datos


                ];

                echo json_encode($results);



                break;


            case 'value':
                # code...
                break;
            
            default:
                # code...
                break;
        }


