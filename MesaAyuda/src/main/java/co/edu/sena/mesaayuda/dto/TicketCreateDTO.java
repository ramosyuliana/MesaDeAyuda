/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.dto;

/**
 *
 * @author Admin
 */
public class TicketCreateDTO {

    private String Title;
    private String Description;
    private int IdCategory;
    private int IdApplicant;

    public TicketCreateDTO() {
    }

    
    public TicketCreateDTO(String Title, String Description, int IdCategory, int IdApplicant) {
        this.Title = Title;
        this.Description = Description;
        this.IdCategory = IdCategory;
        this.IdApplicant = IdApplicant;
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
}