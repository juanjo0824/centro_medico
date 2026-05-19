<?php
    require_once "../modelo/usuario_modelo.php";

    // Mostrar formulario
    function mostrar_login()
    {
        require '../vista/login_vista.php';

    }

    // Procesar credenciales
    function autenticar()
    {
        if ($_SERVER['REQUEST_METHOD'] === 'POST') 
        {
            $login = $_POST['login'];
            $password = $_POST['password'];

            $usuario = validar_usuario($login, $password);

            if ($usuario) 
            {
                header("Location: index.php");
                exit();
            }
            else 
            {
                echo "Credenciales incorrectas. Por favor, inténtalo de nuevo.";
            }
        }
    }
?>