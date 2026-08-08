/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.model;

import java.time.LocalDate;

/**
 *
 * @author Admin
 */
public class Comment {
    
    private int Id;
    
    private int IdAuthor;
    
    private String Text;
    
    private LocalDate Date;

    public Comment() {
    }

    
    public Comment(int IdAuthor, String Text, LocalDate Date) {
        this.IdAuthor = IdAuthor;
        this.Text = Text;
        this.Date = Date;
    }

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
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
    
    
    
    
    
}
