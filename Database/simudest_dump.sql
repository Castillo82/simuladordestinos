--
-- PostgreSQL database dump
--

-- Dumped from database version 12.6
-- Dumped by pg_dump version 12.6

-- Started on 2022-04-10 22:58:53

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE simudest;
--
-- TOC entry 2978 (class 1262 OID 18887)
-- Name: simudest; Type: DATABASE; Schema: -; Owner: simudest
--

CREATE DATABASE simudest WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Spain.1252' LC_CTYPE = 'Spanish_Spain.1252';


ALTER DATABASE simudest OWNER TO simudest;

\connect simudest

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2979 (class 0 OID 0)
-- Dependencies: 2978
-- Name: DATABASE simudest; Type: COMMENT; Schema: -; Owner: simudest
--

COMMENT ON DATABASE simudest IS 'Base de datos del simulador de destinos.';


--
-- TOC entry 5 (class 2615 OID 19179)
-- Name: simudest; Type: SCHEMA; Schema: -; Owner: simudest
--

CREATE SCHEMA simudest;


ALTER SCHEMA simudest OWNER TO simudest;

--
-- TOC entry 8 (class 2615 OID 18888)
-- Name: simudest_2; Type: SCHEMA; Schema: -; Owner: simudest
--

CREATE SCHEMA simudest_2;


ALTER SCHEMA simudest_2 OWNER TO simudest;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 212 (class 1259 OID 19180)
-- Name: convocatoria; Type: TABLE; Schema: simudest; Owner: simudest
--

CREATE TABLE simudest.convocatoria (
    id_convo character varying(36) NOT NULL,
    nombre character varying(100) NOT NULL,
    id_user character varying(36) NOT NULL,
    id_organ integer NOT NULL,
    id_espec integer NOT NULL,
    estado character varying(5) NOT NULL
);


ALTER TABLE simudest.convocatoria OWNER TO simudest;

--
-- TOC entry 2983 (class 0 OID 0)
-- Dependencies: 212
-- Name: TABLE convocatoria; Type: COMMENT; Schema: simudest; Owner: simudest
--

COMMENT ON TABLE simudest.convocatoria IS 'Almacena las convocatorias.';


--
-- TOC entry 213 (class 1259 OID 19183)
-- Name: eleccion; Type: TABLE; Schema: simudest; Owner: simudest
--

CREATE TABLE simudest.eleccion (
    id_plaza character varying(36) NOT NULL,
    id_user character varying(36) NOT NULL,
    orden smallint NOT NULL
);


ALTER TABLE simudest.eleccion OWNER TO simudest;

--
-- TOC entry 2984 (class 0 OID 0)
-- Dependencies: 213
-- Name: TABLE eleccion; Type: COMMENT; Schema: simudest; Owner: simudest
--

COMMENT ON TABLE simudest.eleccion IS 'Almacena las elecciones de plazas de cada opositor';


--
-- TOC entry 215 (class 1259 OID 19188)
-- Name: especialidad; Type: TABLE; Schema: simudest; Owner: simudest
--

CREATE TABLE simudest.especialidad (
    id_espec integer NOT NULL,
    nombre character varying(60) NOT NULL,
    id_grupo integer NOT NULL
);


ALTER TABLE simudest.especialidad OWNER TO simudest;

--
-- TOC entry 2985 (class 0 OID 0)
-- Dependencies: 215
-- Name: TABLE especialidad; Type: COMMENT; Schema: simudest; Owner: simudest
--

COMMENT ON TABLE simudest.especialidad IS 'Almacena las distintas especialidades de los grupos y subgrupos de funcionarios';


--
-- TOC entry 214 (class 1259 OID 19186)
-- Name: especialidad_id_espec_seq; Type: SEQUENCE; Schema: simudest; Owner: simudest
--

CREATE SEQUENCE simudest.especialidad_id_espec_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE simudest.especialidad_id_espec_seq OWNER TO simudest;

--
-- TOC entry 2986 (class 0 OID 0)
-- Dependencies: 214
-- Name: especialidad_id_espec_seq; Type: SEQUENCE OWNED BY; Schema: simudest; Owner: simudest
--

ALTER SEQUENCE simudest.especialidad_id_espec_seq OWNED BY simudest.especialidad.id_espec;


--
-- TOC entry 217 (class 1259 OID 19194)
-- Name: grupo; Type: TABLE; Schema: simudest; Owner: simudest
--

CREATE TABLE simudest.grupo (
    id_grupo integer NOT NULL,
    nombre character varying(4) NOT NULL
);


ALTER TABLE simudest.grupo OWNER TO simudest;

--
-- TOC entry 2987 (class 0 OID 0)
-- Dependencies: 217
-- Name: TABLE grupo; Type: COMMENT; Schema: simudest; Owner: simudest
--

COMMENT ON TABLE simudest.grupo IS 'Tabla que almacena los distintos grupos y subgrupos de funcionarios';


--
-- TOC entry 216 (class 1259 OID 19192)
-- Name: grupo_id_grupo_seq; Type: SEQUENCE; Schema: simudest; Owner: simudest
--

CREATE SEQUENCE simudest.grupo_id_grupo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE simudest.grupo_id_grupo_seq OWNER TO simudest;

--
-- TOC entry 2988 (class 0 OID 0)
-- Dependencies: 216
-- Name: grupo_id_grupo_seq; Type: SEQUENCE OWNED BY; Schema: simudest; Owner: simudest
--

ALTER SEQUENCE simudest.grupo_id_grupo_seq OWNED BY simudest.grupo.id_grupo;


--
-- TOC entry 218 (class 1259 OID 19198)
-- Name: opositor; Type: TABLE; Schema: simudest; Owner: simudest
--

CREATE TABLE simudest.opositor (
    id_convo character varying(36) NOT NULL,
    id_user character varying(36) NOT NULL,
    validado boolean NOT NULL,
    orden smallint
);


ALTER TABLE simudest.opositor OWNER TO simudest;

--
-- TOC entry 2989 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE opositor; Type: COMMENT; Schema: simudest; Owner: simudest
--

COMMENT ON TABLE simudest.opositor IS 'Almacena la relacion entre usuarios y convocatorias, que permite indicar los opositores de la convocatoria y si estan validados';


