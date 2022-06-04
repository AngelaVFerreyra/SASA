package com.mycompany.sasafi;

import java.util.List;
import org.sql2o.*;

public class OrganizacionDAO {

    private List<Organizacion> organizaciones;

    public List<Organizacion> getOrganizaciones() {

        Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/sasa-fifi", "root", "");

        try (Connection con = sql2o.beginTransaction()) {
            String sql = "SELECT CUIL, NOMBRE, HAY_CONVENIO, TIENE_SEGURO "
                    + "FROM ORGANIZACIONES WHERE HAY_CONVENIO = 1 AND TIENE_SEGURO=1 ORDER BY NOMBRE;";
            organizaciones = con
                    .createQuery(sql)
                    .executeAndFetch(Organizacion.class);
        }
        return organizaciones;
    }

    public void insertarOrganizacionPorPPS(int id, String organizacion) {
        String SQL = "INSERT INTO ORGANIZACIONES_POR_PPS(ID_PPS, ORGANIZACION) VALUES (:id, :organizacion);";
        Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/sasa-fifi", "root", "");
        try (Connection con = sql2o.beginTransaction()) {
            con
                    .createQuery(SQL)
                    .addParameter("organizacion", organizacion)
                    .addParameter("id", id)
                    .executeUpdate().commit();
        }
    }
}
