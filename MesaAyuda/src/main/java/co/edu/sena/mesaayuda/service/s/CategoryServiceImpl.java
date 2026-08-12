/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.service.s;

import co.edu.sena.mesaayuda.dto.CategoryDTO;
import co.edu.sena.mesaayuda.mapper.CategoryMapper;
import co.edu.sena.mesaayuda.repository.CategoryRepository;
import java.util.List;

/**
 *
 * @author Admin
 */
public class CategoryServiceImpl implements CategoryService {

    private final CategoryRepository categoryRepository;

    public CategoryServiceImpl(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    @Override
    public List<CategoryDTO> MtListCategories() {
        return CategoryMapper.aDTO(categoryRepository.MtListCategories());

    }

}
