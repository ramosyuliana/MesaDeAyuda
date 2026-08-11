/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package co.edu.sena.mesaayuda.repository;

import co.edu.sena.mesaayuda.model.User;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author julil
 */
public interface UserRepository {

    void MtCreate(User oUser);

    void MtEdit(User oUser);

    List<User> MtList();

    User MtFindByEmail(String email);

    User MtFindById(int id);

    List<User> MtListAgents();

    int MtCountActiveByAgent(int agentId);
    
    List<User> MtListAgentsByCategory(String category);

}
