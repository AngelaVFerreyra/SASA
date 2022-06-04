package com.mycompany.sasafi;

import java.time.Instant;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import spark.Request;
import spark.Response;
import spark.Route;
import java.util.HashMap;
import java.util.List;
import spark.ModelAndView;
import spark.template.velocity.VelocityTemplateEngine;
import java.text.*;

public class PPSController {

    public static Route cargarpps = (Request req, Response res) -> {
        HashMap model = new HashMap();
        if (req.session().attribute("tipo") == null) {
            model.put("template", "templates/index.vsl");
        } else {
            String usuario = req.session().attribute("usuario").toString();

            UsuarioDAO uDAO = new UsuarioDAO();
            List<Carrera> carreras = uDAO.getCarrerasDeUsuarioEstudiante(usuario);

            TutorDeOrganizacionDAO tDAO = new TutorDeOrganizacionDAO();
            List<TutorDeOrganizacion> tutoresorganizacion = tDAO.getTutoresOrganizacion();

            AsignaturaDAO aDAO = new AsignaturaDAO();
            List<Asignatura> asignaturas = aDAO.getAsignaturas(); //Acá debe refinarse filtrando las asignaturas de la carrera elegida.

            OrganizacionDAO oDAO = new OrganizacionDAO();
            List<Organizacion> organizaciones = oDAO.getOrganizaciones();

            DocenteDAO dDAO = new DocenteDAO();
            List<Docente> docentes = dDAO.getDocentes();

            model.put("tutoresorganizacion", tutoresorganizacion);
            model.put("asignaturas", asignaturas);
            model.put("organizaciones", organizaciones);
            model.put("carreras", carreras);
            model.put("docentes", docentes);
            model.put("template", "templates/cargarpps.vsl");
        }

        return new VelocityTemplateEngine().render(new ModelAndView(model, "templates/layout.vsl"));
    };

    public static Route insertarPPS = (Request req, Response res) -> {
        HashMap model = new HashMap();
        String usuario = req.session().attribute("usuario").toString();
        EstudianteDAO eDAO = new EstudianteDAO();
        int DNI = eDAO.getDNIEstudiante(usuario);

        if (req.session().attribute("tipo") == null) {
            model.put("template", "templates/index.vsl");
        } else {
            PPS pps = new PPS();
            pps.setTitulo(req.queryParams("titulo"));
            pps.setDescripcion(req.queryParams("descripcion"));
            pps.setBibliografia(req.queryParams("bibliografia"));
            pps.setEs_de_pares(Boolean.parseBoolean(req.queryParams("pares"))); //Se pensó así y no en agrear directamente otro estudiante para que haya otro apartado en el sistema para que otro alumno elija ser compañero.
            pps.setEtapasyobjetivos(req.queryParams("etapasyobjetivos"));

            PPSDAO pDAO = new PPSDAO();
            pDAO.insertarPPS(pps);

            int id = pDAO.ultimoID();

            eDAO.insertarEstudiantePorPPS(id, DNI);

            CarreraDAO cDAO = new CarreraDAO();
            cDAO.insertarCarreraPorPPS(id, req.queryParams("carrera"));

            AsignaturaDAO aDAO = new AsignaturaDAO();
            aDAO.insertarAsignaturaPorPPS(id, req.queryParams("asignatura")); //En esta implementación se elige una asignatura a usar, por eso se inserta una. Una mejora es que se puedan elegir varias.

            DocenteDAO dDAO = new DocenteDAO();
            dDAO.insertarTutorDocentePorPPS(id, Integer.parseInt(req.queryParams("tutordocente"))); //Si el sistema fuera de una Universidad, se deberían filtrar los docentes por las facultades y de ser necesario, carreras.

            OrganizacionDAO oDAO = new OrganizacionDAO();
            oDAO.insertarOrganizacionPorPPS(id, req.queryParams("organizacion"));

            TutorDeOrganizacionDAO tDAO = new TutorDeOrganizacionDAO();
            tDAO.insertarTutorOrganizacionPorPPS(id, Integer.parseInt(req.queryParams("tutororganizacion")), req.queryParams("organizacion"));

            UsuarioDAO uDAO = new UsuarioDAO();

            java.sql.Date hoySQL = new java.sql.Date(System.currentTimeMillis());
            java.sql.Date unasemandaSQL = new java.sql.Date(System.currentTimeMillis() + 604800000); //Se le suman los milisegundos de una semana para obtener fecha a una semana, valga la redundancia.
            EstadoDAO esDAO = new EstadoDAO();
            esDAO.insertarEstadiosPorPPS(hoySQL, unasemandaSQL, false, id, 4);

            if (req.session().attribute("tipo") == null) {
                model.put("template", "templates/index.vsl");
            } else {
                res.redirect("/index");
            }
        }
        return new VelocityTemplateEngine().render(new ModelAndView(model, "templates/layout.vsl"));
    };

