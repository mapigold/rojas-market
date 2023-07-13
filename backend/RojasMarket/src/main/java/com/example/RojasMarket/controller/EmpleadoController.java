package com.example.RojasMarket.controller;

import com.example.RojasMarket.entity.Cliente;
import com.example.RojasMarket.entity.Empleado;
import com.example.RojasMarket.entity.Proveedor;
import com.example.RojasMarket.service.EmpleadoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/empleado")
@CrossOrigin("*")
public class EmpleadoController {

    @Autowired
    private EmpleadoService empleadoService;

    @GetMapping("/lista")
    public ResponseEntity<List<Empleado>> lista(){
        List<Empleado> lista = empleadoService.listaEmpleado();
        return new ResponseEntity<>(lista, HttpStatus.OK);
    }

    @GetMapping("/verid/{id}")
    public ResponseEntity<Empleado> verId(@PathVariable("id") int id){
        Optional<Empleado> empleado = empleadoService.getById(id);
        if (empleado.isPresent()) {
            return new ResponseEntity<>(empleado.get(), HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }


    @PostMapping("/save")
    public ResponseEntity<String> save(@RequestBody Empleado empleado) {
        empleadoService.saveEmpleado(empleado);
        return new ResponseEntity("Empleado guardado con exito", HttpStatus.CREATED);}

    @PutMapping("/update/{id}")
    public ResponseEntity<String> update(@PathVariable("id") int id, @RequestBody Empleado empleado) {
        Optional<Empleado> existingEmpleado = empleadoService.getById(id);
        if (existingEmpleado.isPresent()) {
            Empleado updateEmpleado = existingEmpleado.get();
            updateEmpleado.setCargo(empleado.getCargo());
            updateEmpleado.setFulldate_empleado(empleado.getFulldate_empleado());
            updateEmpleado.setEdad_empleado(empleado.getEdad_empleado());
            updateEmpleado.setCorreo_empleado(empleado.getCorreo_empleado());
            updateEmpleado.setContrasena_empleado(empleado.getContrasena_empleado());
            empleadoService.updateEmpleado(updateEmpleado);
            return ResponseEntity.ok("Empleado actualizado con éxito");
        } else {
            return ResponseEntity.notFound().build();
        }
    }
    @DeleteMapping("/eliminar/{id}")
    public ResponseEntity<?> eliminar ( @PathVariable("id") int id){
        empleadoService.eliminarEmpleado(id);
        return new ResponseEntity("Empleado eliminado", HttpStatus.OK);
    }
    @PostMapping("/login")
    public ResponseEntity<Boolean> loginEmpleado(@RequestBody Empleado empleado) {
        boolean resultado = empleadoService.loginEmpleado(empleado);
        return ResponseEntity.ok(resultado);
    }

}
