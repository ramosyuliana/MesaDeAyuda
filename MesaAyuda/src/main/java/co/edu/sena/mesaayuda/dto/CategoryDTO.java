/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.dto;


/**
 *
 * @author julil
 */
public class CategoryDTO {

    private int Id;
    private String Name;
    private String priority;

    public CategoryDTO(int Id, String Name, String priority) {
        this.Id = Id;
        this.Name = Name;
        this.priority = priority;
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

    public String getString() {
        return priority;
    }

    public void setString(String priority) {
        this.priority = priority;
    }

}
