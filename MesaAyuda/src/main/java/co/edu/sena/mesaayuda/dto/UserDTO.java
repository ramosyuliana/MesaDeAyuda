/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.dto;

/**
 *
 * @author julil
 */
public class UserDTO {

    private int Id;

    private String Name;

    private String Email;

    private String Role;

    public UserDTO(int Id, String Name, String Email, String Role) {
        this.Id = Id;
        this.Name = Name;
        this.Email = Email;
        this.Role = Role;
    }

    public int getId() {
        return Id;
    }

    public String getName() {
        return Name;
    }

    public String getEmail() {
        return Email;
    }

    public String getRole() {
        return Role;
    }

}
