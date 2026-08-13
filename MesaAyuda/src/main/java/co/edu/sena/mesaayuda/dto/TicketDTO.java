/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.dto;

import java.time.LocalDate;
import java.util.List;

/**
 *
 * @author Admin
 */
public class TicketDTO {
    
    private int Id;
    private String Title;
    private String Description;
    private int IdCategory;
    private String categoryName;
    private int IdApplicant;
    private String applicantName;
    private int IdAgent;
    private String agentName;
    private String priorityName;
    private String State;
    private LocalDate CreateDate;
    private LocalDate ExpirationDate;
    private List<CommentDTO> comments;

    public TicketDTO() {
    }

    
    public TicketDTO(int Id, String Title, String Description, int IdCategory, int IdApplicant, int IdAgent, String State, LocalDate CreateDate, LocalDate ExpirationDate) {
        this.Id = Id;
        this.Title = Title;
        this.Description = Description;
        this.IdCategory = IdCategory;
        this.IdApplicant = IdApplicant;
        this.IdAgent = IdAgent;
        this.State = State;
        this.CreateDate = CreateDate;
        this.ExpirationDate = ExpirationDate;
    }

    public List<CommentDTO> getComments() {
        return comments;
    }

    public void setComments(List<CommentDTO> comments) {
        this.comments = comments;
    }

    
    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getApplicantName() {
        return applicantName;
    }

    public void setApplicantName(String applicantName) {
        this.applicantName = applicantName;
    }

    public String getAgentName() {
        return agentName;
    }

    public void setAgentName(String agentName) {
        this.agentName = agentName;
    }

    public String getPriorityName() {
        return priorityName;
    }

    public void setPriorityName(String priorityName) {
        this.priorityName = priorityName;
    }

    
    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public LocalDate getExpirationDate() {
        return ExpirationDate;
    }

    public void setExpirationDate(LocalDate ExpirationDate) {
        this.ExpirationDate = ExpirationDate;
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
    
    

}
