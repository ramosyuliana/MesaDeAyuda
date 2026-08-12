/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.model.state;

/**
 *
 * @author julil
 */
public class NewState implements TicketState {

    private static final String Name = "NUEVO";

    @Override
    public TicketState MtAssign() {
        return new AssignedState();
    }

    @Override
    public TicketState MtStart() {
        throw new InvalidTransitionException(Name, "iniciar",
                "el ticket aun no tiene agente asignado");
    }

    @Override
    public TicketState MtResolve() {
        throw new InvalidTransitionException(Name, "resolver",
                "el ticket aun no ha sido atendido");
    }

    @Override
    public TicketState MtClose() {
        throw new InvalidTransitionException(Name, "cerrar",
                "un ticket nuevo debe resolverse antes de cerrarse");
    }

    @Override
    public TicketState MtReOpen() {
        throw new InvalidTransitionException(Name, "reabrir",
                "el ticket nunca ha sido resuelto");
    }

    @Override
    public TicketState MtCancel() {
        return new CancelledState();
    }

    @Override
    public String Name() {
        return Name;
    }

}
