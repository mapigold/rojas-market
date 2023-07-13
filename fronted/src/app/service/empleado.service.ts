import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Empleado } from '../Model/Empleado';

@Injectable({
  providedIn: 'root'
})
export class EmpleadoService {
  baseUrl: string = "http://localhost:4940/empleado";

  constructor(private http: HttpClient) { }

  getAll(): Observable<any> {
    return this.http.get(this.baseUrl + "/lista");
  }

  save(empleado: Empleado): Observable<any> {
    let headers = new HttpHeaders();
    headers = headers.set('Content-Type', 'application/json');
    return this.http.post(this.baseUrl + "/save", JSON.stringify(empleado), { headers: headers });
  }

  update(id:number ,empleado:Empleado): Observable<any> {
    let headers = new HttpHeaders();
    headers = headers.set('Content-Type', 'application/json');
    return this.http.put(this.baseUrl + "/update/" + id, JSON.stringify(empleado), { headers: headers });
  }

  delete(id: number): Observable<any> {
    return this.http.delete(this.baseUrl + "/eliminar/"+id);
  }

  loginEmpleado(correo: string, contrasena: string): Observable<any> {
    let headers = new HttpHeaders();
    headers = headers.set('Content-Type', 'application/json');
    const body = { correo_empleado: correo, contrasena_empleado: contrasena };
    return this.http.post(this.baseUrl + "/login", JSON.stringify(body), { headers: headers });
  }
}
