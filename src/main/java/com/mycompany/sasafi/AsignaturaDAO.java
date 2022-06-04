package com.mycompany.sasafi;

import java.util.List;
import org.sql2o.*;

public class AsignaturaDAO {

    private List<AsignaturaAux> asignaturas;
    private List<Asignatura> asignaturasBD;

    public List<Asignatura> getAsignaturas() {

        Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/sasa-fifi", "root", "");

        try (Connection con = sql2o.beginTransaction()) {
            String sql = "SELECT NOMBRE, CODIGO FROM ASIGNATURAS;";
            asignaturasBD = con
                    .createQuery(sql)
                    .executeAndFetch(Asignatura.class);
        }
        return asignaturasBD;
    }
    
    public List<AsignaturaAux> getAsignaturasPorResolucion(String resolucion) {

        Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/sasa-fifi", "root", "");

        try (Connection con = sql2o.beginTransaction()) {
            String sql = "SELECT planes_de_estudio_por_asignaturas.ASIGNATURA,  planes_de_estudio_por_asignaturas.ANIO,  planes_de_estudio_por_asignaturas.PLAN_DE_ESTUDIO, planes_de_estudio_por_carrera.CARRERA, carreras.DURACION as carrera_duracion "
                    + "FROM planes_de_estudio_por_asignaturas "
                    + "JOIN planes_de_estudio_por_carrera ON planes_de_estudio_por_carrera.RESOLUCION = planes_de_estudio_por_asignaturas.PLAN_DE_ESTUDIO  "
                    + "JOIN carreras ON carreras.NOMBRE = planes_de_estudio_por_carrera.CARRERA "
                    + "WHERE planes_de_estudio_por_asignaturas.PLAN_DE_ESTUDIO = :resolucion;";
            asignaturas = con
                    .createQuery(sql)
                    .addParameter("resolucion", resolucion)
                    .executeAndFetch(AsignaturaAux.class);
        }
        return asignaturas;
    }

    public void insertarAsignaturaPorPPS(int id, String asignatura) {
        String SQL = "INSERT INTO ASIGNATURAS_POR_PPS(ID_PPS, ASIGNATURA) VALUES (:id, :asignatura);";
        Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/sasa-fifi", "root", "");
        try (Connection con = sql2o.beginTransaction()) {
            con
                    .createQuery(SQL)
                    .addParameter("id", id)
                    .addParameter("asignatura", asignatura)
                    .executeUpdate().commit();
        }
    }
}
