<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="resources/css/master.css">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link href="all.css" rel="stylesheet"> 
        <title>TecEclipse.com</title>
    </head>
    <body>
        <div class="row">
            <div class="col-md-3">
                <div class="card-body">
                        <form action="Controlador?menu=Usuarios" method="POST">
                            <div class="form-group">
                              <h2 class="card-title">AGREGAR USUARIOS</h2>
                               <hr size="8px" color="red" />
                                <label>Cedula</label>
                                <input type="number" class="form-control" name="txtcedula" required="" value="${usuarioSeleccionado.getCedula()}">
                            </div>
                            <div class="form-group">
                                <label>Nombres y apellidos</label>
                                <input type="text" class="form-control" name="txtnombres" required="" value="${usuarioSeleccionado.getNombre()}">
                            </div>
                            <div class="form-group">
                                <label>Direccion</label>
                                <input type="text" class="form-control" name="txtdireccion" required="" value="${usuarioSeleccionado.getDireccion()}">
                            </div>
                            <div class="form-group">
                                <label>Telefono</label>
                                <input type="text" class="form-control" name="txttelefono" required="" value="${usuarioSeleccionado.getTelefono()}">
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <input type="text" class="form-control" name="txtpassword" required="" value="${usuarioSeleccionado.getPassword()}">
                            </div>
                            <div class="form-group">
                                <label>Rol</label>
                                <select class="form-control form-control-sm" name="txtrol">
                                    <option>Cliente</option>
                                    <option>Proveedor</option>
                                    <option>Empleado</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Estado</label>
                                <select class="form-control form-control-sm" name="txtestado">
                                    <option>Activo</option>
                                    <option>Inactivo</option>
                                </select>
                            </div>

                            <input type="submit" class="btn btn-primary" name="accion" value="Agregar" >
                            <input type="submit" class="btn btn-success" name="accion" value="Actualizar" >
                        </form>
                    
                </div>
            </div>

            <div class="col-md-8">
            <h2>REGISTROS</h2>
                <hr size="8px" color="black" />
                <table class="table">
                    <thead class="thead-color">
                        <tr>
                            <th scope="col">id</th>
                            <th scope="col">Cedula</th>
                            <th scope="col">Nombres</th>
                            <th scope="col">Direccion</th>
                            <th scope="col">Telefono</th>
                            <th scope="col">Contraseña</th>
                            <th scope="col">Rol</th>
                            <th scope="col">Estado</th>
                            <th scope="col">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="usuario" items="${usuarios}">
                            <tr>
                                <th scope="row">${usuario.getId()}</th>
                                <td>${usuario.getCedula()}</td>
                                <td>${usuario.getNombre()}</td>
                                <td>${usuario.getDireccion()}</td>
                                <td>${usuario.getTelefono()}</td>
                                <td>${usuario.getPassword()}</td>
                                <td>${usuario.getRol()}</td>
                                <td>${usuario.getEstado()}</td>
                                <td>
                                    <a class="button3" href="Controlador?menu=Usuarios&accion=Cargar&id=${usuario.getId()}">Editar</a>
                                    <a class="btn btn-danger" href="Controlador?menu=Usuarios&accion=Eliminar&id=${usuario.getId()}">Eliminar</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            </div>
            <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>