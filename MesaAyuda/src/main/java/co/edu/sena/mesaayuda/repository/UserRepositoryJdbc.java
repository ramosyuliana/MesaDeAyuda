/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.repository;

import co.edu.sena.mesaayuda.model.Role;
import co.edu.sena.mesaayuda.model.User;
import co.edu.sena.mesaayuda.util.ConexionDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author julil
 */
public class UserRepositoryJdbc implements UserRepository {

    @Override
    public void MtCreate(User oUser) {

        String sql = "Insert Into \"User\" (\"Name\",\"Email\", \"IdRole\") "
                + "VALUES(?, ?, ?)";

        try (Connection cn = ConexionDB.getConnection(); PreparedStatement ps = cn.prepareStatement(sql)) {
            ps.setString(1, oUser.getName());
            ps.setString(2, oUser.getEmail());
            ps.setInt(3, oUser.getRole().getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("No se pudo crear el usuario ", e);
        }
    }

    @Override
    public void MtEdit(User oUser) {
        String sql = "Update \"User\" set \"Name\" = ?, \"Email\" = ? "
                + "Where \"Id\" = ?";

        try (Connection cn = ConexionDB.getConnection(); PreparedStatement ps = cn.prepareStatement(sql)) {
            ps.setString(1, oUser.getName());
            ps.setString(2, oUser.getEmail());
            ps.setInt(3, oUser.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("No se pudo ditar el usuario ", e);
        }
    }

    @Override
    public List<User> MtList() {

        String sql = "Select u.\"Id\", u.\"Name\", u.\"Email\", r.\"Name\" as \"RoleName\" From \"User\" u "
                + "Inner Join \"Role\" r "
                + "ON "
                + "u.\"IdRole\" = r.\"Id\" ";

        List<User> list = new ArrayList<>();

        try (Connection cn = ConexionDB.getConnection(); PreparedStatement ps = cn.prepareStatement(sql)) {

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    User oUser = new User();
                    oUser.setId(rs.getInt("Id"));
                    oUser.setName(rs.getString("Name"));
                    oUser.setEmail(rs.getString("Email"));
                    Role oRole = new Role();
                    oRole.setName(rs.getString("RoleName"));
                    oUser.setRole(oRole);

                    list.add(oUser);
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException("No se pudo listar los usuarios ", e);
        }

        return list;

    }

    @Override
    public User MtFindByEmail(String email) {

        String sql = "Select u.\"Id\", u.\"Name\", u.\"Email\", r.\"Name\" as \"RoleName\" From \"User\" u "
                + "Inner Join \"Role\" r "
                + "ON "
                + "u.\"IdRole\" = r.\"Id\" "
                + "Where u.\"Email\" = ? ";

        User oUser = null;
        try (Connection cn = ConexionDB.getConnection(); PreparedStatement ps = cn.prepareStatement(sql)) {
            ps.setString(1, email);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    oUser = new User();
                    oUser.setId(rs.getInt("Id"));
                    oUser.setName(rs.getString("Name"));
                    oUser.setEmail(rs.getString("Email"));
                    Role oRole = new Role();
                    oRole.setName(rs.getString("RoleName"));
                    oUser.setRole(oRole);

                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("No se pudo buscar el usuario por su email ", e);
        }
        return oUser;
    }

    @Override
    public User MtFindById(int id) {

        String sql = "Select u.\"Id\", u.\"Name\" From \"User\" u "
                + "Where u.\"Id\" = ? ";

        User oUser = null;
        try (Connection cn = ConexionDB.getConnection(); PreparedStatement ps = cn.prepareStatement(sql)) {
            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    oUser = new User();
                    oUser.setId(rs.getInt("Id"));
                    oUser.setName(rs.getString("Name"));

                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("No se pudo buscar el usuario por su id ", e);
        }
        return oUser;

    }

    @Override
    public List<User> MtListAgents() {
        String sql = "Select u.\"Id\", u.\"Name\", u.\"Email\", r.\"Name\" as \"RoleName\" From \"User\" u "
                + "Inner Join \"Role\" r "
                + "ON "
                + "u.\"IdRole\" = r.\"Id\" Where r.\"Name\" = 'Agente'";

        List<User> list = new ArrayList<>();

        try (Connection cn = ConexionDB.getConnection(); PreparedStatement ps = cn.prepareStatement(sql)) {

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    User oUser = new User();
                    oUser.setId(rs.getInt("Id"));
                    oUser.setName(rs.getString("Name"));
                    oUser.setEmail(rs.getString("Email"));
                    Role oRole = new Role();
                    oRole.setName(rs.getString("RoleName"));
                    oUser.setRole(oRole);

                    list.add(oUser);
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException("No se pudo listar los agentes ", e);
        }

        return list;

    }

    @Override
    public int MtCountActiveByAgent(int agentId) {
        String sql = "Select Count(*) FROM \"Ticket\" Where \"IdAgent\" = ? And \"State\" "
                + "NOT IN ('RESUELTO', 'CERRADO', 'CANCELADO')";

        try (Connection conn = ConexionDB.getConnection(); PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, agentId);
            try (ResultSet rs = stmt.executeQuery()) {
                rs.next();
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error al contar tickets activos por agente", e);
        }
    }

    public List<User> MtListAgentsByCategory(int idCategory) {

        String sql = "Select u.\"Id\", u.\"Name\" From \"User\" u "
                + "Inner Join \"AgentCategory\" ac "
                + "ON "
                + "u.\"Id\" = ac.\"IdAgent\" "
                + "Inner Join \"Category\" c "
                + "ON "
                + "ac.\"IdCategory\" = c.\"Id\" "
                + "Where c.\"Id\" = ? ";

        List<User> list = new ArrayList<>();
        try (Connection cn = ConexionDB.getConnection(); PreparedStatement ps = cn.prepareStatement(sql)) {

            ps.setInt(1, idCategory);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    User oUser = new User();
                    oUser.setId(rs.getInt("Id"));
                    oUser.setName("Name");

                    list.add(oUser);
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException("No se pudo listar los agentes de la categoria ", e);
        }

        return list;
    }

}
