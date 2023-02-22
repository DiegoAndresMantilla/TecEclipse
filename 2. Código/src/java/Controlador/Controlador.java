package Controlador;

import Modelo.Producto;
import Modelo.ProductoDAO;
import Modelo.Usuario;
import Modelo.UsuarioDAO;
import Modelo.Venta;
import Modelo.VentaDAO;
import java.io.IOException;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Controlador", urlPatterns = {"/Controlador"})
public class Controlador extends HttpServlet {

    Usuario usuario = new Usuario();
    UsuarioDAO usuarioDAO = new UsuarioDAO();
    int idUsuario;
    Producto producto = new Producto();
    ProductoDAO productoDAO = new ProductoDAO();
    int idProducto;
    Venta venta = new Venta();
    int item, codProducto, precio, cantidad;
    String descripcion;
    double subtotal, totalapagar = 0;
    List<Venta> listaVentas = new ArrayList();
    VentaDAO ventaDAO = new VentaDAO();
    int numfac = 0;
    NumberFormat formatoNumero1;
    String total1;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");
        if (menu.equals("Principal")) {
            request.getRequestDispatcher("Principal.jsp").forward(request, response);
        }
        if (menu.equals("Productos")) {
            switch (accion) {
                case "Listar":
                    List lista = productoDAO.Listar();
                    request.setAttribute("productos", lista);

                    break;
                case "Agregar":

                    String nombreProducto = request.getParameter("txtNombreProducto");
                    String descripcionProducto = request.getParameter("txtDescripcion");
                    String precioProducto = request.getParameter("txtPrecio");
                    String unidadProducto = request.getParameter("txtUnidad");
                    producto.setDescripcion(descripcionProducto);
                    producto.setNombreProducto(nombreProducto);
                    producto.setUnidad(unidadProducto);
                    producto.setPrecio(precioProducto);
                    productoDAO.Agregar(producto);
                    request.getRequestDispatcher("Controlador?menu=Productos&accion=Listar").forward(request, response);

                    break;
                case "Eliminar":

                    idProducto = Integer.parseInt(request.getParameter("id"));
                    productoDAO.EliminarPorCodigo(idProducto);
                    request.getRequestDispatcher("Controlador?menu=Productos&accion=Listar").forward(request, response);

                    break;
                case "Actualizar":

                    Producto producto1 = new Producto();
                    String nombreproductoUpdate = request.getParameter("txtNombreProducto");
                    String descripcionproductoUpdate = request.getParameter("txtDescripcion");
                    String unidadUpdate = request.getParameter("txtUnidad");
                    String precioUpdate = request.getParameter("txtPrecio");
                    producto1.setNombreProducto(nombreproductoUpdate);
                    producto1.setDescripcion(descripcionproductoUpdate);
                    producto1.setUnidad(unidadUpdate);
                    producto1.setPrecio(precioUpdate);
                    producto1.setId(idProducto);
                    productoDAO.Actualizar(producto1);
                    request.getRequestDispatcher("Controlador?menu=Productos&accion=Listar").forward(request, response);
                    break;
                case "Cargar":

                    idProducto = Integer.parseInt(request.getParameter("id"));
                    Producto producto = productoDAO.ConsultaPorCodigo(idProducto);
                    request.setAttribute("productoSeleccionado", producto);
                    request.getRequestDispatcher("Controlador?menu=Productos&accion=Listar").forward(request, response);

                    break;
            }
            request.getRequestDispatcher("Productos.jsp").forward(request, response);
        }
        if (menu.equals("Usuarios")) {

            switch (accion) {
                case "Listar":
                    List lista = usuarioDAO.Listar();
                    request.setAttribute("usuarios", lista);

                    break;
                case "Agregar":

                    int cedula = Integer.parseInt(request.getParameter("txtcedula"));
                    String nombre = request.getParameter("txtnombres");
                    String password = request.getParameter("txtpassword");
                    String rol = request.getParameter("txtrol");
                    String estado = request.getParameter("txtestado");
                    String direccion = request.getParameter("txtdireccion");
                    String telefono = request.getParameter("txttelefono");
                    usuario.setCedula(cedula);
                    usuario.setNombre(nombre);
                    usuario.setPassword(password);
                    usuario.setRol(rol);
                    usuario.setEstado(estado);
                    usuario.setDireccion(direccion);
                    usuario.setTelefono(telefono);
                    usuarioDAO.Agregar(usuario);
                    request.getRequestDispatcher("Controlador?menu=Usuarios&accion=Listar").forward(request, response);

                    break;
                case "Actualizar":

                    Usuario usuario1 = new Usuario();
                    int cedulaUpdate = Integer.parseInt(request.getParameter("txtcedula"));
                    String nombreUpdate = request.getParameter("txtnombres");
                    String passwordUpdate = request.getParameter("txtpassword");
                    String rolUpdate = request.getParameter("txtrol");
                    String estadoUpdate = request.getParameter("txtestado");
                    String direccionUpdate = request.getParameter("txtdireccion");
                    String telefonoUpdate = request.getParameter("txttelefono");
                    usuario1.setCedula(cedulaUpdate);
                    usuario1.setNombre(nombreUpdate);
                    usuario1.setPassword(passwordUpdate);
                    usuario1.setRol(rolUpdate);
                    usuario1.setEstado(estadoUpdate);
                    usuario1.setDireccion(direccionUpdate);
                    usuario1.setTelefono(telefonoUpdate);
                    usuario1.setId(idUsuario);
                    usuarioDAO.Actualizar(usuario1);
                    request.getRequestDispatcher("Controlador?menu=Usuarios&accion=Listar").forward(request, response);

                    break;
                case "Cargar":

                    idUsuario = Integer.parseInt(request.getParameter("id"));
                    Usuario usuario = usuarioDAO.ListarPorId(idUsuario);
                    request.setAttribute("usuarioSeleccionado", usuario);
                    request.getRequestDispatcher("Controlador?menu=Usuarios&accion=Listar").forward(request, response);

                    break;
                case "Eliminar":

                    idUsuario = Integer.parseInt(request.getParameter("id"));
                    usuarioDAO.Eliminar(idUsuario);
                    request.getRequestDispatcher("Controlador?menu=Usuarios&accion=Listar").forward(request, response);

                    break;
            }

            request.getRequestDispatcher("Usuarios.jsp").forward(request, response);
        }
        if (menu.equals("Clientes")) {
            request.getRequestDispatcher("Clientes.jsp").forward(request, response);
        }
        if (menu.equals("Ventas")) {
            switch (accion) {
                case "BuscarCliente":
                    int documentoCliente = Integer.parseInt(request.getParameter("documentocliente"));
                    usuario = usuarioDAO.BuscarCliente(documentoCliente);
                    request.setAttribute("cliente", usuario);
                    break;

                case "BuscarProducto":
                    int codigoProducto = Integer.parseInt(request.getParameter("codigoproducto"));
                    producto = productoDAO.ConsultaPorCodigo(codigoProducto);
                    request.setAttribute("productoseleccionado", producto);
                    request.setAttribute("cliente", usuario);
                    for (int i = 0; i < listaVentas.size(); i++) {
                        totalapagar += listaVentas.get(i).getSubtotal();
                    }
                    formatoNumero1 = NumberFormat.getNumberInstance();
                    total1 = formatoNumero1.format(totalapagar);
                    request.setAttribute("totalapagar", total1);
                    request.setAttribute("listaventas", listaVentas);
                    break;

                case "AgregarProducto":
                    totalapagar = 0;
                    venta = new Venta();
                    item++;
                    codProducto = Integer.parseInt(request.getParameter("codigoproducto"));
                    descripcion = request.getParameter("nombreproducto");
                    precio = Integer.parseInt(request.getParameter("precioproducto"));
                    cantidad = Integer.parseInt(request.getParameter("cantidadproducto"));
                    subtotal = precio * cantidad;
                    venta.setItem(item);
                    venta.setDescripcionProducto(descripcion);
                    venta.setCantidad(cantidad);
                    venta.setPrecio(precio);
                    venta.setSubtotal(subtotal);
                    venta.setIdProducto(codProducto);
                    listaVentas.add(venta);
                    System.err.println("error venta");
                    request.setAttribute("listaventas", listaVentas);
                    for (int i = 0; i < listaVentas.size(); i++) {
                        totalapagar += listaVentas.get(i).getSubtotal();
                    }
                    formatoNumero1 = NumberFormat.getNumberInstance();
                    total1 = formatoNumero1.format(totalapagar);
                    request.setAttribute("totalapagar", total1);
                    break;

                case "GenerarVenta":

                    Calendar cal = Calendar.getInstance();
                    SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
                    String fecha = formatter.format(cal.getTime());

                    venta.setIdCliente(usuario.getId());
                    venta.setIdEmpleado(1);
                    venta.setNumeroComprobante("" + numfac);
                    venta.setFecha(fecha);
                    venta.setMonto(totalapagar);
                    venta.setEstado("1");
                    ventaDAO.RegistrarVenta(venta);
                    int idv = ventaDAO.ObtenerMaximoIdVentas();
                    for (int i = 0; i < listaVentas.size(); i++) {
                        venta = new Venta();
                        venta.setIdVenta(idv);
                        venta.setIdProducto(listaVentas.get(i).getIdProducto());
                        venta.setCantidad(listaVentas.get(i).getCantidad());
                        venta.setPrecio(listaVentas.get(i).getPrecio());
                        ventaDAO.GuardarDetalleVenta(venta);
                    }

                    break;

                default:
                    String factura = ventaDAO.ObtenerNumeroDeFactura();
                    System.err.println("nume factura" + factura);
                    if (factura == null) {
                        factura = "1";
                    } else {
                        numfac = Integer.parseInt(factura) + 1;
                    }

                    request.setAttribute("numerofactura", numfac);

            }
            request.getRequestDispatcher("Ventas.jsp").forward(request, response);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
