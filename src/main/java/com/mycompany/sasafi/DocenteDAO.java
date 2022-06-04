package com.mycompany.sasafi;

import java.util.List;
import org.sql2o.*;

public class DocenteDAO {

    private List<Docente> docentes;

    public List<Docente> getDocentes() {

        Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/sasa-fifi", "root", "");

        try (Connection con = sql2o.beginTransaction()) {
            String sql = "SELECT PERSONAS.DNI, APELLIDOS, NOMBRES, CELULAR, EMAIL, LEGAJO "
                    + "FROM PERSONAS INNER JOIN DOCENTES ON DOCENTES.DNI=PERSONAS.DNI ORDER BY APELLIDOS;";
            docentes = con
                    .createQuery(sql)
                    .executeAndFetch(Docente.class);
        }
        return docentes;
    }

    public void insertarTutorDocentePorPPS(int id, int DNI) {
        String SQL = "INSERT INTO TUTORES_DOCENTES_POR_PPS(ID_PPS, DNI_DOCENTE) VALUES (:id, :DNI);";
        Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/sasa-fifi", "root", "");
        try (Connection con = sql2o.beginTransaction()) {
            con
                    .createQuery(SQL)
                    .addParameter("DNI", DNI)
                    .addParameter("id", id)
                    .executeUpdate().commit();
        }
    }
}
