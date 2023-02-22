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
                <form action="Controlador?menu=Productos" method="POST">
                    <div class="form-group">
                        <h2 class="card-title">AGREGAR PRODUCTO</h2>
                        <hr size="8px" color="red" />
                        <label>Nombre de producto</label>
                        <input type="text" class="form-control" id="exampleInputPassword1" name="txtNombreProducto" value="${productoSeleccionado.getNombreProducto()}">
                    </div>
                    <div class="form-group">
                        <label>Descripcion producto</label>
                        <input type="text" class="form-control" name="txtDescripcion" value="${productoSeleccionado.getDescripcion()}">
                    </div>
                    <div class="form-group">
                        <label>Unidad</label>
                        <input type="text" class="form-control" name="txtUnidad" value="${productoSeleccionado.getUnidad()}">
                    </div>
                    <div class="form-group">
                        <label>Precio</label>
                        <input type="text" class="form-control" name="txtPrecio" value="${productoSeleccionado.getPrecio()}">
                    </div>
                    <input type="submit" class="btn btn-primary" name="accion" value="Agregar" >
                    <input type="submit" class="btn btn-success" name="accion" value="Actualizar" >
                </form>
            </div>

            <div class="col-md-8">
                <h2>INVENTARIO</h2>
                <hr size="8px" color="black" />
                <table class="table">
                    <thead class="thead-color">
                        <tr>
                            <th scope="col">Codigo</th>
                            <th scope="col">Nombre producto</th>
                            <th scope="col">Descripcion</th>
                            <th scope="col">Unidad</th>
                            <th scope="col">Precio</th>
                            <th scope="col">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="producto" items="${productos}">
                            <tr>
                                <th scope="row">${producto.getId()}</th>
                                <td>${producto.getNombreProducto()}</td>
                                <td>${producto.getDescripcion()}</td>
                                <td>${producto.getUnidad()}</td>
                                <td>${producto.getPrecio()}</td>
                                <td>
                                    <a class="button3" href="Controlador?menu=Productos&accion=Cargar&id=${producto.getId()}">Actualizar</a>
                                    <a class="btn btn-danger" href="Controlador?menu=Productos&accion=Eliminar&id=${producto.getId()}">Eliminar</a>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script> 
    </body>
</html>