package com.example.RojasMarket.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;


@Entity
@Table(name = "detalleventa")
public class DetalleVenta {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_dventa;

    @JsonBackReference
    @ManyToOne
    @JoinColumn(name = "id_venta")
    private Venta venta;

    @ManyToOne
    @JoinColumn(name = "id_producto")
    private Producto producto;

    private int cantidad;
    private float precio_producto;
    private float subTotal;
    private float igv;
    private float totalVenta;


    public DetalleVenta(int id_dventa, Venta venta, Producto producto, int cantidad, float precio_producto, float subTotal, float igv, float totalVenta) {
        this.id_dventa = id_dventa;
        this.venta = venta;
        this.producto = producto;
        this.cantidad = cantidad;
        this.precio_producto = precio_producto;
        this.subTotal = subTotal;
        this.igv = igv;
        this.totalVenta = totalVenta;
    }

    public DetalleVenta() {
    }

    public int getId_dventa() {
        return id_dventa;
    }

    public void setId_dventa(int id_dventa) {
        this.id_dventa = id_dventa;
    }

    public Venta getVenta() {
        return venta;
    }

    public void setVenta(Venta venta) {
        this.venta = venta;
    }

    public Producto getProducto() {
        return producto;
    }

    public void setProducto(Producto producto) {
        this.producto = producto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public float getPrecio_producto() {
        return precio_producto;
    }

    public void setPrecio_producto(float precio_producto) {
        this.precio_producto = precio_producto;
    }

    public float getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(float subTotal) {
        this.subTotal = subTotal;
    }

    public float getIgv() {
        return igv;
    }

    public void setIgv(float igv) {
        this.igv = igv;
    }

    public float getTotalVenta() {
        return totalVenta;
    }

    public void setTotalVenta(float totalVenta) {
        this.totalVenta = totalVenta;
    }
}