--
-- TOC entry 220 (class 1259 OID 19203)
-- Name: organismo; Type: TABLE; Schema: simudest; Owner: simudest
--

CREATE TABLE simudest.organismo (
    id_organ integer NOT NULL,
    nombre character varying(100) NOT NULL
);


ALTER TABLE simudest.organismo OWNER TO simudest;

--
-- TOC entry 2990 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE organismo; Type: COMMENT; Schema: simudest; Owner: simudest
--

COMMENT ON TABLE simudest.organismo IS 'Almacena los distintos organismos a los que puede pertenecer una convocatoria.';


--
-- TOC entry 219 (class 1259 OID 19201)
-- Name: organismo_id_organ_seq; Type: SEQUENCE; Schema: simudest; Owner: simudest
--

CREATE SEQUENCE simudest.organismo_id_organ_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE simudest.organismo_id_organ_seq OWNER TO simudest;

--
-- TOC entry 2991 (class 0 OID 0)
-- Dependencies: 219
-- Name: organismo_id_organ_seq; Type: SEQUENCE OWNED BY; Schema: simudest; Owner: simudest
--

ALTER SEQUENCE simudest.organismo_id_organ_seq OWNED BY simudest.organismo.id_organ;


--
-- TOC entry 221 (class 1259 OID 19207)
-- Name: plaza; Type: TABLE; Schema: simudest; Owner: simudest
--

CREATE TABLE simudest.plaza (
    id_plaza character varying(36) NOT NULL,
    codigo character varying(20),
    ministerio character varying(100),
    centro character varying(150),
    id_provi integer,
    localidad character varying(80),
    denominacion character varying(60),
    nivel smallint,
    c_especifico numeric(8,2),
    id_convo character varying(36) NOT NULL
);


ALTER TABLE simudest.plaza OWNER TO simudest;

--
-- TOC entry 2992 (class 0 OID 0)
-- Dependencies: 221
-- Name: TABLE plaza; Type: COMMENT; Schema: simudest; Owner: simudest
--

COMMENT ON TABLE simudest.plaza IS 'Almacena las plazas de cada oposición.';


--
-- TOC entry 223 (class 1259 OID 19212)
-- Name: provincia; Type: TABLE; Schema: simudest; Owner: simudest
--

CREATE TABLE simudest.provincia (
    id_provi integer NOT NULL,
    nombre character varying(30) NOT NULL
);


ALTER TABLE simudest.provincia OWNER TO simudest;

--
-- TOC entry 2993 (class 0 OID 0)
-- Dependencies: 223
-- Name: TABLE provincia; Type: COMMENT; Schema: simudest; Owner: simudest
--

COMMENT ON TABLE simudest.provincia IS 'Almacena las provincias.';


--
-- TOC entry 222 (class 1259 OID 19210)
-- Name: provincia_id_provi_seq; Type: SEQUENCE; Schema: simudest; Owner: simudest
--

CREATE SEQUENCE simudest.provincia_id_provi_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE simudest.provincia_id_provi_seq OWNER TO simudest;

--
-- TOC entry 2994 (class 0 OID 0)
-- Dependencies: 222
-- Name: provincia_id_provi_seq; Type: SEQUENCE OWNED BY; Schema: simudest; Owner: simudest
--

ALTER SEQUENCE simudest.provincia_id_provi_seq OWNED BY simudest.provincia.id_provi;


--
-- TOC entry 224 (class 1259 OID 19216)
-- Name: usuario; Type: TABLE; Schema: simudest; Owner: simudest
--

CREATE TABLE simudest.usuario (
    id_user character varying(36) NOT NULL,
    email character varying(256) NOT NULL,
    nombre character varying(40) NOT NULL,
    apellido1 character varying(60) NOT NULL,
    apellido2 character varying(60),
    admin boolean NOT NULL,
    contra character varying(72) NOT NULL
);


ALTER TABLE simudest.usuario OWNER TO simudest;

--
-- TOC entry 2995 (class 0 OID 0)
-- Dependencies: 224
-- Name: TABLE usuario; Type: COMMENT; Schema: simudest; Owner: simudest
--

COMMENT ON TABLE simudest.usuario IS 'Almacena los usuarios de la aplicación, independientemente de si son administradores, organizadores u opositores.';


--
-- TOC entry 208 (class 1259 OID 18925)
-- Name: convocatoria; Type: TABLE; Schema: simudest_2; Owner: simudest
--

CREATE TABLE simudest_2.convocatoria (
    id_convo character varying(36) NOT NULL,
    nombre character varying(100) NOT NULL,
    id_user character varying(36) NOT NULL,
    id_organ smallint NOT NULL,
    id_espec smallint NOT NULL,
    estado character varying(5) NOT NULL
);


ALTER TABLE simudest_2.convocatoria OWNER TO simudest;

--
-- TOC entry 2996 (class 0 OID 0)
-- Dependencies: 208
-- Name: TABLE convocatoria; Type: COMMENT; Schema: simudest_2; Owner: simudest
--

COMMENT ON TABLE simudest_2.convocatoria IS 'Almacena las convocatorias.';


--
-- TOC entry 211 (class 1259 OID 18976)
-- Name: eleccion; Type: TABLE; Schema: simudest_2; Owner: simudest
--

CREATE TABLE simudest_2.eleccion (
    id_plaza character varying(36) NOT NULL,
    id_user character varying(36) NOT NULL,
    orden smallint NOT NULL
);


ALTER TABLE simudest_2.eleccion OWNER TO simudest;

--
-- TOC entry 2997 (class 0 OID 0)
-- Dependencies: 211
-- Name: TABLE eleccion; Type: COMMENT; Schema: simudest_2; Owner: simudest
--

COMMENT ON TABLE simudest_2.eleccion IS 'Almacena las elecciones de plazas de cada opositor';


--
-- TOC entry 204 (class 1259 OID 18900)
-- Name: especialidad; Type: TABLE; Schema: simudest_2; Owner: simudest
--

CREATE TABLE simudest_2.especialidad (
    id_espec smallint NOT NULL,
    nombre character varying(60) NOT NULL,
    id_grupo smallint NOT NULL
);


