-- CREATE TABLE

-- Table: GR08_Tipo_Documento
CREATE TABLE GR08_Tipo_Documento (
    id_tipo_doc int NOT NULL,
    tipo varchar(6) NOT NULL,
    CONSTRAINT PK_GR08_Tipo_Documento PRIMARY KEY (id_tipo_doc)
);

-- CREATE TABLE
CREATE TABLE GR08_Ciudad (
    cod_postal int NOT NULL,
    ciudad varchar(30) NOT NULL,
    CONSTRAINT PK_GR08_Ciudad PRIMARY KEY (cod_postal)
);

-- ALTER TABLES
-- -- FK_GR08_Persona_Tipo_Doc
ALTER TABLE GR08_Persona ADD CONSTRAINT FK_GR08_Persona_Tipo_Doc
    FOREIGN KEY (tipo_doc)
    REFERENCES GR08_Tipo_Documento (id_tipo_doc)  
;

-- Agregar la columna cod_postal Departamento
-- FK_GR08_Ciudad
ALTER TABLE GR08_Departamento
    ADD COLUMN cod_postal int NOT NULL,
    ADD CONSTRAINT FK_GR08_Ciudad FOREIGN KEY (cod_postal) REFERENCES GR08_Ciudad (cod_postal);

--***********************************************************************************************************
--***********************************************************************************************************
-- INSERTS
-- Tipos Documento
INSERT INTO GR08_Tipo_Documento (id_tipo_doc,tipo) VALUES (1, 'DNI');
INSERT INTO GR08_Tipo_Documento (id_tipo_doc,tipo) VALUES (2, 'LE');

-- Personas
INSERT INTO GR08_Persona (tipo_doc,nro_doc,apellido,nombre,fecha_nac,e_mail) VALUES(1,31156181,'Martín','David',to_date('28/12/1984','dd/MM/yyyy'),'dmartin@gmail.com');
INSERT INTO GR08_Persona (tipo_doc,nro_doc,apellido,nombre,fecha_nac,e_mail) VALUES(1,30156682,'Pérez','Laura',to_date('08/03/1983','dd/MM/yyyy'),'lauperez@gmail.com');
INSERT INTO GR08_Persona (tipo_doc,nro_doc,apellido,nombre,fecha_nac,e_mail) VALUES(1,32176184,'García','Diana',to_date('18/04/1986','dd/MM/yyyy'),'dgarcia@hotmail.com');
INSERT INTO GR08_Persona (tipo_doc,nro_doc,apellido,nombre,fecha_nac,e_mail) VALUES(1,31789181,'Gómez','Jorge',to_date('22/07/1984','dd/MM/yyyy'),'jorgeg_o@gmail.com');
INSERT INTO GR08_Persona (tipo_doc,nro_doc,apellido,nombre,fecha_nac,e_mail) VALUES(1,29196189,'González','Juan',to_date('14/07/1982','dd/MM/yyyy'),'gonzajuan@gmail.com');
INSERT INTO GR08_Persona (tipo_doc,nro_doc,apellido,nombre,fecha_nac,e_mail) VALUES(1,37159187,'Del Potro','Pedro',to_date('10/09/1993','dd/MM/yyyy'),'delpop@putlook.com');
INSERT INTO GR08_Persona (tipo_doc,nro_doc,apellido,nombre,fecha_nac,e_mail) VALUES(1,26923182,'Ferrari','Carolina',to_date('09/08/1976','dd/MM/yyyy'),'fcarolina@gmail.com');
INSERT INTO GR08_Persona (tipo_doc,nro_doc,apellido,nombre,fecha_nac,e_mail) VALUES(1,25576181,'Pirlo','Paola',to_date('19/08/1974','dd/MM/yyyy'),'ppirlo@gmail.com');

