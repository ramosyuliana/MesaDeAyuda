/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package co.edu.sena.mesaayuda.repository;

import co.edu.sena.mesaayuda.model.Role;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author julil
 */
public interface RoleRepository {
    
    List<Role> MtListRoles() throws SQLException;
}
