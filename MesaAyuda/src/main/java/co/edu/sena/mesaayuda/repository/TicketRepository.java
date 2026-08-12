/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package co.edu.sena.mesaayuda.repository;

import co.edu.sena.mesaayuda.model.Ticket;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author julil
 */
public interface TicketRepository {

    void MtCreate(Ticket oticket);

    void MtEdit(Ticket oticket);

    List<Ticket> MtListByAgent(int IdAgent);

    List<Ticket> MtListByApplicant(int IdApplicant);

    List<Ticket> MtListAll();

    void MtEditAgent(int agent, Ticket oticket);

    void MtEditState(String estado, Ticket oticket);

    int MtCountAssignments();
    
    Ticket MtFindById(int id);
}
