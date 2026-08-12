/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.service.s;

import co.edu.sena.mesaayuda.dto.UserCreateDTO;
import co.edu.sena.mesaayuda.dto.UserDTO;
import co.edu.sena.mesaayuda.dto.UserUpdateDTO;
import co.edu.sena.mesaayuda.mapper.UserMapper;
import co.edu.sena.mesaayuda.model.User;
import co.edu.sena.mesaayuda.repository.UserRepository;
import java.util.List;

/**
 *
 * @author Admin
 */
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;

    public UserServiceImpl(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public void MtCreate(UserCreateDTO oUser) {
        validar(oUser.getName(),oUser.getEmail(),oUser.getidRole());
        User user = UserMapper.toEntityFromCreate(oUser);
        userRepository.MtCreate(user);
    }

    @Override
    public void MtEdit(UserUpdateDTO oUser) {
        validarU(oUser.getName(),oUser.getEmail());
        User user = UserMapper.toEntityFromUpdate(oUser);
        userRepository.MtEdit(user);
    }

    @Override
    public List<UserDTO> MtList() {
        return UserMapper.aDTO(userRepository.MtList());
    }

    private void validar(String name, String email, int Rol) {
        if (name == null || name.trim().isEmpty()) {
            throw new IllegalArgumentException("El nombre del usuario no puede estar vacío");
        }
        if (email == null || email.trim().isEmpty()) {
            throw new IllegalArgumentException("El email del usuario no puede estar vacío");
        }
         
        if (Rol <= 0) {
            throw new IllegalArgumentException("El Rol no es valido");
        }

    }
    private void validarU(String name, String email) {
        if (name == null || name.trim().isEmpty()) {
            throw new IllegalArgumentException("El nombre del usuario no puede estar vacío");
        }
        if (email == null || email.trim().isEmpty()) {
            throw new IllegalArgumentException("El email del usuario no puede estar vacío");
        }
         
        

    }
}
