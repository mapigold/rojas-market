package com.example.RojasMarket.service;

import com.example.RojasMarket.Repository.EmpleadoRepository;
import com.example.RojasMarket.entity.Cliente;
import com.example.RojasMarket.entity.Empleado;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;
@Service
@Transactional
public class EmpleadoService {
    @Autowired
    EmpleadoRepository empleadoRepository;

    public List<Empleado> listaEmpleado(){
        return empleadoRepository.listaEmpleado();

    }

    public Optional<Empleado> getById(int id){

        return empleadoRepository.idEmpleado(id);
    }

    public void saveEmpleado(Empleado empleado){
        empleadoRepository.saveEmpleado(empleado.getCargo(), empleado.getFulldate_empleado(),empleado.getEdad_empleado(),empleado.getCorreo_empleado(),empleado.getContrasena_empleado());
    }
    public void updateEmpleado(Empleado empleado) {
        empleadoRepository.updateEmpleado(
                empleado.getId_empleado(),
                empleado.getCargo(),
                empleado.getFulldate_empleado(),
               empleado.getEdad_empleado(),
                empleado.getCorreo_empleado(),
                empleado.getContrasena_empleado()
        );
    }
    public void eliminarEmpleado(int id){
        empleadoRepository.eliminarEmpleado(id);
    }

    public boolean loginEmpleado(Empleado empleado) {
        String correoEmpleado = empleado.getCorreo_empleado();
        String contrasenaEmpleado = empleado.getContrasena_empleado();
        return empleadoRepository.loginEmpleado(correoEmpleado, contrasenaEmpleado);
    }
}
