package com.mycompany.sasafi;

import java.util.List;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

public class EstudianteDAO {

    private List<Estudiante> estudiantes;

    public List<Estudiante> getEstudiante(String usuario) {

        Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/sasa-fifi", "root", "");

        try (Connection con = sql2o.beginTransaction()) {
            String sql = "SELECT PERSONAS.DNI, APELLIDOS, NOMBRES, CELULAR, EMAIL, LEGAJO "
                    + "FROM USUARIOS INNER JOIN USUARIOS_POR_PERSONAS ON USUARIOS.USUARIO=USUARIOS_POR_PERSONAS.USUARIO "
                    + "INNER JOIN ESTUDIANTES ON ESTUDIANTES.DNI=USUARIOS_POR_PERSONAS.DNI_PERSONA INNER JOIN PERSONAS "
                    + "ON PERSONAS.DNI=ESTUDIANTES.DNI WHERE USUARIOS.USUARIO= :usuario;";
            estudiantes = con
                    .createQuery(sql)
                    .addParameter("usuario", usuario)
                    .executeAndFetch(Estudiante.class);
        }
        return estudiantes;
    }

    public int getDNIEstudiante(String usuario) {
        int DNI;
        Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/sasa-fifi", "root", "");

        try (Connection con = sql2o.beginTransaction()) {
            String sql = "SELECT MAX(PERSONAS.DNI) FROM USUARIOS INNER JOIN USUARIOS_POR_PERSONAS "
                    + "ON USUARIOS.USUARIO=USUARIOS_POR_PERSONAS.USUARIO INNER JOIN ESTUDIANTES "
                    + "ON ESTUDIANTES.DNI=USUARIOS_POR_PERSONAS.DNI_PERSONA INNER JOIN PERSONAS "
                    + "ON PERSONAS.DNI=ESTUDIANTES.DNI WHERE USUARIOS.USUARIO= :usuario ;";
            DNI = con
                    .createQuery(sql)
                    .addParameter("usuario", usuario)
                    .executeScalar(Integer.class);
        }
        return DNI;
    }

    public void insertarEstudiantePorPPS(int id, int DNI) {
        String SQL = "INSERT INTO ESTUDIANTES_POR_PPS(DNI_ESTUDIANTE, ID_PPS) VALUES (:DNI,:id);";
        Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/sasa-fifi", "root", "");
        try (Connection con = sql2o.beginTransaction()) {
            con
                    .createQuery(SQL)
                    .addParameter("id", id)
                    .addParameter("DNI", DNI)
                    .executeUpdate().commit();
        }
    }
}
