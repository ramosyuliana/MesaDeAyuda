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
public class AgentCreateDTO {

    private int Id;

    private String Name;

    private String Email;

    private int idRole;

    private List<String> idCategories;

    public AgentCreateDTO(String Name, String Email, int idRole, List<String> idCategories) {
        this.Name = Name;
        this.Email = Email;
        this.idRole = idRole;
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

    public int getIdRole() {
        return idRole;
    }

    public void setIdRole(int idRole) {
        this.idRole = idRole;
    }

    public List<String> getIdCategories() {
        return idCategories;
    }

    public void setIdCategories(List<String> idCategories) {
        this.idCategories = idCategories;
    }
    
    


}
