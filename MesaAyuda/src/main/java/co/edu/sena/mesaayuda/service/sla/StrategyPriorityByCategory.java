/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.service.sla;

import co.edu.sena.mesaayuda.model.Category;
import co.edu.sena.mesaayuda.model.Priority;
import co.edu.sena.mesaayuda.model.Ticket;
import co.edu.sena.mesaayuda.repository.CategoryRepository;

/**
 *
 * @author Admin
 */
public class StrategyPriorityByCategory implements StrategyPriority{
     private final CategoryRepository categoryRepository;

    public StrategyPriorityByCategory(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    @Override
    public Priority MtDeterminePriority(Ticket ticket) {
        Category category = categoryRepository.MtFindById(ticket.getIdCategory());
        return category.getPriority();
    }
}
