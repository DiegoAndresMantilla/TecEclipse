package Modelo;

import Config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ProductoDAO {

    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Conexion cn = new Conexion();
    int r;


    public Producto ConsultaPorCodigo(int idProducto) {
        Producto producto = new Producto();
        String consulta = "SELECT * FROM productos WHERE id = " + idProducto;
        con = cn.Conexion();
        try {
            ps = con.prepareStatement(consulta);
            rs = ps.executeQuery();
            while (rs.next()) {
                producto.setId(rs.getInt("id"));
                producto.setNombreProducto(rs.getString("nombreproducto"));
                producto.setDescripcion(rs.getString("descripcionproducto"));
                producto.setUnidad(rs.getString("unidad"));
                producto.setPrecio(rs.getString("precio"));

            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return producto;
    }

        public int Actualizar(Producto producto) {
        String sentencia = "UPDATE productos set nombreproducto=?,descripcionproducto=?,unidad=?,precio=? WHERE id=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sentencia);
            ps.setString(1, producto.getNombreProducto());
            ps.setString(2, producto.getDescripcion());
            ps.setString(3, producto.getUnidad());
            ps.setString(4, producto.getPrecio());
            ps.setInt(5, producto.getId());
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return r;
    }
    
    public int Agregar(Producto producto) {
        
        String sentencia = "INSERT INTO productos (nombreproducto, descripcionproducto, unidad, precio) VALUES (?,?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sentencia);
            ps.setString(1, producto.getNombreProducto());
            ps.setString(2, producto.getDescripcion());
            ps.setString(3, producto.getUnidad());
            ps.setString(4, producto.getPrecio());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return r;
    }

    public List Listar() {
        String consulta = "SELECT * FROM productos";
        List<Producto> lista = new ArrayList();

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(consulta);
            rs = ps.executeQuery();
            while (rs.next()) {
                Producto producto = new Producto();
                producto.setId(rs.getInt("id"));
                producto.setNombreProducto(rs.getString("nombreproducto"));
                producto.setDescripcion(rs.getString("descripcionproducto"));
                producto.setUnidad(rs.getString("unidad"));
                producto.setPrecio(rs.getString("precio"));
                lista.add(producto);

            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public void EliminarPorCodigo(int idProducto) {
        String sql = "DELETE FROM productos WHERE id=" + idProducto;
        con = cn.Conexion();
        try {
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductoDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
 }