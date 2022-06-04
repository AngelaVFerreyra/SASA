package com.mycompany.sasafi;

import java.util.List;
import org.sql2o.*;

public class TutorDeOrganizacionDAO {

    private List<TutorDeOrganizacion> tutoresorganizacion;

    public List<TutorDeOrganizacion> getTutoresOrganizacion() { //En esta implementación se muestran los posibles tutores con la organización. Una mejora es que automáticamente se filtre por la organización elegida.

        Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/sasa-fifi", "root", "");

        try (Connection con = sql2o.beginTransaction()) {
            String sql = "SELECT PERSONAS.DNI, APELLIDOS, NOMBRES, CELULAR, EMAIL, CARGO, ORGANIZACION FROM TUTORES_DE_ORGANIZACION INNER JOIN PERSONAS "
                    + "ON PERSONAS.DNI = TUTORES_DE_ORGANIZACION.DNI INNER JOIN ORGANIZACIONES "
                    + "ON ORGANIZACIONES.NOMBRE=TUTORES_DE_ORGANIZACION.ORGANIZACION "
                    + "WHERE ORGANIZACIONES.HAY_CONVENIO=1 AND ORGANIZACIONES.TIENE_SEGURO=1 ORDER BY ORGANIZACION, APELLIDOS;";
            tutoresorganizacion = con
                    .createQuery(sql)
                    .executeAndFetch(TutorDeOrganizacion.class);
        }
        return tutoresorganizacion;
    }

    public void insertarTutorOrganizacionPorPPS(int id, int DNI, String organizacion) {
        String SQL = "INSERT INTO TUTORES_DE_ORGANIZACION_POR_PPS(DNI_TUTOR, ORGANIZACION, ID_PPS) VALUES (:DNI, :organizacion, :id);";
        Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/sasa-fifi", "root", "");
        try (Connection con = sql2o.beginTransaction()) {
            con
                    .createQuery(SQL)
                    .addParameter("id", id)
                    .addParameter("organizacion", organizacion)
                    .addParameter("DNI", DNI)
                    .executeUpdate().commit();
        }
    }
}