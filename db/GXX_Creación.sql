-- DROP TABLES IF EXISTS
DROP TABLE IF EXISTS GXX_Departamento;
DROP TABLE IF EXISTS GXX_Tipo_Dpto;
DROP TABLE IF EXISTS GXX_Habitacion;
DROP TABLE IF EXISTS GXX_CostoDepto;
DROP TABLE IF EXISTS GXX_Reserva;
DROP TABLE IF EXISTS GXX_Pago;
DROP TABLE IF EXISTS GXX_Tipo_Pago;
DROP TABLE IF EXISTS GXX_EstadoLuegoOcupacion;
DROP TABLE IF EXISTS GXX_Huesped;
DROP TABLE IF EXISTS GXX_Huesped_Reserva;
DROP TABLE IF EXISTS GXX_Persona;
DROP TABLE IF EXISTS GXX_Comentario;


-- CREATE TABLES

-- Table: GXX_Comentario
CREATE TABLE GXX_Comentario (
    tipo_doc int  NOT NULL,
    nro_doc decimal(11,0)  NOT NULL,
    id_reserva int  NOT NULL,
    fecha_hora_comentario date  NOT NULL,
    comentario varchar(2048)  NOT NULL,
    estrellas int  NOT NULL,
    CONSTRAINT PK_GXX_Comentario PRIMARY KEY (tipo_doc,nro_doc,id_reserva,fecha_hora_comentario)
);

-- Table: GXX_CostoDepto
CREATE TABLE GXX_CostoDepto (
    id_dpto int  NOT NULL,
    fecha_desde date  NOT NULL,
    fecha_hasta date  NOT NULL,
    precio_noche decimal(10,2)  NOT NULL,
    CONSTRAINT pl_GXX_CostoDepto PRIMARY KEY (id_dpto,fecha_desde)
);

-- Table: GXX_Departamento
CREATE TABLE GXX_Departamento (
    id_dpto int  NOT NULL,
    descripcion varchar(80)  NOT NULL,
    superficie decimal(10,2)  NOT NULL,
    id_tipo_depto int  NOT NULL,
    tipo_doc int  NOT NULL,
    nro_doc decimal(11,0)  NOT NULL,
    precio_noche decimal(10,2)  NOT NULL,
    CONSTRAINT PK_GXX_Departamento PRIMARY KEY (id_dpto)
);

-- Table: GXX_EstadoLuegoOcupacion
CREATE TABLE GXX_EstadoLuegoOcupacion (
    id_reserva int  NOT NULL,
    fecha int  NOT NULL,
    comentario varchar(2048)  NOT NULL,
    CONSTRAINT PK_GXX_EstadoLuegoOcupacion PRIMARY KEY (id_reserva,fecha)
);

-- Table: GXX_Habitacion
CREATE TABLE GXX_Habitacion (
    id_dpto int  NOT NULL,
    id_habitacion int  NOT NULL,
    posib_camas_simples int  NOT NULL,
    posib_camas_dobles int  NOT NULL,
    posib_camas_kind int  NOT NULL,
    tv boolean  NOT NULL,
    sillon int  NOT NULL,
    frigobar int  NOT NULL,
    mesa boolean  NOT NULL,
    sillas int  NOT NULL,
    cocina boolean  NOT NULL,
    CONSTRAINT PK_GXX_Habitacion PRIMARY KEY (id_dpto,id_habitacion)
);

-- Table: GXX_Huesped
CREATE TABLE GXX_Huesped (
    tipo_doc int  NOT NULL,
    nro_doc decimal(11,0)  NOT NULL,
    CONSTRAINT PK_GXX_Huesped PRIMARY KEY (tipo_doc,nro_doc)
);

-- Table: GXX_Huesped_Reserva
CREATE TABLE GXX_Huesped_Reserva (
    tipo_doc int  NOT NULL,
    nro_doc decimal(11,0)  NOT NULL,
    id_reserva int  NOT NULL,
    CONSTRAINT PK_GXX_Huesped_Reserva PRIMARY KEY (tipo_doc,nro_doc,id_reserva)
);

-- Table: GXX_Pago
CREATE TABLE GXX_Pago (
    fecha_pago timestamp  NOT NULL,
    id_reserva int  NOT NULL,
    id_tipo_pago int  NOT NULL,
    comentario varchar(80)  NULL,
    importe decimal(8,3)  NOT NULL,
    CONSTRAINT PK_GXX_Pago PRIMARY KEY (fecha_pago,id_reserva,id_tipo_pago)
);

-- Table: GXX_Persona
CREATE TABLE GXX_Persona (
    tipo_doc int  NOT NULL,
    nro_doc decimal(11,0)  NOT NULL,
    apellido varchar(80)  NOT NULL,
    nombre varchar(80)  NOT NULL,
    fecha_nac date  NOT NULL,
    e_mail int  NOT NULL,
    CONSTRAINT PK_GXX_Persona PRIMARY KEY (tipo_doc,nro_doc)
);

