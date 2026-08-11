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
    
    void MtCreate(Ticket oticket)throws SQLException;
    void MtEdit(Ticket oticket)throws SQLException;
    List<Ticket> MtListByAgent(int IdAgent) throws SQLException;
    List<Ticket> MtListByApplicant (int IdApplicant) throws SQLException;
    List<Ticket> MtListAll() throws SQLException;
    void MtEditAgent(int agent,Ticket oticket)throws SQLException;
    void MtEditState(String estado,Ticket oticket)throws SQLException;
    int MtCountAssignments() throws SQLException;
}
