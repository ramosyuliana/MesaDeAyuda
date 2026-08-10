/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.model;

/**
 *
 * @author Admin
 */
public class User {
    
    private int Id;
    
    private String Name;
    
    private String Email;
    
    private Role Role;

    public User() {
    }

    public User(String Name, String Email, Role Role) {
        this.Name = Name;
        this.Email = Email;
        this.Role = Role;
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

    public Role getRole() {
        return Role;
    }

    public void setRole(Role Role) {
        this.Role = Role;
    }

   
    
    
    
}