INSERT INTO GR08_Persona (tipo_doc,nro_doc,apellido,nombre,fecha_nac,e_mail) VALUES(1,28499199,'Tangorra','Paula',to_date('21/05/1976','dd/MM/yyyy'),'tpaula@hotmail.com');
INSERT INTO GR08_Persona (tipo_doc,nro_doc,apellido,nombre,fecha_nac,e_mail) VALUES(1,28856188,'Pedreira','Pedro',to_date('25/05/1980','dd/MM/yyyy'),'ppedreira@hotmail.com');
INSERT INTO GR08_Persona (tipo_doc,nro_doc,apellido,nombre,fecha_nac,e_mail) VALUES(1,26886654,'Martinez','Carlos',to_date('24/09/1976','dd/MM/yyyy'),'cmartinez@hotmail.com');
INSERT INTO GR08_Persona (tipo_doc,nro_doc,apellido,nombre,fecha_nac,e_mail) VALUES(1,27999444,'Rodriguez','Alberto',to_date('03/09/1975','dd/MM/yyyy'),'r.alberto.r@hotmail.com');
INSERT INTO GR08_Persona (tipo_doc,nro_doc,apellido,nombre,fecha_nac,e_mail) VALUES(1,29997755,'Gallo','Victoria',to_date('28/07/1981','dd/MM/yyyy'),'gallovic@hotmail.com');
INSERT INTO GR08_Persona (tipo_doc,nro_doc,apellido,nombre,fecha_nac,e_mail) VALUES(1,32224455,'Torres','Paola',to_date('02/05/1985','dd/MM/yyyy'),'ptorres@outlook.com');
INSERT INTO GR08_Persona (tipo_doc,nro_doc,apellido,nombre,fecha_nac,e_mail) VALUES(1,31335566,'Lombardi','Nicolás',to_date('01/12/1984','dd/MM/yyyy'),'nico.lombardi@hotmail.com');


-- Tipo Departamento
INSERT INTO GR08_Tipo_Dpto (id_tipo_depto,cant_habitaciones,cant_banios,cant_max_huespedes) VALUES (1,1,1,2);
INSERT INTO GR08_Tipo_Dpto (id_tipo_depto,cant_habitaciones,cant_banios,cant_max_huespedes) VALUES (2,2,1,3);
INSERT INTO GR08_Tipo_Dpto (id_tipo_depto,cant_habitaciones,cant_banios,cant_max_huespedes) VALUES (3,2,2,4);
INSERT INTO GR08_Tipo_Dpto (id_tipo_depto,cant_habitaciones,cant_banios,cant_max_huespedes) VALUES (4,3,2,6);
INSERT INTO GR08_Tipo_Dpto (id_tipo_depto,cant_habitaciones,cant_banios,cant_max_huespedes) VALUES (5,3,2,8);

-- Ciudad
INSERT INTO GR08_Ciudad (cod_postal,ciudad) VALUES (7000,'Tandil');
INSERT INTO GR08_Ciudad (cod_postal,ciudad) VALUES (7600,'Mar del Plata');
INSERT INTO GR08_Ciudad (cod_postal,ciudad) VALUES (1900,'La Plata');
INSERT INTO GR08_Ciudad (cod_postal,ciudad) VALUES (7165,'Villa Gesell');
INSERT INTO GR08_Ciudad (cod_postal,ciudad) VALUES (7167,'Pinamar');

-- Departamento
INSERT INTO GR08_Departamento (id_dpto,descripcion,superficie,id_tipo_depto,tipo_doc,nro_doc,precio_noche,cod_postal) VALUES (1,'Pequeño pero moderno',40,1,1,31156181,350,7000);
INSERT INTO GR08_Departamento (id_dpto,descripcion,superficie,id_tipo_depto,tipo_doc,nro_doc,precio_noche,cod_postal) VALUES (2,'Monoambiente simple',41,1,1,30156682,370,7000);
INSERT INTO GR08_Departamento (id_dpto,descripcion,superficie,id_tipo_depto,tipo_doc,nro_doc,precio_noche,cod_postal) VALUES (3,'Mediano con buena luz',58,2,1,32176184,450,1900);
INSERT INTO GR08_Departamento (id_dpto,descripcion,superficie,id_tipo_depto,tipo_doc,nro_doc,precio_noche,cod_postal) VALUES (4,'Mediano con vista al parque',70,2,1,31789181,450,7000);
INSERT INTO GR08_Departamento (id_dpto,descripcion,superficie,id_tipo_depto,tipo_doc,nro_doc,precio_noche,cod_postal) VALUES (5,'Mediano, a 2 cuadras del centro',73,3,1,29196189,520,7600);
INSERT INTO GR08_Departamento (id_dpto,descripcion,superficie,id_tipo_depto,tipo_doc,nro_doc,precio_noche,cod_postal) VALUES (6,'Monoambiente retro',40,1,1,37159187,350,7000);
INSERT INTO GR08_Departamento (id_dpto,descripcion,superficie,id_tipo_depto,tipo_doc,nro_doc,precio_noche,cod_postal) VALUES (7,'Grande con vista al mar',108,4,1,26923182,800,7600);
INSERT INTO GR08_Departamento (id_dpto,descripcion,superficie,id_tipo_depto,tipo_doc,nro_doc,precio_noche,cod_postal) VALUES (8,'Grande, buena luz y moderno',120,5,1,25576181,920,7600);

