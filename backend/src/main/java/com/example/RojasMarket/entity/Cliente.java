package com.example.RojasMarket.entity;


import jakarta.persistence.*;

@Entity
public class Cliente {

@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private int id_cliente ;
private  int dni_cliente;
private String nombre_cliente;
private String correo_cliente;

@Column(length = 9)
private String telefono_cliente;


    public Cliente(int id_cliente, int dni_cliente, String nombre_cliente, String correo_cliente, String telefono_cliente) {
        this.id_cliente = id_cliente;
        this.dni_cliente = dni_cliente;
        this.nombre_cliente = nombre_cliente;
        this.correo_cliente = correo_cliente;
        this.telefono_cliente = telefono_cliente;
    }

    public Cliente() {
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public int getDni_cliente() {
        return dni_cliente;
    }

    public void setDni_cliente(int dni_cliente) {
        this.dni_cliente = dni_cliente;
    }

    public String getNombre_cliente() {
        return nombre_cliente;
    }

    public void setNombre_cliente(String nombre_cliente) {
        this.nombre_cliente = nombre_cliente;
    }

    public String getCorreo_cliente() {
        return correo_cliente;
    }

    public void setCorreo_cliente(String correo_cliente) {
        this.correo_cliente = correo_cliente;
    }

    public String getTelefono_cliente() {
        return telefono_cliente;
    }

    public void setTelefono_cliente(String telefono_cliente) {
        this.telefono_cliente = telefono_cliente;
    }
}
