<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio de sesion</title>
</head>
<body>
    <h2>Iniciar sesion </h2>
    <!-- Formulario para el inicio de sesion -->
    <form action="../modelo/usuario_modelo.php" method="POST">
        <label for="login">Login:</label>
        <input type="text" id="" name="login" required autofocus>
        <br><br>
        <label for="password">Contraseña:</label>
        <input type="password" id="" name="password" required>
        <br><br>
        <input type="submit" value="Iniciar Sesion">
    </form>
</body>
</html>