-- Costo Departamento
INSERT INTO GR08_CostoDepto (id_dpto,fecha_desde,fecha_hasta,precio_noche) VALUES (1,to_date('20/12/2017','dd/MM/yyyy'),to_date('01/03/2018','dd/MM/yyyy'),430);
INSERT INTO GR08_CostoDepto (id_dpto,fecha_desde,fecha_hasta,precio_noche) VALUES (1,to_date('02/03/2018','dd/MM/yyyy'),to_date('19/12/2018','dd/MM/yyyy'),350);
INSERT INTO GR08_CostoDepto (id_dpto,fecha_desde,fecha_hasta,precio_noche) VALUES (2,to_date('20/12/2017','dd/MM/yyyy'),to_date('01/03/2018','dd/MM/yyyy'),450);
INSERT INTO GR08_CostoDepto (id_dpto,fecha_desde,fecha_hasta,precio_noche) VALUES (2,to_date('02/03/2018','dd/MM/yyyy'),to_date('19/12/2018','dd/MM/yyyy'),370);
INSERT INTO GR08_CostoDepto (id_dpto,fecha_desde,fecha_hasta,precio_noche) VALUES (3,to_date('20/12/2017','dd/MM/yyyy'),to_date('01/03/2018','dd/MM/yyyy'),520);
INSERT INTO GR08_CostoDepto (id_dpto,fecha_desde,fecha_hasta,precio_noche) VALUES (3,to_date('02/03/2018','dd/MM/yyyy'),to_date('19/12/2018','dd/MM/yyyy'),450);
INSERT INTO GR08_CostoDepto (id_dpto,fecha_desde,fecha_hasta,precio_noche) VALUES (4,to_date('20/12/2017','dd/MM/yyyy'),to_date('01/03/2018','dd/MM/yyyy'),550);
INSERT INTO GR08_CostoDepto (id_dpto,fecha_desde,fecha_hasta,precio_noche) VALUES (4,to_date('02/03/2018','dd/MM/yyyy'),to_date('19/12/2018','dd/MM/yyyy'),450);
INSERT INTO GR08_CostoDepto (id_dpto,fecha_desde,fecha_hasta,precio_noche) VALUES (5,to_date('20/12/2017','dd/MM/yyyy'),to_date('01/03/2018','dd/MM/yyyy'),600);
INSERT INTO GR08_CostoDepto (id_dpto,fecha_desde,fecha_hasta,precio_noche) VALUES (5,to_date('02/03/2018','dd/MM/yyyy'),to_date('19/12/2018','dd/MM/yyyy'),520);
INSERT INTO GR08_CostoDepto (id_dpto,fecha_desde,fecha_hasta,precio_noche) VALUES (6,to_date('20/12/2017','dd/MM/yyyy'),to_date('01/03/2018','dd/MM/yyyy'),400);
INSERT INTO GR08_CostoDepto (id_dpto,fecha_desde,fecha_hasta,precio_noche) VALUES (6,to_date('02/03/2018','dd/MM/yyyy'),to_date('19/12/2018','dd/MM/yyyy'),350);
INSERT INTO GR08_CostoDepto (id_dpto,fecha_desde,fecha_hasta,precio_noche) VALUES (7,to_date('20/12/2017','dd/MM/yyyy'),to_date('01/03/2018','dd/MM/yyyy'),1200);
INSERT INTO GR08_CostoDepto (id_dpto,fecha_desde,fecha_hasta,precio_noche) VALUES (7,to_date('02/03/2018','dd/MM/yyyy'),to_date('19/12/2018','dd/MM/yyyy'),800);
INSERT INTO GR08_CostoDepto (id_dpto,fecha_desde,fecha_hasta,precio_noche) VALUES (8,to_date('20/12/2017','dd/MM/yyyy'),to_date('01/03/2018','dd/MM/yyyy'),1400);
INSERT INTO GR08_CostoDepto (id_dpto,fecha_desde,fecha_hasta,precio_noche) VALUES (8,to_date('02/03/2018','dd/MM/yyyy'),to_date('19/12/2018','dd/MM/yyyy'),920);

