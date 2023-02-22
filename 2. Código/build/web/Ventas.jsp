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
        <style>
            @media print{
                .seccion1, .btn, .columna{
                    display:none;
                }
            }
        </style>
    </head>
    <body>
        <div class="row">
            <div class="col-md-8 seccion1">
                <div class="card">
                    <h5 class="card-header">Ingrese datos del cliente</h5>
                    <div class="card-body">
                        <form method="post" action="Controlador?menu=Ventas">
                            <div class="row">
                                <div class="col-md-4 d-flex">
                                    <input type="number" name="documentocliente" class="form-control" placeholder="cedula" value="${cliente.getCedula()}">
                                    <input type="submit" name="accion" value="BuscarCliente" class="btn btn-outline-dark">
                                </div>
                                <div class="col-md-8 d-flex">
                                    <input type="text" name="nombrecliente" class="form-control" placeholder="Nombre del cliente" value="${cliente.getNombre()}">
                                </div>
                            </div>
                            <div class="row"></div>

                        </form>
                    </div>
                </div>
                <div class="card">
                    <h5 class="card-header">Ingrese datos del producto</h5>
                    <div class="card-body">
                        <form action="Controlador?menu=Ventas" method="post">
                            <div class="row">
                                <div class="col-md-4 d-flex form-group">
                                    <input type="number" name="codigoproducto" class="form-control" placeholder="Codigo Producto" value="${productoseleccionado.getId()}">
                                    <input type="submit" name="accion" value="BuscarProducto" class="btn btn-outline-dark">
                                </div>
                                <div class="col-md-8 d-flex form-group">
                                    <input type="text" name="nombreproducto" class="form-control" placeholder="Nombre Producto" value="${productoseleccionado.getNombreProducto()}">
                                </div>
                                <div class="col-md-4 d-flex form-group">
                                    <input type="text" name="precioproducto" class="form-control" placeholder="$ 0.00" value="${productoseleccionado.getPrecio()}">
                                </div>
                                <div class="col-md-8 d-flex form-group">
                                    <input type="number" value="1" name="cantidadproducto" class="form-control" placeholder="Cantidad">
                                </div>
                            </div>
                            <input type="submit" name="accion" value="AgregarProducto" class="btn btn-outline-primary col text-center">
                            <div class="row"></div>

                        </form>
                    </div>
                </div>
            </div>

            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        <div class="form-group row">
                            <label class="col-sm-2 col-form-label">Numero de factura</label>
                            <input class="form-control col-md-4" type="text" name="txtnumerofactura" value="${numerofactura}">
                        </div>

                    </div>

                    <div class="card-body">
                        <p> 
                            <img class="impresion" src="resources/img/TEF.png" align="right">
                        </p>
                        <table class="table">
                            <thead class="thead-color">
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Codigo</th>
                                    <th scope="col">Producto</th>
                                    <th scope="col">Precio</th>
                                    <th scope="col">Cantidad</th>
                                    <th scope="col">Total</th>
                                </tr>
                            </thead>
                            <tbody>

                                <c:forEach var="lista" items="${listaventas}">
                                    <tr>
                                        <th scope="row" style="width: 30px;">${lista.getItem()}</th>
                                        <td style="width: 30px;">${lista.getIdProducto()}</td>
                                        <td style="width: 350px;">${lista.getDescripcionProducto()}</td>
                                        <td>$ ${lista.getPrecio()}</td>
                                        <td style="width: 30px;">${lista.getCantidad()}</td>
                                        <td>$ ${lista.getSubtotal()}</td>
                                    </tr>
                                </c:forEach>

                            </tbody>
                        </table>
                    </div>
                    <div class="card-footer d-flex">
                        <div class="col-md-8 text-center">
                            <a class="btn btn-primary" onclick="print()" href="Controlador?menu=Ventas&accion=GenerarVenta">Vender</a>
                            <a class="btn btn-danger" href="Controlador?menu=Ventas&accion=NuevaVenta">Nueva Venta</a>

                        </div>
                        <div class="col-md-4">
                            <input type=text" name="txttotalapagar" class="form-control" placeholder="$ 0.00" disabled="disabled" value="${totalapagar}">
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
