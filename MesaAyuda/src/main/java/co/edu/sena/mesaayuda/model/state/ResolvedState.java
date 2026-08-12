/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.model.state;

/**
 *
 * @author julil
 */
public class ResolvedState implements TicketState {

    private static final String Name = "RESUELTO";

    @Override
    public TicketState MtAssign() {
        throw new InvalidTransitionException(Name, "asignar", "el ticket ya fue atentido");
    }

    @Override
    public TicketState MtStart() {
        throw new InvalidTransitionException(Name, "iniciar", "el ticket ya fue resuelto, use reabrir");
    }

    @Override
    public TicketState MtResolve() {
        throw new InvalidTransitionException(Name, "resolver", "el ticket ya fue resuelto");
    }

    @Override
    public TicketState MtClose() {
        return new ClosedState();
    }

    @Override
    public TicketState MtReOpen() {
        return new InProcessState();
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
