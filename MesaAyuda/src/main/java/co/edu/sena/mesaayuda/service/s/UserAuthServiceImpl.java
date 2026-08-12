/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.service.s;

import co.edu.sena.mesaayuda.model.User;
import co.edu.sena.mesaayuda.repository.UserRepository;

/**
 *
 * @author Admin
 */
public class UserAuthServiceImpl implements UserAuthService{

    private final UserRepository userRepository;

    public UserAuthServiceImpl(UserRepository userRepository) {
        this.userRepository = userRepository;
    }
    
    
    @Override
    public User MtAuthenticate(String email) {
        if(email == null || email.trim().isEmpty()){
            throw new IllegalArgumentException("El correo es obligatorio");
        }
        
        User user = userRepository.MtFindByEmail(email);
        
        if(user == null){
            throw new IllegalArgumentException("usuario no encontrado");
        }
        
        return user;
    }
    
}
