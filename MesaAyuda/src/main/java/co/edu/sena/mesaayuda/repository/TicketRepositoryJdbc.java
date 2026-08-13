/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.repository;

import co.edu.sena.mesaayuda.dto.TicketDTO;
import co.edu.sena.mesaayuda.model.Ticket;
import co.edu.sena.mesaayuda.util.*;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author julil
 */
public class TicketRepositoryJdbc implements TicketRepository {

    @Override
    public void MtCreate(Ticket oticket) {
        String consulta = "Insert into \"Ticket\"(\"Title\",\"Description\",\"IdCategory\",\"IdApplicant\",\"IdAgent\",\"State\",\"CreateDate\",\"ExpirationDate\") Values (?,?,?,?,?,?,?,?)";
        try (Connection con = ConexionDB.getConnection(); PreparedStatement ps = con.prepareStatement(consulta)) {
            ps.setString(1, oticket.getTitle());
            ps.setString(2, oticket.getDescription());
            ps.setInt(3, oticket.getIdCategory());
            ps.setInt(4, oticket.getIdApplicant());
            ps.setInt(5, oticket.getIdAgent());
            ps.setString(6, oticket.getState());
            ps.setDate(7, Date.valueOf(oticket.getCreateDate()));
            ps.setDate(8, Date.valueOf(oticket.getExpirationDate()));
            ps.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException("No se pudo crear el ticket ", e);
        }
    }

    @Override
    public void MtEdit(Ticket oticket) {
        String consulta = "Update \"Ticket\" set \"Title\" = ?,\"Description\" = ?,\"IdCategory\" = ? Where \"Id\" = ?";
        try (Connection con = ConexionDB.getConnection(); PreparedStatement ps = con.prepareStatement(consulta)) {
            ps.setString(1, oticket.getTitle());
            ps.setString(2, oticket.getDescription());
            ps.setInt(3, oticket.getIdCategory());
            ps.setInt(4, oticket.getId());
            ps.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException("No se pudo editar el ticket ", e);
        }
    }

    @Override
    public void MtEditState(String estado, Ticket oticket) {
        String consulta = "Update \"Ticket\" set \"State\" = ? Where \"Id\" = ?";
        try (Connection con = ConexionDB.getConnection(); PreparedStatement ps = con.prepareStatement(consulta)) {
            ps.setString(1, estado);
            ps.setInt(2, oticket.getId());
            ps.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException("No se pudo editar el estado del ticket ", e);
        }
    }

    @Override
    public void MtEditAgent(int IdAgent, Ticket oticket) {
        String consulta = "Update \"Ticket\" set \"IdAgent\" = ?  Where \"Id\" = ?";
        try (Connection con = ConexionDB.getConnection(); PreparedStatement ps = con.prepareStatement(consulta)) {
            ps.setInt(1, IdAgent);
            ps.setInt(2, oticket.getId());
            ps.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException("No se pudo editar el agente asignado al ticket ", e);
        }
    }

    private static final String SELECT_WITH_DETAILS
            = "Select t.\"Id\", t.\"Title\", t.\"Description\", t.\"State\", "
            + "t.\"CreateDate\", t.\"ExpirationDate\", "
            + "t.\"IdCategory\", c.\"Name\" as \"CategoryName\", "
            + "t.\"IdApplicant\", ua.\"Name\" as \"ApplicantName\", "
            + "t.\"IdAgent\", uag.\"Name\" as \"AgentName\", "
            + "p.\"Name\" as \"PriorityName\" "
            + "From \"Ticket\" t "
            + "Join \"Category\" c On c.\"Id\" = t.\"IdCategory\" "
            + "Join \"User\" ua On ua.\"Id\" = t.\"IdApplicant\" "
            + "Left Join \"User\" uag On uag.\"Id\" = t.\"IdAgent\" "
            + "Join \"Priority\" p On p.\"Id\" = c.\"IdPriority\" ";

    @Override
    public List<TicketDTO> MtListByAgent(int IdAgent) {
        String consulta = SELECT_WITH_DETAILS + "Where t.\"IdAgent\" = ?";
        List<TicketDTO> list = new ArrayList<TicketDTO>();
        try (Connection cn = ConexionDB.getConnection(); PreparedStatement ps = cn.prepareStatement(consulta);) {
            ps.setInt(1, IdAgent);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(mapearTicketDTO(rs));
                }
            }

