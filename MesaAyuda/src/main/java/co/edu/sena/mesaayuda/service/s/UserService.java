/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package co.edu.sena.mesaayuda.service.s;

import co.edu.sena.mesaayuda.dto.UserCreateDTO;
import co.edu.sena.mesaayuda.dto.UserDTO;
import co.edu.sena.mesaayuda.dto.UserUpdateDTO;
import java.util.List;

/**
 *
 * @author Admin
 */
public interface UserService {
    
    void MtCreate(UserCreateDTO oUser);

    void MtEdit(UserUpdateDTO oUser);

    List<UserDTO> MtList();

  
}