ALTER TABLE simudest_2.especialidad OWNER TO simudest;

--
-- TOC entry 2998 (class 0 OID 0)
-- Dependencies: 204
-- Name: TABLE especialidad; Type: COMMENT; Schema: simudest_2; Owner: simudest
--

COMMENT ON TABLE simudest_2.especialidad IS 'Almacena las distintas especialidades de los grupos y subgrupos de funcionarios';


--
-- TOC entry 203 (class 1259 OID 18889)
-- Name: grupo; Type: TABLE; Schema: simudest_2; Owner: simudest
--

CREATE TABLE simudest_2.grupo (
    id_grupo smallint NOT NULL,
    nombre character varying(4) NOT NULL
);


ALTER TABLE simudest_2.grupo OWNER TO simudest;

--
-- TOC entry 2999 (class 0 OID 0)
-- Dependencies: 203
-- Name: TABLE grupo; Type: COMMENT; Schema: simudest_2; Owner: simudest
--

COMMENT ON TABLE simudest_2.grupo IS 'Tabla que almacena los distintos grupos y subgrupos de funcionarios';


--
-- TOC entry 210 (class 1259 OID 18961)
-- Name: opositor; Type: TABLE; Schema: simudest_2; Owner: simudest
--

CREATE TABLE simudest_2.opositor (
    id_convo character varying(36) NOT NULL,
    id_user character varying(36) NOT NULL,
    validado boolean NOT NULL,
    orden smallint
);


ALTER TABLE simudest_2.opositor OWNER TO simudest;

--
-- TOC entry 3000 (class 0 OID 0)
-- Dependencies: 210
-- Name: TABLE opositor; Type: COMMENT; Schema: simudest_2; Owner: simudest
--

COMMENT ON TABLE simudest_2.opositor IS 'Almacena la relacion entre usuarios y convocatorias, que permite indicar los opositores de la convocatoria y si estan validados';


--
-- TOC entry 205 (class 1259 OID 18910)
-- Name: organismo; Type: TABLE; Schema: simudest_2; Owner: simudest
--

CREATE TABLE simudest_2.organismo (
    id_organ smallint NOT NULL,
    nombre character varying(100) NOT NULL
);


ALTER TABLE simudest_2.organismo OWNER TO simudest;

--
-- TOC entry 3001 (class 0 OID 0)
-- Dependencies: 205
-- Name: TABLE organismo; Type: COMMENT; Schema: simudest_2; Owner: simudest
--

COMMENT ON TABLE simudest_2.organismo IS 'Almacena los distintos organismos a los que puede pertenecer una convocatoria.';


--
-- TOC entry 209 (class 1259 OID 18945)
-- Name: plaza; Type: TABLE; Schema: simudest_2; Owner: simudest
--

CREATE TABLE simudest_2.plaza (
    id_plaza character varying(36) NOT NULL,
    codigo character varying(20),
    ministerio character varying(100),
    centro character varying(150),
    id_provi smallint,
    localidad character varying(80),
    denominacion character varying(60),
    nivel smallint,
    c_especifico numeric(8,2),
    id_convo character varying(36) NOT NULL
);


ALTER TABLE simudest_2.plaza OWNER TO simudest;

--
-- TOC entry 3002 (class 0 OID 0)
-- Dependencies: 209
-- Name: TABLE plaza; Type: COMMENT; Schema: simudest_2; Owner: simudest
--

COMMENT ON TABLE simudest_2.plaza IS 'Almacena las plazas de cada oposición.';


--
-- TOC entry 207 (class 1259 OID 18920)
-- Name: provincia; Type: TABLE; Schema: simudest_2; Owner: simudest
--

CREATE TABLE simudest_2.provincia (
    id_provi smallint NOT NULL,
    nombre character varying(30) NOT NULL
);


ALTER TABLE simudest_2.provincia OWNER TO simudest;

--
-- TOC entry 3003 (class 0 OID 0)
-- Dependencies: 207
-- Name: TABLE provincia; Type: COMMENT; Schema: simudest_2; Owner: simudest
--

COMMENT ON TABLE simudest_2.provincia IS 'Almacena las provincias.';


--
-- TOC entry 206 (class 1259 OID 18915)
-- Name: usuario; Type: TABLE; Schema: simudest_2; Owner: simudest
--

CREATE TABLE simudest_2.usuario (
    id_user character varying(36) NOT NULL,
    email character varying(256) NOT NULL,
    nombre character varying(40) NOT NULL,
    apellido1 character varying(60) NOT NULL,
    apellido2 character varying(60),
    admin boolean NOT NULL
);


ALTER TABLE simudest_2.usuario OWNER TO simudest;

--
-- TOC entry 3004 (class 0 OID 0)
-- Dependencies: 206
-- Name: TABLE usuario; Type: COMMENT; Schema: simudest_2; Owner: simudest
--

COMMENT ON TABLE simudest_2.usuario IS 'Almacena los usuarios de la aplicación, independientemente de si son administradores, organizadores u opositores.';


--
-- TOC entry 2763 (class 2604 OID 19191)
-- Name: especialidad id_espec; Type: DEFAULT; Schema: simudest; Owner: simudest
--

ALTER TABLE ONLY simudest.especialidad ALTER COLUMN id_espec SET DEFAULT nextval('simudest.especialidad_id_espec_seq'::regclass);


--
-- TOC entry 2764 (class 2604 OID 19197)
-- Name: grupo id_grupo; Type: DEFAULT; Schema: simudest; Owner: simudest
--

ALTER TABLE ONLY simudest.grupo ALTER COLUMN id_grupo SET DEFAULT nextval('simudest.grupo_id_grupo_seq'::regclass);


--
-- TOC entry 2765 (class 2604 OID 19206)
-- Name: organismo id_organ; Type: DEFAULT; Schema: simudest; Owner: simudest
--

ALTER TABLE ONLY simudest.organismo ALTER COLUMN id_organ SET DEFAULT nextval('simudest.organismo_id_organ_seq'::regclass);


--
-- TOC entry 2766 (class 2604 OID 19215)
-- Name: provincia id_provi; Type: DEFAULT; Schema: simudest; Owner: simudest
--

