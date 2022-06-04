package com.mycompany.sasafi;

import java.util.List;
import org.sql2o.*;

public class PlanDeEstudioDAO {

    private List<PlanDeEstudio> planesestudios;

    public List<PlanDeEstudio> getPlanesDeEstudioPorCarrera(String carrera) {
        Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/sasa-fifi", "root", "");
        try (Connection con = sql2o.open()) {
            String sql = "SELECT planes_de_estudio.RESOLUCION, planes_de_estudio.TIENE_PPS "
                    + "FROM planes_de_estudio "
                    + "JOIN planes_de_estudio_por_carrera ON planes_de_estudio_por_carrera.RESOLUCION = planes_de_estudio.RESOLUCION "
                    + "WHERE planes_de_estudio_por_carrera.CARRERA = :carrera";
            planesestudios = con
                    .createQuery(sql)
                    .addParameter("carrera", carrera)
                    .executeAndFetch(PlanDeEstudio.class);
        }
        return planesestudios;
    }

}
