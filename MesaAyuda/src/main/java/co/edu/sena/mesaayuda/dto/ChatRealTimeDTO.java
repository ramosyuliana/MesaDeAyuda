/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.dto;

/**
 *
 * @author Admin
 */
public class ChatRealTimeDTO {

    private int IdAuthor;
    private String AuthorName;
    private String Text;
    private String Date;

    public ChatRealTimeDTO() {
    }

    public ChatRealTimeDTO(int IdAuthor, String AuthorName, String Text, String Date) {
        this.IdAuthor = IdAuthor;
        this.AuthorName = AuthorName;
        this.Text = Text;
        this.Date = Date;
    }

    public int getIdAuthor() {
        return IdAuthor;
    }

    public void setIdAuthor(int IdAuthor) {
        this.IdAuthor = IdAuthor;
    }

    public String getAuthorName() {
        return AuthorName;
    }

    public void setAuthorName(String AuthorName) {
        this.AuthorName = AuthorName;
    }

    public String getText() {
        return Text;
    }

    public void setText(String Text) {
        this.Text = Text;
    }

    public String getDate() {
        return Date;
    }

    public void setDate(String Date) {
        this.Date = Date;
    }
    
    
    

}