ALTER TABLE ONLY simudest.provincia ALTER COLUMN id_provi SET DEFAULT nextval('simudest.provincia_id_provi_seq'::regclass);


--
-- TOC entry 2960 (class 0 OID 19180)
-- Dependencies: 212
-- Data for Name: convocatoria; Type: TABLE DATA; Schema: simudest; Owner: simudest
--

INSERT INTO simudest.convocatoria VALUES ('123123123', 'Convocatoria 2019-2020', 'asd-asdasdasd', 2, 3, 'ON');


--
-- TOC entry 2961 (class 0 OID 19183)
-- Dependencies: 213
-- Data for Name: eleccion; Type: TABLE DATA; Schema: simudest; Owner: simudest
--



--
-- TOC entry 2963 (class 0 OID 19188)
-- Dependencies: 215
-- Data for Name: especialidad; Type: TABLE DATA; Schema: simudest; Owner: simudest
--

INSERT INTO simudest.especialidad VALUES (1, 'Gestión Administrativa', 2);
INSERT INTO simudest.especialidad VALUES (2, 'Escala Técnica de Sistemas e Informática', 2);
INSERT INTO simudest.especialidad VALUES (3, 'Escala Administrativa de Sistemas e Informática', 4);


--
-- TOC entry 2965 (class 0 OID 19194)
-- Dependencies: 217
-- Data for Name: grupo; Type: TABLE DATA; Schema: simudest; Owner: simudest
--

INSERT INTO simudest.grupo VALUES (1, 'A1');
INSERT INTO simudest.grupo VALUES (2, 'A2');
INSERT INTO simudest.grupo VALUES (3, 'B');
INSERT INTO simudest.grupo VALUES (4, 'C1');
INSERT INTO simudest.grupo VALUES (5, 'C2');
INSERT INTO simudest.grupo VALUES (6, 'E');


--
-- TOC entry 2966 (class 0 OID 19198)
-- Dependencies: 218
-- Data for Name: opositor; Type: TABLE DATA; Schema: simudest; Owner: simudest
--



--
-- TOC entry 2968 (class 0 OID 19203)
-- Dependencies: 220
-- Data for Name: organismo; Type: TABLE DATA; Schema: simudest; Owner: simudest
--

INSERT INTO simudest.organismo VALUES (1, 'Administración General del Estado');
INSERT INTO simudest.organismo VALUES (2, 'Junta de Comunidades de Castilla la Mancha');
INSERT INTO simudest.organismo VALUES (3, 'Ayuntamiento de Madrid');


--
-- TOC entry 2969 (class 0 OID 19207)
-- Dependencies: 221
-- Data for Name: plaza; Type: TABLE DATA; Schema: simudest; Owner: simudest
--



--
-- TOC entry 2971 (class 0 OID 19212)
-- Dependencies: 223
-- Data for Name: provincia; Type: TABLE DATA; Schema: simudest; Owner: simudest
--

INSERT INTO simudest.provincia VALUES (2, 'Albacete');
INSERT INTO simudest.provincia VALUES (3, 'Alicante/Alacant');
INSERT INTO simudest.provincia VALUES (4, 'Almería');
INSERT INTO simudest.provincia VALUES (1, 'Araba/Álava');
INSERT INTO simudest.provincia VALUES (33, 'Asturias');
INSERT INTO simudest.provincia VALUES (5, 'Avila');
INSERT INTO simudest.provincia VALUES (6, 'Badajoz');
INSERT INTO simudest.provincia VALUES (7, 'Balears, Illes');
INSERT INTO simudest.provincia VALUES (8, 'Barcelona');
INSERT INTO simudest.provincia VALUES (48, 'Bizkaia');
INSERT INTO simudest.provincia VALUES (9, 'Burgos');
INSERT INTO simudest.provincia VALUES (10, 'Cáceres');
INSERT INTO simudest.provincia VALUES (11, 'Cádiz');
INSERT INTO simudest.provincia VALUES (39, 'Cantabria');
INSERT INTO simudest.provincia VALUES (12, 'Castellón/Castelló');
INSERT INTO simudest.provincia VALUES (51, 'Ceuta');
INSERT INTO simudest.provincia VALUES (13, 'Ciudad Real');
INSERT INTO simudest.provincia VALUES (14, 'Córdoba');
INSERT INTO simudest.provincia VALUES (15, 'Coruña, A');
INSERT INTO simudest.provincia VALUES (16, 'Cuenca');
INSERT INTO simudest.provincia VALUES (20, 'Gipuzkoa');
INSERT INTO simudest.provincia VALUES (17, 'Girona');
INSERT INTO simudest.provincia VALUES (18, 'Granada');
INSERT INTO simudest.provincia VALUES (19, 'Guadalajara');
INSERT INTO simudest.provincia VALUES (21, 'Huelva');
INSERT INTO simudest.provincia VALUES (22, 'Huesca');
INSERT INTO simudest.provincia VALUES (23, 'Jaén');
INSERT INTO simudest.provincia VALUES (24, 'León');
INSERT INTO simudest.provincia VALUES (27, 'Lugo');
INSERT INTO simudest.provincia VALUES (25, 'Lleida');
INSERT INTO simudest.provincia VALUES (28, 'Madrid');
INSERT INTO simudest.provincia VALUES (29, 'Málaga');
INSERT INTO simudest.provincia VALUES (52, 'Melilla');
INSERT INTO simudest.provincia VALUES (30, 'Murcia');
INSERT INTO simudest.provincia VALUES (31, 'Navarra');
INSERT INTO simudest.provincia VALUES (32, 'Ourense');
INSERT INTO simudest.provincia VALUES (34, 'Palencia');
INSERT INTO simudest.provincia VALUES (35, 'Palmas, Las');
INSERT INTO simudest.provincia VALUES (36, 'Pontevedra');
INSERT INTO simudest.provincia VALUES (26, 'Rioja, La');
INSERT INTO simudest.provincia VALUES (37, 'Salamanca');
INSERT INTO simudest.provincia VALUES (38, 'Santa Cruz de Tenerife');
INSERT INTO simudest.provincia VALUES (40, 'Segovia');
INSERT INTO simudest.provincia VALUES (41, 'Sevilla');
INSERT INTO simudest.provincia VALUES (42, 'Soria');
INSERT INTO simudest.provincia VALUES (43, 'Tarragona');
INSERT INTO simudest.provincia VALUES (44, 'Teruel');
INSERT INTO simudest.provincia VALUES (45, 'Toledo');
INSERT INTO simudest.provincia VALUES (46, 'Valencia/València');
INSERT INTO simudest.provincia VALUES (47, 'Valladolid');
INSERT INTO simudest.provincia VALUES (49, 'Zamora');
INSERT INTO simudest.provincia VALUES (50, 'Zaragoza');