-- Habitación
INSERT INTO GR08_Habitacion (id_dpto,id_habitacion,posib_camas_simples,posib_camas_dobles,posib_camas_kind,tv,sillon,frigobar,mesa,sillas,cocina) VALUES (1,1,2,1,0,true,0,false,true,3,true);
INSERT INTO GR08_Habitacion (id_dpto,id_habitacion,posib_camas_simples,posib_camas_dobles,posib_camas_kind,tv,sillon,frigobar,mesa,sillas,cocina) VALUES (2,1,2,1,0,true,0,false,true,3,true);
INSERT INTO GR08_Habitacion (id_dpto,id_habitacion,posib_camas_simples,posib_camas_dobles,posib_camas_kind,tv,sillon,frigobar,mesa,sillas,cocina) VALUES (3,1,3,1,1,true,0,true,true,4,true);
INSERT INTO GR08_Habitacion (id_dpto,id_habitacion,posib_camas_simples,posib_camas_dobles,posib_camas_kind,tv,sillon,frigobar,mesa,sillas,cocina) VALUES (3,2,3,1,1,true,0,true,true,4,true);
INSERT INTO GR08_Habitacion (id_dpto,id_habitacion,posib_camas_simples,posib_camas_dobles,posib_camas_kind,tv,sillon,frigobar,mesa,sillas,cocina) VALUES (4,1,3,1,0,true,0,true,true,4,true);
INSERT INTO GR08_Habitacion (id_dpto,id_habitacion,posib_camas_simples,posib_camas_dobles,posib_camas_kind,tv,sillon,frigobar,mesa,sillas,cocina) VALUES (4,2,3,1,0,true,0,true,true,4,true);
INSERT INTO GR08_Habitacion (id_dpto,id_habitacion,posib_camas_simples,posib_camas_dobles,posib_camas_kind,tv,sillon,frigobar,mesa,sillas,cocina) VALUES (5,1,2,1,1,true,1,true,true,3,true);
INSERT INTO GR08_Habitacion (id_dpto,id_habitacion,posib_camas_simples,posib_camas_dobles,posib_camas_kind,tv,sillon,frigobar,mesa,sillas,cocina) VALUES (5,2,2,1,1,true,1,true,true,3,true);
INSERT INTO GR08_Habitacion (id_dpto,id_habitacion,posib_camas_simples,posib_camas_dobles,posib_camas_kind,tv,sillon,frigobar,mesa,sillas,cocina) VALUES (6,1,2,0,0,true,0,false,true,3,true);
INSERT INTO GR08_Habitacion (id_dpto,id_habitacion,posib_camas_simples,posib_camas_dobles,posib_camas_kind,tv,sillon,frigobar,mesa,sillas,cocina) VALUES (7,1,4,1,1,true,1,true,true,4,true);
INSERT INTO GR08_Habitacion (id_dpto,id_habitacion,posib_camas_simples,posib_camas_dobles,posib_camas_kind,tv,sillon,frigobar,mesa,sillas,cocina) VALUES (7,2,2,0,0,false,0,false,false,1,false);
INSERT INTO GR08_Habitacion (id_dpto,id_habitacion,posib_camas_simples,posib_camas_dobles,posib_camas_kind,tv,sillon,frigobar,mesa,sillas,cocina) VALUES (7,3,2,0,0,false,0,false,false,1,false);
INSERT INTO GR08_Habitacion (id_dpto,id_habitacion,posib_camas_simples,posib_camas_dobles,posib_camas_kind,tv,sillon,frigobar,mesa,sillas,cocina) VALUES (8,1,2,1,1,true,1,true,true,4,true);
INSERT INTO GR08_Habitacion (id_dpto,id_habitacion,posib_camas_simples,posib_camas_dobles,posib_camas_kind,tv,sillon,frigobar,mesa,sillas,cocina) VALUES (8,2,2,1,1,true,0,false,true,4,true);
INSERT INTO GR08_Habitacion (id_dpto,id_habitacion,posib_camas_simples,posib_camas_dobles,posib_camas_kind,tv,sillon,frigobar,mesa,sillas,cocina) VALUES (8,3,2,1,1,true,0,false,true,4,true);

