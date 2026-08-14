/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.dto;

import java.util.List;

/**
 *
 * @author julil
 */
public class AgentUpdateDTO {

    private int Id;

    private String Name;

    private String Email;

    private List<String> idCategories;

    public AgentUpdateDTO(int Id, String Name, String Email, List<String> idCategories) {
        this.Id = Id;
        this.Name = Name;
        this.Email = Email;
        this.idCategories = idCategories;
    }
    
    


    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public List<String> getIdCategories() {
        return idCategories;
    }

    public void setIdCategories(List<String> idCategories) {
        this.idCategories = idCategories;
    }
    
    

}
