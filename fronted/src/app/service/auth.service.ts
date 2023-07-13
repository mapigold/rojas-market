import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private credencialesValidadasSubject: BehaviorSubject<boolean> = new BehaviorSubject<boolean>(false);
  credencialesValidadas$ = this.credencialesValidadasSubject.asObservable();

  validarCredenciales() {
    this.credencialesValidadasSubject.next(true);
  }

  cerrarSesion() {
    this.credencialesValidadasSubject.next(false);
  }
}
