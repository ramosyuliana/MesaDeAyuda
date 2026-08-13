/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.service.s;

import co.edu.sena.mesaayuda.dto.TicketCreateDTO;
import co.edu.sena.mesaayuda.dto.TicketDTO;
import co.edu.sena.mesaayuda.mapper.TicketMapper;
import co.edu.sena.mesaayuda.model.Notification;
import co.edu.sena.mesaayuda.model.Priority;
import co.edu.sena.mesaayuda.model.Ticket;
import co.edu.sena.mesaayuda.model.User;
import co.edu.sena.mesaayuda.model.state.NewState;
import co.edu.sena.mesaayuda.model.state.TicketState;
import co.edu.sena.mesaayuda.model.state.TicketStateFactory;
import co.edu.sena.mesaayuda.repository.CategoryRepository;
import co.edu.sena.mesaayuda.repository.TicketRepository;
import co.edu.sena.mesaayuda.repository.UserRepository;
import co.edu.sena.mesaayuda.service.assignment.StrategyAssignment;
import co.edu.sena.mesaayuda.service.notification.Notificator;
import co.edu.sena.mesaayuda.service.sla.StrategyPriority;
import co.edu.sena.mesaayuda.service.sla.StrategySLA;
import java.time.LocalDate;
import java.util.List;

/**
 *
 * @author Admin
 */
public class TicketServiceImpl implements TicketService {

    private final TicketRepository ticketRepository;
    private final UserRepository userRepository;
    private final CategoryRepository categoryRepository;
    private final StrategySLA strategySla;
    private final StrategyAssignment strategyAssignment;
    private final StrategyPriority strategyPriority;
    private final Notificator notificator;

    public TicketServiceImpl(TicketRepository ticketRepository, UserRepository userRepository, CategoryRepository categoryRepository, StrategySLA strategySla, StrategyAssignment strategyAssignment, StrategyPriority strategyPriority, Notificator notificator) {
        this.ticketRepository = ticketRepository;
        this.userRepository = userRepository;
        this.categoryRepository = categoryRepository;
        this.strategySla = strategySla;
        this.strategyAssignment = strategyAssignment;
        this.strategyPriority = strategyPriority;
        this.notificator = notificator;
    }

    @Override
    public void MtCreateTicket(TicketCreateDTO oTicket) {
        validar(oTicket.getTitle(), oTicket.getDescription(), oTicket.getIdCategory());
        Ticket ticket = TicketMapper.toEntityFromCreate(oTicket);
        ticket.setCreateDate(LocalDate.now());

        Priority priority = strategyPriority.MtDeterminePriority(ticket);

        int AttentionTime = this.strategySla.MtCalculeDays(priority);
        ticket.setExpirationDate(ticket.getCreateDate().plusDays(AttentionTime));

        List<User> availableAgents = userRepository.MtListAgents();
        User agent = strategyAssignment.MtAssigmentAgent(ticket, availableAgents);
        ticket.setIdAgent(agent.getId());

        TicketState newTicketState = new NewState();
        ticket.setState(newTicketState.Name());

        TicketState estadoAsignado = newTicketState.MtAssign();
        ticket.setState(estadoAsignado.Name());

        ticketRepository.MtCreate(ticket);
    }

    @Override
    public void MtEditTicket(TicketDTO oTicket) {
        validar(oTicket.getTitle(), oTicket.getDescription(), oTicket.getIdCategory());
        Ticket ticket = ticketRepository.MtFindById(oTicket.getId());
        if (ticket == null) {
            throw new IllegalArgumentException("Ticket no encontrado");
        }

        ticket.setTitle(oTicket.getTitle());
        ticket.setDescription(oTicket.getDescription());
        ticket.setIdCategory(oTicket.getIdCategory());

        ticketRepository.MtEdit(ticket);
    }

    @Override
    public void MtEditState(int idTicket, String action) {
        Ticket ticket = ticketRepository.MtFindById(idTicket);
        if (ticket == null) {
            throw new IllegalArgumentException("Ticket no encontrado");
        }

        TicketState currentState = TicketStateFactory.fromName(ticket.getState());

        TicketState newState = switch (action) {
            case "ASIGNAR" ->
                currentState.MtAssign();
            case "INICIAR" ->
                currentState.MtStart();
            case "RESOLVER" ->
                currentState.MtResolve();
            case "CERRAR" ->
                currentState.MtClose();
            case "REABRIR" ->
                currentState.MtReOpen();
            case "CANCELAR" ->
                currentState.MtCancel();
            default ->
                throw new IllegalArgumentException("Acción no reconocida: " + action);
        };

        ticketRepository.MtEditState(newState.Name(), ticket);
    }

    @Override
    public void MtReassignAgent(int idTicket) {
        Ticket ticket = ticketRepository.MtFindById(idTicket);
        if (ticket == null) {
            throw new IllegalArgumentException("Ticket no encontrado");
        }

        List<User> availableAgents = userRepository.MtListAgents();
        User newAgent = strategyAssignment.MtAssigmentAgent(ticket, availableAgents);

        ticketRepository.MtEditAgent(newAgent.getId(), ticket);
    }

    @Override
    public List<TicketDTO> MtListByAgent(int IdAgent) {
        return ticketRepository.MtListByAgent(IdAgent);
    }

    @Override
    public List<TicketDTO> MtListByApplicant(int IdApplicant) {
        return ticketRepository.MtListByApplicant(IdApplicant);
    }

    @Override
    public List<TicketDTO> MtListAll() {
        return ticketRepository.MtListAll();

    }

    private void validar(String Title, String Description, int idCategory) {
        if (Title == null || Title.trim().isEmpty()) {
            throw new IllegalArgumentException("El titulo del ticket no puede estar vacío");
        }
        if (idCategory <= 0) {
            throw new IllegalArgumentException("El ticket asociado no es válido");
        }
        if (Description == null || Description.trim().isEmpty()) {
            throw new IllegalArgumentException("La Descripcion del ticket no puede estar vacío");
        }
        if (Description != null && Description.length() > 1000) {
            throw new IllegalArgumentException("La descripcion no puede superar los 1000 caracteres");
        }

    }

    @Override
    public void MtNotifyStateChange(Ticket oTicket, TicketState oPreviousState) {

        String subject = "Ticket #" + oTicket.getId() + " - " + oTicket.getState();

        String message = "Su ticket \"" + oTicket.getTitle() + "\" paso de "
                + oPreviousState.Name() + " a " + oTicket.getState() + ".";

        User oApplicant = userRepository.MtFindById(oTicket.getIdApplicant());
        Notification oNotification = new Notification(
                oTicket.getId(),
                oApplicant,
                subject,
                message
        );

        notificator.MtSendNotification(oNotification);
    }
}
