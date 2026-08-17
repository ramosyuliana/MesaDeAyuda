/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.repository;

import co.edu.sena.mesaayuda.model.Notification;
import co.edu.sena.mesaayuda.model.Role;
import co.edu.sena.mesaayuda.model.User;
import co.edu.sena.mesaayuda.util.ConexionDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;

/**
 *
 * @author julil
 */
public class NotificationRepositoryJdbc implements NotificationRepository {

    @Override
    public Notification MtSave(Notification oNotification) {

        String sql = "Insert into \"Notification\" (\"IdTicket\", \"IdAddressee\", \"Subject\", \"Message\", "
                + "\"Channel\" ) "
                + "Values(?, ?, ?, ?, ?) RETURNING \"Id\",\"SendDate\" ";

        try (Connection cn = ConexionDB.getConnection(); PreparedStatement ps = cn.prepareStatement(sql)) {

            ps.setInt(1, oNotification.getIdTicket());
            ps.setInt(2, oNotification.getAddressee().getId());
            ps.setString(3, oNotification.getSubject());
            ps.setString(4, oNotification.getMessage());
            ps.setString(5, oNotification.getChannel());

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    oNotification.setId(rs.getInt("Id"));
                    oNotification.setSendDate(rs.getTimestamp("SendDate").toLocalDateTime());
                }
            }

            return oNotification;

        } catch (SQLException e) {

            e.printStackTrace();
            throw new RuntimeException("No se pudo guardar la notificacion del ticket " + oNotification.getIdTicket(), e);
        }
    }

    @Override
    public List<Notification> MtFindByAddressee(Integer idUser) {

        String sql = "SELECT "
                + "    n.\"Id\", n.\"IdTicket\", n.\"Channel\", n.\"Subject\", "
                + "    n.\"Message\", n.\"SendDate\", n.\"Read\", "
                + "    u.\"Id\" AS \"UserId\", u.\"Name\", u.\"Email\", "
                + "    r.\"Id\" AS \"IdRole\", r.\"Name\" AS \"RoleName\" "
                + "FROM \"Notification\" n "
                + "INNER JOIN \"User\" u ON u.\"Id\" = n.\"IdAddressee\" "
                + "INNER JOIN \"Role\" r ON r.\"Id\" = u.\"IdRole\" "
                + "WHERE n.\"IdAddressee\" = ? "
                + "ORDER BY n.\"SendDate\" DESC";

        List<Notification> list = new ArrayList<>();
        try (Connection cn = ConexionDB.getConnection(); PreparedStatement ps = cn.prepareStatement(sql)) {

            ps.setInt(1, idUser);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(MtMap(rs));
                }
            }

            return list;

        } catch (SQLException e) {
            
            e.printStackTrace();
            throw new RuntimeException("No se pudieron consultar las notificaciones del usuario " + idUser, e);
        }

    }

    @Override
    public int MtCountUnread(Integer idUser) {

        String sql = "Select Count(*) From \"Notification\" "
                + "Where \"IdAddressee\" = ? and \"Read\" = false";

        try (Connection oConnection = ConexionDB.getConnection(); PreparedStatement oStatement = oConnection.prepareStatement(sql)) {

            oStatement.setInt(1, idUser);

            try (ResultSet oResultSet = oStatement.executeQuery()) {
                if (oResultSet.next()) {
                    return oResultSet.getInt(1);
                }
                return 0;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("No se pudieron contar las notificaciones sin leer del usuario " + idUser, e);
        }
    }

    @Override
    public void MtMarkAsRead(Integer idNotification) {
        String sql = "Update \"Notification\" "
                + "Set \"Read\" = true "
                + "Where \"Id\" = ?";

        try (Connection oConnection = ConexionDB.getConnection(); PreparedStatement oStatement = oConnection.prepareStatement(sql)) {

            oStatement.setInt(1, idNotification);

            int rowsAffected = oStatement.executeUpdate();

            if (rowsAffected == 0) {
                throw new RuntimeException(
                        "No existe la notificacion con id " + idNotification);
            }

        } catch (SQLException e) {
            throw new RuntimeException("No se pudo marcar como leida la notificacion " + idNotification, e);
        }
    }

    private Notification MtMap(ResultSet oResultSet) throws SQLException {

        Role oRole = new Role(
                oResultSet.getInt("IdRole"),
                oResultSet.getString("RoleName")
        );

        User oAddressee = new User(
                oResultSet.getInt("UserId"),
                oResultSet.getString("Name"),
                oResultSet.getString("Email"),
                oRole
        );

        return new Notification(
                oResultSet.getInt("Id"),
                oResultSet.getInt("IdTicket"),
                oAddressee,
                oResultSet.getString("Subject"),
                oResultSet.getString("Message"),
                oResultSet.getString("Channel"),
                oResultSet.getTimestamp("SendDate").toLocalDateTime(),
                oResultSet.getBoolean("Read")
        );
    }

}
