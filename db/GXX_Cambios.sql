-- DROP TABLE
DROP TABLE IF EXISTS GRXX_Huesped_Reserva CASCADE;
DROP TABLE IF EXISTS GRXX_Huesped CASCADE;

-- CREATE TABLE

-- Table: GRXX_Tipo_Documento
CREATE TABLE GRXX_Tipo_Documento (
    id_tipo_doc int NOT NULL,
    tipo varchar(6) NOT NULL,
    CONSTRAINT PK_GRXX_Tipo_Documento PRIMARY KEY (id_tipo_doc)
);

CREATE TABLE GRXX_Huesped (
    tipo_doc int NOT NULL,
    nro_doc char(8)  NOT NULL,
    id_reserva int  NOT NULL,
    CONSTRAINT PK_GRXX_Huesped_Reserva PRIMARY KEY (tipo_doc,nro_doc,id_reserva)
);

-- CREATE TABLE
CREATE TABLE GRXX_Ciudad (
    cod_postal int NOT NULL,
    nombre varchar(30) NOT NULL,
    CONSTRAINT PK_GRXX_Ciudad PRIMARY KEY (cod_postal)
);

-- ALTER TABLES
-- -- FK_GRXX_Persona_Tipo_Doc
ALTER TABLE GRXX_Persona ADD CONSTRAINT FK_GRXX_Persona_Tipo_Doc
    FOREIGN KEY (tipo_doc)
    REFERENCES GRXX_Tipo_Documento (id_tipo_doc)  
;

-- FK_GRXX_Huesped_Reserva - FK_GRXX_Huesped_Persona
 ALTER TABLE GRXX_Huesped 
    ADD CONSTRAINT FK_GRXX_Huesped_Reserva FOREIGN KEY (id_reserva) REFERENCES GRXX_Reserva (id_reserva),
    ADD CONSTRAINT FK_GRXX_Huesped_Persona FOREIGN KEY (tipo_doc,nro_doc) REFERENCES GRXX_Persona (tipo_doc,nro_doc)  
;

-- Agregar la columna cod_postal Departamento
-- FK_GRXX_Ciudad
ALTER TABLE GRXX_Departamento
    DROP COLUMN precio_noche,
    ADD COLUMN cod_postal int NOT NULL,
    ADD CONSTRAINT FK_GRXX_Ciudad FOREIGN KEY (cod_postal) REFERENCES GRXX_Ciudad (cod_postal);

--***********************************************************************************************************
--***********************************************************************************************************
-- INSERTS
-- Tipos Documento
INSERT INTO GRXX_Tipo_Documento (id_tipo_doc,tipo) VALUES (1, 'DNI');
INSERT INTO GRXX_Tipo_Documento (id_tipo_doc,tipo) VALUES (2, 'LE');

-- Personas
INSERT INTO GRXX_Persona (tipo_doc,nro_doc,apellido,nombre,fecha_nac,e_mail) VALUES(1,31156181,'Martín','David',to_date('28/12/1984','dd/MM/yyyy'),'dmartin@gmail.com');
INSERT INTO GRXX_Persona (tipo_doc,nro_doc,apellido,nombre,fecha_nac,e_mail) VALUES(1,30156682,'Pérez','Laura',to_date('08/03/1983','dd/MM/yyyy'),'lauperez@gmail.com');
INSERT INTO GRXX_Persona (tipo_doc,nro_doc,apellido,nombre,fecha_nac,e_mail) VALUES(1,32176184,'García','Diana',to_date('18/04/1986','dd/MM/yyyy'),'dgarcia@hotmail.com');
INSERT INTO GRXX_Persona (tipo_doc,nro_doc,apellido,nombre,fecha_nac,e_mail) VALUES(1,31789181,'Gómez','Jorge',to_date('22/07/1984','dd/MM/yyyy'),'jorgeg_o@gmail.com');
INSERT INTO GRXX_Persona (tipo_doc,nro_doc,apellido,nombre,fecha_nac,e_mail) VALUES(1,29196189,'González','Juan',to_date('14/07/1982','dd/MM/yyyy'),'gonzajuan@gmail.com');
INSERT INTO GRXX_Persona (tipo_doc,nro_doc,apellido,nombre,fecha_nac,e_mail) VALUES(1,37159187,'Del Potro','Pedro',to_date('10/09/1993','dd/MM/yyyy'),'delpop@putlook.com');
INSERT INTO GRXX_Persona (tipo_doc,nro_doc,apellido,nombre,fecha_nac,e_mail) VALUES(1,26923182,'Ferrari','Carolina',to_date('09/08/1976','dd/MM/yyyy'),'fcarolina@gmail.com');
INSERT INTO GRXX_Persona (tipo_doc,nro_doc,apellido,nombre,fecha_nac,e_mail) VALUES(1,25576181,'Pirlo','Paola',to_date('19/08/1974','dd/MM/yyyy'),'ppirlo@gmail.com');
INSERT INTO GRXX_Persona (tipo_doc,nro_doc,apellido,nombre,fecha_nac,e_mail) VALUES(1,26456181,'Tangorra','Paula',to_date('21/05/1976','dd/MM/yyyy'),'tpaula@hotmail.com');

