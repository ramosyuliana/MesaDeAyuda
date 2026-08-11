/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package co.edu.sena.mesaayuda.repository;

import co.edu.sena.mesaayuda.model.Comment;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author julil
 */
public interface CommentRepository {

    void MtCreate(Comment ocomment);

    List<Comment> MtListByTicket(int id);

    void MtEdit(Comment ocomment);

}
