/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.model;

/**
 *
 * @author Admin
 */
public class Category {
    
    private int Id;
    private String Name;
    private int IdPriority;

    public Category() {
    }

    public Category(String Name, int IdPriority) {
        this.Name = Name;
        this.IdPriority = IdPriority;
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

    public int getIdPriority() {
        return IdPriority;
    }

    public void setIdPriority(int IdPriority) {
        this.IdPriority = IdPriority;
    }
    
    
    
}
