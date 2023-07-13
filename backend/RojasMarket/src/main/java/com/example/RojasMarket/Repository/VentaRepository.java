package com.example.RojasMarket.Repository;

import com.example.RojasMarket.entity.Venta;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;


@Repository
public interface VentaRepository extends JpaRepository<Venta, Integer> {

    @Query(value = "call listaVenta()", nativeQuery = true)
    List<Venta> listaVenta();


    @Query(value = "call IDVenta(:idin)", nativeQuery = true)
    Optional<Venta> idventa(@Param("idin") int idin);


    @Modifying
    @Transactional
    @Query(value = "CALL guardarVentaYDetalle(:idEmp, :dniCli, :productoCantidadList, :delimiter)", nativeQuery = true)
    void guardarVentaYDetalle(
            @Param("idEmp") int idEmp,
            @Param("dniCli") int dniCli,
            @Param("productoCantidadList") String productoCantidadList,
            @Param("delimiter") String delimiter
    );


    @Query(value = "call DeleteVenta(:idin)", nativeQuery = true)
    void eliminarVenta(@Param("idin") int idin);
}


