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
public class TIcket {
    
    private int Id;
    
    private String Title;
    
    private String Description;
    
    private int IdCategory;
    
    private int IdApplicant;
    
    private int IdAgent;
    
    private String State;
    
    private LocalDate CreateDate;
    
    private int IdComment;

    public TIcket() {
    }

    public TIcket(String Title, String Description, int IdCategory, int IdApplicant, int IdAgent, String State, LocalDate CreateDate, int IdComment) {
        this.Title = Title;
        this.Description = Description;
        this.IdCategory = IdCategory;
        this.IdApplicant = IdApplicant;
        this.IdAgent = IdAgent;
        this.State = State;
        this.CreateDate = CreateDate;
        this.IdComment = IdComment;
    }

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String Title) {
        this.Title = Title;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public int getIdCategory() {
        return IdCategory;
    }

    public void setIdCategory(int IdCategory) {
        this.IdCategory = IdCategory;
    }

    public int getIdApplicant() {
        return IdApplicant;
    }

    public void setIdApplicant(int IdApplicant) {
        this.IdApplicant = IdApplicant;
    }

    public int getIdAgent() {
        return IdAgent;
    }

    public void setIdAgent(int IdAgent) {
        this.IdAgent = IdAgent;
    }

    public String getState() {
        return State;
    }

    public void setState(String State) {
        this.State = State;
    }

    public LocalDate getCreateDate() {
        return CreateDate;
    }

    public void setCreateDate(LocalDate CreateDate) {
        this.CreateDate = CreateDate;
    }

    public int getIdComment() {
        return IdComment;
    }

    public void setIdComment(int IdComment) {
        this.IdComment = IdComment;
    }
    
    
    
}
