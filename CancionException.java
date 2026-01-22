/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package disquera.exceptions;

/**
 *
 * @author gdiazl
 */
public class CancionException extends Exception
{
    /**
     * Constructor con parámetros de la Exception ClienteException
     * @param mensaje El mensaje que se emitirá al formulario
     */
    public CancionException(String mensaje)
    {
        super(mensaje);
    }
}
