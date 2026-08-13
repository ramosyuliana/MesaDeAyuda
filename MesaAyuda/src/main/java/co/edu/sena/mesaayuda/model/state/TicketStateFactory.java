/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.model.state;

/**
 *
 * @author Admin
 */
public class TicketStateFactory {
    
       public static TicketState fromName(String name) {
        return switch (name) {
            case "NUEVO" -> new NewState();
            case "ASIGNADO" -> new AssignedState();
            case "ENPROCESO" -> new InProcessState();
            case "RESUELTO" -> new ResolvedState();
            case "CERRADO" -> new ClosedState();
            case "CANCELADO" -> new CancelledState();
            default -> throw new IllegalStateException("Estado desconocido: " + name);
        };
    }
}
