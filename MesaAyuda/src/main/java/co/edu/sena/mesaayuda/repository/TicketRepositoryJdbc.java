/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.repository;


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
    public void MtCreate(Ticket oticket) throws SQLException {
        String consulta = "Insert into \"Ticket\"(\"Title\",\"Description\",\"IdCategoty\",\"IdApplicant\",\"IdAgent\",\"State\",\"CreateDate\") Values (?,?,?,?,?,?,?)";
        try (Connection con = ConexionDB.getConnection(); PreparedStatement ps = con.prepareStatement(consulta)) {
           ps.setString(1,oticket.getTitle());
           ps.setString(2, oticket.getDescription());
           ps.setInt(3, oticket.getIdCategory());
           ps.setInt(4, oticket.getIdApplicant());
           ps.setInt(5, oticket.getIdAgent());
           ps.setString(6, oticket.getState());
           ps.setDate(7,Date.valueOf(oticket.getCreateDate()));
           ps.executeUpdate();

        }
    }

    @Override
    public void MtEdit(Ticket oticket) throws SQLException {
         String consulta = "Update \"Ticket\" set \"Title\" = ?,\"Description\" = ?,\"IdCategoty\" = ? Where \"Id\" = ?";
        try (Connection con = ConexionDB.getConnection(); PreparedStatement ps = con.prepareStatement(consulta)) {
           ps.setString(1,oticket.getTitle());
           ps.setString(2, oticket.getDescription());
           ps.setInt(3, oticket.getIdCategory());
           ps.setInt(4, oticket.getId());
           ps.executeUpdate();

        }
    }
    
    @Override
    public void MtEditState(String estado,Ticket oticket) throws SQLException {
         String consulta = "Update \"Ticket\" set \"State\" = ? Where \"Id\" = ?";
        try (Connection con = ConexionDB.getConnection(); PreparedStatement ps = con.prepareStatement(consulta)) {
           ps.setString(1,"estado");
           ps.setInt(2, oticket.getId());
           ps.executeUpdate();

        }
    }
    
    @Override
    public void MtEditAgent(int IdAgent,Ticket oticket) throws SQLException {
         String consulta = "Update \"Ticket\" set \"IdAgent\" = ?  Where \"Id\" = ?";
        try (Connection con = ConexionDB.getConnection(); PreparedStatement ps = con.prepareStatement(consulta)) {
           ps.setInt(1,IdAgent);
           ps.setInt(2, oticket.getId());
           ps.executeUpdate();

        }
    }

    @Override
    public List<Ticket> MtListByAgent(int IdAgent) throws SQLException {
       String consulta = "Select * from \"Ticket\"  where \"IdAgent\"= ?";
        List<Ticket> list = new ArrayList<Ticket>();
        try (Connection cn = ConexionDB.getConnection(); PreparedStatement ps = cn.prepareStatement(consulta);) {
            ps.setInt(1, IdAgent);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Ticket oticket = new Ticket();
                    oticket.setId(rs.getInt("Id"));
                    oticket.setTitle(rs.getString("Title"));
                    oticket.setDescription(rs.getString("Description"));
                    oticket.setIdCategory(rs.getInt("IdCategory"));
                    oticket.setIdCategory(rs.getInt("IdApplicant"));
                    oticket.setIdCategory(rs.getInt("IdAgent"));
                    oticket.setState(rs.getString("State"));
                    oticket.setCreateDate(rs.getObject("CreateDate", LocalDate.class));
                    

                    list.add(oticket);
                }
            }
            
            return list;
        }

    }

    @Override
    public List<Ticket> MtListByApplicant(int IdApplicant) throws SQLException {
               String consulta = "Select * from \"Ticket\"  where \"IdApplicant\"= ?";
        List<Ticket> list = new ArrayList<Ticket>();
        try (Connection cn = ConexionDB.getConnection(); PreparedStatement ps = cn.prepareStatement(consulta);) {
            ps.setInt(1, IdApplicant);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Ticket oticket = new Ticket();
                    oticket.setId(rs.getInt("Id"));
                    oticket.setTitle(rs.getString("Title"));
                    oticket.setDescription(rs.getString("Description"));
                    oticket.setIdCategory(rs.getInt("IdCategory"));
                    oticket.setIdCategory(rs.getInt("IdApplicant"));
                    oticket.setIdCategory(rs.getInt("IdAgent"));
                    oticket.setState(rs.getString("State"));
                    oticket.setCreateDate(rs.getObject("CreateDate", LocalDate.class));
                    

                    list.add(oticket);
                }
            }
            
            return list;
        }
    }

    @Override
    public List<Ticket> MtListAll() throws SQLException {
               String consulta = "Select * from \"Ticket\" ";
        List<Ticket> list = new ArrayList<Ticket>();
        try (Connection cn = ConexionDB.getConnection(); PreparedStatement ps = cn.prepareStatement(consulta);) {
           
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Ticket oticket = new Ticket();
                    oticket.setId(rs.getInt("Id"));
                    oticket.setTitle(rs.getString("Title"));
                    oticket.setDescription(rs.getString("Description"));
                    oticket.setIdCategory(rs.getInt("IdCategory"));
                    oticket.setIdCategory(rs.getInt("IdApplicant"));
                    oticket.setIdCategory(rs.getInt("IdAgent"));
                    oticket.setState(rs.getString("State"));
                    oticket.setCreateDate(rs.getObject("CreateDate", LocalDate.class));
                    

                    list.add(oticket);
                }
            }
            
            return list;
        }
    }

}
