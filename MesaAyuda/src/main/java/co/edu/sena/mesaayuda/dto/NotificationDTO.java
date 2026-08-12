/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.dto;

/**
 *
 * @author julil
 */
public class NotificationDTO {

    private Integer Id;
    private Integer IdTicket;
    private String Subject;
    private String Message;
    private String Channel;
    private String SendDate;
    private boolean Read;

    public NotificationDTO(Integer Id, Integer IdTicket, String Subject, String Message, String Channel, String SendDate, boolean Read) {
        this.Id = Id;
        this.IdTicket = IdTicket;
        this.Subject = Subject;
        this.Message = Message;
        this.Channel = Channel;
        this.SendDate = SendDate;
        this.Read = Read;
    }

    public Integer getId() {
        return Id;
    }

    public Integer getIdTicket() {
        return IdTicket;
    }

    public String getSubject() {
        return Subject;
    }

    public String getMessage() {
        return Message;
    }

    public String getChannel() {
        return Channel;
    }

    public String getSendDate() {
        return SendDate;
    }

    public boolean isRead() {
        return Read;
    }

}
