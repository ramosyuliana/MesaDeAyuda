/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.service.s;

import co.edu.sena.mesaayuda.model.Notification;
import co.edu.sena.mesaayuda.model.User;
import co.edu.sena.mesaayuda.repository.UserRepository;
import co.edu.sena.mesaayuda.service.notification.Notificator;
import java.security.SecureRandom;
import java.time.LocalDateTime;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 *
 * @author Admin
 */
public class OtpServiceImpl implements OtpService {

    private final Map<Integer, OtpEntry> store = new ConcurrentHashMap<>();

    private final Notificator notificator;
    private final UserRepository userRepository;

    public OtpServiceImpl(Notificator notificator, UserRepository userRepository) {
        this.notificator = notificator;
        this.userRepository = userRepository;
    }

    @Override
    public void MtGenerateAndSend(int idTicket, int idApplicant) {
        String code = generarCodigo();
        store.put(idTicket, new OtpEntry(code, LocalDateTime.now().plusMinutes(10)));

        User applicant = userRepository.MtFindById(idApplicant);
        Notification notification = new Notification(
                idTicket, applicant,
                "Código de confirmación de cierre",
                "Tu código para confirmar el cierre del ticket es: " + code + " (válido 10 minutos)"
        );
        notificator.MtSendNotification(notification);
    }

    @Override
    public boolean MtValidate(int idTicket, String code) {
        OtpEntry entry = store.get(idTicket);
        if (entry == null) {
            return false;
        }
        if (entry.used || LocalDateTime.now().isAfter(entry.expiresAt)) {
            return false;
        }
        if (!entry.code.equals(code)) {
            return false;
        }
        entry.used = true;
        return true;
    }

    private String generarCodigo() {
        SecureRandom random = new SecureRandom();
        int codigo = 100000 + random.nextInt(900000);
        System.out.println("DEBUG - El código OTP generado es: " + codigo);
        return String.valueOf(codigo);
        
    }

    private static class OtpEntry {

        final String code;
        final LocalDateTime expiresAt;
        boolean used = false;

        OtpEntry(String code, LocalDateTime expiresAt) {
            this.code = code;
            this.expiresAt = expiresAt;
        }
    }
}
