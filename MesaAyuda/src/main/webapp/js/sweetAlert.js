/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */

class sweetAlert {

    static success(title, text = '') {
        return Swal.fire({
            icon: 'success',
            title: title,
            text: text,
            confirmButtonColor: '#2563eb', // Coincide con tu paleta de colores (Primary)
            timer: 8000,
            timerProgressBar: true
        });
    }

    static error(title, text = '') {
        return Swal.fire({
            icon: 'error',
            title: title,
            text: text,
            confirmButtonColor: '#dc2626' // Coincide con tu color de error
        });
    }

    static warning(title, text = '') {
        return Swal.fire({
            icon: 'warning',
            title: title,
            text: text,
            confirmButtonColor: '#2563eb'
        });
    }

    static confirm(title, text, confirmButtonText = 'Sí, confirmar') {
        return Swal.fire({
            title: title,
            text: text,
            icon: 'question',
            showCancelButton: true,
            confirmButtonColor: '#2563eb',
            cancelButtonColor: '#64748b',
            confirmButtonText: confirmButtonText,
            cancelButtonText: 'Cancelar'
        });
    }
}
