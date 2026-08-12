/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.model.state;

/**
 *
 * @author julil
 */
public class InProcessState implements TicketState {

    private static final String Name = "ENPROCESO";

    @Override
    public TicketState MtAssign() {
        throw new InvalidTransitionException(Name, "asignar", "el ticket ya fue atentido");
    }

    @Override
    public TicketState MtStart() {
        throw new InvalidTransitionException(Name, "iniciar", "el ticket ya fue aignado y esta en proceso de revisión");
    }

    @Override
    public TicketState MtResolve() {
        return new ClosedState();
    }

    @Override
    public TicketState MtClose() {
        throw new InvalidTransitionException(Name, "cerrar",
                "un ticket en proceso debe resolverse antes de cerrarse");
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
