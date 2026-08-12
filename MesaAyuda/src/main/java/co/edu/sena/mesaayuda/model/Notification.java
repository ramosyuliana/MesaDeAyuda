/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.model;

import java.time.LocalDateTime;

/**
 *
 * @author julil
 */
public class Notification {

    private Integer Id;

    private Integer IdTicket;

    private User Addressee;

    private String Subject;

    private String Message;

    private String Channel;

    private LocalDateTime SendDate;

    private boolean Read;

    public Notification(Integer IdTicket, User Addressee, String Subject, String Message) {
        this(null, IdTicket, Addressee, Subject, Message, null, null, false);
    }

    public Notification(Integer Id, Integer IdTicket, User Addressee, String Subject, String Message, String Channel, LocalDateTime SendDate, boolean Read) {
        this.Id = Id;
        this.IdTicket = IdTicket;
        this.Addressee = Addressee;
        this.Subject = Subject;
        this.Message = Message;
        this.Channel = Channel;
        this.SendDate = SendDate;
        this.Read = Read;
    }


    public Integer getId() {
        return Id;
    }

    public void setId(Integer Id) {
        this.Id = Id;
    }

    public Integer getIdTicket() {
        return IdTicket;
    }

    public void setIdTicket(Integer IdTicket) {
        this.IdTicket = IdTicket;
    }

    public User getAddressee() {
        return Addressee;
    }

    public void setAddressee(User Addressee) {
        this.Addressee = Addressee;
    }

    public String getSubject() {
        return Subject;
    }

    public void setSubject(String Subject) {
        this.Subject = Subject;
    }

    public String getMessage() {
        return Message;
    }

    public void setMessage(String Message) {
        this.Message = Message;
    }

    public String getChannel() {
        return Channel;
    }

    public void setChannel(String Channel) {
        this.Channel = Channel;
    }

    public LocalDateTime getSendDate() {
        return SendDate;
    }

    public void setSendDate(LocalDateTime SendDate) {
        this.SendDate = SendDate;
    }

    public boolean isRead() {
        return Read;
    }

    public void setRead(boolean Read) {
        this.Read = Read;
    }

}
