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
import disquera.exceptions.CancionException;


/**
 *
 * @author ITALO SABATTINI AND ROBERTO FUENTES
 */

/**
 * 
 * CLASES
 */
public class Cancion {
    private String id;
    private String nombre;
    private double duracion;
    
    public Cancion() {
        this.id = this.nombre = new String();
        this.duracion = 0.0;
    
    }
    
    public Cancion(String nombre, double duracion, String id) throws CancionException {
        this();
        this.setId(id);
        this.setNombre(nombre);
        this.setDuracion(duracion);
    }
    
    
    /*public Cancion(String id, String nombre, int duracion) {
        this.id = id;
        this.nombre = nombre;
        this.duracion = duracion;
        /*this.disco = disco;
    }*/

/**
 * 
 * SETTERS
 */
    public void setId(String id) throws CancionException {
        if(id != null && id.trim().length() > 0) {
            this.id = id;
        }
        else {
            throw new CancionException("Debe ingresar el id de la cancion.");
        }
    }

    public void setNombre(String nombre) throws CancionException {
        if(nombre != null && nombre.trim().length() > 0) {
            this.nombre = nombre;
        }
        else {
            throw new CancionException("Debe ingresar el nombre de la cancion.");
        }
    }
    
/**
 * 
 * GETTERS
 */

    public void setDuracion(double duracion) {
        this.duracion = duracion;
    }

    public String getId() {
        return id;
    }

    public String getNombre() {
        return nombre;
    }

    public double getDuracion() {
        return duracion;
    }
    
    /*public String getDisco() {
        return disco;
    }*/
}
