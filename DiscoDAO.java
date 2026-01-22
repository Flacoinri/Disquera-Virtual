package disquera.datos;

import disquera.beans.Disco;
import disquera.exceptions.DiscoException;
import disquera.db.DataBase;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DiscoDAO {
    
    private static ArrayList<Disco> lstDisco = new ArrayList<>();
    
    public DiscoDAO() {
    }
    
    private void sincronizarDesdeBaseDeDatos() throws DiscoException {
        lstDisco.clear();
        String sql = "SELECT * FROM disco";
        
        try (Connection con = DataBase.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                Disco d = new Disco();
                d.setId(rs.getString("id"));
                d.setNombre(rs.getString("nombre"));
                d.setArtista(rs.getString("artista"));
                d.setAnio(rs.getInt("anio"));
                d.setDuracion(rs.getInt("duracion"));
                d.setRanking(rs.getString("ranking"));
                d.setGenero(rs.getString("genero"));
                lstDisco.add(d);
            }
        } catch (SQLException e) {
            throw new DiscoException("Error al sincronizar: " + e.getMessage());
        }
    }

    public boolean ValidarExistencia(String id) throws DiscoException {
        String sql = "SELECT id FROM disco WHERE id = ?";
        try (Connection con = DataBase.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setString(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) {
            throw new DiscoException("Error al validar: " + e.getMessage());
        }
    }
    
    public void IngresoDisco(Disco disco) throws DiscoException {
        String sql = "INSERT INTO disco (id, nombre, artista, anio, duracion, ranking, genero) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection con = DataBase.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setString(1, disco.getId());
            ps.setString(2, disco.getNombre());
            ps.setString(3, disco.getArtista());
            ps.setInt(4, disco.getAnio());
            ps.setInt(5, disco.getDuracion());
            ps.setString(6, disco.getRanking());
            ps.setString(7, disco.getGenero());
            
            ps.executeUpdate();
            
            lstDisco.add(disco);
            
        } catch (SQLException e) {
            throw new DiscoException("Error al ingresar: " + e.getMessage());
        }
    }
    
    public ArrayList<Disco> ListarDisco() throws DiscoException {
        if (lstDisco.isEmpty()) {
            sincronizarDesdeBaseDeDatos();
        }
        return lstDisco;
    }
    
    public Disco BuscarDisco(String id) throws DiscoException {
        for(Disco d : lstDisco) {
            if(d.getId().equalsIgnoreCase(id)) {
                return d;
            }
        }
        
        String sql = "SELECT * FROM disco WHERE id = ?";
        try (Connection con = DataBase.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setString(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Disco d = new Disco();
                    d.setId(rs.getString("id"));
                    d.setNombre(rs.getString("nombre"));
                    d.setArtista(rs.getString("artista"));
                    d.setAnio(rs.getInt("anio"));
                    d.setDuracion(rs.getInt("duracion"));
                    d.setRanking(rs.getString("ranking"));
                    d.setGenero(rs.getString("genero"));
                    return d;
                }
            }
        } catch (SQLException e) {
            throw new DiscoException("Error SQL: " + e.getMessage());
        }
        
        throw new DiscoException("Disco no encontrado.");
    }
    
    public boolean EliminarDisco(String id) throws DiscoException {
        String sql = "DELETE FROM disco WHERE id = ?";
        try (Connection con = DataBase.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setString(1, id);
            int filas = ps.executeUpdate();
            
            if (filas > 0) {
                lstDisco.removeIf(d -> d.getId().equalsIgnoreCase(id));
                return true;
            }
            return false;
            
        } catch (SQLException e) {
            throw new DiscoException("Error al eliminar: " + e.getMessage());
        }
    }
    
    public boolean ActualizarDisco(Disco disco) throws DiscoException {
        String sql = "UPDATE disco SET nombre=?, artista=?, anio=?, duracion=?, ranking=?, genero=? WHERE id=?";
        try (Connection con = DataBase.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setString(1, disco.getNombre());
            ps.setString(2, disco.getArtista());
            ps.setInt(3, disco.getAnio());
            ps.setInt(4, disco.getDuracion());
            ps.setString(5, disco.getRanking());
            ps.setString(6, disco.getGenero());
            ps.setString(7, disco.getId());
            
            int filas = ps.executeUpdate();
            
            if (filas > 0) {
                for(Disco d : lstDisco) {
                    if(d.getId().equalsIgnoreCase(disco.getId())) {
                        d.setNombre(disco.getNombre());
                        d.setArtista(disco.getArtista());
                        d.setAnio(disco.getAnio());
                        d.setDuracion(disco.getDuracion());
                        d.setRanking(disco.getRanking());
                        d.setGenero(disco.getGenero());
                        break;
                    }
                }
                return true;
            }
            return false;
            
        } catch (SQLException e) {
            throw new DiscoException("Error al actualizar: " + e.getMessage());
        }
    }
}