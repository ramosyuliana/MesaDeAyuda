/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.repository;

import co.edu.sena.mesaayuda.model.ChatRealTime;
import co.edu.sena.mesaayuda.util.ConexionDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ChatRealTimeRepositoryJdbc implements ChatRealTimeRepository {

    @Override
    public void MtCreate(ChatRealTime ochat) {
        String query = "Insert into \"ChatMessage\"(\"IdTicket\", \"IdAuthor\", \"Text\", \"Date\") Values (?,?,?,?)";
        try (Connection cn = ConexionDB.getConnection(); PreparedStatement ps = cn.prepareStatement(query)) {
            ps.setInt(1, ochat.getIdTicket());
            ps.setInt(2, ochat.getIdAuthor());
            ps.setString(3, ochat.getText());
            ps.setTimestamp(4, Timestamp.valueOf(ochat.getDate()));
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("No se pudo guardar el mensaje", e);
        }
    }

    @Override
    public List<ChatRealTime> MtListByTicket(int idTicket) {

        String query  = "Select * from \"ChatMessage\" where \"IdTicket\" = ? order by \"Date\" asc";
        List<ChatRealTime> list = new ArrayList<>();
        try (Connection cn = ConexionDB.getConnection(); PreparedStatement ps = cn.prepareStatement(query)) {
            ps.setInt(1, idTicket);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ChatRealTime m = new ChatRealTime();
                    m.setId(rs.getInt("Id"));
                    m.setIdTicket(rs.getInt("IdTicket"));
                    m.setIdAuthor(rs.getInt("IdAuthor"));
                    m.setText(rs.getString("Text"));
                    m.setDate(rs.getObject("Date", LocalDateTime.class));
                    list.add(m);
                }
            }
            return list;
        } catch (SQLException e) {
            throw new RuntimeException("No se pudo listar el historial del chat", e);
        }
    }

}
