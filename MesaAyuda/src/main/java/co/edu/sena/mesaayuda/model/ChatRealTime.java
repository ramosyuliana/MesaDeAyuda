/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.model;

import java.time.LocalDateTime;

/**
 *
 * @author Admin
 */
public class ChatRealTime {

    private int Id;
    private int IdTicket;
    private int IdAuthor;
    private String Text;
    private LocalDateTime Date;

    public ChatRealTime() {
    }

    public ChatRealTime(int IdTicket, int IdAuthor, String Text) {
        this.IdTicket = IdTicket;
        this.IdAuthor = IdAuthor;
        this.Text = Text;
        this.Date = LocalDateTime.now();
    }

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public int getIdTicket() {
        return IdTicket;
    }

    public void setIdTicket(int IdTicket) {
        this.IdTicket = IdTicket;
    }

    public int getIdAuthor() {
        return IdAuthor;
    }

    public void setIdAuthor(int IdAuthor) {
        this.IdAuthor = IdAuthor;
    }

    public String getText() {
        return Text;
    }

    public void setText(String Text) {
        this.Text = Text;
    }

    public LocalDateTime getDate() {
        return Date;
    }

    public void setDate(LocalDateTime Date) {
        this.Date = Date;
    }
    
    
    
    
}
