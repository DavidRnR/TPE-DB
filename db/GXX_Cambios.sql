-- Que las fechas de las reservas sean consistentes, 
-- es decir que la fecha de inicio de la reserva sea menor que la fecha de finalización.
ALTER TABLE GXX_Reserva
    ADD CONSTRAINT CK_GXX_ReservaFechas CHECK (fecha_desde < fecha_hasta);

-- Que el detalle de las habitaciones sea consistente con el tipo de departamento, 
-- es decir que si el tipo de departamento es de 2 habitaciones, 
-- en el detalle se consideren como máximo 2 habitaciones.
CREATE ASSERTION CK_GXX_CANTIDAD_HABITACIONES
CHECK NOT EXISTS
(SELECT 1
    FROM GXX_Departamento d
    JOIN GXX_Tipo_Dpto t ON (d.id_tipo_depto = t.id_tipo_depto)
    WHERE t.cant_habitaciones > 
        (SELECT COUNT(*)
         FROM GXX_Habitacion h WHERE d.id_dpto = h.id_dpt);

CREATE OR REPLACE FUNCTION FN_GXX_CK_CANTIDAD_HABITACIONES() RETURNS trigger
AS $$
BEGIN
    IF(EXISTS (
    SELECT 1
    FROM GXX_Departamento d
    JOIN GXX_Tipo_Dpto t ON (NEW.d.id_tipo_depto = t.id_tipo_depto)
    WHERE t.cant_habitaciones > 
        (SELECT COUNT(*)
         FROM GXX_Habitacion h WHERE NEW.d.id_dpto = h.id_dpto
    )) THEN
    RAISE EXCEPTION 'Departamento con cantidad de habitaciones inconrrectas'
END IF;
RETURN new;
END; $$ LANGUAGE plpgsql;


CREATE TRIGGER TR_GXX_CK_CANTIDAD_HABITACIONES ON 
 	 AFTER INSERT OR DELETE OF GXX_Habitacion FOR EACH ROW EXECUTE PROCEDURE FN_GXX_CK_CANTIDAD_HABITACIONES();



-- Que tanto la persona que realiza la reserva 
-- como los huéspedes no sea el propietario del departamento.
CREATE ASSERTION CK_GXX_PROPIETARIO
    CHECK NOT EXISTS (
        SELECT 1 FROM GXX_Departamento d
        JOIN GXX_Reserva r ON (d.tipo_doc = r.tipo_doc AND d.nro_doc = r.nro_doc);
);

CREATE OR REPLACE FUNCTION FN_GXX_CK_RESERVA () RETURNS trigger
AS $$
BEGIN
    IF(EXISTS (
        SELECT 1 FROM GXX_Departamento d
        JOIN GXX_Reserva r ON (d.tipo_doc = NEW.r.tipo_doc AND d.nro_doc = NEW.r.nro_doc);
    ) THEN
    RAISE EXCEPTION 'El propietario del Departamento no puede realizar una reserva'
END IF;
RETURN new;
END; $$ LANGUAGE plpgsql;

CREATE TRIGGER TR_GXX_CK_RESERVA ON 
 	 AFTER INSERT OR UPDATE OF GXX_Reserva FOR EACH ROW EXECUTE PROCEDURE FN_GXX_CK_RESERVA();


-- Que la cantidad de huéspedes no supere 
-- la cantidad máxima de personas permitidas para una reserva.
CREATE ASSERTION CK_GXX_MAX_HUESPEDES
    CHECK NOT EXISTS (
        SELECT 1 FROM GXX_Tipo_Depto t 
        JOIN GXX_Departamento d ON (t.tipo_dpto = d.id_tipo_dpto)
        WHERE t.cant_max_huespedes > (
            SELECT COUNT(*) 
            FROM GXX_Persona p 
            JOIN GXX_Huesped h ON ((h.tipo_doc = p.tipo_doc AND h.nro_doc = p.nro_doc)
        )
);

CREATE OR REPLACE FUNCTION FN_GXX_CK_MAX_HUESPEDES () RETURNS trigger
AS $$
BEGIN
    IF(EXISTS (
       SELECT 1 FROM GXX_Tipo_Depto t 
        JOIN GXX_Departamento d ON (t.tipo_dpto = d.id_tipo_dpto)
        WHERE t.cant_max_huespedes > (
            SELECT COUNT(*) 
            FROM GXX_Persona p 
            JOIN GXX_Huesped h ON ((h.tipo_doc = p.tipo_doc AND h.nro_doc = p.nro_doc)
    ) THEN
    RAISE EXCEPTION 'Departamento ocupado'
END IF;
RETURN new;
END; $$ LANGUAGE plpgsql;

CREATE TRIGGER TR_GXX_CK_MAX_HUESPEDES ON 
 	 AFTER INSERT OF GXX_Reserva FOR EACH ROW EXECUTE PROCEDURE FN_GXX_CK_MAX_HUESPEDES();