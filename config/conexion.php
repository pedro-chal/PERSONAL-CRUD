<?php

            class Database {
            private $host = "localhost";
            private $dbname = "crud";
            private $user = "root";
            private $pass = "";
            protected $dbh;

            protected function Conexion() {
                try {
                    // Conexión a la base de datos
                    $this->dbh = new PDO("mysql:host={$this->host};dbname={$this->dbname};charset=utf8", $this->user, $this->pass);
                    // Opcional: establecer atributos para manejar errores y excepciones
                    $this->dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                    return $this->dbh;
                } catch (PDOException $e) {
                    echo "Error de conexión: " . $e->getMessage();
                    die();
                }
            }

            function Desconectar() {
                // Cierra la conexión limpiando la propiedad
                $this->dbh = null;
            }
        }