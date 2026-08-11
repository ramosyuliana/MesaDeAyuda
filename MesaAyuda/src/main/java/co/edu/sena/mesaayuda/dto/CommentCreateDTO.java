/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.dto;

import java.time.LocalDate;

/**
 *
 * @author Admin
 */
public class CommentCreateDTO {
      
    private int IdAuthor;
    private String Text;
    private LocalDate Date;
    private int IdTicket;

    public CommentCreateDTO(int IdAuthor, String Text, LocalDate Date, int IdTicket) {
        this.IdAuthor = IdAuthor;
        this.Text = Text;
        this.Date = Date;
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

    public LocalDate getDate() {
        return Date;
    }

    public void setDate(LocalDate Date) {
        this.Date = Date;
    }

    public int getIdTicket() {
        return IdTicket;
    }

    public void setIdTicket(int IdTicket) {
        this.IdTicket = IdTicket;
    }
    
}
