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

public class UsuarioDAO {

    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Conexion cn = new Conexion();
    int r;

    public Usuario BuscarCliente(int cedula){
        Usuario usuario = new Usuario();
        String consulta = "SELECT * FROM usuarios WHERE cedula = ?";
        con = cn.Conexion();
        try {
            ps = con.prepareStatement(consulta);
            ps.setInt(1, cedula);
            rs = ps.executeQuery();
            while(rs.next()){
                usuario.setId(rs.getInt("id"));
                usuario.setCedula(rs.getInt("cedula"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setRol(rs.getString("rol"));
                usuario.setEstado(rs.getString("estado"));
                usuario.setDireccion(rs.getString("direccion"));
                usuario.setTelefono(rs.getString("telefono"));
                System.err.println(""+usuario.getNombre());
              }
        } catch (Exception e) {
        }
        return usuario;
    }

    
    public Usuario Validar(int cedula, String password) {
        Usuario usuario = new Usuario();
        String consulta = "SELECT * FROM usuarios WHERE cedula = ? AND password = ?";
        con = cn.Conexion();
        try {
            ps = con.prepareStatement(consulta);
            ps.setInt(1, cedula);
            ps.setString(2, password);
            rs = ps.executeQuery();
            rs.next();
            do {
                usuario.setId(rs.getInt("id"));
                usuario.setCedula(rs.getInt("cedula"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setPassword(rs.getString("password"));
                usuario.setEstado(rs.getString("estado"));
            } while (rs.next());
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return usuario;
    }

    public List Listar() {
        String consulta = "SELECT * FROM usuarios";
        List<Usuario> lista = new ArrayList();

        try {
            con = cn.Conexion();
            ps = con.prepareStatement(consulta);
            rs = ps.executeQuery();
            while (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("id"));
                usuario.setCedula(rs.getInt("cedula"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setPassword(rs.getString("password"));
                usuario.setEstado(rs.getString("estado"));
                usuario.setRol(rs.getString("rol"));
                usuario.setDireccion(rs.getString("direccion"));
                usuario.setTelefono(rs.getString("telefono"));
                lista.add(usuario);

            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public int Agregar(Usuario usuario) {

        String sentencia = "INSERT INTO usuarios (cedula,nombre,password,rol,estado,direccion, telefono) VALUES (?,?,?,?,?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sentencia);
            ps.setInt(1, usuario.getCedula());
            ps.setString(2, usuario.getNombre());
            ps.setString(3, usuario.getPassword());
            ps.setString(4, usuario.getRol());
            ps.setString(5, usuario.getEstado());
            ps.setString(6, usuario.getDireccion());
            ps.setString(7, usuario.getTelefono());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return r;
    }

    public Usuario ListarPorId(int id) {
        Usuario usuario = new Usuario();
        String consulta = "SELECT * FROM usuarios WHERE id=" + id;
        con = cn.Conexion();
        try {
            ps = con.prepareStatement(consulta);
            rs = ps.executeQuery();
            while (rs.next()) {
                usuario.setCedula(rs.getInt(2));
                usuario.setNombre(rs.getString(3));
                usuario.setPassword(rs.getString(4));
                usuario.setRol(rs.getString(5));
                usuario.setEstado(rs.getString(6));
                usuario.setDireccion(rs.getString(7));
                usuario.setTelefono(rs.getString(8));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return usuario;

    }

    public int Actualizar(Usuario usuario) {
        String sentencia = "UPDATE usuarios set cedula=?,nombre=?,password=?,Rol=?,estado=?,direccion=?,telefono=? WHERE id=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sentencia);
            ps.setInt(1, usuario.getCedula());
            ps.setString(2, usuario.getNombre());
            ps.setString(3, usuario.getPassword());
            ps.setString(4, usuario.getRol());
            ps.setString(5, usuario.getEstado());
            ps.setString(6, usuario.getDireccion());
            ps.setString(7, usuario.getTelefono());
            ps.setInt(8, usuario.getId());
            ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return r;
    }

    public void Eliminar(int id) {

        String sql = "DELETE FROM usuarios WHERE id=" + id;
        con = cn.Conexion();
        try {
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
