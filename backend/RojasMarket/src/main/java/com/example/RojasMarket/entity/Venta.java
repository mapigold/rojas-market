package com.example.RojasMarket.entity;
import jakarta.persistence.*;
import java.sql.Date;
import java.util.List;

@Entity
public class Venta {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_venta;

    private Date fechaVenta;




    private  int id_emp;


    private int dni_cli;

    private float total;
    @OneToMany(mappedBy = "venta", cascade = CascadeType.ALL)
    private List<DetalleVenta> detallesVenta;

    public Venta(int id_venta, Date fechaVenta, int id_emp, int dni_cli, float total, List<DetalleVenta> detallesVenta) {
        this.id_venta = id_venta;
        this.fechaVenta = fechaVenta;
        this.id_emp = id_emp;
        this.dni_cli = dni_cli;
        this.total = total;
        this.detallesVenta = detallesVenta;
    }

    public Venta() {
    }

    public int getId_venta() {
        return id_venta;
    }

    public void setId_venta(int id_venta) {
        this.id_venta = id_venta;
    }

    public Date getFechaVenta() {
        return fechaVenta;
    }

    public void setFechaVenta(Date fechaVenta) {
        this.fechaVenta = fechaVenta;
    }

    public int getId_emp() {
        return id_emp;
    }

    public void setId_emp(int id_emp) {
        this.id_emp = id_emp;
    }

    public int getDni_cli() {
        return dni_cli;
    }

    public void setDni_cli(int dni_cli) {
        this.dni_cli = dni_cli;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public List<DetalleVenta> getDetallesVenta() {
        return detallesVenta;
    }

    public void setDetallesVenta(List<DetalleVenta> detallesVenta) {
        this.detallesVenta = detallesVenta;
    }
}
