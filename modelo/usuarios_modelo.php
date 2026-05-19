<?php
    require_once "../config/conexion.php";
    
    //Funcion para buscar un usuario por su login
    function validar_usuario($login, $password)
    {
        //establecer conexion con la BD

        $conexion = conectar();

        //instruccion SQL para hacer la consulta a la BD

        $sql = "SELECT login_usuario, password_usuario, estado_uduario, tipo_usuario, COUNT(*) AS contar FROM usuario WHERE login_usuario = '$login' AND password_usuario = '$password'";

        //ejecutar la consulta SQL a la base de datos

        $consulta = mysqli_query($conexion, $sql) or trigger_error("Error en la consulta SQL: " . mysqli_error($conexion));

        //Convertir consulta en Array

        $resultado = mysqli_fetch_array($consulta);

        //verificar si el usuario existe en la BD

        if ($resultado['contar'] > 0) 
        {
            echo "el usuario existe en la BD";
            echo $resultado['login_usuario'];
        } 
        else 
        {
            echo "el usuario no existe en la BD o usuario o contraseña incorrectos";
        }
    }

    conectar();
?>