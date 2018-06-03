-- DROP TABLES IF EXISTS
DROP TABLE IF EXISTS GRXX_Departamento CASCADE;
DROP TABLE IF EXISTS GRXX_Tipo_Dpto CASCADE;
DROP TABLE IF EXISTS GRXX_Habitacion CASCADE;
DROP TABLE IF EXISTS GRXX_CostoDepto CASCADE;
DROP TABLE IF EXISTS GRXX_Reserva CASCADE;
DROP TABLE IF EXISTS GRXX_Pago CASCADE;
DROP TABLE IF EXISTS GRXX_Tipo_Pago CASCADE;
DROP TABLE IF EXISTS GRXX_EstadoLuegoOcupacion CASCADE;
DROP TABLE IF EXISTS GRXX_Huesped CASCADE;
DROP TABLE IF EXISTS GRXX_Huesped_Reserva CASCADE;
DROP TABLE IF EXISTS GRXX_Persona CASCADE;
DROP TABLE IF EXISTS GRXX_Comentario CASCADE;


-- CREATE TABLES

-- Table: GRXX_Comentario
CREATE TABLE GRXX_Comentario (
    tipo_doc int  NOT NULL,
    nro_doc char(8)  NOT NULL,
    id_reserva int  NOT NULL,
    fecha_hora_comentario date  NOT NULL,
    comentario varchar(2048)  NOT NULL,
    estrellas int  NOT NULL,
    CONSTRAINT PK_GRXX_Comentario PRIMARY KEY (tipo_doc,nro_doc,id_reserva,fecha_hora_comentario)
);

-- Table: GRXX_CostoDepto
CREATE TABLE GRXX_CostoDepto (
    id_dpto int  NOT NULL,
    fecha_desde date  NOT NULL,
    fecha_hasta date  NOT NULL,
    precio_noche decimal(10,2)  NOT NULL,
    CONSTRAINT pl_GRXX_CostoDepto PRIMARY KEY (id_dpto,fecha_desde)
);

-- Table: GRXX_Departamento
CREATE TABLE GRXX_Departamento (
    id_dpto int  NOT NULL,
    descripcion varchar(80)  NOT NULL,
    superficie decimal(10,2)  NOT NULL,
    id_tipo_depto int  NOT NULL,
    tipo_doc int  NOT NULL,
    nro_doc char(8)  NOT NULL,
    precio_noche decimal(10,2)  NOT NULL,
    CONSTRAINT PK_GRXX_Departamento PRIMARY KEY (id_dpto)
);

-- Table: GRXX_EstadoLuegoOcupacion
CREATE TABLE GRXX_EstadoLuegoOcupacion (
    id_reserva int  NOT NULL,
    fecha date  NOT NULL,
    comentario varchar(2048)  NOT NULL,
    CONSTRAINT PK_GRXX_EstadoLuegoOcupacion PRIMARY KEY (id_reserva,fecha)
);

-- Table: GRXX_Habitacion
CREATE TABLE GRXX_Habitacion (
    id_dpto int  NOT NULL,
    id_habitacion int  NOT NULL,
    posib_camas_simples int  NOT NULL,
    posib_camas_dobles int  NOT NULL,
    posib_camas_kind int  NOT NULL,
    tv boolean  NOT NULL,
    sillon boolean  NOT NULL,
    frigobar boolean NOT NULL,
    mesa boolean  NOT NULL,
    sillas int  NOT NULL,
    cocina boolean  NOT NULL,
    CONSTRAINT PK_GRXX_Habitacion PRIMARY KEY (id_dpto,id_habitacion)
);

-- Table: GRXX_Huesped
CREATE TABLE GRXX_Huesped (
    tipo_doc int  NOT NULL,
    nro_doc char(8)  NOT NULL,
    CONSTRAINT PK_GRXX_Huesped PRIMARY KEY (tipo_doc,nro_doc)
);

-- Table: GRXX_Huesped_Reserva
CREATE TABLE GRXX_Huesped_Reserva (
    tipo_doc int  NOT NULL,
    nro_doc char(8)  NOT NULL,
    id_reserva int  NOT NULL,
    CONSTRAINT PK_GRXX_Huesped_Reserva PRIMARY KEY (tipo_doc,nro_doc,id_reserva)
);

-- Table: GRXX_Pago
CREATE TABLE GRXX_Pago (
    fecha_pago timestamp  NOT NULL,
    id_reserva int  NOT NULL,
    id_tipo_pago int  NOT NULL,
    comentario varchar(2048)  NULL,
    importe decimal(8,2)  NOT NULL,
    CONSTRAINT PK_GRXX_Pago PRIMARY KEY (fecha_pago,id_reserva,id_tipo_pago)
);

-- Table: GRXX_Persona
CREATE TABLE GRXX_Persona (
    tipo_doc int  NOT NULL,
    nro_doc char(8)  NOT NULL,
    apellido varchar(80)  NOT NULL,
    nombre varchar(80)  NOT NULL,
    fecha_nac date  NOT NULL,
    e_mail varchar(30)  NOT NULL,
    CONSTRAINT PK_GRXX_Persona PRIMARY KEY (tipo_doc,nro_doc)
);

