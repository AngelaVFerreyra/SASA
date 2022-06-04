package com.mycompany.sasafi;

import java.util.List;
import org.sql2o.*;

public class UsuarioDAO {

    private List<Usuario> usuarios;
    private List<Carrera> carreras;
    private List<PlanDeEstudio> planesestudio;
    private List<PPS> ppss;

    public List<Usuario> getUsuarios(String usuario, String contraseña) {

        Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/sasa-fifi", "root", "");

        try (Connection con = sql2o.beginTransaction()) {
            String sql = "SELECT * FROM usuarios WHERE usuario= :usuario and contraseña = :contraseña";
            usuarios = con
                    .createQuery(sql)
                    .addParameter("usuario", usuario)
                    .addParameter("contraseña", contraseña)
                    .executeAndFetch(Usuario.class);
        }
        return usuarios;
    }

    public List<Carrera> getCarrerasDeUsuarioEstudiante(String usuario) {

        Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/sasa-fifi", "root", "");

        try (Connection con = sql2o.beginTransaction()) {
            String sql = "SELECT CODIGO, NOMBRE, DURACION FROM CARRERAS INNER JOIN ESTUDIANTES_POR_CARRERA "
                    + "ON CARRERAS.NOMBRE=ESTUDIANTES_POR_CARRERA.NOMBRE_DE_CARRERA INNER JOIN USUARIOS_POR_PERSONAS "
                    + "ON USUARIOS_POR_PERSONAS.DNI_PERSONA=ESTUDIANTES_POR_CARRERA.DNI_ESTUDIANTE INNER JOIN USUARIOS "
                    + "ON USUARIOS.USUARIO=USUARIOS_POR_PERSONAS.USUARIO "
                    + "INNER JOIN planes_de_estudio_por_carrera ON planes_de_estudio_por_carrera.CARRERA=carreras.NOMBRE "
                    + "INNER JOIN planes_de_estudio ON planes_de_estudio.RESOLUCION=planes_de_estudio_por_carrera.RESOLUCION "
                    + "WHERE USUARIOS.USUARIO = :usuario AND TIENE_PPS=1;";
            carreras = con
                    .createQuery(sql)
                    .addParameter("usuario", usuario)
                    .executeAndFetch(Carrera.class);
        }
        return carreras;
    }

    public List<PPS> getPPSdeUsuarioEstudiante(String usuario) {
        Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/sasa-fifi", "root", "");
        try (Connection con = sql2o.open()) {
            String sql = "SELECT ppss.id_pps, ppss.titulo, estados.DESCRIPCION as estado "
                    + "FROM estados "
                    + "JOIN estadios_por_pps ON estadios_por_pps.ID_ESTADO = estados.ID_ESTADO "
                    + "JOIN ppss ON ppss.ID_PPS = estadios_por_pps.ID_PPS "
                    + "JOIN estudiantes_por_pps ON estudiantes_por_pps.ID_PPS = ppss.ID_PPS "
                    + "JOIN usuarios_por_personas ON usuarios_por_personas.DNI_PERSONA = estudiantes_por_pps.DNI_ESTUDIANTE "
                    + "JOIN usuarios ON usuarios.USUARIO = usuarios_por_personas.USUARIO "
                    + "WHERE usuarios.USUARIO = :user;";
            ppss = con.createQuery(sql)
                    .addParameter("user", usuario)
                    .executeAndFetch(PPS.class);
        }
        return ppss;
    }

}
