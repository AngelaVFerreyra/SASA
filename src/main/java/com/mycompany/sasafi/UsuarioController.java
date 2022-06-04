package com.mycompany.sasafi;

import spark.Request;
import spark.Response;
import spark.Route;
import java.util.List;
import java.util.HashMap;
import spark.ModelAndView;
import spark.template.velocity.VelocityTemplateEngine;

public class UsuarioController {

    public static Route getLogin = (Request req, Response res) -> {
        HashMap model = new HashMap();
        if (req.queryParams("contraseña") != null && req.queryParams("usuario") != null) {
            UsuarioDAO uDAO = new UsuarioDAO();
            List<Usuario> user = uDAO.getUsuarios(req.queryParams("usuario"), req.queryParams("contraseña"));
            if (user.size() > 0) {
                //Creación de sesión.
                model.put("template", "templates/index.vsl");
                Usuario usuarioLogeado = user.get(0);
                req.session(true); //Crear y retornar sesion.
                req.session().attribute("usuario", usuarioLogeado.getUsuario());
                req.session().attribute("tipo", usuarioLogeado.getTipo_de_usuario()); //Setear atributo.
                res.redirect("/index");

            } else {
                model.put("template", "templates/login.vsl");
                model.put("request", req);
                model.put("error", "La contraseña o el email es incorrecto.");
            }

        } else {
            model.put("usuario", "");
            model.put("template", "templates/login.vsl");
        }

        return new VelocityTemplateEngine().render(new ModelAndView(model, "templates/layout.vsl"));

    };

    public static Route Logout = (Request req, Response res) -> {

        req.session().removeAttribute("usuario");
        req.session().removeAttribute("tipo");
        req.session().removeAttribute("PPS");
        res.redirect("/index");
        return null;
    };
}
