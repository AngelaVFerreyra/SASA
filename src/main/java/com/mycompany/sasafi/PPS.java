package com.mycompany.sasafi;

import lombok.Data;

@Data
public class PPS {
    private int id_pps;
    private String titulo;
    private String descripcion;
    private String bibliografia;
    private String etapasyobjetivos;
    private boolean es_de_pares = false;
    private String estado;
}
