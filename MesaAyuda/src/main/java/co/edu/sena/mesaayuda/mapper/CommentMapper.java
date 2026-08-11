/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.mapper;

import co.edu.sena.mesaayuda.dto.CommentCreateDTO;
import co.edu.sena.mesaayuda.dto.CommentDTO;
import co.edu.sena.mesaayuda.model.Comment;
import java.util.List;
import java.util.stream.Collectors;

/**
 *
 * @author Admin
 */
public class CommentMapper {

    public static Comment toEntityFromCreate(CommentCreateDTO dto) {

       Comment oComment = new Comment();
        oComment.setIdAuthor(dto.getIdAuthor());
        oComment.setText(dto.getText());
        oComment.setDate(dto.getDate());
        oComment.setIdTicket(dto.getIdTicket());
        return oComment;
    }
    
    public static Comment toEntityFromUpdate(CommentDTO dto) {

        Comment oComment = new Comment();
        oComment.setId(dto.getId());
        oComment.setIdAuthor(dto.getIdAuthor());
        oComment.setText(dto.getText());
        oComment.setDate(dto.getDate());
        oComment.setIdTicket(dto.getIdTicket());
        return oComment;
    }

    public static CommentDTO aDTO(Comment ocomment) {
        return new CommentDTO(
                ocomment.getId(),
                ocomment.getIdAuthor(),
                ocomment.getText(),
                ocomment.getDate(),
                ocomment.getIdTicket()
        );
    }

    public static List<CommentDTO> aDTO(List<Comment> comments) {
        return comments.stream().map(CommentMapper::aDTO).collect(Collectors.toList());
    }

}
