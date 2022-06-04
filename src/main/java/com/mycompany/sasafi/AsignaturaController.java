
package com.mycompany.sasafi;

import java.util.HashMap;
import java.util.List;
import spark.ModelAndView;
import spark.Request;
import spark.Response;
import spark.Route;
import spark.template.velocity.VelocityTemplateEngine;


public class AsignaturaController {
     public static Route getAsignaturas = (Request req, Response res) -> {
        HashMap model = new HashMap();
        if (req.session().attribute("tipo") == null) {

            model.put("template", "templates/index.vsl");
        } else {
            AsignaturaDAO aDAO = new AsignaturaDAO();
            List<AsignaturaAux> asignaturas = aDAO.getAsignaturasPorResolucion(req.queryParams("resolucion"));
            model.put("asignaturas", asignaturas);

            model.put("template", "templates/asignaturas_por_resolucion.vsl");
        }

        return new VelocityTemplateEngine().render(new ModelAndView(model, "templates/layout.vsl"));
    };  
}
