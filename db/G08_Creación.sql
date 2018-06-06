-- CREATE TABLES

-- Table: GR08_Comentario
CREATE TABLE GR08_Comentario (
    tipo_doc int  NOT NULL,
    nro_doc decimal(11,0)  NOT NULL,
    id_reserva int  NOT NULL,
    fecha_hora_comentario date  NOT NULL,
    comentario varchar(2048)  NOT NULL,
    estrellas int  NOT NULL,
    CONSTRAINT PK_GR08_Comentario PRIMARY KEY (tipo_doc,nro_doc,id_reserva,fecha_hora_comentario)
);

-- Table: GR08_CostoDepto
CREATE TABLE GR08_CostoDepto (
    id_dpto int  NOT NULL,
    fecha_desde date  NOT NULL,
    fecha_hasta date  NOT NULL,
    precio_noche decimal(10,2)  NOT NULL,
    CONSTRAINT pl_GR08_CostoDepto PRIMARY KEY (id_dpto,fecha_desde)
);

-- Table: GR08_Departamento
CREATE TABLE GR08_Departamento (
    id_dpto int  NOT NULL,
    descripcion varchar(80)  NOT NULL,
    superficie decimal(10,2)  NOT NULL,
    id_tipo_depto int  NOT NULL,
    tipo_doc int  NOT NULL,
    nro_doc decimal(11,0)  NOT NULL,
    precio_noche decimal(10,2)  NOT NULL,
    CONSTRAINT PK_GR08_Departamento PRIMARY KEY (id_dpto)
);

-- Table: GR08_EstadoLuegoOcupacion
CREATE TABLE GR08_EstadoLuegoOcupacion (
    id_reserva int  NOT NULL,
    fecha date  NOT NULL,
    comentario varchar(2048)  NOT NULL,
    CONSTRAINT PK_GR08_EstadoLuegoOcupacion PRIMARY KEY (id_reserva,fecha)
);

-- Table: GR08_Habitacion
CREATE TABLE GR08_Habitacion (
    id_dpto int  NOT NULL,
    id_habitacion int  NOT NULL,
    posib_camas_simples int  NOT NULL,
    posib_camas_dobles int  NOT NULL,
    posib_camas_kind int  NOT NULL,
    tv boolean  NOT NULL,
    sillon int  NOT NULL,
    frigobar boolean NOT NULL,
    mesa boolean  NOT NULL,
    sillas int  NOT NULL,
    cocina boolean  NOT NULL,
    CONSTRAINT PK_GR08_Habitacion PRIMARY KEY (id_dpto,id_habitacion)
);

-- Table: GR08_Huesped
CREATE TABLE GR08_Huesped (
    tipo_doc int  NOT NULL,
    nro_doc decimal(11,0)  NOT NULL,
    CONSTRAINT PK_GR08_Huesped PRIMARY KEY (tipo_doc,nro_doc)
);

-- Table: GR08_Huesped_Reserva
CREATE TABLE GR08_Huesped_Reserva (
    tipo_doc int  NOT NULL,
    nro_doc decimal(11,0)  NOT NULL,
    id_reserva int  NOT NULL,
    CONSTRAINT PK_GR08_Huesped_Reserva PRIMARY KEY (tipo_doc,nro_doc,id_reserva)
);

-- Table: GR08_Pago
CREATE TABLE GR08_Pago (
    fecha_pago timestamp  NOT NULL,
    id_reserva int  NOT NULL,
    id_tipo_pago int  NOT NULL,
    comentario varchar(80)  NULL,
    importe decimal(8,3)  NOT NULL,
    CONSTRAINT PK_GR08_Pago PRIMARY KEY (fecha_pago,id_reserva,id_tipo_pago)
);

-- Table: GR08_Persona
CREATE TABLE GR08_Persona (
    tipo_doc int  NOT NULL,
    nro_doc decimal(11,0)  NOT NULL,
    apellido varchar(80)  NOT NULL,
    nombre varchar(80)  NOT NULL,
    fecha_nac date  NOT NULL,
    e_mail varchar(30)  NOT NULL,
    CONSTRAINT PK_GR08_Persona PRIMARY KEY (tipo_doc,nro_doc)
);

-- Table: GR08_Reserva
CREATE TABLE GR08_Reserva (
    id_reserva int  NOT NULL,
    fecha_reserva date  NOT NULL,
    fecha_desde date  NOT NULL,
    fecha_hasta date  NOT NULL,
    tipo varchar(15)  NOT NULL,
    id_dpto int  NOT NULL,
    valor_noche decimal(8,3) NOT NULL,
    limpieza boolean NOT NULL,
    tipo_doc int NOT NULL,
    nro_doc decimal(11,0) NOT NULL,
    CONSTRAINT PK_GR08_Reserva PRIMARY KEY (id_reserva)
);

