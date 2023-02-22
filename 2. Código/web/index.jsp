<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" type="text/css" href="resources/css/master.css">
        <title>Login</title>
    </head>
    <body>
        <div class="login-box">
            <img src="resources/img/logoSW2.JPG"  class="logo" alt="...">
            <h1>Iniciar Sesion</h1>
            <form method="POST" action="Validar">
                <label>Usuario</label>
                <input type="text"  name="txtusuario" placeholder="Ingrese usuario" required="">
                <label for="exampleInputPassword1">Contraseña</label>
                <input type="password" name="txtpassword" placeholder="Ingrese clave" required="">
                <div >
                    <button class="button button1" align="center" type="submit" name="accion" value="Ingresar">Ingresar</button>
                </div>
            </form>
        </div>
    </body>
</html>
