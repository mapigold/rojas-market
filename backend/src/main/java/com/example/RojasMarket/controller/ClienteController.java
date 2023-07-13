package com.example.RojasMarket.controller;

import com.example.RojasMarket.entity.Cliente;
import com.example.RojasMarket.service.ClienteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;
@RestController
@RequestMapping("/cliente")
@CrossOrigin("*")
public class ClienteController {


    @Autowired
    ClienteService clienteService;

    @GetMapping("/lista")
    public ResponseEntity<List<Cliente>> lista(){
        List<Cliente> lista = clienteService.listaCliente();
        return new ResponseEntity(lista, HttpStatus.OK);
    }

    @GetMapping("/verid/{id}")
    public ResponseEntity<Cliente> verId(@PathVariable("id") int id){
        Optional<Cliente> cliente = clienteService.getById(id);
        return new ResponseEntity(cliente, HttpStatus.OK);
    }

    @PostMapping("/save")
    public ResponseEntity<String> save(@RequestBody Cliente cliente) {
        clienteService.saveCliente(cliente);
        return new ResponseEntity("cliente guardado con exito", HttpStatus.CREATED);
    }
    @PutMapping("/update/{id}")
    public ResponseEntity<String> update(@PathVariable("id") int id, @RequestBody Cliente cliente) {
        Optional<Cliente> existingCliente = clienteService.getById(id);
        if (existingCliente.isPresent()) {
            Cliente updatedCliente = existingCliente.get();
            updatedCliente.setDni_cliente(cliente.getDni_cliente());
            updatedCliente.setNombre_cliente(cliente.getNombre_cliente());
            updatedCliente.setCorreo_cliente(cliente.getCorreo_cliente());
            updatedCliente.setTelefono_cliente(cliente.getTelefono_cliente());
            clienteService.updateCliente(updatedCliente);
            return ResponseEntity.ok("Cliente actualizado con éxito");
        } else {
            return ResponseEntity.notFound().build();
        }
    }




    @DeleteMapping("/eliminar/{id}")
    public  ResponseEntity<?> eliminar(@PathVariable("id") int id){
        clienteService.eliminarCliente(id);
        return new ResponseEntity("cliente eliminado", HttpStatus.OK);
    }
}