--
-- TOC entry 2972 (class 0 OID 19216)
-- Dependencies: 224
-- Data for Name: usuario; Type: TABLE DATA; Schema: simudest; Owner: simudest
--

INSERT INTO simudest.usuario VALUES ('asd-asdasdasd', 'asd@asd.asd', 'Alberto', 'Castillo', 'Jimenez', true, '{bcrypt}$2a$10$oKPsvfh.NXZjkec7ZpTOZOhOfpYk9f37jAmEtEj16Z63mc/jvbX2C');
INSERT INTO simudest.usuario VALUES ('8a09e0b47f78f5f7017f78f6394d0000', '123123@123.123', '123', '123', '123', false, '{bcrypt}$2a$10$rml0Iu9jzZ0TzHTAGLlmC.rCm1FEYrJrN552YE0scrm9147swLv/W');
INSERT INTO simudest.usuario VALUES ('8a09e0847f79325e017f793789380000', 'asd@asd.test', 'test', 'test', 'test', false, '{bcrypt}$2a$10$7zc/rcEbDrScu1Lj2gkbV.NwR1pIJc5.AquobU9U2I3oz3aWHP9y6');
INSERT INTO simudest.usuario VALUES ('4028b8817f7b2793017f7b28007c0000', '123123@123.1231', '123', '123', '123', false, '{bcrypt}$2a$10$TnpA5lH0ru0nIN6RnPtKreZMXIMc2mWhK9UBxl0upX..GTEzzYB3i');
INSERT INTO simudest.usuario VALUES ('4028b8817f827e7f017f827f1ac70000', 'mir@mir.mir', 'Miriam', 'sin', 'cuenta', false, '{bcrypt}$2a$10$ZCrAxoNlCT2utQJQG7xDpO3gvzz4KkAnnWQ93WhbUY5t9cfBJt0VC');


--
-- TOC entry 2956 (class 0 OID 18925)
-- Dependencies: 208
-- Data for Name: convocatoria; Type: TABLE DATA; Schema: simudest_2; Owner: simudest
--



--
-- TOC entry 2959 (class 0 OID 18976)
-- Dependencies: 211
-- Data for Name: eleccion; Type: TABLE DATA; Schema: simudest_2; Owner: simudest
--



--
-- TOC entry 2952 (class 0 OID 18900)
-- Dependencies: 204
-- Data for Name: especialidad; Type: TABLE DATA; Schema: simudest_2; Owner: simudest
--



--
-- TOC entry 2951 (class 0 OID 18889)
-- Dependencies: 203
-- Data for Name: grupo; Type: TABLE DATA; Schema: simudest_2; Owner: simudest
--



--
-- TOC entry 2958 (class 0 OID 18961)
-- Dependencies: 210
-- Data for Name: opositor; Type: TABLE DATA; Schema: simudest_2; Owner: simudest
--



--
-- TOC entry 2953 (class 0 OID 18910)
-- Dependencies: 205
-- Data for Name: organismo; Type: TABLE DATA; Schema: simudest_2; Owner: simudest
--



--
-- TOC entry 2957 (class 0 OID 18945)
-- Dependencies: 209
-- Data for Name: plaza; Type: TABLE DATA; Schema: simudest_2; Owner: simudest
--



--
-- TOC entry 2955 (class 0 OID 18920)
-- Dependencies: 207
-- Data for Name: provincia; Type: TABLE DATA; Schema: simudest_2; Owner: simudest
--

