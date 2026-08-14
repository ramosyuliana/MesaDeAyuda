/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package co.edu.sena.mesaayuda.service.s;

/**
 *
 * @author Admin
 */
public interface OtpService {
    void MtGenerateAndSend(int idTicket,int idApplicant);
    boolean MtValidate(int idTicket,String code);
}
