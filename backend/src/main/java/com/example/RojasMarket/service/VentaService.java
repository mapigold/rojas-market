package com.example.RojasMarket.service;


import com.example.RojasMarket.Repository.VentaRepository;
import com.example.RojasMarket.entity.*;
import jakarta.persistence.Table;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
public class VentaService {

    @Autowired
    VentaRepository ventaRepository;

    public List<Venta> lista(){
        return ventaRepository.listaVenta();

    }

    public Optional<Venta> getById(int id){

        return ventaRepository.idventa(id);
    }

    public void guardarVentaYDetalle(Venta venta, String productoCantidadList, String delimiter) {
        int idEmp = venta.getId_emp();
        int idCli = venta.getDni_cli();
        ventaRepository.guardarVentaYDetalle(idEmp, idCli, productoCantidadList, delimiter);
    }

    public void eliminarVenta(int id){
        ventaRepository.eliminarVenta(id);
    }

}