-- Table: GR08_Tipo_Dpto
CREATE TABLE GR08_Tipo_Dpto (
    id_tipo_depto int  NOT NULL,
    cant_habitaciones int  NOT NULL,
    cant_banios int  NOT NULL,
    cant_max_huespedes int  NOT NULL,
    CONSTRAINT PK_GR08_Tipo_Dpto PRIMARY KEY (id_tipo_depto)
);

-- Table: GR08_Tipo_Pago
CREATE TABLE GR08_Tipo_Pago (
    id_tipo_pago int  NOT NULL,
    empresa varchar(80)  NOT NULL,
    CONSTRAINT PK_GR08_Tipo_Pago PRIMARY KEY (id_tipo_pago)
);


-- ALTER TABLES -- 

-- FK_Comentario_Huesped_Reserva
ALTER TABLE GR08_Comentario ADD CONSTRAINT FK_GR08_Comentario_Huesped_Reserva
    FOREIGN KEY (tipo_doc, nro_doc, id_reserva)
    REFERENCES GR08_Huesped_Reserva (tipo_doc, nro_doc, id_reserva)  
;

-- FK_CostoDepto_Departamento
ALTER TABLE GR08_CostoDepto ADD CONSTRAINT FK_GR08_CostoDepto_Departamento
    FOREIGN KEY (id_dpto)
    REFERENCES GR08_Departamento (id_dpto)  
 ;

-- FK_Departamento_Persona
 ALTER TABLE GR08_Departamento ADD CONSTRAINT FK_GR08_Departamento_Persona
    FOREIGN KEY (tipo_doc, nro_doc)
    REFERENCES GR08_Persona (tipo_doc, nro_doc)  
;

-- FK_Departamento_Tipo_Dpto
ALTER TABLE GR08_Departamento ADD CONSTRAINT FK_GR08_Departamento_Tipo_Dpto
    FOREIGN KEY (id_tipo_depto)
    REFERENCES GR08_Tipo_Dpto (id_tipo_depto)  
;

-- FK_EstadoLuegoOcupacion_Reserva
ALTER TABLE GR08_EstadoLuegoOcupacion ADD CONSTRAINT FK_GR08_EstadoLuegoOcupacion_Reserva
    FOREIGN KEY (id_reserva)
    REFERENCES GR08_Reserva (id_reserva)  
;

-- FK_Habitacion_Departamento 
ALTER TABLE GR08_Habitacion ADD CONSTRAINT FK_GR08_Habitacion_Departamento
    FOREIGN KEY (id_dpto)
    REFERENCES GR08_Departamento (id_dpto)  
;

-- FK_Huesped_Persona
ALTER TABLE GR08_Huesped ADD CONSTRAINT FK_GR08_Huesped_Persona
    FOREIGN KEY (tipo_doc, nro_doc)
    REFERENCES GR08_Persona (tipo_doc, nro_doc)  
;

-- FK_Huesped_Reserva_Huesped
ALTER TABLE GR08_Huesped_Reserva ADD CONSTRAINT FK_GR08_Huesped_Reserva_Huesped
    FOREIGN KEY (tipo_doc, nro_doc)
    REFERENCES GR08_Huesped (tipo_doc, nro_doc)  
;

-- FK_Huesped_Reserva_Reserva
ALTER TABLE GR08_Huesped_Reserva ADD CONSTRAINT FK_GR08_Huesped_Reserva_Reserva
    FOREIGN KEY (id_reserva)
    REFERENCES GR08_Reserva (id_reserva)  
;

-- FK_Pago_Reserva
ALTER TABLE GR08_Pago ADD CONSTRAINT FK_GR08_Pago_Reserva
    FOREIGN KEY (id_reserva)
    REFERENCES GR08_Reserva (id_reserva)  
;

-- FK_Pago_Tipo_Pago 
ALTER TABLE GR08_Pago ADD CONSTRAINT FK_GR08_Pago_Tipo_Pago
    FOREIGN KEY (id_tipo_pago)
    REFERENCES GR08_Tipo_Pago (id_tipo_pago)  
;

-- FK_Reserva_Departamento 
ALTER TABLE GR08_Reserva ADD CONSTRAINT FK_GR08_Reserva_Departamento
    FOREIGN KEY (id_dpto)
    REFERENCES GR08_Departamento (id_dpto)  
;

-- FK_Reserva_Huesped 
ALTER TABLE GR08_Reserva ADD CONSTRAINT FK_GR08_Reserva_Huesped
    FOREIGN KEY (tipo_doc, nro_doc)
    REFERENCES GR08_Huesped (tipo_doc, nro_doc)  
;