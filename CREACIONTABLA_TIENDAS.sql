/*GRUPO 3, CADENA DE TIENDAS*/
/*PEREZ REYES ALISSON*/

/* TABLA: TIENDA */
CREATE  TABLE TIENDA(
TIENDA_COD SMALLINT PRIMARY KEY NOT NULL,
TIENDA_NOMBRE VARCHAR(50) NOT NULL,
TIENDA_DIRECCION VARCHAR(50) NOT NULL,
TIENDA_LOCALIDAD VARCHAR(50) NOT NULL,
TIENDA_CODIGOPOSTAL VARCHAR(6) NOT NULL,
TIENDA_TELEFONO VARCHAR(10) NOT NULL,
TIENDA_FAX VARCHAR(10) NOT NULL
);

/* TABLA: GERENTE */
CREATE  TABLE GERENTE(
GERENTE_DNI VARCHAR(10) PRIMARY KEY NOT NULL,
GERENTE_NOMBRE VARCHAR(40) NOT NULL,
GERENTE_DIRECCION VARCHAR(50) NOT NULL,
GERENTE_TELEFONO VARCHAR(10) NOT NULL,
GERENTE_FECHA_INCORPORACION DATE NOT NULL,	
TIENDA_COD SMALLINT NOT NULL,
CONSTRAINT TIENDAGERENTE_COD_FK FOREIGN KEY (TIENDA_COD) REFERENCES TIENDA(TIENDA_COD)
  ON DELETE RESTRICT ON UPDATE CASCADE
);


/* TABLA: EMPLEADO */
CREATE  TABLE EMPLEADO(
EMPLEADO_DNI VARCHAR(10) PRIMARY KEY NOT NULL,
EMPLEADO_NOMBRE VARCHAR(40) NOT NULL,
EMPLEADO_DIRECCION VARCHAR(50) NOT NULL,
EMPLEADO_TELEFONO VARCHAR(10) NOT NULL,
EMPLEADO_FECHA_INCORPORACION DATE NOT NULL,	
TIENDA_COD SMALLINT NOT NULL,
CONSTRAINT TIENDAEMPLEADO_COD_FK FOREIGN KEY (TIENDA_COD) REFERENCES TIENDA(TIENDA_COD)
  ON DELETE RESTRICT ON UPDATE CASCADE
);

/* TABLA: ARTÍCULOS */
CREATE  TABLE ARTICULO(
ARTICULO_COD VARCHAR(3) PRIMARY KEY NOT NULL,
ARTICULO_DESCRIPCION VARCHAR(40) NOT NULL,
ARTICULO_PRECIO NUMERIC(5, 2) NOT NULL,
ARTICULO_STOCK SMALLINT NOT NULL,
TIENDA_COD SMALLINT NOT NULL,
CONSTRAINT TIENDAART_COD_FK FOREIGN KEY (TIENDA_COD) REFERENCES TIENDA(TIENDA_COD)
  ON DELETE RESTRICT ON UPDATE CASCADE
);




/* TABLA: CLIENTE */
CREATE  TABLE CLIENTE(
CLIENTE_DNI VARCHAR(10) PRIMARY KEY NOT NULL,
CLIENTE_NOMBRE VARCHAR(40) NOT NULL,
CLIENTE_DIRECCION VARCHAR(40) NOT NULL
);





/* TABLA: FACTURA */
CREATE  TABLE FACTURA(
FACTURA_CODE VARCHAR(5) PRIMARY KEY NOT NULL,
FACTURA_FECHA DATE NOT NULL,
TIENDA_COD SMALLINT NOT NULL,
CLIENTE_DNI VARCHAR(10) NOT NULL,
CONSTRAINT FACTIENDA_COD_FK FOREIGN KEY (TIENDA_COD) REFERENCES TIENDA(TIENDA_COD)
 ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT FACLIENTE_COD_FK FOREIGN KEY (CLIENTE_DNI) REFERENCES CLIENTE(CLIENTE_DNI)
 ON DELETE RESTRICT ON UPDATE CASCADE
);

/* TABLA: DETALLE_FACTURA */
CREATE  TABLE DETALLE_FACTURA(
DETALLEFACTURA_CODE VARCHAR(10) PRIMARY KEY NOT NULL,
DETALLEFACTURA_DESC SMALLINT NOT NULL,
DETALLEFACTURA_CANT SMALLINT NOT NULL,
DETALLEFACTURA_TOTAL DECIMAL NOT NULL,
FACTURA_CODE VARCHAR(5) NOT NULL,
ARTICULO_COD VARCHAR(3) NOT NULL,
CONSTRAINT DETAFACT_COD_FK FOREIGN KEY (FACTURA_CODE) REFERENCES FACTURA(FACTURA_CODE)
 ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT DETARTI_COD_FK FOREIGN KEY (ARTICULO_COD) REFERENCES ARTICULO(ARTICULO_COD)
 ON DELETE RESTRICT ON UPDATE CASCADE
);