INSERT INTO simudest_2.provincia VALUES (2, 'Albacete');
INSERT INTO simudest_2.provincia VALUES (3, 'Alicante/Alacant');
INSERT INTO simudest_2.provincia VALUES (4, 'Almería');
INSERT INTO simudest_2.provincia VALUES (1, 'Araba/Álava');
INSERT INTO simudest_2.provincia VALUES (33, 'Asturias');
INSERT INTO simudest_2.provincia VALUES (5, 'Ávila');
INSERT INTO simudest_2.provincia VALUES (6, 'Badajoz');
INSERT INTO simudest_2.provincia VALUES (7, 'Balears, Illes');
INSERT INTO simudest_2.provincia VALUES (8, 'Barcelona');
INSERT INTO simudest_2.provincia VALUES (48, 'Bizkaia');
INSERT INTO simudest_2.provincia VALUES (9, 'Burgos');
INSERT INTO simudest_2.provincia VALUES (10, 'Cáceres');
INSERT INTO simudest_2.provincia VALUES (11, 'Cádiz');
INSERT INTO simudest_2.provincia VALUES (39, 'Cantabria');
INSERT INTO simudest_2.provincia VALUES (12, 'Castellón/Castelló');
INSERT INTO simudest_2.provincia VALUES (51, 'Ceuta');
INSERT INTO simudest_2.provincia VALUES (13, 'Ciudad Real');
INSERT INTO simudest_2.provincia VALUES (14, 'Córdoba');
INSERT INTO simudest_2.provincia VALUES (15, 'Coruña, A');
INSERT INTO simudest_2.provincia VALUES (16, 'Cuenca');
INSERT INTO simudest_2.provincia VALUES (20, 'Gipuzkoa');
INSERT INTO simudest_2.provincia VALUES (17, 'Girona');
INSERT INTO simudest_2.provincia VALUES (18, 'Granada');
INSERT INTO simudest_2.provincia VALUES (19, 'Guadalajara');
INSERT INTO simudest_2.provincia VALUES (21, 'Huelva');
INSERT INTO simudest_2.provincia VALUES (22, 'Huesca');
INSERT INTO simudest_2.provincia VALUES (23, 'Jaén');
INSERT INTO simudest_2.provincia VALUES (24, 'León');
INSERT INTO simudest_2.provincia VALUES (27, 'Lugo');
INSERT INTO simudest_2.provincia VALUES (25, 'Lleida');
INSERT INTO simudest_2.provincia VALUES (28, 'Madrid');
INSERT INTO simudest_2.provincia VALUES (29, 'Málaga');
INSERT INTO simudest_2.provincia VALUES (52, 'Melilla');
INSERT INTO simudest_2.provincia VALUES (30, 'Murcia');
INSERT INTO simudest_2.provincia VALUES (31, 'Navarra');
INSERT INTO simudest_2.provincia VALUES (32, 'Ourense');
INSERT INTO simudest_2.provincia VALUES (34, 'Palencia');
INSERT INTO simudest_2.provincia VALUES (35, 'Palmas, Las');
INSERT INTO simudest_2.provincia VALUES (36, 'Pontevedra');
INSERT INTO simudest_2.provincia VALUES (26, 'Rioja, La');
INSERT INTO simudest_2.provincia VALUES (37, 'Salamanca');
INSERT INTO simudest_2.provincia VALUES (38, 'Santa Cruz de Tenerife');
INSERT INTO simudest_2.provincia VALUES (40, 'Segovia');
INSERT INTO simudest_2.provincia VALUES (41, 'Sevilla');
INSERT INTO simudest_2.provincia VALUES (42, 'Soria');
INSERT INTO simudest_2.provincia VALUES (43, 'Tarragona');
INSERT INTO simudest_2.provincia VALUES (44, 'Teruel');
INSERT INTO simudest_2.provincia VALUES (45, 'Toledo');
INSERT INTO simudest_2.provincia VALUES (46, 'Valencia/València');
INSERT INTO simudest_2.provincia VALUES (47, 'Valladolid');
INSERT INTO simudest_2.provincia VALUES (49, 'Zamora');
INSERT INTO simudest_2.provincia VALUES (50, 'Zaragoza');


--
-- TOC entry 2954 (class 0 OID 18915)
-- Dependencies: 206
-- Data for Name: usuario; Type: TABLE DATA; Schema: simudest_2; Owner: simudest
--



--
-- TOC entry 3005 (class 0 OID 0)
-- Dependencies: 214
-- Name: especialidad_id_espec_seq; Type: SEQUENCE SET; Schema: simudest; Owner: simudest
--

SELECT pg_catalog.setval('simudest.especialidad_id_espec_seq', 1, false);


--
-- TOC entry 3006 (class 0 OID 0)
-- Dependencies: 216
-- Name: grupo_id_grupo_seq; Type: SEQUENCE SET; Schema: simudest; Owner: simudest
--

SELECT pg_catalog.setval('simudest.grupo_id_grupo_seq', 1, false);


--
-- TOC entry 3007 (class 0 OID 0)
-- Dependencies: 219
-- Name: organismo_id_organ_seq; Type: SEQUENCE SET; Schema: simudest; Owner: simudest
--

SELECT pg_catalog.setval('simudest.organismo_id_organ_seq', 1, false);


--
-- TOC entry 3008 (class 0 OID 0)
-- Dependencies: 222
-- Name: provincia_id_provi_seq; Type: SEQUENCE SET; Schema: simudest; Owner: simudest
--

SELECT pg_catalog.setval('simudest.provincia_id_provi_seq', 2, true);


--
-- TOC entry 2787 (class 2606 OID 19220)
-- Name: convocatoria convocatoria_pkey; Type: CONSTRAINT; Schema: simudest; Owner: simudest
--

ALTER TABLE ONLY simudest.convocatoria
    ADD CONSTRAINT convocatoria_pkey PRIMARY KEY (id_convo);


--
-- TOC entry 2789 (class 2606 OID 19222)
-- Name: eleccion eleccion_pkey; Type: CONSTRAINT; Schema: simudest; Owner: simudest
--

ALTER TABLE ONLY simudest.eleccion
    ADD CONSTRAINT eleccion_pkey PRIMARY KEY (id_plaza, id_user);


--
-- TOC entry 2791 (class 2606 OID 19224)
-- Name: especialidad especialidad_pkey; Type: CONSTRAINT; Schema: simudest; Owner: simudest
--

ALTER TABLE ONLY simudest.especialidad
    ADD CONSTRAINT especialidad_pkey PRIMARY KEY (id_espec);


--
-- TOC entry 2793 (class 2606 OID 19226)
-- Name: grupo grupo_pkey; Type: CONSTRAINT; Schema: simudest; Owner: simudest
--

ALTER TABLE ONLY simudest.grupo
    ADD CONSTRAINT grupo_pkey PRIMARY KEY (id_grupo);


--
-- TOC entry 2795 (class 2606 OID 19228)
-- Name: opositor opositor_pkey; Type: CONSTRAINT; Schema: simudest; Owner: simudest
--

ALTER TABLE ONLY simudest.opositor
    ADD CONSTRAINT opositor_pkey PRIMARY KEY (id_convo, id_user);


--
-- TOC entry 2797 (class 2606 OID 19230)
-- Name: organismo organismo_pkey; Type: CONSTRAINT; Schema: simudest; Owner: simudest
--

ALTER TABLE ONLY simudest.organismo
    ADD CONSTRAINT organismo_pkey PRIMARY KEY (id_organ);


--
-- TOC entry 2800 (class 2606 OID 19232)
-- Name: plaza plaza_pkey; Type: CONSTRAINT; Schema: simudest; Owner: simudest
--

ALTER TABLE ONLY simudest.plaza
    ADD CONSTRAINT plaza_pkey PRIMARY KEY (id_plaza);


--
-- TOC entry 2802 (class 2606 OID 19234)
-- Name: provincia provincia_pkey; Type: CONSTRAINT; Schema: simudest; Owner: simudest
--

ALTER TABLE ONLY simudest.provincia
    ADD CONSTRAINT provincia_pkey PRIMARY KEY (id_provi);


--
-- TOC entry 2804 (class 2606 OID 19236)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: simudest; Owner: simudest
--

