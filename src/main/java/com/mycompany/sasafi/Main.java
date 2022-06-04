package com.mycompany.sasafi;

import static spark.Spark.*;

public class Main {

    public static void main(String[] args) {
        staticFiles.location("/public");
        get("/login", UsuarioController.getLogin);
        post("/login", UsuarioController.getLogin);
        get("/logout", UsuarioController.Logout);
        get("/index", IndexController.getIndex);
        get("/cargarpps", PPSController.cargarpps);
        post("/insertarpps", PPSController.insertarPPS);
        
        get("/getPPSS", PPSController.getAllPPS);
        get("/getPPS", PPSController.getOnePPS);
        get("/getPPSSevaluar", PPSController.getAllPPSevaluar);  
        get("/getPPSevaluar", PPSController.getOnePPSevaluar);
        get("/evaluar", PPSController.evaluarPPS);
        get("/estadopps", PPSController.getEstadoPPS);
        
        get("/carreras", CarreraController.getCarreras);
        get("/planes", PlanDeEstudioController.getPlanesDeEstudio);
        get("/asignaturas", AsignaturaController.getAsignaturas);
    }
}

//http://localhost:4567/login