        public static Route getAllPPS = (Request req, Response res) -> {
        HashMap model = new HashMap();
        if (req.session().attribute("tipo") == null) {

            model.put("template", "templates/index.vsl");
        } else {
            PPSDAO pDAO = new PPSDAO();
            List<PPS> all = pDAO.getPPSS();
            model.put("ppss", all);

            model.put("template", "templates/PPS_mostrartodas.vsl");
        }

        return new VelocityTemplateEngine().render(new ModelAndView(model, "templates/layout.vsl"));
    };
    
    public static Route getAllPPSevaluar = (Request req, Response res) -> {
        HashMap model = new HashMap();
        if (req.session().attribute("tipo") == null) {

            model.put("template", "templates/index.vsl");
        } else {
            PPSDAO pDAO = new PPSDAO();
            List<PPS> all = pDAO.getPPSS();
            model.put("ppss", all);

            model.put("template", "templates/PPS_mostrar.vsl");
        }

        return new VelocityTemplateEngine().render(new ModelAndView(model, "templates/layout.vsl"));
    };

    
    public static Route getOnePPSevaluar = (Request req, Response res) -> {
        HashMap model = new HashMap();
        if (req.session().attribute("tipo") == null) {

            model.put("template", "templates/index.vsl");
        } else {
            PPSDAO pDAO = new PPSDAO();
            List<PPS> instance = pDAO.getPPS(req.queryParams("id"));
            model.put("instance", instance.get(0));

            model.put("template", "templates/PPS_evaluar1.vsl");
        }

        return new VelocityTemplateEngine().render(new ModelAndView(model, "templates/layout.vsl"));
    };

    public static Route getOnePPS = (Request req, Response res) -> {
        HashMap model = new HashMap();
        if (req.session().attribute("tipo") == null) {

            model.put("template", "templates/index.vsl");
        } else {
            PPSDAO pDAO = new PPSDAO();
            List<PPS> instance = pDAO.getPPS(req.queryParams("id"));
            model.put("instance", instance.get(0));

            model.put("template", "templates/PPS_mostraruna.vsl");
        }

        return new VelocityTemplateEngine().render(new ModelAndView(model, "templates/layout.vsl"));
    };

    public static Route evaluarPPS = (Request req, Response res) -> {
        HashMap model = new HashMap();
        if (req.session().attribute("tipo") == null) {

            model.put("template", "templates/index.vsl");
        } else {
            PPSDAO pDAO = new PPSDAO();
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            pDAO.evaluarpps(req.queryParams("id"), req.queryParams("notaa"), req.queryParams("obs"), dtf.format(LocalDateTime.now()));

            EstadoDAO eDAO = new EstadoDAO();
            eDAO.modificarEstadiosPorPPS(req.queryParams("id"), dtf.format(LocalDateTime.now()));

            model.put("template", "templates/PPS_evaluar2.vsl");
        }

        return new VelocityTemplateEngine().render(new ModelAndView(model, "templates/layout.vsl"));
    };


    public static Route getEstadoPPS = (Request req, Response res) -> {

        HashMap model = new HashMap();

        String usuario = req.session().attribute("usuario").toString();
        UsuarioDAO uDAO = new UsuarioDAO();
        List<PPS> instance = uDAO.getPPSdeUsuarioEstudiante(usuario);

        if (instance.get(0) == null) {

        } else {
            model.put("instance", instance.get(0));

            model.put("template", "templates/PPS_estado.vsl");
        }

        return new VelocityTemplateEngine().render(new ModelAndView(model, "templates/layout.vsl"));
    };

}
