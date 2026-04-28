<?php
    // script para crear una conexion con la BD

    // parametros requeridos para la conexion con la BD 

    // parametros BD local - Constantes
    define('USER', 'jdelgado'); // crea la constante USER con valor 'root'

    define('PW', '12345');
    define('HOST', 'localhost');
    define('BD', 'centro_medicoj');

    // parametros BD remota (infinityfree)
    /*define('USER', ''); // crea la constante USER con valor 'root'

    define('PW', '');
    define('HOST', '');
    define('BD', '');*/

    // conexion con la BD
    $conexion = mysqli_connect(HOST, USER, PW, BD);

    // Establecer conjunto de caracteres para el hosting
    mysqli_set_charset($conexion, 'utf8mb4');

    // Verificar la conexion con la BD

    if (!$conexion)
    {
        die("La conexión con la BD fallo: " + mysqli_error($conexion));
    }
    else
    {
        die ("conexión a la BD exitosa");
    }

?>
