/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.model;

/**
 *
 * @author julil
 */
public class Agent {
    
    private int Id;
    
    private String Name;
    
    private String Email;
    
    private Role Role;
    
    private Category Category;

    public Agent() {
    }

    public Agent(int Id, String Name, String Email, Role Role, Category Category) {
        this.Id = Id;
        this.Name = Name;
        this.Email = Email;
        this.Role = Role;
        this.Category = Category;
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

    public Category getCategory() {
        return Category;
    }

    public void setCategory(Category Category) {
        this.Category = Category;
    }
    
    
    
}
