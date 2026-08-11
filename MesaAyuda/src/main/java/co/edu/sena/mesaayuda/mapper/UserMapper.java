/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.mapper;

import co.edu.sena.mesaayuda.dto.UserCreateDTO;
import co.edu.sena.mesaayuda.dto.UserDTO;
import co.edu.sena.mesaayuda.dto.UserUpdateDTO;
import co.edu.sena.mesaayuda.model.Role;
import co.edu.sena.mesaayuda.model.User;
import java.util.List;
import java.util.stream.Collectors;

/**
 *
 * @author julil
 */
public class UserMapper {

    public static User toEntityFromCreate(UserCreateDTO oUserDto) {
        if (oUserDto == null) {
            return null;
        }

        User oUser = new User();
        oUser.setName(oUserDto.getName());
        oUser.setEmail(oUserDto.getEmail());

        Role oRole = new Role();
        oRole.setId(oUserDto.getidRole());

        oUser.setRole(oRole);

        return oUser;

    }

    public static User toEntityFromUpdate(UserUpdateDTO oUserDto) {

        if (oUserDto == null) {
            return null;
        }

        User oUser = new User();

        oUser.setId(oUserDto.getId());
        oUser.setName(oUserDto.getName());
        oUser.setEmail(oUserDto.getEmail());

        return oUser;
    }
    
    public static UserDTO aDTO(User oUser){
        return new UserDTO(
                oUser.getId(),
                oUser.getName(),
                oUser.getEmail(),
                oUser.getRole().getName()
        );
    }
    
    public static List<UserDTO> aDTO(List<User> users){
        return users.stream().map(UserMapper::aDTO).collect(Collectors.toList());
    }
    
    
}
