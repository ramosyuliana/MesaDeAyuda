/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.model;

/**
 *
 * @author Admin
 */
public class Priority {

    private int Id;

    private String Name;
    
    private int AttentionTime;

    public Priority() {
    }

    public Priority(int Id, String Name, int AttentionTime) {
        this.Id = Id;
        this.Name = Name;
        this.AttentionTime = AttentionTime;
    }

    public int getAttentionTime() {
        return AttentionTime;
    }

    public void setAttentionTime(int AttentionTime) {
        this.AttentionTime = AttentionTime;
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

}