-- Table: GRXX_Reserva
CREATE TABLE GRXX_Reserva (
    id_reserva int  NOT NULL,
    fecha_reserva date  NOT NULL,
    fecha_desde date  NOT NULL,
    fecha_hasta date  NOT NULL,
    tipo varchar(15)  NOT NULL,
    id_dpto int  NOT NULL,
    valor_noche decimal(8,2) NOT NULL,
    limpieza boolean NOT NULL,
    tipo_doc int NOT NULL,
    nro_doc char(8) NOT NULL,
    CONSTRAINT PK_GRXX_Reserva PRIMARY KEY (id_reserva)
);

-- Table: GRXX_Tipo_Dpto
CREATE TABLE GRXX_Tipo_Dpto (
    id_tipo_depto int  NOT NULL,
    cant_habitaciones int  NOT NULL,
    cant_banios int  NOT NULL,
    cant_max_huespedes int  NOT NULL,
    CONSTRAINT PK_GRXX_Tipo_Dpto PRIMARY KEY (id_tipo_depto)
);

-- Table: GRXX_Tipo_Pago
CREATE TABLE GRXX_Tipo_Pago (
    id_tipo_pago int  NOT NULL,
    empresa varchar(80)  NOT NULL,
    CONSTRAINT PK_GRXX_Tipo_Pago PRIMARY KEY (id_tipo_pago)
);


-- ALTER TABLES -- 

-- FK_Comentario_Huesped_Reserva
ALTER TABLE GRXX_Comentario ADD CONSTRAINT FK_GRXX_Comentario_Huesped_Reserva
    FOREIGN KEY (tipo_doc, nro_doc, id_reserva)
    REFERENCES GRXX_Huesped_Reserva (tipo_doc, nro_doc, id_reserva)  
;

-- FK_CostoDepto_Departamento
ALTER TABLE GRXX_CostoDepto ADD CONSTRAINT FK_GRXX_CostoDepto_Departamento
    FOREIGN KEY (id_dpto)
    REFERENCES GRXX_Departamento (id_dpto)  
 ;

-- FK_Departamento_Persona
 ALTER TABLE GRXX_Departamento ADD CONSTRAINT FK_GRXX_Departamento_Persona
    FOREIGN KEY (tipo_doc, nro_doc)
    REFERENCES GRXX_Persona (tipo_doc, nro_doc)  
;

-- FK_Departamento_Tipo_Dpto
ALTER TABLE GRXX_Departamento ADD CONSTRAINT FK_GRXX_Departamento_Tipo_Dpto
    FOREIGN KEY (id_tipo_depto)
    REFERENCES GRXX_Tipo_Dpto (id_tipo_depto)  
;

-- FK_EstadoLuegoOcupacion_Reserva
ALTER TABLE GRXX_EstadoLuegoOcupacion ADD CONSTRAINT FK_GRXX_EstadoLuegoOcupacion_Reserva
    FOREIGN KEY (id_reserva)
    REFERENCES GRXX_Reserva (id_reserva)  
;

-- FK_Habitacion_Departamento 
ALTER TABLE GRXX_Habitacion ADD CONSTRAINT FK_GRXX_Habitacion_Departamento
    FOREIGN KEY (id_dpto)
    REFERENCES GRXX_Departamento (id_dpto)  
;

-- FK_Huesped_Persona
ALTER TABLE GRXX_Huesped ADD CONSTRAINT FK_GRXX_Huesped_Persona
    FOREIGN KEY (tipo_doc, nro_doc)
    REFERENCES GRXX_Persona (tipo_doc, nro_doc)  
;

-- FK_Huesped_Reserva_Huesped
ALTER TABLE GRXX_Huesped_Reserva ADD CONSTRAINT FK_GRXX_Huesped_Reserva_Huesped
    FOREIGN KEY (tipo_doc, nro_doc)
    REFERENCES GRXX_Huesped (tipo_doc, nro_doc)  
;

-- FK_Huesped_Reserva_Reserva
ALTER TABLE GRXX_Huesped_Reserva ADD CONSTRAINT FK_GRXX_Huesped_Reserva_Reserva
    FOREIGN KEY (id_reserva)
    REFERENCES GRXX_Reserva (id_reserva)  
;

-- FK_Pago_Reserva
ALTER TABLE GRXX_Pago ADD CONSTRAINT FK_GRXX_Pago_Reserva
    FOREIGN KEY (id_reserva)
    REFERENCES GRXX_Reserva (id_reserva)  
;

-- FK_Pago_Tipo_Pago 
ALTER TABLE GRXX_Pago ADD CONSTRAINT FK_GRXX_Pago_Tipo_Pago
    FOREIGN KEY (id_tipo_pago)
    REFERENCES GRXX_Tipo_Pago (id_tipo_pago)  
;

-- FK_Reserva_Departamento 
ALTER TABLE GRXX_Reserva ADD CONSTRAINT FK_GRXX_Reserva_Departamento
    FOREIGN KEY (id_dpto)
    REFERENCES GRXX_Departamento (id_dpto)  
;

-- FK_Reserva_Huesped 
ALTER TABLE GRXX_Reserva ADD CONSTRAINT FK_GRXX_Reserva_Huesped
    FOREIGN KEY (tipo_doc, nro_doc)
    REFERENCES GRXX_Huesped (tipo_doc, nro_doc)  
;