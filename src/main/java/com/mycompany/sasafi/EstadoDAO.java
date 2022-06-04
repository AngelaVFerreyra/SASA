package com.mycompany.sasafi;

import org.sql2o.Connection;
import org.sql2o.Sql2o;

public class EstadoDAO {

    public void insertarEstadiosPorPPS(java.sql.Date fecha_inicio, java.sql.Date fecha_fin, boolean tiene_prorroga, int id_pps, int id_estado) {
        String SQL = "INSERT INTO ESTADIOS_POR_PPS(FECHA_INICIO, FECHA_FIN, TIENE_PRORROGA, ID_PPS, ID_ESTADO) VALUES (:fecha_inicio, :fecha_fin, :tiene_prorroga, :id_pps, :id_estado );";
        Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/sasa-fifi", "root", "");
        try (Connection con = sql2o.beginTransaction()) {
            con
                    .createQuery(SQL)
                    .addParameter("fecha_inicio", fecha_inicio)
                    .addParameter("fecha_fin", fecha_fin)
                    .addParameter("tiene_prorroga", tiene_prorroga)
                    .addParameter("id_pps", id_pps)
                    .addParameter("id_estado", id_estado)
                    .executeUpdate()
                    .commit();
        }
    }

    public void modificarEstadiosPorPPS(String id, String fecha) {
        String SQL = "UPDATE ESTADIOS_POR_PPS SET FECHA_FIN = :fecha, ID_ESTADO = 2 WHERE ESTADIOS_POR_PPS.ID_PPS = :id";
        Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/sasa-fifi", "root", "");
        try (Connection con = sql2o.open()) {
            con.createQuery(SQL)
                    .addParameter("fecha", fecha)
                    .addParameter("id", id)
                    .executeUpdate();
        }
    }
}