ALTER TABLE ONLY simudest.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_user);


--
-- TOC entry 2778 (class 2606 OID 18929)
-- Name: convocatoria convocatoria_pkey; Type: CONSTRAINT; Schema: simudest_2; Owner: simudest
--

ALTER TABLE ONLY simudest_2.convocatoria
    ADD CONSTRAINT convocatoria_pkey PRIMARY KEY (id_convo);


--
-- TOC entry 2785 (class 2606 OID 18980)
-- Name: eleccion eleccion_pkey; Type: CONSTRAINT; Schema: simudest_2; Owner: simudest
--

ALTER TABLE ONLY simudest_2.eleccion
    ADD CONSTRAINT eleccion_pkey PRIMARY KEY (id_plaza, id_user);


--
-- TOC entry 2770 (class 2606 OID 18904)
-- Name: especialidad especialidad_pkey; Type: CONSTRAINT; Schema: simudest_2; Owner: simudest
--

ALTER TABLE ONLY simudest_2.especialidad
    ADD CONSTRAINT especialidad_pkey PRIMARY KEY (id_espec);


--
-- TOC entry 2768 (class 2606 OID 18895)
-- Name: grupo grupo_pkey; Type: CONSTRAINT; Schema: simudest_2; Owner: simudest
--

ALTER TABLE ONLY simudest_2.grupo
    ADD CONSTRAINT grupo_pkey PRIMARY KEY (id_grupo);


--
-- TOC entry 2783 (class 2606 OID 18965)
-- Name: opositor opositor_pkey; Type: CONSTRAINT; Schema: simudest_2; Owner: simudest
--

ALTER TABLE ONLY simudest_2.opositor
    ADD CONSTRAINT opositor_pkey PRIMARY KEY (id_convo, id_user);


--
-- TOC entry 2772 (class 2606 OID 18914)
-- Name: organismo organismo_pkey; Type: CONSTRAINT; Schema: simudest_2; Owner: simudest
--

ALTER TABLE ONLY simudest_2.organismo
    ADD CONSTRAINT organismo_pkey PRIMARY KEY (id_organ);


--
-- TOC entry 2781 (class 2606 OID 18949)
-- Name: plaza plaza_pkey; Type: CONSTRAINT; Schema: simudest_2; Owner: simudest
--

ALTER TABLE ONLY simudest_2.plaza
    ADD CONSTRAINT plaza_pkey PRIMARY KEY (id_plaza);


--
-- TOC entry 2776 (class 2606 OID 18924)
-- Name: provincia provincia_pkey; Type: CONSTRAINT; Schema: simudest_2; Owner: simudest
--

ALTER TABLE ONLY simudest_2.provincia
    ADD CONSTRAINT provincia_pkey PRIMARY KEY (id_provi);


--
-- TOC entry 2774 (class 2606 OID 18919)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: simudest_2; Owner: simudest
--

ALTER TABLE ONLY simudest_2.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_user);


--
-- TOC entry 2798 (class 1259 OID 19237)
-- Name: index_convo; Type: INDEX; Schema: simudest; Owner: simudest
--

CREATE INDEX index_convo ON simudest.plaza USING btree (id_convo);


--
-- TOC entry 2779 (class 1259 OID 18960)
-- Name: index_convo; Type: INDEX; Schema: simudest_2; Owner: simudest
--

CREATE INDEX index_convo ON simudest_2.plaza USING btree (id_convo);


--
-- TOC entry 2815 (class 2606 OID 19238)
-- Name: convocatoria fk_convo_espec; Type: FK CONSTRAINT; Schema: simudest; Owner: simudest
--

ALTER TABLE ONLY simudest.convocatoria
    ADD CONSTRAINT fk_convo_espec FOREIGN KEY (id_espec) REFERENCES simudest.especialidad(id_espec);


--
-- TOC entry 2816 (class 2606 OID 19243)
-- Name: convocatoria fk_convo_organ; Type: FK CONSTRAINT; Schema: simudest; Owner: simudest
--

ALTER TABLE ONLY simudest.convocatoria
    ADD CONSTRAINT fk_convo_organ FOREIGN KEY (id_organ) REFERENCES simudest.organismo(id_organ);


--
-- TOC entry 2817 (class 2606 OID 19248)
-- Name: convocatoria fk_convo_user; Type: FK CONSTRAINT; Schema: simudest; Owner: simudest
--

ALTER TABLE ONLY simudest.convocatoria
    ADD CONSTRAINT fk_convo_user FOREIGN KEY (id_user) REFERENCES simudest.usuario(id_user);


--
-- TOC entry 2818 (class 2606 OID 19253)
-- Name: eleccion fk_elec_plaza; Type: FK CONSTRAINT; Schema: simudest; Owner: simudest
--

ALTER TABLE ONLY simudest.eleccion
    ADD CONSTRAINT fk_elec_plaza FOREIGN KEY (id_plaza) REFERENCES simudest.plaza(id_plaza);


--
-- TOC entry 2819 (class 2606 OID 19258)
-- Name: eleccion fk_elec_user; Type: FK CONSTRAINT; Schema: simudest; Owner: simudest
--

ALTER TABLE ONLY simudest.eleccion
    ADD CONSTRAINT fk_elec_user FOREIGN KEY (id_user) REFERENCES simudest.usuario(id_user);


--
-- TOC entry 2820 (class 2606 OID 19263)
-- Name: especialidad fk_espec_grupo; Type: FK CONSTRAINT; Schema: simudest; Owner: simudest
--

ALTER TABLE ONLY simudest.especialidad
    ADD CONSTRAINT fk_espec_grupo FOREIGN KEY (id_grupo) REFERENCES simudest.grupo(id_grupo);


--
-- TOC entry 2821 (class 2606 OID 19268)
-- Name: opositor fk_opo_convo; Type: FK CONSTRAINT; Schema: simudest; Owner: simudest
--

ALTER TABLE ONLY simudest.opositor
    ADD CONSTRAINT fk_opo_convo FOREIGN KEY (id_convo) REFERENCES simudest.convocatoria(id_convo);


