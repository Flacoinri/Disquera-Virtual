package disquera.datos;

import disquera.beans.Cancion;
import disquera.db.DataBase;
import disquera.exceptions.CancionException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CancionDAO {
    
    private static ArrayList<Cancion> lstCancion = new ArrayList<>();
    
    public CancionDAO() {
    }
    
    private void sincronizarDesdeBaseDeDatos() throws CancionException {
        lstCancion.clear();
        String sql = "SELECT * FROM cancion";
        
        try (Connection con = DataBase.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                Cancion c = new Cancion();
                c.setId(rs.getString("id"));
                c.setNombre(rs.getString("nombre"));
                c.setDuracion(rs.getDouble("duracion"));
                lstCancion.add(c);
            }
        } catch (SQLException e) {
            throw new CancionException("Error al sincronizar: " + e.getMessage());
        }
    }

    public boolean ValidarExistencia(String id) throws CancionException {
        String sql = "SELECT id FROM cancion WHERE id = ?";
        try (Connection con = DataBase.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setString(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) {
            throw new CancionException("Error al validar: " + e.getMessage());
        }
    }
    
    public void IngresoCancion(Cancion cancion) throws CancionException {
        String sql = "INSERT INTO cancion (id, nombre, duracion) VALUES (?, ?, ?)";
        try (Connection con = DataBase.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setString(1, cancion.getId());
            ps.setString(2, cancion.getNombre());
            ps.setDouble(3, cancion.getDuracion());
            ps.executeUpdate();
            
            lstCancion.add(cancion);
            
        } catch (SQLException e) {
            throw new CancionException("Error al ingresar: " + e.getMessage());
        }
    }
    
    public ArrayList<Cancion> ListarCancion() throws CancionException {
        if (lstCancion.isEmpty()) {
            sincronizarDesdeBaseDeDatos();
        }
        return lstCancion;
    }
    
    public Cancion BuscarCancion(String id) throws CancionException {
        for(Cancion c : lstCancion) {
            if(c.getId().equalsIgnoreCase(id)) {
                return c;
            }
        }
        
        String sql = "SELECT * FROM cancion WHERE id = ?";
        try (Connection con = DataBase.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setString(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Cancion c = new Cancion();
                    c.setId(rs.getString("id"));
                    c.setNombre(rs.getString("nombre"));
                    c.setDuracion(rs.getDouble("duracion"));
                    return c;
                }
            }
        } catch (SQLException e) {
            throw new CancionException("Error SQL: " + e.getMessage());
        }
        
        throw new CancionException("Canción no encontrada.");
    }
    
    public boolean EliminarCancion(String id) throws CancionException {
        String sql = "DELETE FROM cancion WHERE id = ?";
        try (Connection con = DataBase.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setString(1, id);
            int filas = ps.executeUpdate();
            
            if (filas > 0) {
                lstCancion.removeIf(c -> c.getId().equalsIgnoreCase(id));
                return true;
            }
            return false;
            
        } catch (SQLException e) {
            throw new CancionException("Error al eliminar: " + e.getMessage());
        }
    }
    
    public boolean ModificarCancion(Cancion cancion) throws CancionException {
        String sql = "UPDATE cancion SET nombre = ?, duracion = ? WHERE id = ?";
        try (Connection con = DataBase.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setString(1, cancion.getNombre());
            ps.setDouble(2, cancion.getDuracion());
            ps.setString(3, cancion.getId());
            
            int filas = ps.executeUpdate();
            
            if (filas > 0) {
                for(Cancion c : lstCancion) {
                    if(c.getId().equalsIgnoreCase(cancion.getId())) {
                        c.setNombre(cancion.getNombre());
                        c.setDuracion(cancion.getDuracion());
                        break;
                    }
                }
                return true;
            }
            return false;
            
        } catch (SQLException e) {
            throw new CancionException("Error al modificar: " + e.getMessage());
        }
    }
}