-- Tipo Departamento
INSERT INTO GRXX_Tipo_Dpto (id_tipo_depto,cant_habitaciones,cant_banios,cant_max_huespedes) VALUES (1,1,1,2);
INSERT INTO GRXX_Tipo_Dpto (id_tipo_depto,cant_habitaciones,cant_banios,cant_max_huespedes) VALUES (2,2,1,3);
INSERT INTO GRXX_Tipo_Dpto (id_tipo_depto,cant_habitaciones,cant_banios,cant_max_huespedes) VALUES (3,2,2,4);
INSERT INTO GRXX_Tipo_Dpto (id_tipo_depto,cant_habitaciones,cant_banios,cant_max_huespedes) VALUES (4,3,2,6);
INSERT INTO GRXX_Tipo_Dpto (id_tipo_depto,cant_habitaciones,cant_banios,cant_max_huespedes) VALUES (5,3,2,8);

-- Ciudad
INSERT INTO GRXX_Ciudad (cod_postal,nombre) VALUES (7000,'Tandil');
INSERT INTO GRXX_Ciudad (cod_postal,nombre) VALUES (7600,'Mar del Plata');
INSERT INTO GRXX_Ciudad (cod_postal,nombre) VALUES (1900,'La Plata');
INSERT INTO GRXX_Ciudad (cod_postal,nombre) VALUES (7165,'Villa Gesell');
INSERT INTO GRXX_Ciudad (cod_postal,nombre) VALUES (7167,'Pinamar');

-- Departamento
INSERT INTO GRXX_Departamento (id_dpto,descripcion,superficie,id_tipo_depto,tipo_doc,nro_doc,cod_postal) VALUES (1,'Pequeño pero moderno',40,1,1,31156181,7000);
INSERT INTO GRXX_Departamento (id_dpto,descripcion,superficie,id_tipo_depto,tipo_doc,nro_doc,cod_postal) VALUES (2,'Monoambiente simple',41,1,1,30156682,7000);
INSERT INTO GRXX_Departamento (id_dpto,descripcion,superficie,id_tipo_depto,tipo_doc,nro_doc,cod_postal) VALUES (3,'Mediano con buena luz',58,2,1,32176184,1900);
INSERT INTO GRXX_Departamento (id_dpto,descripcion,superficie,id_tipo_depto,tipo_doc,nro_doc,cod_postal) VALUES (4,'Mediano con vista al parque',70,2,1,31156181,7000);
INSERT INTO GRXX_Departamento (id_dpto,descripcion,superficie,id_tipo_depto,tipo_doc,nro_doc,cod_postal) VALUES (5,'Mediano, a 2 cuadras del centro',73,3,1,26456181,7600);
INSERT INTO GRXX_Departamento (id_dpto,descripcion,superficie,id_tipo_depto,tipo_doc,nro_doc,cod_postal) VALUES (6,'Monoambiente retro',40,1,1,31156181,7000);
INSERT INTO GRXX_Departamento (id_dpto,descripcion,superficie,id_tipo_depto,tipo_doc,nro_doc,cod_postal) VALUES (7,'Grande con vista al mar',108,4,1,31156181,7600);
INSERT INTO GRXX_Departamento (id_dpto,descripcion,superficie,id_tipo_depto,tipo_doc,nro_doc,cod_postal) VALUES (8,'Grande, buena luz y moderno',120,5,1,37159187,7600);

--***********************************************************************************************************
--***********************************************************************************************************
-- RESTRICTIONS

-- Que las fechas de las reservas sean consistentes, 
-- es decir que la fecha de inicio de la reserva sea menor que la fecha de finalización.
-- ALTER TABLE GRXX_Reserva
--     ADD CONSTRAINT CK_GRXX_ReservaFechas CHECK (fecha_desde < fecha_hasta);

-- Que el detalle de las habitaciones sea consistente con el tipo de departamento, 
-- es decir que si el tipo de departamento es de 2 habitaciones, 
-- en el detalle se consideren como máximo 2 habitaciones.

/*
CREATE ASSERTION CK_GRXX_CANTIDAD_HABITACIONES
CHECK NOT EXISTS
(SELECT 1
    FROM GRXX_Departamento d
    JOIN GRXX_Tipo_Dpto t ON (d.id_tipo_depto = t.id_tipo_depto)
    WHERE t.cant_habitaciones > 
        (SELECT COUNT(*)
         FROM GRXX_Habitacion h WHERE d.id_dpto = h.id_dpt);
*/