            return list;
        } catch (SQLException e) {
            throw new RuntimeException("No se pudo listar los tickets asociados al agente ", e);
        }

    }

    @Override
    public List<TicketDTO> MtListByApplicant(int IdApplicant) {
        String consulta = SELECT_WITH_DETAILS + "Where t.\"IdApplicant\" = ?";
        List<TicketDTO> list = new ArrayList<TicketDTO>();
        try (Connection cn = ConexionDB.getConnection(); PreparedStatement ps = cn.prepareStatement(consulta);) {
            ps.setInt(1, IdApplicant);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(mapearTicketDTO(rs));
                }
            }

            return list;
        } catch (SQLException e) {
            throw new RuntimeException("No se pudo listar los tickets del solicitante ", e);
        }
    }

    @Override
    public List<TicketDTO> MtListAll() {
        String consulta = SELECT_WITH_DETAILS;
        List<TicketDTO> list = new ArrayList<TicketDTO>();
        try (Connection cn = ConexionDB.getConnection(); PreparedStatement ps = cn.prepareStatement(consulta);) {

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(mapearTicketDTO(rs));
                }
            }

            return list;
        } catch (SQLException e) {
            throw new RuntimeException("No se pudo listar los tickets ", e);
        }
    }

    private TicketDTO mapearTicketDTO(ResultSet rs) throws SQLException {
        TicketDTO dto = new TicketDTO();
        dto.setId(rs.getInt("Id"));
        dto.setTitle(rs.getString("Title"));
        dto.setDescription(rs.getString("Description"));
        dto.setState(rs.getString("State"));
        dto.setCreateDate(rs.getObject("CreateDate", LocalDate.class));
        dto.setExpirationDate(rs.getObject("ExpirationDate", LocalDate.class));

        dto.setIdCategory(rs.getInt("IdCategory"));
        dto.setCategoryName(rs.getString("CategoryName"));

        dto.setIdApplicant(rs.getInt("IdApplicant"));
        dto.setApplicantName(rs.getString("ApplicantName"));

        int idAgent = rs.getInt("IdAgent");
        if (!rs.wasNull()) {
            dto.setIdAgent(idAgent);
            dto.setAgentName(rs.getString("AgentName"));
        }

        dto.setPriorityName(rs.getString("PriorityName"));

        return dto;
    }

    @Override
    public int MtCountAssignments() {

        String sql = "Select Count(*) From \"Ticket\" Where \"IdAgent\" IS NOT NULL ";

        try (Connection cn = ConexionDB.getConnection(); PreparedStatement ps = cn.prepareStatement(sql)) {

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            throw new RuntimeException("No se pudo contar los tickets sin agente asignado ", e);
        }

        return 0;
    }

    @Override
    public Ticket MtFindById(int id) {
        String consulta = "Select * from \"Ticket\" where \"Id\" = ?";
        try (Connection cn = ConexionDB.getConnection(); PreparedStatement ps = cn.prepareStatement(consulta)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Ticket oticket = new Ticket();
                    oticket.setId(rs.getInt("Id"));
                    oticket.setTitle(rs.getString("Title"));
                    oticket.setDescription(rs.getString("Description"));
                    oticket.setIdCategory(rs.getInt("IdCategory"));
                    oticket.setIdApplicant(rs.getInt("IdApplicant"));
                    oticket.setIdAgent(rs.getInt("IdAgent"));
                    oticket.setState(rs.getString("State"));
                    oticket.setCreateDate(rs.getObject("CreateDate", LocalDate.class));
                    oticket.setExpirationDate(rs.getObject("ExpirationDate", LocalDate.class));
                    return oticket;
                }
                return null; // el Service valida null y lanza IllegalArgumentException
            }
        } catch (SQLException e) {
            throw new RuntimeException("No se pudo buscar el ticket por id", e);
        }
    }

    @Override
    public double MtCanceledTicketRate() {
        double tasaCancelacion = 0.0;
        String sql = "SELECT "
                + "  (SELECT COUNT(*) FROM \"Ticket\" WHERE \"State\" = 'CANCELADO') AS \"Cancelados\", "
                + "  (SELECT COUNT(*) FROM \"Ticket\") AS \"Total\"";

        try (Connection con = ConexionDB.getConnection(); PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                double cancelados = rs.getDouble("Cancelados");
                double total = rs.getDouble("Total");

                if (total > 0) {
                    tasaCancelacion = (cancelados / total) * 100.0;
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException("No se pudo obtener la tasa de cancelacion", e);

        }

        return Math.round(tasaCancelacion * 100.0) / 100.0;
    }

    @Override
    public double MtResolvedTicketRate() {

        double tasaResuelto = 0.0;
        String sql = "SELECT "
                + "  (SELECT COUNT(*) FROM \"Ticket\" WHERE \"State\" = 'RESUELTO') AS \"Resueltos\", "
                + "  (SELECT COUNT(*) FROM \"Ticket\") AS \"Total\"";

        try (Connection con = ConexionDB.getConnection(); PreparedStatement ps = con.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                double cancelados = rs.getDouble("Resueltos");
                double total = rs.getDouble("Total");

                if (total > 0) {
                    tasaResuelto = (cancelados / total) * 100.0;
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException("No se pudo obtener la tasa de cancelacion", e);

        }

        return Math.round(tasaResuelto * 100.0) / 100.0;
    }

}
