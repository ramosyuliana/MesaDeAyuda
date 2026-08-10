/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.repository;

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
    public void MtCreate(Comment ocomment) throws SQLException {
        String consulta = "Insert into \"Comment\"(\"IdAuthor\",\"Text\",\"Date\",\"IdTicket\") Values (?,?,?,?)";
        try (Connection con = ConexionDB.getConnection(); PreparedStatement ps = con.prepareStatement(consulta)) {
            ps.setInt(1, ocomment.getIdAuthor());
            ps.setString(2, ocomment.getText());
            ps.setDate(3, Date.valueOf(ocomment.getDate()));
            ps.setInt(4, ocomment.getIdTicket());
            ps.executeUpdate();

        }
    }

    @Override
    public List<Comment> MtListByTicket(int id)throws SQLException {
        String consulta = "Select * from \"Comment\"  where \"IdTicket\"= ?";
        List<Comment> list = new ArrayList<Comment>();
        try (Connection cn = ConexionDB.getConnection(); PreparedStatement ps = cn.prepareStatement(consulta);) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Comment ocomment = new Comment();
                    ocomment.setId(rs.getInt("Id"));
                    ocomment.setIdAuthor(rs.getInt("IdAuthor"));
                    ocomment.setText(rs.getString("Text"));
                    ocomment.setDate(rs.getObject("Date", LocalDate.class));
                    ocomment.setIdTicket(rs.getInt("IdTicket"));

                    list.add(ocomment);
                }
            }
            
            return list;
        }

    }

    @Override
    public void MtEdit(Comment ocomment)throws SQLException{
        String consulta = "Update \"Comment\" set \"Text\" = ?,\"Date\" = ? Where \"Id\" = ?";
        try (Connection con = ConexionDB.getConnection(); PreparedStatement ps = con.prepareStatement(consulta)) {
           
            ps.setString(1, ocomment.getText());
            ps.setDate(2, Date.valueOf(ocomment.getDate()));
            ps.setInt(3, ocomment.getId());
            ps.executeUpdate();
     

        }
    }

}
