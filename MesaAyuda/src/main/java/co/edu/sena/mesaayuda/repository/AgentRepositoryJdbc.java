/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.repository;

import co.edu.sena.mesaayuda.model.Agent;
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
public class AgentRepositoryJdbc implements AgentRepository {

    @Override
    public void MtCreateAgent(Agent oAgent, List<String> idCategories) {
        String sql = "Insert Into \"User\" (\"Name\", \"Email\", \"IdRole\") Values(?, ?, ?) RETURNING \"Id\"";
        String query = "Insert Into \"AgentCategory\" (\"IdAgent\", \"IdCategory\") Values (?, ?)";
        Connection cn = null;
        try {
            cn = ConexionDB.getConnection();
            cn.setAutoCommit(false); // importante si vas a hacer commit/rollback manual
            int idAgent = 0;
            try (PreparedStatement ps = cn.prepareStatement(sql)) {
                ps.setString(1, oAgent.getName());
                ps.setString(2, oAgent.getEmail());
                ps.setInt(3, oAgent.getRole().getId());
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        idAgent = rs.getInt(1);
                    }
                }
            }
            if (idAgent != 0 && idCategories != null && !idCategories.isEmpty()) {
                try (PreparedStatement ps = cn.prepareStatement(query)) { // <-- aquí el fix
                    for (String idCats : idCategories) {
                        ps.setInt(1, idAgent);
                        ps.setInt(2, Integer.parseInt(idCats));
                        ps.addBatch();
                    }
                    ps.executeBatch();
                }
            }
            cn.commit();
        } catch (SQLException e) {
            if (cn != null) {
                try {
                    cn.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            throw new RuntimeException("No se pudo crear el agente ", e);
        } finally {
            if (cn != null) {
                try {
                    cn.setAutoCommit(true);
                    cn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        }
    }

    @Override
    public void MtUpdateAgent(Agent oAgent, List<String> idCategories) {
        String updateSql = "Update \"User\" Set \"Name\" = ?, \"Email\" = ? Where \"Id\" = ?";
        String deleteSql = "Delete From \"AgentCategory\" Where \"IdAgent\" = ?";
        String insertSql = "Insert Into \"AgentCategory\" (\"IdAgent\", \"IdCategory\") Values (?, ?)";
        Connection cn = null;
        try {
            cn = ConexionDB.getConnection();
            cn.setAutoCommit(false);

            try (PreparedStatement ps = cn.prepareStatement(updateSql)) {
                ps.setString(1, oAgent.getName());
                ps.setString(2, oAgent.getEmail());
                ps.setInt(3, oAgent.getId());
                ps.executeUpdate();
            }

            try (PreparedStatement ps = cn.prepareStatement(deleteSql)) {
                ps.setInt(1, oAgent.getId());
                ps.executeUpdate();
            }

            if (idCategories != null && !idCategories.isEmpty()) {
                try (PreparedStatement ps = cn.prepareStatement(insertSql)) {
                    for (String idCat : idCategories) {
                        ps.setInt(1, oAgent.getId());
                        ps.setInt(2, Integer.parseInt(idCat));
                        ps.addBatch();
                    }
                    ps.executeBatch();
                }
            }

            cn.commit();
        } catch (SQLException e) {
            if (cn != null) {
                try {
                    cn.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            throw new RuntimeException("No se pudo actualizar el agente ", e);
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        }
    }

    @Override
    public List<Integer> MtFindIdCategories(int idAgent) {
        String sql = "SELECT \"IdCategory\" FROM \"AgentCategory\" WHERE \"IdAgent\" = ?";

        List<Integer> idCategories = new ArrayList<>();

        try (Connection cn = ConexionDB.getConnection(); PreparedStatement ps = cn.prepareStatement(sql)) {
            ps.setInt(1, idAgent);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    idCategories.add(rs.getInt("IdCategory"));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("No se pudieron obtener las categorías del agente " + idAgent, e);
        }

        return idCategories;
    }

}
