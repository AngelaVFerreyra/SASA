
package com.mycompany.sasafi;

import java.util.HashMap;
import java.util.List;
import spark.ModelAndView;
import spark.Request;
import spark.Response;
import spark.Route;
import spark.template.velocity.VelocityTemplateEngine;

public class PlanDeEstudioController {
    public static Route 
        getPlanesDeEstudio = (Request req, Response res) -> {
     
            HashMap model = new HashMap();
            if (req.session().attribute("tipo") == null) {

            model.put("template", "templates/index.vsl");
            } else {
                PlanDeEstudioDAO pDAO = new PlanDeEstudioDAO();
                List<PlanDeEstudio> pde = pDAO.getPlanesDeEstudioPorCarrera(req.queryParams("carrera"));
                model.put("pdes", pde);
     
      
                model.put("template", "templates/planesdeestudio_por_carreras.vsl");
            }
      
            return new VelocityTemplateEngine().render(new ModelAndView(model, "templates/layout.vsl")); 
        };
    
    public static Route 
        getPlanDeEstudio = (Request req, Response res) -> {
            HashMap model = new HashMap();
            if (req.session().attribute("tipo") == null) {

            model.put("template", "templates/index.vsl");
            } else {
                String plan = req.queryParams("p");
                System.out.print(plan);
                if(null != plan)switch (plan) {
                case "ap":
                    model.put("template", "templates/pe_analistaprogramador.vsl");
                    break;
                case "ic":
                    model.put("template", "templates/pe_ingenieriacomputacion.vsl");
                    break;
                case "ie":
                    model.put("template", "templates/pe_ingenieriaelectromecanica.vsl");
                    break;
                case "io":
                    model.put("template", "templates/pe_ingenieriaelectromecanicaconOrit.vsl");
                    break;
                case "ii":
                    model.put("template", "templates/pe_ingenieriaindustrial.vsl");
                    break;
                case "is":
                    model.put("template", "templates/pe_ingenieriasistemas.vsl");
                    break;
                default:
                    break;
                }
            }
            
            return new VelocityTemplateEngine().render(new ModelAndView(model, "templates/layout.vsl")); 
        };
}
