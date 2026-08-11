/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.repository;

import co.edu.sena.mesaayuda.model.Role;
import co.edu.sena.mesaayuda.util.ConexionDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author julil
 */
public class RoleRepositoryJdbc implements RoleRepository {

    @Override
    public List<Role> MtListRoles() {

        String sql = "Select \"Id\", \"Name\" From \"Role\"";

        List<Role> list = new ArrayList<Role>();

        try (Connection cn = ConexionDB.getConnection(); PreparedStatement ps = cn.prepareStatement(sql)) {

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Role oRole = new Role();
                    oRole.setId(rs.getInt("Id"));
                    oRole.setName(rs.getString("Name"));

                    list.add(oRole);
                }
            }
            return list;
        } catch (SQLException e) {
            throw new RuntimeException("No se pudieron listar los roles", e);
        }
    }

}