--
-- TOC entry 2822 (class 2606 OID 19273)
-- Name: opositor fk_opo_user; Type: FK CONSTRAINT; Schema: simudest; Owner: simudest
--

ALTER TABLE ONLY simudest.opositor
    ADD CONSTRAINT fk_opo_user FOREIGN KEY (id_user) REFERENCES simudest.usuario(id_user);


--
-- TOC entry 2823 (class 2606 OID 19278)
-- Name: plaza fk_plaza_convo; Type: FK CONSTRAINT; Schema: simudest; Owner: simudest
--

ALTER TABLE ONLY simudest.plaza
    ADD CONSTRAINT fk_plaza_convo FOREIGN KEY (id_convo) REFERENCES simudest.convocatoria(id_convo);


--
-- TOC entry 2824 (class 2606 OID 19283)
-- Name: plaza fk_plaza_provi; Type: FK CONSTRAINT; Schema: simudest; Owner: simudest
--

ALTER TABLE ONLY simudest.plaza
    ADD CONSTRAINT fk_plaza_provi FOREIGN KEY (id_provi) REFERENCES simudest.provincia(id_provi);


--
-- TOC entry 2806 (class 2606 OID 18930)
-- Name: convocatoria fk_convo_espec; Type: FK CONSTRAINT; Schema: simudest_2; Owner: simudest
--

ALTER TABLE ONLY simudest_2.convocatoria
    ADD CONSTRAINT fk_convo_espec FOREIGN KEY (id_espec) REFERENCES simudest_2.especialidad(id_espec);


--
-- TOC entry 2808 (class 2606 OID 18940)
-- Name: convocatoria fk_convo_organ; Type: FK CONSTRAINT; Schema: simudest_2; Owner: simudest
--

ALTER TABLE ONLY simudest_2.convocatoria
    ADD CONSTRAINT fk_convo_organ FOREIGN KEY (id_organ) REFERENCES simudest_2.organismo(id_organ);


--
-- TOC entry 2807 (class 2606 OID 18935)
-- Name: convocatoria fk_convo_user; Type: FK CONSTRAINT; Schema: simudest_2; Owner: simudest
--

ALTER TABLE ONLY simudest_2.convocatoria
    ADD CONSTRAINT fk_convo_user FOREIGN KEY (id_user) REFERENCES simudest_2.usuario(id_user);


--
-- TOC entry 2813 (class 2606 OID 18981)
-- Name: eleccion fk_elec_plaza; Type: FK CONSTRAINT; Schema: simudest_2; Owner: simudest
--

ALTER TABLE ONLY simudest_2.eleccion
    ADD CONSTRAINT fk_elec_plaza FOREIGN KEY (id_plaza) REFERENCES simudest_2.plaza(id_plaza);


--
-- TOC entry 2814 (class 2606 OID 18986)
-- Name: eleccion fk_elec_user; Type: FK CONSTRAINT; Schema: simudest_2; Owner: simudest
--

ALTER TABLE ONLY simudest_2.eleccion
    ADD CONSTRAINT fk_elec_user FOREIGN KEY (id_user) REFERENCES simudest_2.usuario(id_user);


--
-- TOC entry 2805 (class 2606 OID 18905)
-- Name: especialidad fk_espec_grupo; Type: FK CONSTRAINT; Schema: simudest_2; Owner: simudest
--

ALTER TABLE ONLY simudest_2.especialidad
    ADD CONSTRAINT fk_espec_grupo FOREIGN KEY (id_grupo) REFERENCES simudest_2.grupo(id_grupo);


--
-- TOC entry 2811 (class 2606 OID 18966)
-- Name: opositor fk_opo_convo; Type: FK CONSTRAINT; Schema: simudest_2; Owner: simudest
--

ALTER TABLE ONLY simudest_2.opositor
    ADD CONSTRAINT fk_opo_convo FOREIGN KEY (id_convo) REFERENCES simudest_2.convocatoria(id_convo);


--
-- TOC entry 2812 (class 2606 OID 18971)
-- Name: opositor fk_opo_user; Type: FK CONSTRAINT; Schema: simudest_2; Owner: simudest
--

ALTER TABLE ONLY simudest_2.opositor
    ADD CONSTRAINT fk_opo_user FOREIGN KEY (id_user) REFERENCES simudest_2.usuario(id_user);


--
-- TOC entry 2810 (class 2606 OID 18955)
-- Name: plaza fk_plaza_convo; Type: FK CONSTRAINT; Schema: simudest_2; Owner: simudest
--

ALTER TABLE ONLY simudest_2.plaza
    ADD CONSTRAINT fk_plaza_convo FOREIGN KEY (id_convo) REFERENCES simudest_2.convocatoria(id_convo);


--
-- TOC entry 2809 (class 2606 OID 18950)
-- Name: plaza fk_plaza_provi; Type: FK CONSTRAINT; Schema: simudest_2; Owner: simudest
--

ALTER TABLE ONLY simudest_2.plaza
    ADD CONSTRAINT fk_plaza_provi FOREIGN KEY (id_provi) REFERENCES simudest_2.provincia(id_provi);


--
-- TOC entry 2980 (class 0 OID 0)
-- Dependencies: 2978
-- Name: DATABASE simudest; Type: ACL; Schema: -; Owner: simudest
--

REVOKE ALL ON DATABASE simudest FROM simudest;
GRANT CREATE,CONNECT ON DATABASE simudest TO simudest;
GRANT TEMPORARY ON DATABASE simudest TO simudest WITH GRANT OPTION;


--
-- TOC entry 2981 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA simudest; Type: ACL; Schema: -; Owner: simudest
--

REVOKE ALL ON SCHEMA simudest FROM simudest;
GRANT ALL ON SCHEMA simudest TO simudest WITH GRANT OPTION;


--
-- TOC entry 2982 (class 0 OID 0)
-- Dependencies: 8
-- Name: SCHEMA simudest_2; Type: ACL; Schema: -; Owner: simudest
--

REVOKE ALL ON SCHEMA simudest_2 FROM simudest;
GRANT ALL ON SCHEMA simudest_2 TO simudest WITH GRANT OPTION;


-- Completed on 2022-04-10 22:58:53

--
-- PostgreSQL database dump complete
--

