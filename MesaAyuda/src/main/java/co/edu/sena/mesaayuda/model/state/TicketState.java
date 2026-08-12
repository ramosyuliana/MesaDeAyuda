/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package co.edu.sena.mesaayuda.model.state;

/**
 *
 * @author julil
 */
public interface TicketState {

    /**
     * El sistema asigna un agente: NUEVO -> ASIGNADO
     */
    TicketState MtAssign();

    /**
     * El agente inicia la atencion: ASIGNADO -> EN_PROCESO
     */
    TicketState MtStart();

    /**
     * El agente resuelve: EN_PROCESO -> RESUELTO
     */
    TicketState MtResolve();

    /**
     * El solicitante confirma: RESUELTO -> CERRADO
     */
    TicketState MtClose();

    /**
     * El solicitante reabre: RESUELTO -> EN_PROCESO
     */
    TicketState MtReOpen();

    /**
     * El administrador cancela: cualquier estado no cerrado -> CANCELADO
     */
    TicketState MtCancel();

    String Name();

}
