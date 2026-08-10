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

    void MtCreate(User oUser) throws SQLException;

    void MtEdit(User oUser) throws SQLException;

    List<User> MtList() throws SQLException;

    User MtFindByEmail(String email) throws SQLException;

    User MtFindById(int id) throws SQLException;

}
