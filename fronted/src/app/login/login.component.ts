import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { EmpleadoService } from '../service/empleado.service';
import { Router } from '@angular/router';
import { AuthService } from '../service/auth.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  loginForm!: FormGroup;
  errorMessage: string = '';

  constructor(
    private formBuilder: FormBuilder,
    private empleadoService: EmpleadoService,
    private router: Router,
    private authService: AuthService
  ) {}

  ngOnInit() {
    this.loginForm = this.formBuilder.group({
      correo_empleado: ['', [Validators.required, Validators.email]],
      contrasena_empleado: ['', Validators.required]
    });
  }

  login() {
    if (this.loginForm.invalid) {
      this.loginForm.markAllAsTouched();
      return;
    }

    const correo_empleado = this.loginForm.value.correo_empleado;
    const contrasena_empleado = this.loginForm.value.contrasena_empleado;

    this.empleadoService.loginEmpleado(correo_empleado, contrasena_empleado).subscribe(
      (loggedIn: boolean) => {
        if (loggedIn) {
          // Credenciales válidas, redireccionar al dashboard y establecer estado de credenciales validadas
          this.router.navigate(['/producto']);
          this.authService.validarCredenciales();
        } else {
          // Credenciales inválidas, mostrar mensaje de error
          this.errorMessage = 'Credenciales inválidas. Por favor, intenta nuevamente.';
        }
      },
      (error) => {
        console.log(error);
      }
    );
  }
}
