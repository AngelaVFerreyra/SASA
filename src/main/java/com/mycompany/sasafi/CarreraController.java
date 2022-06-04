package com.mycompany.sasafi;

import java.util.HashMap;
import java.util.List;
import spark.ModelAndView;
import spark.Request;
import spark.Response;
import spark.Route;
import spark.template.velocity.VelocityTemplateEngine;

public class CarreraController {
  public static Route getCarreras = (Request req, Response res) -> {
        HashMap model = new HashMap();
        if (req.session().attribute("tipo") == null) {

            model.put("template", "templates/index.vsl");
        } else {
            CarreraDAO cDAO = new CarreraDAO();
            List<Carrera> carreras = cDAO.getCarreras();
            model.put("carreras", carreras);

            model.put("template", "templates/carreras_mostrartodas.vsl");
        }

        return new VelocityTemplateEngine().render(new ModelAndView(model, "templates/layout.vsl"));
    };  
}