-- Huesped
INSERT INTO GR08_Huesped (tipo_doc,nro_doc) VALUES (1,28499199);
INSERT INTO GR08_Huesped (tipo_doc,nro_doc) VALUES (1,28856188);
INSERT INTO GR08_Huesped (tipo_doc,nro_doc) VALUES (1,26886654);
INSERT INTO GR08_Huesped (tipo_doc,nro_doc) VALUES (1,27999444);
INSERT INTO GR08_Huesped (tipo_doc,nro_doc) VALUES (1,29997755);

-- Reservas
INSERT INTO GR08_Reserva (id_reserva,fecha_reserva,fecha_desde,fecha_hasta,tipo,id_dpto,valor_noche,limpieza,tipo_doc,nro_doc) VALUES (1,to_date('22/12/2017','dd/MM/yyyy'),to_date('24/12/2017','dd/MM/yyyy'),to_date('02/01/2018','dd/MM/yyyy'),'Internet',1,430,false,1,28499199);
INSERT INTO GR08_Reserva (id_reserva,fecha_reserva,fecha_desde,fecha_hasta,tipo,id_dpto,valor_noche,limpieza,tipo_doc,nro_doc) VALUES (2,to_date('05/01/2018','dd/MM/yyyy'),to_date('06/01/2017','dd/MM/yyyy'),to_date('10/01/2018','dd/MM/yyyy'),'Internet',2,450,false,1,28856188);
INSERT INTO GR08_Reserva (id_reserva,fecha_reserva,fecha_desde,fecha_hasta,tipo,id_dpto,valor_noche,limpieza,tipo_doc,nro_doc) VALUES (3,to_date('06/01/2018','dd/MM/yyyy'),to_date('12/01/2018','dd/MM/yyyy'),to_date('18/01/2018','dd/MM/yyyy'),'Internet',3,520,false,1,26886654);
INSERT INTO GR08_Reserva (id_reserva,fecha_reserva,fecha_desde,fecha_hasta,tipo,id_dpto,valor_noche,limpieza,tipo_doc,nro_doc) VALUES (4,to_date('02/02/2018','dd/MM/yyyy'),to_date('05/02/2018','dd/MM/yyyy'),to_date('07/02/2018','dd/MM/yyyy'),'Internet',3,520,false,1,27999444);
INSERT INTO GR08_Reserva (id_reserva,fecha_reserva,fecha_desde,fecha_hasta,tipo,id_dpto,valor_noche,limpieza,tipo_doc,nro_doc) VALUES (5,to_date('02/04/2018','dd/MM/yyyy'),to_date('03/04/2018','dd/MM/yyyy'),to_date('15/04/2018','dd/MM/yyyy'),'Internet',8,920,true,1,29997755);

--Estado Luego Ocupación
INSERT INTO GR08_EstadoLuegoOcupacion (id_reserva,fecha,comentario) VALUES (1,to_date('02/01/2018','dd/MM/yyyy'),'Todo en condiciones normales');
INSERT INTO GR08_EstadoLuegoOcupacion (id_reserva,fecha,comentario) VALUES (2,to_date('10/01/2018','dd/MM/yyyy'),'Todo en condiciones normales');
INSERT INTO GR08_EstadoLuegoOcupacion (id_reserva,fecha,comentario) VALUES (3,to_date('18/01/2018','dd/MM/yyyy'),'Una silla rota');
INSERT INTO GR08_EstadoLuegoOcupacion (id_reserva,fecha,comentario) VALUES (4,to_date('07/02/2018','dd/MM/yyyy'),'Baño tapado');
INSERT INTO GR08_EstadoLuegoOcupacion (id_reserva,fecha,comentario) VALUES (5,to_date('15/04/2018','dd/MM/yyyy'),'Espejo roto. Baño sucio');

