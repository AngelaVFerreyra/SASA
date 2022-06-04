package com.mycompany.sasafi;

import spark.Request;
import spark.Response;
import spark.Route;
import java.util.HashMap;
import spark.ModelAndView;
import spark.template.velocity.VelocityTemplateEngine;

public class IndexController {

    public static Route getIndex = (Request req, Response res) -> {

        HashMap model = new HashMap();

        if (req.session().attribute("tipo") == null) {

            model.put("template", "templates/index.vsl");
        } else {
            if (req.session().attribute("tipo").toString().equals("1")) { //Administrador.
                model.put("template", "templates/adminindex.vsl");
            }
            if (req.session().attribute("tipo").toString().equals("2")) { //Comité Evaluador.
                model.put("template", "templates/ceindex.vsl");
            }
            if (req.session().attribute("tipo").toString().equals("3")) { //Docente.
                //model.put("template", "templates/ceindex.vsl");
            }
            if (req.session().attribute("tipo").toString().equals("4")) { //Alumno.
                model.put("template", "templates/alumnoindex.vsl");
            }
        }

        return new VelocityTemplateEngine().render(new ModelAndView(model, "templates/layout.vsl"));
    };
}
