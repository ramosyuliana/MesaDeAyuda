/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.repository;

import co.edu.sena.mesaayuda.dto.CommentDTO;
import co.edu.sena.mesaayuda.model.Comment;
import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;
import co.edu.sena.mesaayuda.util.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author julil
 */
public class CommentRepositoryJdbc implements CommentRepository {

    @Override
    public void MtCreate(Comment ocomment) {
        String consulta = "Insert into \"Comment\"(\"IdAuthor\",\"Text\",\"Date\",\"IdTicket\") Values (?,?,?,?)";
        try (Connection con = ConexionDB.getConnection(); PreparedStatement ps = con.prepareStatement(consulta)) {
            ps.setInt(1, ocomment.getIdAuthor());
            ps.setString(2, ocomment.getText());
            ps.setDate(3, Date.valueOf(ocomment.getDate()));
            ps.setInt(4, ocomment.getIdTicket());
            ps.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException("No se pudo crear el comentario", e);
        }
    }

    @Override
    public List<CommentDTO> MtListByTicket(int id) {
        
        String consulta = "Select c.*,u.\"Name\" from \"Comment\" c inner join \"User\" u on u.\"Id\" = c.\"IdAuthor\" where \"IdTicket\"= ?";
        List<CommentDTO> list = new ArrayList<CommentDTO>();
        try (Connection cn = ConexionDB.getConnection(); PreparedStatement ps = cn.prepareStatement(consulta);) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(mapearCommentDTO(rs));
                }
            }

            return list;
        } catch (SQLException e) {

            throw new RuntimeException("No se pudieron listar los comentarios asociados al ticket", e);

        }

    }

    private CommentDTO mapearCommentDTO(ResultSet rs) throws SQLException {

        CommentDTO dto = new CommentDTO();
        dto.setId(rs.getInt("Id"));
        dto.setIdAuthor(rs.getInt("IdAuthor"));
        dto.setText(rs.getString("Text"));
        dto.setDate(rs.getObject("Date", LocalDate.class));
        dto.setIdTicket(rs.getInt("IdTicket"));
        dto.setNameAuthor(rs.getString("Name"));

        return dto;
    }

    @Override
    public void MtEdit(Comment ocomment) {
        String consulta = "Update \"Comment\" set \"Text\" = ?,\"Date\" = ? Where \"Id\" = ?";
        try (Connection con = ConexionDB.getConnection(); PreparedStatement ps = con.prepareStatement(consulta)) {

            ps.setString(1, ocomment.getText());
            ps.setDate(2, Date.valueOf(ocomment.getDate()));
            ps.setInt(3, ocomment.getId());
            ps.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException("No se pudo editar el comentario", e);
        }
    }

}
