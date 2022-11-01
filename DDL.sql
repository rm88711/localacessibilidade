-- Gerado por Oracle SQL Developer Data Modeler 22.2.0.165.1149
--   em:        2022-11-01 08:26:41 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE
--
drop table t_acessibilidade_local;
drop table t_acessibilidade;
drop table t_local;
drop table t_logradouro;
drop table t_bairro;
drop table t_cidade;
drop table t_estado;
--
CREATE TABLE t_acessibilidade (
    id_acessibilidade NUMBER(9) NOT NULL,
    tp_acessibilidade VARCHAR2(90) NOT NULL
);

ALTER TABLE t_acessibilidade ADD CONSTRAINT t_acessibilidade_pk PRIMARY KEY ( id_acessibilidade );

CREATE TABLE t_acessibilidade_local (
    id_local          NUMBER(9) NOT NULL,
    id_acessibilidade NUMBER(9) NOT NULL
);

ALTER TABLE t_acessibilidade_local ADD CONSTRAINT acessibilidade_local_pk PRIMARY KEY ( id_local,
                                                                                        id_acessibilidade );

CREATE TABLE t_bairro (
    id_bairro          NUMBER(9) NOT NULL,
    t_cidade_id_cidade NUMBER(9) NOT NULL,
    nm_bairro          VARCHAR2(90) NOT NULL
);

ALTER TABLE t_bairro ADD CONSTRAINT t_bairro_pk PRIMARY KEY ( id_bairro );

CREATE TABLE t_cidade (
    id_cidade          NUMBER(9) NOT NULL,
    t_estado_id_estado NUMBER(9) NOT NULL,
    nm_cidade          VARCHAR2(80) NOT NULL
);

ALTER TABLE t_cidade ADD CONSTRAINT t_cidade_pk PRIMARY KEY ( id_cidade );

CREATE TABLE t_estado (
    id_estado       NUMBER(9) NOT NULL,
    nm_estado       VARCHAR2(30) NOT NULL,
    nm_sigla_estado VARCHAR2(2)  NOT NULL
);

ALTER TABLE t_estado ADD CONSTRAINT t_estado_pk PRIMARY KEY ( id_estado );

CREATE TABLE t_local (
    id_local                   NUMBER(9) NOT NULL,
    t_logradouro_id_logradouro NUMBER(9) NOT NULL,
    nm_local                   VARCHAR2(90)
);

ALTER TABLE t_local ADD CONSTRAINT t_locais_acessibilidade_pk PRIMARY KEY ( id_local );

CREATE TABLE t_logradouro (
    id_logradouro      NUMBER(9) NOT NULL,
    t_bairro_id_bairro NUMBER(9) NOT NULL,
    ds_logradouro      VARCHAR2(90) NOT NULL,
    nr_cep             VARCHAR2(20)
);

ALTER TABLE t_logradouro ADD CONSTRAINT t_logradouro_pk PRIMARY KEY ( id_logradouro );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE t_acessibilidade_local
    ADD CONSTRAINT acessibilidade_local_t_acessibilidade_fk FOREIGN KEY ( id_acessibilidade )
        REFERENCES t_acessibilidade ( id_acessibilidade );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE t_acessibilidade_local
    ADD CONSTRAINT acessibilidade_local_t_locais_acessibilidade_fk FOREIGN KEY ( id_local )
        REFERENCES t_local ( id_local );

ALTER TABLE t_bairro
    ADD CONSTRAINT t_bairro_t_cidade_fk FOREIGN KEY ( t_cidade_id_cidade )
        REFERENCES t_cidade ( id_cidade );

ALTER TABLE t_cidade
    ADD CONSTRAINT t_cidade_t_estado_fk FOREIGN KEY ( t_estado_id_estado )
        REFERENCES t_estado ( id_estado );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE t_local
    ADD CONSTRAINT t_locais_acessibilidade_t_logradouro_fk FOREIGN KEY ( t_logradouro_id_logradouro )
        REFERENCES t_logradouro ( id_logradouro );

ALTER TABLE t_logradouro
    ADD CONSTRAINT t_logradouro_t_bairro_fk FOREIGN KEY ( t_bairro_id_bairro )
        REFERENCES t_bairro ( id_bairro );



-- Relat�rio do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             7
-- CREATE INDEX                             0
-- ALTER TABLE                             13
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
-- ERRORS                                   4
-- WARNINGS                                 0
