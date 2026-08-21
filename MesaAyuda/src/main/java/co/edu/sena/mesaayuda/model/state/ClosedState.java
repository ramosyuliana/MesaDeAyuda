/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.model.state;

/**
 *
 * @author julil
 */
public class ClosedState implements TicketState {

    private static final String Name = "CERRADO";
    private static final String Motivo = "el ticket esta cerrado y no admite cambios";

    @Override
    public TicketState MtAssign() {
        throw new InvalidTransitionException(Name, "asignar", Motivo);
    }

    @Override
    public TicketState MtStart() {
        throw new InvalidTransitionException(Name, "asignar", Motivo);
    }

    @Override
    public TicketState MtResolve() {
        throw new InvalidTransitionException(Name, "asignar", Motivo);
    }

    @Override
    public TicketState MtClose() {
        throw new InvalidTransitionException(Name, "asignar", Motivo);
    }

    @Override
    public TicketState MtReOpen() {
        return new InProcessState();
    }

    @Override
    public TicketState MtCancel() {
        throw new InvalidTransitionException(Name, "asignar", Motivo);
    }

    @Override
    public String Name() {
        return Name;
    }

}
