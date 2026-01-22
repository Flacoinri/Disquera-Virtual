/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 * 
 * PAQUETES
 */
package disquera.beans;

/**
 * 
 * IMPORTACIONES
 */
import disquera.exceptions.DiscoException;

/**
 *
 * @author ITALO SABATTINI AND ROBERTO FUENTES
 */

/**
 * 
 * CLASES
 */
public class Disco {
    private String id;
    private String nombre;
    private String artista;
    private int anio;
    private int duracion;
    private String ranking;
    private String genero;

    
    public Disco() {
        this.id = this.nombre = this.artista = this.genero = this.ranking =  new String();
        this.anio = 0;
        this.duracion = 0;
    }
    
    public Disco(String id, String nombre, String artista, int anio, int duracion, String ranking, String genero) throws DiscoException {
        this.id = id;
        this.nombre = nombre;
        this.artista = artista;
        this.anio = anio;
        this.duracion = duracion;
        this.ranking = ranking;
        this.genero = genero;
    }
/**
 * 
 * SETTERS
 */
    public void setId(String id) throws DiscoException {
        if(id != null && id.trim().length() > 0) {
            this.id = id;
        }
        else {
            throw new DiscoException("Debe ingresar el id de la cancion.");
        }
    }

    public void setNombre(String nombre) throws DiscoException {
        if(nombre != null && nombre.trim().length() > 0) {
            this.nombre = nombre;
        }
        else {
            throw new DiscoException("Debe ingresar el nombre de la cancion.");
        }
    }

    public void setArtista(String artista) throws DiscoException {
        if(artista != null && artista.trim().length() > 0) {
            this.artista = artista;
        }
        else {
            throw new DiscoException("Debe ingresar el nombre de la cancion.");
        }
    }

    public void setAnio(int anio) {
        this.anio = anio;
    }

    public void setDuracion(int duracion) throws DiscoException {
        if (duracion > 0){
            this.duracion = duracion;
        }else{
            throw new DiscoException("La duracion debe ser mayor a 0");
        }
   
    }

    public void setRanking(String ranking) {
        this.ranking = ranking;
    }

    public void setGenero(String genero) throws DiscoException {
        if(genero != null && genero.trim().length() > 0) {
            this.genero = genero;
        }
        else {
            throw new DiscoException("Debe ingresar el nombre de la cancion.");
        }
    }
/**
 * 
 * GETTERS
 */
    public String getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public String getArtista() {
        return artista;
    }

    public int getAnio() {
        return anio;
    }

    public int getDuracion() {
        return duracion;
    }

    public String getRanking() {
        return ranking;
    }

    public String getGenero() {
        return genero;
    }
 
}
