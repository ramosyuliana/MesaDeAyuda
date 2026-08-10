/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.mapper;

import co.edu.sena.mesaayuda.dto.CategoryDTO;
import co.edu.sena.mesaayuda.model.Category;
import java.util.List;
import java.util.stream.Collectors;

/**
 *
 * @author julil
 */
public class CategoryMapper {
    
    public static CategoryDTO aDTO(Category oCategory){
        return new CategoryDTO(
                oCategory.getId(),
                oCategory.getName(),
                oCategory.getPriority().getName()
        );
    }
    
    
    public static List<CategoryDTO> aDTO(List<Category> categories){
        return categories.stream().map(CategoryMapper::aDTO).collect(Collectors.toList());
    }
}
