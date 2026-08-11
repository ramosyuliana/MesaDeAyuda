/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.repository;

import co.edu.sena.mesaayuda.model.Category;
import co.edu.sena.mesaayuda.model.Priority;
import co.edu.sena.mesaayuda.util.ConexionDB;
import java.util.List;
import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author julil
 */
public class CategoryRepositoryJdbc implements CategoryRepository {

    @Override
    public List<Category> MtListCategories() {

        String sql = "Select c.\"Id\", c.\"Name\", p.\"Name\" as \"PriorityName\" From \"Category\" c "
                + "Inner Join \"Priority\" p "
                + "ON "
                + "c.\"IdPriority\" = p.\"Id\"";

        List<Category> list = new ArrayList<Category>();

        try (Connection cn = ConexionDB.getConnection(); PreparedStatement ps = cn.prepareStatement(sql)) {

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Category oCategory = new Category();
                    oCategory.setId(rs.getInt("Id"));
                    oCategory.setName(rs.getString("Name"));
                    Priority oPriority = new Priority();
                    oPriority.setName(rs.getString("PriorityName"));
                    oCategory.setPriority(oPriority);
                    list.add(oCategory);
                }
            }
            return list;
        } catch (SQLException e) {
            throw new RuntimeException("No se pudieron listar las categorias", e);
        }
    }
}
