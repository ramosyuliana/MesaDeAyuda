/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.mapper;

import co.edu.sena.mesaayuda.dto.TicketCreateDTO;
import co.edu.sena.mesaayuda.dto.TicketDTO;
import co.edu.sena.mesaayuda.model.Ticket;
import java.util.List;
import java.util.stream.Collectors;

/**
 *
 * @author Admin
 */
public class TicketMapper {
    
    public static Ticket toEntityFromCreate(TicketCreateDTO dto){
        Ticket oTicket = new Ticket();
        oTicket.setTitle(dto.getTitle());
        oTicket.setDescription(dto.getDescription());
        oTicket.setIdCategory(dto.getIdCategory());
        oTicket.setIdApplicant(dto.getIdApplicant());
        oTicket.setIdAgent(dto.getIdAgent());
        oTicket.setState(dto.getState());
        
        return oTicket;
    }
    
     public static Ticket toEntityFromUpdate(TicketDTO dto){
        Ticket oTicket = new Ticket();
        oTicket.setId(dto.getId());
        oTicket.setTitle(dto.getTitle());
        oTicket.setDescription(dto.getDescription());
        oTicket.setIdCategory(dto.getIdCategory());
        oTicket.setIdApplicant(dto.getIdApplicant());
        oTicket.setIdAgent(dto.getIdAgent());
        oTicket.setState(dto.getState());
        oTicket.setCreateDate(dto.getCreateDate());
        oTicket.setCreateDate(dto.getExpirationDate());
        return oTicket;
    }
     
      public static TicketDTO aDTO(Ticket oticket) {
        return new TicketDTO(
                oticket.getId(),
                oticket.getTitle(),
                oticket.getDescription(),
                oticket.getIdCategory(),
                oticket.getIdApplicant(),
                oticket.getIdAgent(),
                oticket.getState(),
                oticket.getCreateDate(),
                oticket.getExpirationDate()
        );
    }

    public static List<TicketDTO> aDTO(List<Ticket> tickets) {
        return tickets.stream().map(TicketMapper::aDTO).collect(Collectors.toList());
    }
}
