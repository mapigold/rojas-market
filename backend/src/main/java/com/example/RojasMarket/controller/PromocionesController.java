package com.example.RojasMarket.controller;

import com.example.RojasMarket.entity.Promociones;
import com.example.RojasMarket.entity.Proveedor;
import com.example.RojasMarket.service.PromocionesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/promociones")
@CrossOrigin("*")
public class PromocionesController {
    @Autowired
    PromocionesService promocionesService;
    @GetMapping("/lista")
    public ResponseEntity<List<Proveedor>> lista(){
        List<Promociones> lista = promocionesService.lista();
        return new ResponseEntity(lista, HttpStatus.OK);
    }

    @GetMapping("/verid/{id}")
    public ResponseEntity<Proveedor> verId(@PathVariable("id") int id){
        Optional<Promociones> promociones = promocionesService.getById(id);
        return new ResponseEntity(promociones, HttpStatus.OK);
    }

    @PostMapping("/nuevo")
    public ResponseEntity<String> save(@RequestBody Promociones promociones) {
        promocionesService.savePromociones(promociones);
        return new ResponseEntity("Promoción guardado con exito", HttpStatus.CREATED);}


    @DeleteMapping("/eliminar/{id}")
    public ResponseEntity<?> eliminar ( @PathVariable("id") int id){
        promocionesService.eliminarPromociones(id);
        return new ResponseEntity("Promoción eliminada", HttpStatus.OK);
    }
}
