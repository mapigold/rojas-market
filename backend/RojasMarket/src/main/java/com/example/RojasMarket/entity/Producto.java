package com.example.RojasMarket.entity;


import jakarta.persistence.*;

import java.sql.Date;

@Entity
public class Producto {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_producto;


    @ManyToOne
    @JoinColumn(name = "id_proveedor")
    private Proveedor proveedor;
    private String nombre_producto;
    private String descripcion_producto;

    private Date fecha_vencimiento;
    private int cantidad_producto;

    private float precio_ingreso_producto;
    private float precio_salida_producto;
     private int stock_minimo_producto;


    public Producto(int id_producto, Proveedor proveedor, String nombre_producto, String descripcion_producto, Date fecha_vencimiento, int cantidad_producto, float precio_ingreso_producto, float precio_salida_producto, int stock_minimo_producto) {
        this.id_producto = id_producto;
        this.proveedor = proveedor;
        this.nombre_producto = nombre_producto;
        this.descripcion_producto = descripcion_producto;
        this.fecha_vencimiento = fecha_vencimiento;
        this.cantidad_producto = cantidad_producto;
        this.precio_ingreso_producto = precio_ingreso_producto;
        this.precio_salida_producto = precio_salida_producto;
        this.stock_minimo_producto = stock_minimo_producto;
    }

    public Producto() {
    }

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public Proveedor getProveedor() {
        return proveedor;
    }

    public void setProveedor(Proveedor proveedor) {
        this.proveedor = proveedor;
    }

    public String getNombre_producto() {
        return nombre_producto;
    }

    public void setNombre_producto(String nombre_producto) {
        this.nombre_producto = nombre_producto;
    }

    public String getDescripcion_producto() {
        return descripcion_producto;
    }

    public void setDescripcion_producto(String descripcion_producto) {
        this.descripcion_producto = descripcion_producto;
    }

    public Date getFecha_vencimiento() {
        return fecha_vencimiento;
    }

    public void setFecha_vencimiento(Date fecha_vencimiento) {
        this.fecha_vencimiento = fecha_vencimiento;
    }

    public int getCantidad_producto() {
        return cantidad_producto;
    }

    public void setCantidad_producto(int cantidad_producto) {
        this.cantidad_producto = cantidad_producto;
    }

    public float getPrecio_ingreso_producto() {
        return precio_ingreso_producto;
    }

    public void setPrecio_ingreso_producto(float precio_ingreso_producto) {
        this.precio_ingreso_producto = precio_ingreso_producto;
    }

    public float getPrecio_salida_producto() {
        return precio_salida_producto;
    }

    public void setPrecio_salida_producto(float precio_salida_producto) {
        this.precio_salida_producto = precio_salida_producto;
    }

    public int getStock_minimo_producto() {
        return stock_minimo_producto;
    }

    public void setStock_minimo_producto(int stock_minimo_producto) {
        this.stock_minimo_producto = stock_minimo_producto;
    }
}
