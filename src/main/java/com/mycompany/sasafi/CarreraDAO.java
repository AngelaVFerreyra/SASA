package com.mycompany.sasafi;

import java.util.List;
import org.sql2o.*;

public class CarreraDAO {
    private List<Carrera> carreras;

    public void insertarCarreraPorPPS(int id, String carrera) {
        String SQL = "INSERT INTO CARRERAS_POR_PPS(ID_PPS, CARRERA) VALUES (:id, :carrera);";
        Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/sasa-fifi", "root", "");
        try (Connection con = sql2o.beginTransaction()) {
            con
                    .createQuery(SQL)
                    .addParameter("id", id)
                    .addParameter("carrera", carrera)
                    .executeUpdate().commit();
        }
    }
    
    public List<Carrera> getCarreras() {    
        Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/sasa-fifi", "root", "");
        try (Connection con = sql2o.open()) {
            String sql = "SELECT * FROM carreras;";
            carreras = con
                .createQuery(sql)
                .executeAndFetch(Carrera.class);
        }
        return carreras;
    }
}