--Tipos de Pago
INSERT INTO GR08_Tipo_Pago (id_tipo_pago, empresa) VALUES (1,'Efectivo');
INSERT INTO GR08_Tipo_Pago (id_tipo_pago, empresa) VALUES (2,'Visa');
INSERT INTO GR08_Tipo_Pago (id_tipo_pago, empresa) VALUES (3,'Mastercard');
INSERT INTO GR08_Tipo_Pago (id_tipo_pago, empresa) VALUES (4,'Cabal');
INSERT INTO GR08_Tipo_Pago (id_tipo_pago, empresa) VALUES (5,'Cheque');

--Pagos
INSERT INTO GR08_Pago (fecha_pago,id_reserva,id_tipo_pago,comentario,importe) VALUES (to_date('22/12/2017','dd/MM/yyyy'),1,2,'Todo OK',430);
INSERT INTO GR08_Pago (fecha_pago,id_reserva,id_tipo_pago,comentario,importe) VALUES (to_date('05/01/2018','dd/MM/yyyy'),2,2,'Todo OK',450);
INSERT INTO GR08_Pago (fecha_pago,id_reserva,id_tipo_pago,comentario,importe) VALUES (to_date('06/01/2018','dd/MM/yyyy'),3,2,'Todo OK',520);
INSERT INTO GR08_Pago (fecha_pago,id_reserva,id_tipo_pago,comentario,importe) VALUES (to_date('02/02/2018','dd/MM/yyyy'),4,2,'Todo OK',520);
INSERT INTO GR08_Pago (fecha_pago,id_reserva,id_tipo_pago,comentario,importe) VALUES (to_date('02/04/2018','dd/MM/yyyy'),5,2,'Todo OK',920);


-- Huesped x Reserva
INSERT INTO GR08_Huesped_Reserva (tipo_doc,nro_doc,id_reserva) VALUES (1,28499199,1);
INSERT INTO GR08_Huesped_Reserva (tipo_doc,nro_doc,id_reserva) VALUES (1,28856188,2);
INSERT INTO GR08_Huesped_Reserva (tipo_doc,nro_doc,id_reserva) VALUES (1,26886654,3);
INSERT INTO GR08_Huesped_Reserva (tipo_doc,nro_doc,id_reserva) VALUES (1,27999444,4);
INSERT INTO GR08_Huesped_Reserva (tipo_doc,nro_doc,id_reserva) VALUES (1,29997755,5);

-- Comentario
INSERT INTO GR08_Comentario (tipo_doc,nro_doc,id_reserva,fecha_hora_comentario,comentario,estrellas) VALUES (1,28499199,1,to_date('03/01/2018','dd/MM/yyyy'),'Excelente Depto',4);
INSERT INTO GR08_Comentario (tipo_doc,nro_doc,id_reserva,fecha_hora_comentario,comentario,estrellas) VALUES (1,28856188,2,to_date('11/01/2018','dd/MM/yyyy'),'Muy limpor, Todo OK',4);
INSERT INTO GR08_Comentario (tipo_doc,nro_doc,id_reserva,fecha_hora_comentario,comentario,estrellas) VALUES (1,26886654,3,to_date('19/01/2018','dd/MM/yyyy'), 'Super Recomendable. para pasar el finde',5);
INSERT INTO GR08_Comentario (tipo_doc,nro_doc,id_reserva,fecha_hora_comentario,comentario,estrellas) VALUES (1,27999444,4,to_date('08/02/2018','dd/MM/yyyy'),'Está bien, algo dejado. Pero no volvería.',2);
INSERT INTO GR08_Comentario (tipo_doc,nro_doc,id_reserva,fecha_hora_comentario,comentario,estrellas) VALUES (1,29997755,5,to_date('15/04/2018','dd/MM/yyyy'),'Super ampli y limpo. Todo en execelentes condiciones',5);
--***********************************************************************************************************
--***********************************************************************************************************
-- RESTRICTIONS

