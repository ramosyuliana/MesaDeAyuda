/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.model.state;

/**
 *
 * @author julil
 */
public class InvalidTransitionException extends RuntimeException {

    public InvalidTransitionException(String state, String action, String reason) {
        super("No se puede " + action + " un ticket en estado " + state + ": " + reason);
    }

}
