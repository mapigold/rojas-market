import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { EmpleadoComponent } from './empleado/empleado.component';
import { ProveedorComponent } from './proveedor/proveedor.component';
import { ProductoComponent } from './producto/producto.component';
import { VentaComponent } from './venta/venta.component';
import { ClienteComponent } from './cliente/cliente.component';
import { LoginComponent } from './login/login.component';
import { HomeComponent } from './home/home.component';


const routes: Routes = [
  { path: '', redirectTo: '/login', pathMatch: 'full' },
  { path: 'empleado', component: EmpleadoComponent },
  { path: 'cliente', component: ClienteComponent },
  { path: 'proveedor', component: ProveedorComponent },
  { path: 'producto', component: ProductoComponent },
  { path: 'venta', component: VentaComponent },
  { path: 'login', component: LoginComponent },
  { path: 'home', component: HomeComponent }

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