-- Table: GXX_Reserva
CREATE TABLE GXX_Reserva (
    id_reserva int  NOT NULL,
    fecha_reserva date  NOT NULL,
    fecha_desde date  NOT NULL,
    fecha_hasta date  NOT NULL,
    tipo varchar(15)  NOT NULL,
    id_dpto int  NOT NULL,
    valor_noche decimal(8,3)  NOT NULL,
    limpieza decimal(5,3)  NOT NULL,
    tipo_doc int  NOT NULL,
    nro_doc decimal(11,0)  NOT NULL,
    CONSTRAINT PK_GXX_Reserva PRIMARY KEY (id_reserva)
);

-- Table: GXX_Tipo_Dpto
CREATE TABLE GXX_Tipo_Dpto (
    id_tipo_depto int  NOT NULL,
    cant_habitaciones int  NOT NULL,
    cant_banios int  NOT NULL,
    cant_max_huespedes int  NOT NULL,
    CONSTRAINT PK_GXX_Tipo_Dpto PRIMARY KEY (id_tipo_depto)
);

-- Table: GXX_Tipo_Pago
CREATE TABLE GXX_Tipo_Pago (
    id_tipo_pago int  NOT NULL,
    empresa int  NOT NULL,
    CONSTRAINT PK_GXX_Tipo_Pago PRIMARY KEY (id_tipo_pago)
);


-- ALTER TABLES -- 

-- FK_Comentario_Huesped_Reserva
ALTER TABLE GXX_Comentario ADD CONSTRAINT FK_GXX_Comentario_Huesped_Reserva
    FOREIGN KEY (tipo_doc, nro_doc, id_reserva)
    REFERENCES GXX_Huesped_Reserva (tipo_doc, nro_doc, id_reserva)  
;

-- FK_CostoDepto_Departamento
ALTER TABLE GXX_CostoDepto ADD CONSTRAINT FK_GXX_CostoDepto_Departamento
    FOREIGN KEY (id_dpto)
    REFERENCES GXX_Departamento (id_dpto)  
 ;

-- FK_Departamento_Persona
 ALTER TABLE GXX_Departamento ADD CONSTRAINT FK_GXX_Departamento_Persona
    FOREIGN KEY (tipo_doc, nro_doc)
    REFERENCES GXX_Persona (tipo_doc, nro_doc)  
;

-- FK_Departamento_Tipo_Dpto
ALTER TABLE GXX_Departamento ADD CONSTRAINT FK_GXX_Departamento_Tipo_Dpto
    FOREIGN KEY (id_tipo_depto)
    REFERENCES GXX_Tipo_Dpto (id_tipo_depto)  
;

-- FK_EstadoLuegoOcupacion_Reserva
ALTER TABLE GXX_EstadoLuegoOcupacion ADD CONSTRAINT FK_GXX_EstadoLuegoOcupacion_Reserva
    FOREIGN KEY (id_reserva)
    REFERENCES GXX_Reserva (id_reserva)  
;

-- FK_Habitacion_Departamento 
ALTER TABLE GXX_Habitacion ADD CONSTRAINT FK_GXX_Habitacion_Departamento
    FOREIGN KEY (id_dpto)
    REFERENCES GXX_Departamento (id_dpto)  
;

-- FK_Huesped_Persona
ALTER TABLE GXX_Huesped ADD CONSTRAINT FK_GXX_Huesped_Persona
    FOREIGN KEY (tipo_doc, nro_doc)
    REFERENCES GXX_Persona (tipo_doc, nro_doc)  
;

-- FK_Huesped_Reserva_Huesped
ALTER TABLE GXX_Huesped_Reserva ADD CONSTRAINT FK_GXX_Huesped_Reserva_Huesped
    FOREIGN KEY (tipo_doc, nro_doc)
    REFERENCES GXX_Huesped (tipo_doc, nro_doc)  
;

-- FK_Huesped_Reserva_Reserva
ALTER TABLE GXX_Huesped_Reserva ADD CONSTRAINT FK_GXX_Huesped_Reserva_Reserva
    FOREIGN KEY (id_reserva)
    REFERENCES GXX_Reserva (id_reserva)  
;

-- FK_Pago_Reserva
ALTER TABLE GXX_Pago ADD CONSTRAINT FK_GXX_Pago_Reserva
    FOREIGN KEY (id_reserva)
    REFERENCES GXX_Reserva (id_reserva)  
;

-- FK_Pago_Tipo_Pago 
ALTER TABLE GXX_Pago ADD CONSTRAINT FK_GXX_Pago_Tipo_Pago
    FOREIGN KEY (id_tipo_pago)
    REFERENCES GXX_Tipo_Pago (id_tipo_pago)  
;

-- FK_Reserva_Departamento 
ALTER TABLE GXX_Reserva ADD CONSTRAINT FK_GXX_Reserva_Departamento
    FOREIGN KEY (id_dpto)
    REFERENCES GXX_Departamento (id_dpto)  
;

-- FK_Reserva_Huesped 
ALTER TABLE GXX_Reserva ADD CONSTRAINT FK_GXX_Reserva_Huesped
    FOREIGN KEY (tipo_doc, nro_doc)
    REFERENCES GXX_Huesped (tipo_doc, nro_doc)  
;