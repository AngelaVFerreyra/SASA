package com.mycompany.sasafi;

import java.util.List;
import org.sql2o.*;

public class PPSDAO {
    private List<PPS> ppss;
    
    public void insertarPPS(PPS pps) {
        String SQL = "INSERT INTO PPSS(TITULO, DESCRIPCION, BIBLIOGRAFIA, ETAPAS_Y_OBJETIVOS, ES_DE_PARES) VALUES (:titulo,:descripcion,:bibliografia, :etapasyobjetivos, :es_de_pares);";
        Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/sasa-fifi", "root", "");
        try (Connection con = sql2o.beginTransaction()) {
            con.createQuery(SQL).bind(pps).executeUpdate().commit();
        }
    }

    public int ultimoID() { //En este caso funciona porque hay una sola comunicación con la BD a la vez, se debe mejorar para un sistema más complejo.
        int id;
        String SQL = "SELECT MAX(ID_PPS) FROM PPSS;";
        Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/sasa-fifi", "root", "");
        try (Connection con = sql2o.beginTransaction()) {
            id = con
                    .createQuery(SQL)
                    .executeScalar(Integer.class);
        }
        return id;
    }
    
    public List<PPS> getPPSS() {    
        Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/sasa-fifi", "root", "");
        try (Connection con = sql2o.open()) {
            String sql = "SELECT ppss.id_pps, titulo, ppss.descripcion, bibliografia, etapas_y_objetivos as etapasyobjetivos, es_de_pares, estados.DESCRIPCION as estado "
                    + "FROM ppss "
                    + "JOIN estadios_por_pps ON ppss.id_pps=estadios_por_pps.ID_PPS "
                    + "JOIN estados ON estadios_por_pps.ID_ESTADO = estados.ID_ESTADO";
            ppss = con
                .createQuery(sql)
                .executeAndFetch(PPS.class);
        }
        return ppss;
    }
    
    public List<PPS> getPPS(String Id) {    
        Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/sasa-fifi", "root", "");
        try (Connection con = sql2o.open()) {
            String sql = "SELECT ppss.id_pps, titulo, ppss.descripcion, bibliografia, es_de_pares, estados.DESCRIPCION as estado "
                    + "FROM ppss JOIN estadios_por_pps ON ppss.id_pps=estadios_por_pps.ID_PPS "
                    + "JOIN estados ON estadios_por_pps.ID_ESTADO = estados.ID_ESTADO "
                    + "WHERE ppss.id_pps = :id";
            ppss = con
                .createQuery(sql)
                .addParameter("id", Id)
                .executeAndFetch(PPS.class);
        }
        return ppss;
    }
 

    
    public void evaluarpps(String Id, String nota, String obs, String fecha) {
        Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/sasa-fifi", "root", "");
        String updateSQL = "UPDATE evaluaciones_ce SET NOTA = :notaa, OBSERVACIONES = :obs, FECHA = :date WHERE evaluaciones_ce.ID_PPS = :id";

        try (Connection con = sql2o.open()) {
          con.createQuery(updateSQL)
                  .addParameter("id", Id)
                  .addParameter("notaa", nota)
                  .addParameter("obs", obs)
                  .addParameter("date", fecha)
                  .executeUpdate();
        } 
    }
    

}
