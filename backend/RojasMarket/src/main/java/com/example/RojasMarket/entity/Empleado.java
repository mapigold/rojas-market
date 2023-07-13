package com.example.RojasMarket.entity;

import jakarta.persistence.*;

import java.sql.Date;

@Entity
public class Empleado {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_empleado;

    private String cargo;


    private String fulldate_empleado;
    private int edad_empleado;
    private String correo_empleado;
    private String contrasena_empleado;

    private Date fecha_registro;

    public Empleado() {
    }

    public Empleado(int id_empleado, String cargo, String fulldate_empleado, int edad_empleado, String correo_empleado, String contrasena_empleado, Date fecha_registro) {
        this.id_empleado = id_empleado;
        this.cargo = cargo;
        this.fulldate_empleado = fulldate_empleado;
        this.edad_empleado = edad_empleado;
        this.correo_empleado = correo_empleado;
        this.contrasena_empleado = contrasena_empleado;
        this.fecha_registro = fecha_registro;
    }

    public int getId_empleado() {
        return id_empleado;
    }

    public void setId_empleado(int id_empleado) {
        this.id_empleado = id_empleado;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public String getFulldate_empleado() {
        return fulldate_empleado;
    }

    public void setFulldate_empleado(String fulldate_empleado) {
        this.fulldate_empleado = fulldate_empleado;
    }

    public int getEdad_empleado() {
        return edad_empleado;
    }

    public void setEdad_empleado(int edad_empleado) {
        this.edad_empleado = edad_empleado;
    }

    public String getCorreo_empleado() {
        return correo_empleado;
    }

    public void setCorreo_empleado(String correo_empleado) {
        this.correo_empleado = correo_empleado;
    }

    public String getContrasena_empleado() {
        return contrasena_empleado;
    }

    public void setContrasena_empleado(String contrasena_empleado) {
        this.contrasena_empleado = contrasena_empleado;
    }

    public Date getFecha_registro() {
        return fecha_registro;
    }

    public void setFecha_registro(Date fecha_registro) {
        this.fecha_registro = fecha_registro;
    }
}