package com.example.RojasMarket.Repository;

import com.example.RojasMarket.entity.Empleado;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

@Repository
public interface EmpleadoRepository extends JpaRepository<Empleado, Integer> {

    @Query(value = "call listaEmpleado()", nativeQuery = true)
    List<Empleado> listaEmpleado();

    @Query(value = "call IDEmpleado(:idin)", nativeQuery = true)
    Optional<Empleado> idEmpleado(@Param("idin") int idin);

    @Query(value = "CALL saveRegistroEmpleado(:cargoIn, :fulldate_empleadoIn, :edad_empleadoIn, :correo_empleadoIn, :contrasena_empleadoIn)", nativeQuery = true)
    void saveEmpleado(
            @Param("cargoIn") String cargoIn,
            @Param("fulldate_empleadoIn") String fulldate_empleadoIn,
            @Param("edad_empleadoIn") int edad_empleadoIn,
            @Param("correo_empleadoIn") String correo_empleadoIn,
            @Param("contrasena_empleadoIn") String contrasena_empleadoIn
    );

    @Modifying
    @Query(value = "{call EditEmpleado(:idIn, :cargoIn, :fulldate_empleadoIn, :edad_empleadoIn, :correo_empleadoIn, :contrasena_empleadoIn)}", nativeQuery = true)
    void updateEmpleado(
            @Param("idIn") int idIn,
            @Param("cargoIn") String cargoIn,
            @Param("fulldate_empleadoIn") String fulldate_empleadoIn,
            @Param("edad_empleadoIn")int edad_empleadoIn,
            @Param("correo_empleadoIn") String correo_empleadoIn,
            @Param("contrasena_empleadoIn") String contrasena_empleadoIn
    );
    @Query(value = "CALL loginEmpleado(:correo_empleadoIn, :contrasena_empleadoIn)", nativeQuery = true)
    boolean loginEmpleado(
            @Param("correo_empleadoIn") String correo_empleadoIn,
            @Param("contrasena_empleadoIn") String contrasena_empleadoIn);

    @Query(value = "call DeleteEmpleado(:idin)", nativeQuery = true)
    void eliminarEmpleado(@Param("idin") int idin);

}