-- Que las fechas de las reservas sean consistentes, 
-- es decir que la fecha de inicio de la reserva sea menor que la fecha de finalización.
 ALTER TABLE GR08_Reserva
     ADD CONSTRAINT CK_GR08_ReservaFechas CHECK (fecha_desde < fecha_hasta);

-- Que el detalle de las habitaciones sea consistente con el tipo de departamento, 
-- es decir que si el tipo de departamento es de 2 habitaciones, 
-- en el detalle se consideren como máximo 2 habitaciones.

/*
CREATE ASSERTION CK_GR08_CANTIDAD_HABITACIONES
CHECK NOT EXISTS
(SELECT 1
    FROM GR08_Departamento d
    JOIN GR08_Tipo_Dpto t ON (d.id_tipo_depto = t.id_tipo_depto)
    WHERE t.cant_habitaciones > 
        (SELECT COUNT(*)
         FROM GR08_Habitacion h WHERE d.id_dpto = h.id_dpt);
*/

CREATE OR REPLACE FUNCTION TRFN_GR08_CK_CANTIDAD_HABITACIONES() RETURNS trigger
AS $$
BEGIN
    IF(EXISTS 
    (SELECT 1
    FROM GR08_Departamento d
    JOIN GR08_Tipo_Dpto t ON (d.id_tipo_depto = t.id_tipo_depto)
    WHERE t.cant_habitaciones = 
        (SELECT COUNT(*)
         FROM GR08_Habitacion h WHERE d.id_dpto = h.id_dpto
    ))) THEN
    RAISE EXCEPTION 'Departamento con cantidad de habitaciones inconrrectas';
END IF;
RETURN new;
END; $$ LANGUAGE plpgsql;


CREATE TRIGGER TR_GR08_CK_CANTIDAD_HABITACIONES 
  BEFORE INSERT OR DELETE ON GR08_Habitacion FOR EACH ROW EXECUTE PROCEDURE TRFN_GR08_CK_CANTIDAD_HABITACIONES();



-- Que tanto la persona que realiza la reserva 
-- como los huéspedes no sea el propietario del departamento.

/*
CREATE ASSERTION CK_GR08_PROPIETARIO
    CHECK NOT EXISTS (
        SELECT 1 FROM GR08_Departamento d
        JOIN GR08_Reserva r ON (d.tipo_doc = r.tipo_doc AND d.nro_doc = r.nro_doc);
);
*/

CREATE OR REPLACE FUNCTION TRFN_GR08_CK_RESERVA () RETURNS trigger
AS $$
BEGIN
    IF(EXISTS (
        SELECT 1 FROM GR08_Departamento d
        JOIN GR08_Reserva r ON (d.tipo_doc = NEW.tipo_doc AND d.nro_doc = NEW.nro_doc)
    )) THEN
    RAISE EXCEPTION 'El propietario del Departamento no puede realizar una reserva a su Departamento';
END IF;
RETURN new;
END; $$ LANGUAGE plpgsql;

CREATE TRIGGER TR_GR08_CK_RESERVA  
 	 AFTER INSERT OR UPDATE ON GR08_Reserva FOR EACH ROW EXECUTE PROCEDURE TRFN_GR08_CK_RESERVA();


-- Que la cantidad de huéspedes no supere 
-- la cantidad máxima de personas permitidas para una reserva.

/*
CREATE ASSERTION CK_GR08_MAX_HUESPEDES
    CHECK NOT EXISTS (
        SELECT 1 FROM GR08_Tipo_Depto t 
        JOIN GR08_Departamento d ON (t.tipo_dpto = d.id_tipo_dpto)
        WHERE t.cant_max_huespedes > (
            SELECT COUNT(*) 
            FROM GR08_Persona p 
            JOIN GR08_Huesped h ON ((h.tipo_doc = p.tipo_doc AND h.nro_doc = p.nro_doc)
        )
);
*/

