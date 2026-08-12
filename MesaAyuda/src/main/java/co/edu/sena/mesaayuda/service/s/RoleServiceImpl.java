/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.service.s;

import co.edu.sena.mesaayuda.dto.RoleDTO;
import co.edu.sena.mesaayuda.mapper.RoleMapper;
import co.edu.sena.mesaayuda.repository.RoleRepository;
import java.util.List;

/**
 *
 * @author Admin
 */
public class RoleServiceImpl implements RoleService {
    
    private final RoleRepository roleRepository;

    public RoleServiceImpl(RoleRepository roleRepository) {
        this.roleRepository = roleRepository;
    }
    
    @Override
    public List<RoleDTO> MtListRoles(){
        return RoleMapper.aDTO(roleRepository.MtListRoles());
    }
    
}
