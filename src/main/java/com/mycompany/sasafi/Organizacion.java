package com.mycompany.sasafi;

import lombok.Data;

@Data
public class Organizacion {

    private double cuil;
    private String nombre;
    private boolean hay_convenio;
    private boolean tiene_seguro;
}
