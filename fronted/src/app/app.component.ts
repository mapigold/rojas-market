import { Component, OnInit } from '@angular/core';
import { MenuItem } from 'primeng/api';
import { AuthService } from './service/auth.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {
  items: MenuItem[] = [];
  credencialesValidadas: boolean = false;

  constructor(private authService: AuthService, private router: Router) {}

  ngOnInit() {
    this.authService.credencialesValidadas$.subscribe(validadas => {
      this.credencialesValidadas = validadas;
    });

    this.items = [
      { label: 'Home', icon: 'pi pi-fw pi-home', routerLink: '/home' },
      { label: 'Cliente', icon: 'pi pi-fw pi-users', routerLink: '/cliente' },
      { label: 'Empleado', icon: 'pi pi-fw pi-id-card', routerLink: '/empleado' },
      { label: 'Producto', icon: 'pi pi-fw pi-box', routerLink: '/producto' },
      { label: 'Proveedor', icon: 'pi pi-fw pi-truck', routerLink: '/proveedor' },
      { label: 'Venta', icon: 'pi pi-fw pi-cart-plus', routerLink: '/venta' },
      { label: 'Cerrar Sesión', icon: 'pi pi-fw pi-sign-out', command: () => this.cerrarSesion() }
    ];
  }

  cerrarSesion() {
    // Realizar las tareas necesarias para cerrar la sesión, como limpiar los datos de autenticación
    this.authService.cerrarSesion();

    // Restablecer el estado original
    this.credencialesValidadas = false;

    // Redirigir al login
    this.router.navigate(['/login']);
  }
}
