/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.model.state;

/**
 *
 * @author julil
 */
public class AssignedState implements TicketState {

    private static final String Name = "ASIGNADO";

    @Override
    public TicketState MtAssign() {
        throw new InvalidTransitionException(Name, "asignar", "el ticket ya fue atentido");
    }

    @Override
    public TicketState MtStart() {
        return new InProcessState();
    }

    @Override
    public TicketState MtResolve() {
        throw new InvalidTransitionException(Name, "resolver", "el ticket ya fue resuelto");
    }

    @Override
    public TicketState MtClose() {
        throw new InvalidTransitionException(Name, "cerrar",
                "un ticket asignado debe resolverse antes de cerrarse");
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
