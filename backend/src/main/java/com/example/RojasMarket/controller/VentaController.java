package com.example.RojasMarket.controller;


import com.example.RojasMarket.entity.Empleado;
import com.example.RojasMarket.entity.Promociones;
import com.example.RojasMarket.entity.Proveedor;
import com.example.RojasMarket.entity.Venta;
import com.example.RojasMarket.service.VentaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("/venta")
@CrossOrigin("*")
public class VentaController {

    @Autowired
    VentaService ventaService;


    @GetMapping("/lista")
    public ResponseEntity<List<Venta>> lista(){
        List<Venta> lista = ventaService.lista();
        return new ResponseEntity<>(lista, HttpStatus.OK);
    }

    @GetMapping("/verid/{id}")
    public ResponseEntity<Venta> verId(@PathVariable("id") int id){
        Optional<Venta> venta = ventaService.getById(id);
        return new ResponseEntity(venta, HttpStatus.OK);
    }

    @PostMapping("/save")
    public ResponseEntity<Void> crearVenta(@RequestBody Map<String, Object> requestBody) {
        Venta venta = new Venta();
        venta.setId_emp((int) requestBody.get("id_emp"));
        venta.setDni_cli((int) requestBody.get("dni_cli"));
        // Configurar los demás atributos de la venta según los parámetros recibidos

        String productoCantidadList = (String) requestBody.get("productoCantidadList");
        String delimiter =";";

        ventaService.guardarVentaYDetalle(venta, productoCantidadList, delimiter);

        return ResponseEntity.status(HttpStatus.CREATED).build();
    }

    @DeleteMapping("/eliminar/{id}")
    public ResponseEntity<?> eliminar ( @PathVariable("id") int id){
        ventaService.eliminarVenta(id);
        return new ResponseEntity("venta eliminada", HttpStatus.OK);
    }


}
