/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.dto;

/**
 *
 * @author julil
 */
public class UserCreateDTO {
    
    private String Name;
    
    private String Email;
    
    private int idRole;

    public UserCreateDTO(String Name, String Email, int idRole) {
        this.Name = Name;
        this.Email = Email;
        this.idRole = idRole;
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

    public int getidRole() {
        return idRole;
    }

    public void setidRole(int idRole) {
        this.idRole = idRole;
    }
    
    
    
    
}