-- CREATE OR REPLACE FUNCTION TRFN_GRXX_CK_CANTIDAD_HABITACIONES() RETURNS trigger
-- AS $$
-- BEGIN
--     IF(EXISTS (
--     SELECT 1
--     FROM GRXX_Departamento d
--     JOIN GRXX_Tipo_Dpto t ON (NEW.d.id_tipo_depto = t.id_tipo_depto)
--     WHERE t.cant_habitaciones > 
--         (SELECT COUNT(*)
--          FROM GRXX_Habitacion h WHERE NEW.d.id_dpto = h.id_dpto
--     )) THEN
--     RAISE EXCEPTION 'Departamento con cantidad de habitaciones inconrrectas'
-- END IF;
-- RETURN new;
-- END; $$ LANGUAGE plpgsql;


-- CREATE TRIGGER TR_GRXX_CK_CANTIDAD_HABITACIONES ON 
--  	 AFTER INSERT OR DELETE OF GRXX_Habitacion FOR EACH ROW EXECUTE PROCEDURE TRFN_GRXX_CK_CANTIDAD_HABITACIONES();



-- Que tanto la persona que realiza la reserva 
-- como los huéspedes no sea el propietario del departamento.

/*
CREATE ASSERTION CK_GRXX_PROPIETARIO
    CHECK NOT EXISTS (
        SELECT 1 FROM GRXX_Departamento d
        JOIN GRXX_Reserva r ON (d.tipo_doc = r.tipo_doc AND d.nro_doc = r.nro_doc);
);
*/

-- CREATE OR REPLACE FUNCTION TRFN_GRXX_CK_RESERVA () RETURNS trigger
-- AS $$
-- BEGIN
--     IF(EXISTS (
--         SELECT 1 FROM GRXX_Departamento d
--         JOIN GRXX_Reserva r ON (d.tipo_doc = NEW.r.tipo_doc AND d.nro_doc = NEW.r.nro_doc);
--     ) THEN
--     RAISE EXCEPTION 'El propietario del Departamento no puede realizar una reserva'
-- END IF;
-- RETURN new;
-- END; $$ LANGUAGE plpgsql;

-- CREATE TRIGGER TR_GRXX_CK_RESERVA ON 
--  	 AFTER INSERT OR UPDATE OF GRXX_Reserva FOR EACH ROW EXECUTE PROCEDURE TRFN_GRXX_CK_RESERVA();


-- Que la cantidad de huéspedes no supere 
-- la cantidad máxima de personas permitidas para una reserva.

/*
CREATE ASSERTION CK_GRXX_MAX_HUESPEDES
    CHECK NOT EXISTS (
        SELECT 1 FROM GRXX_Tipo_Depto t 
        JOIN GRXX_Departamento d ON (t.tipo_dpto = d.id_tipo_dpto)
        WHERE t.cant_max_huespedes > (
            SELECT COUNT(*) 
            FROM GRXX_Persona p 
            JOIN GRXX_Huesped h ON ((h.tipo_doc = p.tipo_doc AND h.nro_doc = p.nro_doc)
        )
);
*/

-- CREATE OR REPLACE FUNCTION TRFN_GRXX_CK_MAX_HUESPEDES () RETURNS trigger
-- AS $$
-- BEGIN
--     IF(EXISTS (
--        SELECT 1 FROM GRXX_Tipo_Depto t 
--         JOIN GRXX_Departamento d ON (t.tipo_dpto = d.id_tipo_dpto)
--         WHERE t.cant_max_huespedes > (
--             SELECT COUNT(*) 
--             FROM GRXX_Persona p 
--             JOIN GRXX_Huesped h ON ((h.tipo_doc = p.tipo_doc AND h.nro_doc = p.nro_doc)
--     ) THEN
--     RAISE EXCEPTION 'Departamento ocupado'
-- END IF;
-- RETURN new;
-- END; $$ LANGUAGE plpgsql;

-- CREATE TRIGGER TR_GRXX_CK_MAX_HUESPEDES ON 
--  	 AFTER INSERT OF GRXX_Reserva FOR EACH ROW EXECUTE PROCEDURE TRFN_GRXX_CK_MAX_HUESPEDES();

-- ****************************************************************************************
-- ****************************************************************************************

-- SERVICES

-- Por cada departamento en el sistema,
-- el estado en una fecha determinada, esto es si el mismo está Ocupado o Libre.

-- // TODO 

-- Dada una rango de fechas y una ciudad, 
-- devuelva una lista de departamentos disponibles.

-- // TODO

-- ****************************************************************************************
-- ****************************************************************************************

-- VIEWS

-- Devuelva un listado de todos los departamentos del sistema 
-- junto con la recaudación de los mismos en los últimos 6 meses.

-- CREATE VIEW GRXX_RECAUDACION AS (
--     SELECT d.*, SUM(p.importe) FROM GRXX_Departamento d
--     JOIN GRXX_Reserva r ON (r.id_dpto = d.id_dpto)
--     JOIN GRXX_Pago p ON (p.id_reserva = r.id_reserva)
--     WHERE p.fecha_pago <= NOW() AND p.fecha_pago > NOW() - interval '6 month'
--     GROUP BY 1,2;
-- );