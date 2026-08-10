/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.mapper;

import co.edu.sena.mesaayuda.dto.RoleDTO;
import co.edu.sena.mesaayuda.model.Role;
import java.util.List;
import java.util.stream.Collectors;

/**
 *
 * @author julil
 */
public class RoleMapper {

    public static RoleDTO aDTO(Role oRole) {
        return new RoleDTO(oRole.getId(),
                oRole.getName());
    }

    public static List<RoleDTO> aDTO(List<Role> roles) {

        return roles.stream().map(RoleMapper::aDTO).collect(Collectors.toList());
    }

}
