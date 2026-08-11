/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.repository;

import co.edu.sena.mesaayuda.model.Priority;
import co.edu.sena.mesaayuda.util.ConexionDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class PriorityRepositoryJdbc implements PriorityRepository {

    @Override
    public List<Priority> MtListPriorities() {

        String sql = "Select \"Id\", \"Name\", \"AttentionTime\" From \"Priority\"";

        List<Priority> list = new ArrayList<Priority>();

        try (Connection cn = ConexionDB.getConnection(); PreparedStatement ps = cn.prepareStatement(sql)) {

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Priority oPriority = new Priority();
                    oPriority.setId(rs.getInt("Id"));
                    oPriority.setName(rs.getString("Name"));
                    oPriority.setAttentionTime(rs.getInt("AttentionTime"));

                    list.add(oPriority);
                }
            }
            return list;
        } catch (SQLException e) {
            throw new RuntimeException("No se pudieron listar las prioridades", e);
        }
    }

    @Override
    public Priority MtFindByName(String name) {

        String sql = "Select \"Id\", \"Name\", \"AttentionTime\" From \"Priority\" where \"Name\" = ? ";

        Priority oPriority = null;

        try (Connection cn = ConexionDB.getConnection(); PreparedStatement ps = cn.prepareStatement(sql)) {
            ps.setString(1, name);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    oPriority = new Priority();
                    oPriority.setId(rs.getInt("Id"));
                    oPriority.setName(rs.getString("Name"));
                    oPriority.setAttentionTime(rs.getInt("AttentionTime"));

                }
            }
            return oPriority;
        } catch (SQLException e) {
            throw new RuntimeException("No se pudieron buscar prioridades por nombre", e);
        }
    }

}
