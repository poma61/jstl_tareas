package com.emergentes;
public class Tarea {
 private int id;
 private String tarea;
 private String prioridad;

    public Tarea() {
        this.id=0;
        this.prioridad="";
        this.tarea="";       
    }

    public Tarea(int id, String tarea, String prioridad) {
        this.id = id;
        this.tarea = tarea;
        this.prioridad = prioridad;
    }
//metodos getter sy setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTarea() {
        return tarea;
    }

    public void setTarea(String tarea) {
        this.tarea = tarea;
    }

    public String getPrioridad() {
        return prioridad;
    }
    public void setPrioridad(String prioridad) {
        this.prioridad = prioridad;
    }
}//class
