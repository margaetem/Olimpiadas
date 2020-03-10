-- Generado por Oracle SQL Developer Data Modeler 19.4.0.350.1424
--   en:        2020-03-10 11:02:05 PDT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



CREATE TABLE comisario (
    id_comisario     INTEGER NOT NULL,
    nombrecomisario  VARCHAR2(100 CHAR)
);

ALTER TABLE comisario ADD CONSTRAINT comisario_pk PRIMARY KEY ( id_comisario );

CREATE TABLE complejodeportivo (
    id_complejo     INTEGER NOT NULL,
    nombrecomplejo  VARCHAR2(100 CHAR),
    sede_id_sede    INTEGER NOT NULL
);

ALTER TABLE complejodeportivo ADD CONSTRAINT complejodeportivo_pk PRIMARY KEY ( id_complejo );

CREATE TABLE deporte (
    id_deporte     INTEGER NOT NULL,
    nombredeporte  VARCHAR2(100 CHAR)
);

ALTER TABLE deporte ADD CONSTRAINT deporte_pk PRIMARY KEY ( id_deporte );

CREATE TABLE equipamiento (
    id_equipamiento     INTEGER NOT NULL,
    nombreequipamiento  VARCHAR2(100 CHAR)
);

ALTER TABLE equipamiento ADD CONSTRAINT equipamiento_pk PRIMARY KEY ( id_equipamiento );

CREATE TABLE evento (
    id_evento                     INTEGER NOT NULL,
    fecha                         DATE,
    duracion                      INTEGER,
    numeroparticipantes           INTEGER,
    localizacion_id_localizacion  INTEGER NOT NULL,
    localizacion_id_complejo      INTEGER NOT NULL,
    deporte_id_deporte            INTEGER NOT NULL
);

ALTER TABLE evento ADD CONSTRAINT evento_pk PRIMARY KEY ( id_evento );

CREATE TABLE localizacion (
    id_localizacion                INTEGER NOT NULL,
    nombrelocalizacion             VARCHAR2(100 CHAR),
    complejodeportivo_id_complejo  INTEGER NOT NULL
);

ALTER TABLE localizacion ADD CONSTRAINT localizacion_pk PRIMARY KEY ( id_localizacion,
                                                                      complejodeportivo_id_complejo );

CREATE TABLE relation_1 (
    evento_id_evento        INTEGER NOT NULL,
    comisario_id_comisario  INTEGER NOT NULL,
    tarea                   CHAR(1)
);

ALTER TABLE relation_1 ADD CONSTRAINT relation_1_pk PRIMARY KEY ( evento_id_evento,
                                                                  comisario_id_comisario );

CREATE TABLE relation_6 (
    deporte_id_deporte            INTEGER NOT NULL,
    equipamiento_id_equipamiento  INTEGER NOT NULL
);

ALTER TABLE relation_6 ADD CONSTRAINT relation_6_pk PRIMARY KEY ( deporte_id_deporte,
                                                                  equipamiento_id_equipamiento );

CREATE TABLE sede (
    id_sede          INTEGER NOT NULL,
    nombresede       VARCHAR2(100 CHAR),
    numerocomplejos  INTEGER,
    presupuesto      FLOAT(2)
);

ALTER TABLE sede ADD CONSTRAINT sede_pk PRIMARY KEY ( id_sede );

ALTER TABLE complejodeportivo
    ADD CONSTRAINT complejodeportivo_sede_fk FOREIGN KEY ( sede_id_sede )
        REFERENCES sede ( id_sede );

ALTER TABLE evento
    ADD CONSTRAINT evento_deporte_fk FOREIGN KEY ( deporte_id_deporte )
        REFERENCES deporte ( id_deporte );

ALTER TABLE evento
    ADD CONSTRAINT evento_localizacion_fk FOREIGN KEY ( localizacion_id_localizacion,
                                                        localizacion_id_complejo )
        REFERENCES localizacion ( id_localizacion,
                                  complejodeportivo_id_complejo );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE localizacion
    ADD CONSTRAINT localizacion_complejodeportivo_fk FOREIGN KEY ( complejodeportivo_id_complejo )
        REFERENCES complejodeportivo ( id_complejo );

ALTER TABLE relation_1
    ADD CONSTRAINT relation_1_comisario_fk FOREIGN KEY ( comisario_id_comisario )
        REFERENCES comisario ( id_comisario );

ALTER TABLE relation_1
    ADD CONSTRAINT relation_1_evento_fk FOREIGN KEY ( evento_id_evento )
        REFERENCES evento ( id_evento );

ALTER TABLE relation_6
    ADD CONSTRAINT relation_6_deporte_fk FOREIGN KEY ( deporte_id_deporte )
        REFERENCES deporte ( id_deporte );

ALTER TABLE relation_6
    ADD CONSTRAINT relation_6_equipamiento_fk FOREIGN KEY ( equipamiento_id_equipamiento )
        REFERENCES equipamiento ( id_equipamiento );



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             9
-- CREATE INDEX                             0
-- ALTER TABLE                             17
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   1
-- WARNINGS                                 0
