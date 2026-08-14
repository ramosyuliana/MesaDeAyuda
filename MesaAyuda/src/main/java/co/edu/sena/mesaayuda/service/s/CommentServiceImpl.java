/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.service.s;

import co.edu.sena.mesaayuda.dto.CommentCreateDTO;
import co.edu.sena.mesaayuda.dto.CommentDTO;
import co.edu.sena.mesaayuda.mapper.CommentMapper;
import co.edu.sena.mesaayuda.model.Comment;
import co.edu.sena.mesaayuda.repository.CommentRepository;
import java.time.LocalDate;
import java.util.List;

/**
 *
 * @author Admin
 */
public class CommentServiceImpl implements CommentService {

    private final CommentRepository commentRepository;

    public CommentServiceImpl(CommentRepository commentRepository) {
        this.commentRepository = commentRepository;

    }

    @Override
    public List<CommentDTO> MtListComment(int idTicket) {
        return commentRepository.MtListByTicket(idTicket);
    }

    @Override
    public void MtCreateComment(CommentCreateDTO oComment) {
        validar(oComment.getText(), oComment.getIdTicket(),oComment.getIdAuthor());
        Comment comment = CommentMapper.toEntityFromCreate(oComment);
        comment.setDate(LocalDate.now());
        commentRepository.MtCreate(comment);
    }

    @Override
    public void MtEditCommment(CommentDTO oComment) {
        validar(oComment.getText(), oComment.getIdTicket(),oComment.getIdAuthor());
        Comment comment = CommentMapper.toEntityFromUpdate(oComment);
        commentRepository.MtEdit(comment);
    }

    private void validar(String text, int idTicket,int idAuthor) {
        if (text == null || text.trim().isEmpty()) {
            throw new IllegalArgumentException("El texto del comentario no puede estar vacío");
        }
        if (idTicket <= 0) {
            throw new IllegalArgumentException("El ticket asociado no es válido");
        }
        if (text != null && text.length() > 500) {
            throw new IllegalArgumentException("El comentario no puede superar los 500 caracteres");
        }
        if (idAuthor <= 0) {
            throw new IllegalArgumentException("Debe especificar un autor válido");
        }

    }
}