-- CREATE OR REPLACE FUNCTION TRFN_GR08_CK_MAX_HUESPEDES () RETURNS trigger
-- AS $$
-- BEGIN
--     IF(EXISTS (
--        SELECT 1 FROM GR08_Tipo_Depto t 
--         JOIN GR08_Departamento d ON (t.tipo_dpto = d.id_tipo_dpto)
--         WHERE t.cant_max_huespedes > (
--             SELECT COUNT(*) 
--             FROM GR08_Persona p 
--             JOIN GR08_Huesped_Reserva hr ON ((hr.tipo_doc = p.tipo_doc AND hr.nro_doc = p.nro_doc)
--     )))) THEN
--     RAISE EXCEPTION 'Departamento ocupado';
-- END IF;
-- RETURN new;
-- END; $$ LANGUAGE plpgsql;

-- CREATE TRIGGER TR_GR08_CK_MAX_HUESPEDES 
--  	 AFTER INSERT ON GR08_Reserva FOR EACH ROW EXECUTE PROCEDURE TRFN_GR08_CK_MAX_HUESPEDES();

-- ****************************************************************************************
-- ****************************************************************************************

-- SERVICES

-- Por cada departamento en el sistema,
-- el estado en una fecha determinada, esto es si el mismo está Ocupado o Libre.

CREATE OR REPLACE FUNCTION TRFN_GR08_DEPARTAMENTO_ESTADO(_fecha date, _id_dpto int) 
RETURNS varchar(40) AS $$
BEGIN
    IF(EXISTS (
        SELECT 1
        FROM GR08_Reserva r 
        WHERE _id_dpto = r.id_dpto AND  _fecha BETWEEN r.fecha_desde and r.fecha_hasta)) THEN
        RETURN 'Ocupado';
    END IF;
RETURN 'Libre';
END;
$$ LANGUAGE plpgsql;

-- Dada una rango de fechas y una ciudad, 
-- devuelva una lista de departamentos disponibles.

CREATE OR REPLACE FUNCTION TRFN_GR08_DEPARTAMENTO_BY_FECHA_CIUDAD(_fecha_desde date, _fecha_hasta date, _ciudad int) 
RETURNS TABLE (id_dpto int, descripcion varchar(80), superficie decimal(10,2), precio_noche decimal(10,2), cod_postal int, ciudad varchar(30)) AS $$
BEGIN
        RETURN QUERY
        SELECT d.id_dpto, d.descripcion, d.superficie, d.precio_noche, c.cod_postal, c.ciudad 
        FROM GR08_Reserva r
        JOIN GR08_Departamento d ON (d.id_dpto = r.id_dpto)
        JOIN GR08_Ciudad c ON (_ciudad = c.cod_postal)
    WHERE r.fecha_desde >= _fecha_desde AND r.fecha_hasta <= _fecha_hasta
    GROUP BY d.id_dpto,c.cod_postal; 
END;
$$ LANGUAGE plpgsql;


-- Dado un DeptoID y un Mes (Fecha Desde y Hasta), Devolver todos los días del mes que están disponibles
CREATE OR REPLACE FUNCTION TRFN_GR08_DEPARTAMENTO_FECHAS_DISPONIBLES (_id_dpto int,_fecha_desde date, _fecha_hasta date) 
 RETURNS TABLE (fecha date)AS $$
BEGIN
   
END;
$$ LANGUAGE plpgsql;

-- ****************************************************************************************
-- ****************************************************************************************

-- VIEWS

-- Devuelva un listado de todos los departamentos del sistema 
-- junto con la recaudación de los mismos en los últimos 6 meses.

CREATE VIEW GR08_RECAUDACION_ULTIMOS_6_MESES AS (
    SELECT d.*, SUM(p.importe) as total FROM GR08_Departamento d
    JOIN GR08_Reserva r ON (r.id_dpto = d.id_dpto)
    JOIN GR08_Pago p ON (p.id_reserva = r.id_reserva)
    WHERE p.fecha_pago <= NOW() AND p.fecha_pago > NOW() - interval '6 month'
    GROUP BY 1,2
);