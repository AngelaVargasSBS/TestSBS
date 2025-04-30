--
-- PostgreSQL database dump
--

-- Dumped from database version 16.8 (Ubuntu 16.8-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.8 (Ubuntu 16.8-0ubuntu0.24.04.1)

-- Started on 2025-04-30 07:30:02 -05

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
-- TOC entry 9 (class 2615 OID 99336)
-- Name: syli; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA syli;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 560 (class 1259 OID 99337)
-- Name: aplicacion; Type: TABLE; Schema: syli; Owner: -
--

CREATE TABLE syli.aplicacion (
    codigo_aplicativo numeric(4,0) NOT NULL,
    descripcion_aplicativo character varying(50) NOT NULL,
    abreviatura_aplicativo character varying(50) NOT NULL,
    sn_activo boolean,
    fecha_alta timestamp without time zone,
    fecha_modificacion timestamp without time zone,
    codigo_front numeric(4,0) DEFAULT 2 NOT NULL
);


--
-- TOC entry 561 (class 1259 OID 99341)
-- Name: modulo_app; Type: TABLE; Schema: syli; Owner: -
--

CREATE TABLE syli.modulo_app (
    codigo_aplicativo numeric(4,0) NOT NULL,
    codigo_modulo numeric(3,0) NOT NULL,
    descripcion_modulo character varying(50) NOT NULL,
    imagen character varying(50) NOT NULL,
    titulo_modulo character varying(100) NOT NULL,
    activo boolean,
    numero_accion numeric(6,0),
    numero_opcion numeric(6,0),
    fecha_alta timestamp without time zone,
    fecha_modificacion timestamp without time zone,
    codigo_componente integer
);


--
-- TOC entry 562 (class 1259 OID 99344)
-- Name: perfil_app; Type: TABLE; Schema: syli; Owner: -
--

CREATE TABLE syli.perfil_app (
    codigo_aplicativo numeric(4,0) NOT NULL,
    codigo_perfil numeric(2,0) NOT NULL,
    descripcion_perfil character varying(50) NOT NULL,
    sn_activo boolean,
    fecha_alta timestamp without time zone,
    fecha_modificacion timestamp without time zone,
    sn_ramo_comercial_todos boolean DEFAULT false,
    sn_clave_pdf boolean DEFAULT false,
    sn_sucursal_todos boolean DEFAULT false
);


--
-- TOC entry 563 (class 1259 OID 99350)
-- Name: persona; Type: TABLE; Schema: syli; Owner: -
--

CREATE TABLE syli.persona (
    tipo_documento numeric(2,0) NOT NULL,
    numero_documento character varying(20) NOT NULL,
    digito_verificacion_nit numeric(1,0),
    fecha_expedicion_documento date,
    persona_natural boolean,
    nombres character varying(50),
    apellido1 character varying(60),
    apellido2 character varying(60),
    nombre_completo_razon_social character varying(250),
    genero numeric(1,0),
    fecha_nacimiento date,
    estrato numeric(1,0),
    ocupacion character varying(60),
    numero_hijos numeric(2,0),
    origen numeric(3,0),
    fecha_formulario_sarlaft timestamp without time zone,
    codigo_estado_civil numeric(2,0),
    profesion_oficio character varying(60),
    pais_nacimiento character varying(2),
    departamento_nacimiento character varying(2),
    municipio_nacimiento character varying(6),
    empleado boolean,
    peso numeric(3,0),
    estatura numeric(3,0),
    habeas_data boolean,
    grupo_sanguineo character varying(2),
    rh_sanguineo boolean,
    codigo_eps character varying(10),
    fecha_creacion date,
    fecha_actualizacion date,
    fecha_defuncion date,
    autoriza_historia_clinica boolean,
    sarlaft_vigente boolean,
    codigo_ciiu character varying(6),
    fecha_alta timestamp without time zone DEFAULT now(),
    fecha_modificacion timestamp without time zone,
    token_recaudo character varying(70),
    subtoken_recaudo character varying(20),
    fecha_vigencia_desde_eps timestamp without time zone DEFAULT now(),
    fecha_vigencia_hasta_eps timestamp without time zone,
    codigo_regimen_eps integer,
    codigo_estado_afiliacion integer,
    codigo_tipo_afiliado_eps integer,
    id_log_transaccional integer
);


--
-- TOC entry 564 (class 1259 OID 99357)
-- Name: persona_direccion; Type: TABLE; Schema: syli; Owner: -
--

CREATE TABLE syli.persona_direccion (
    tipo_documento numeric(2,0) NOT NULL,
    numero_documento character varying(20) NOT NULL,
    codigo_tipo_direccion numeric(4,0) NOT NULL,
    direccion character varying(200) NOT NULL,
    direccion_estandarizada character varying(200),
    codigo_postal character varying(7),
    codigo_pais character varying(2),
    codigo_departamento character varying(2),
    codigo_municipio character varying(6),
    numero_latitud numeric(11,8),
    numero_longitud numeric(11,8),
    codigo_zona numeric(2,0),
    codigo_localidad character varying(2),
    origen numeric(2,0),
    fecha_alta timestamp without time zone DEFAULT now(),
    fecha_modificacion timestamp without time zone,
    urbana boolean
);


--
-- TOC entry 565 (class 1259 OID 99361)
-- Name: persona_telefono; Type: TABLE; Schema: syli; Owner: -
--

CREATE TABLE syli.persona_telefono (
    tipo_documento numeric(2,0) NOT NULL,
    numero_documento character varying(20) NOT NULL,
    codigo_tipo_telefono numeric(4,0) NOT NULL,
    telefono character varying(100) NOT NULL,
    codigo_pais character varying(2),
    origen numeric(3,0),
    fecha_alta timestamp without time zone DEFAULT now(),
    fecha_modificacion timestamp without time zone
);


--
-- TOC entry 566 (class 1259 OID 99365)
-- Name: tp_actividad_economica; Type: TABLE; Schema: syli; Owner: -
--

CREATE TABLE syli.tp_actividad_economica (
    codigo_ciiu character varying(4) NOT NULL,
    descripcion_ciiu character varying(200) NOT NULL,
    fecha_alta timestamp without time zone,
    fecha_modificacion timestamp without time zone
);


--
-- TOC entry 567 (class 1259 OID 99368)
-- Name: tp_actividad_economica_h; Type: TABLE; Schema: syli; Owner: -
--

CREATE TABLE syli.tp_actividad_economica_h (
    codigo_ciiud character varying(4) NOT NULL,
    codigo_ciiud_anterior character varying(4) NOT NULL,
    descripcion_ciiud_anterior character varying(200) NOT NULL,
    fecha_alta timestamp without time zone DEFAULT now(),
    fecha_modificacion timestamp without time zone
);


--
-- TOC entry 568 (class 1259 OID 99372)
-- Name: tp_calle; Type: TABLE; Schema: syli; Owner: -
--

CREATE TABLE syli.tp_calle (
    codigo_tipo_calle numeric(2,0) NOT NULL,
    descripcion_tipo_calle character varying(100) NOT NULL,
    fecha_alta timestamp without time zone,
    fecha_modificacion timestamp without time zone,
    activa boolean DEFAULT true
);


--
-- TOC entry 569 (class 1259 OID 99376)
-- Name: tp_dir_barrio; Type: TABLE; Schema: syli; Owner: -
--

CREATE TABLE syli.tp_dir_barrio (
    codigo_barrio character varying(2) NOT NULL,
    descripcion_barrio character varying(30) NOT NULL,
    fecha_alta timestamp without time zone DEFAULT now(),
    fecha_modificacion timestamp without time zone
);


--
-- TOC entry 570 (class 1259 OID 99380)
-- Name: tp_dir_cuadrante; Type: TABLE; Schema: syli; Owner: -
--

CREATE TABLE syli.tp_dir_cuadrante (
    codigo_cuadrante numeric(1,0) NOT NULL,
    descripcion_cuadrante character varying(30) NOT NULL,
    abreviatura_cuadrante character varying(2),
    fecha_alta timestamp without time zone DEFAULT now(),
    fecha_modificacion timestamp without time zone
);


--
-- TOC entry 571 (class 1259 OID 99384)
-- Name: tp_dir_manzana; Type: TABLE; Schema: syli; Owner: -
--

CREATE TABLE syli.tp_dir_manzana (
    codigo_manzana character varying(2) NOT NULL,
    descripcion_manzana character varying(30) NOT NULL,
    fecha_alta timestamp without time zone DEFAULT now(),
    fecha_modificacion timestamp without time zone
);


--
-- TOC entry 572 (class 1259 OID 99388)
-- Name: tp_dir_predio; Type: TABLE; Schema: syli; Owner: -
--

CREATE TABLE syli.tp_dir_predio (
    codigo_predio character varying(2) NOT NULL,
    descripcion_predio character varying(30) NOT NULL,
    fecha_alta timestamp without time zone DEFAULT now(),
    fecha_modificacion timestamp without time zone
);


--
-- TOC entry 573 (class 1259 OID 99392)
-- Name: tp_direccion; Type: TABLE; Schema: syli; Owner: -
--

CREATE TABLE syli.tp_direccion (
    codigo_tipo_direccion numeric(4,0) NOT NULL,
    descripcion_tipo_direccion character varying(30),
    abreviatura_tipo_direccion character varying(4),
    fecha_alta timestamp without time zone DEFAULT now(),
    fecha_modificacion timestamp without time zone,
    activo boolean DEFAULT false NOT NULL
);


--
-- TOC entry 574 (class 1259 OID 99397)
-- Name: tp_estado_civil; Type: TABLE; Schema: syli; Owner: -
--

CREATE TABLE syli.tp_estado_civil (
    codigo_estado_civil numeric(2,0) NOT NULL,
    descripcion_estado_civil character varying(30) NOT NULL,
    fecha_alta timestamp without time zone DEFAULT now(),
    fecha_modificacion timestamp without time zone
);


--
-- TOC entry 575 (class 1259 OID 99401)
-- Name: tp_ipc; Type: TABLE; Schema: syli; Owner: -
--

CREATE TABLE syli.tp_ipc (
    anio_ipc numeric(4,0) NOT NULL,
    mes_ipc numeric(2,0) NOT NULL,
    ipc double precision NOT NULL,
    mensual numeric(9,4) NOT NULL,
    anio_corrido numeric(9,4) NOT NULL,
    acumulado12 numeric(9,4) NOT NULL,
    fecha_alta date,
    fecha_modificacion date
);


--
-- TOC entry 576 (class 1259 OID 99404)
-- Name: tp_moneda; Type: TABLE; Schema: syli; Owner: -
--

CREATE TABLE syli.tp_moneda (
    codigo_moneda numeric(3,0) NOT NULL,
    descripcion_corta_moneda character varying(3) NOT NULL,
    descripcion_moneda character varying(20) NOT NULL,
    cantidad_decimales numeric(2,0) NOT NULL,
    codigo_iso character varying(4),
    fecha_alta timestamp without time zone DEFAULT now(),
    fecha_modificacion timestamp without time zone
);


--
-- TOC entry 577 (class 1259 OID 99408)
-- Name: tp_origen; Type: TABLE; Schema: syli; Owner: -
--

CREATE TABLE syli.tp_origen (
    codigo_origen numeric(2,0) NOT NULL,
    descripcion_origen character varying(50) NOT NULL,
    fecha_alta timestamp without time zone DEFAULT now(),
    fecha_modificacion timestamp without time zone
);


--
-- TOC entry 578 (class 1259 OID 99412)
-- Name: tp_pais; Type: TABLE; Schema: syli; Owner: -
--

CREATE TABLE syli.tp_pais (
    codigo_pais character varying(2) NOT NULL,
    descripcion_pais character varying(50) NOT NULL,
    codigo_npais numeric(4,0) NOT NULL,
    codigo_pais_rentec numeric(4,0),
    fecha_alta timestamp without time zone DEFAULT now(),
    fecha_modificacion timestamp without time zone,
    restriccion_pais boolean DEFAULT false NOT NULL,
    codigo_pais_sise character varying(4),
    codigo_pais_dian character varying(4),
    codigo_pais_iso3 character varying(4),
    codigo_pais_iso character varying(4),
    restricion_pais boolean DEFAULT false NOT NULL
);


--
-- TOC entry 579 (class 1259 OID 99418)
-- Name: tp_telefono; Type: TABLE; Schema: syli; Owner: -
--

CREATE TABLE syli.tp_telefono (
    codigo_tipo_telefono numeric(4,0) NOT NULL,
    descripcion_tipo_telefono character varying(30) NOT NULL,
    abreviatura_tipo_telefono character varying(4) NOT NULL,
    fecha_alta timestamp without time zone DEFAULT now(),
    fecha_modificacion timestamp without time zone
);


--
-- TOC entry 580 (class 1259 OID 99422)
-- Name: tp_transaccion; Type: TABLE; Schema: syli; Owner: -
--

CREATE TABLE syli.tp_transaccion (
    codigo_aplicativo numeric(4,0) NOT NULL,
    codigo_transaccion integer NOT NULL,
    codigo_modulo numeric(3,0) NOT NULL,
    codigo_submodulo numeric(3,0) NOT NULL,
    descripcion_transaccion character varying(100) NOT NULL,
    fecha_alta timestamp without time zone,
    fecha_modificacion timestamp without time zone
);


--
-- TOC entry 581 (class 1259 OID 99425)
-- Name: tp_zonas; Type: TABLE; Schema: syli; Owner: -
--

CREATE TABLE syli.tp_zonas (
    codigo_tipo_zona numeric(2,0) NOT NULL,
    codigo_zona numeric(8,0) NOT NULL,
    descripcion_zona character varying(50) NOT NULL,
    fecha_alta timestamp without time zone DEFAULT now(),
    fecha_modificacion timestamp without time zone
);


--
-- TOC entry 582 (class 1259 OID 99429)
-- Name: usuario_app; Type: TABLE; Schema: syli; Owner: -
--

CREATE TABLE syli.usuario_app (
    codigo_aplicativo numeric(4,0) NOT NULL,
    codigo_usuario numeric(6,0) NOT NULL,
    codigo_perfil numeric(2,0) NOT NULL,
    tipo_documento numeric(2,0) NOT NULL,
    numero_documento character varying(20) NOT NULL,
    activo boolean,
    usuario character varying(50) NOT NULL,
    clave character varying(50) NOT NULL,
    fecha_alta timestamp without time zone DEFAULT now(),
    fecha_modificacion timestamp without time zone,
    codigo_front numeric(4,0) DEFAULT 1 NOT NULL
);


--
-- TOC entry 4729 (class 0 OID 99337)
-- Dependencies: 560
-- Data for Name: aplicacion; Type: TABLE DATA; Schema: syli; Owner: -
--

INSERT INTO syli.aplicacion VALUES (3, 'Copropiedades - Pymes', 'CP', true, '2021-12-01 00:58:55.766902', NULL, 2);
INSERT INTO syli.aplicacion VALUES (2, 'SipaNew', 'SN', true, '2020-07-26 01:45:16.372371', NULL, 2);
INSERT INTO syli.aplicacion VALUES (5, 'SBS-Web', 'SBSW', true, NULL, NULL, 2);
INSERT INTO syli.aplicacion VALUES (4, 'Document Certifier', 'DC', true, '2022-03-31 01:26:31.282666', NULL, 2);
INSERT INTO syli.aplicacion VALUES (1, 'Mercadeo Empresarial', 'MS', true, '2022-11-02 00:59:30.315077', '2023-01-04 00:03:59.130503', 1);


--
-- TOC entry 4730 (class 0 OID 99341)
-- Dependencies: 561
-- Data for Name: modulo_app; Type: TABLE DATA; Schema: syli; Owner: -
--

INSERT INTO syli.modulo_app VALUES (5, 1, 'Plataforma SBS', 'PlataformaSBS.png', 'Plataforma SBS', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO syli.modulo_app VALUES (1, 11, 'MODULO INGESTAS', 'reports_Icon.png', 'Modulo cargue de ingestas', false, NULL, NULL, NULL, NULL, NULL);
INSERT INTO syli.modulo_app VALUES (1, 2, 'Reportes de Mercadeo Empresarial', 'ReportesDeMercadeoEmpresarial.png', 'Reportes de Mercadeo Empresarial', false, NULL, NULL, NULL, '2022-12-29 11:17:49.615772', NULL);
INSERT INTO syli.modulo_app VALUES (1, 1, 'Cotizador MS', 'CotizadorMS.png', 'Cotizador MS', true, NULL, NULL, NULL, '2022-12-29 11:17:49.615772', NULL);
INSERT INTO syli.modulo_app VALUES (1, 9, 'MODULO REPORTES', 'reports_Icon.png', ' Modulo de reportes para ME (VISTA REPORTES)', true, NULL, NULL, NULL, '2023-11-09 17:37:51.689501', NULL);
INSERT INTO syli.modulo_app VALUES (1, 10, 'MODULO ADMINISTRADOR', 'reports_Icon.png', 'Modulo Administrativo', true, NULL, NULL, NULL, NULL, NULL);


--
-- TOC entry 4731 (class 0 OID 99344)
-- Dependencies: 562
-- Data for Name: perfil_app; Type: TABLE DATA; Schema: syli; Owner: -
--

INSERT INTO syli.perfil_app VALUES (2, 5, 'Modyo', true, NULL, NULL, false, false, true);
INSERT INTO syli.perfil_app VALUES (2, 4, 'CONSULTAS ITAU', true, '2020-10-15 12:35:16.25983', NULL, true, true, true);
INSERT INTO syli.perfil_app VALUES (2, 7, 'Analytics', true, '2022-02-15 03:37:17.21132', NULL, true, true, true);
INSERT INTO syli.perfil_app VALUES (5, 1, 'SBS Web', true, NULL, NULL, NULL, NULL, true);
INSERT INTO syli.perfil_app VALUES (4, 1, 'GENERACION QR', true, '2022-03-31 01:26:31.282666', NULL, false, true, true);
INSERT INTO syli.perfil_app VALUES (2, 2, 'CONSULTAS', true, '2020-07-15 03:32:02.832578', NULL, true, false, true);
INSERT INTO syli.perfil_app VALUES (2, 1, 'Administrador', true, NULL, NULL, true, false, true);
INSERT INTO syli.perfil_app VALUES (1, 4, 'Consulta Sipa', true, '2022-11-02 00:59:30.380505', NULL, false, false, false);
INSERT INTO syli.perfil_app VALUES (1, 5, 'Administrador de Usuarios', true, '2022-11-02 00:59:30.380505', NULL, false, false, false);
INSERT INTO syli.perfil_app VALUES (2, 9, 'SipaItauConsultas-Copropiedades', true, NULL, NULL, false, false, false);
INSERT INTO syli.perfil_app VALUES (3, 1, 'ACTUALIZACION COPROPIEDAD', true, '2022-06-10 00:00:00', '2022-06-13 14:15:51.686153', false, false, true);
INSERT INTO syli.perfil_app VALUES (3, 2, 'CONSULTAS COPROPIEDAD', true, '2022-06-10 18:40:56.775834', '2022-06-13 14:15:51.686153', false, false, true);
INSERT INTO syli.perfil_app VALUES (3, 3, 'CONSULTAS+ACTUALIZACION COPROPIEDAD', true, '2022-06-13 14:15:51.686153', NULL, false, false, true);
INSERT INTO syli.perfil_app VALUES (2, 8, 'CONSULTAS ITAU - ACTUALIZA COPROPIEDAD', true, '2022-06-10 00:00:00', '2022-06-13 14:15:51.686153', false, false, true);
INSERT INTO syli.perfil_app VALUES (3, 6, 'CONSULTA CP', true, '2021-12-01 00:58:55.766902', NULL, false, false, true);
INSERT INTO syli.perfil_app VALUES (2, 3, 'Consultas AXA', true, '2020-10-01 01:46:52.195111', NULL, false, false, true);
INSERT INTO syli.perfil_app VALUES (1, 10, 'Reportes ME', true, NULL, '2022-12-29 11:48:58.816639', false, false, true);
INSERT INTO syli.perfil_app VALUES (1, 1, 'Super Usuario ME', true, NULL, '2023-01-04 00:08:53.319285', false, false, true);
INSERT INTO syli.perfil_app VALUES (1, 3, 'Administrativo ME (parametrizaciones)', true, '2022-11-02 00:59:30.380505', NULL, false, false, false);
INSERT INTO syli.perfil_app VALUES (1, 2, 'Reportes ME', true, '2022-11-02 00:59:30.380505', NULL, false, false, false);


--
-- TOC entry 4732 (class 0 OID 99350)
-- Dependencies: 563
-- Data for Name: persona; Type: TABLE DATA; Schema: syli; Owner: -
--

INSERT INTO syli.persona VALUES (1, '1128266194', NULL, NULL, NULL, 'CARLOS', 'TABORDA', NULL, 'CARLOS TABORDA', 2, '1981-06-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-25', NULL, NULL, NULL, NULL, '2023-04-04 18:51:21.239702', '2023-07-25 07:52:17.311543', NULL, NULL, '2023-04-04 18:51:21.239702', NULL, NULL, NULL, NULL, NULL);
INSERT INTO syli.persona VALUES (1, '1010003199', 1, '2018-09-24', NULL, 'ANGIE', 'FORERO', 'GARCIA', 'ANGIE FORERO GARCIA', 1, '2000-09-11', NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'EPS008', NULL, '2024-03-07', NULL, NULL, NULL, NULL, '2023-04-04 18:51:16.435328', '2024-03-07 14:02:33.892', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 808);
INSERT INTO syli.persona VALUES (1, '1032477633', 1, '2014-01-17', NULL, 'NICOLAS', 'RIVERA', 'GOMEZ', 'NICOLAS RIVERA GOMEZ', 2, '1996-01-02', NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'EPS008', NULL, '2024-03-07', NULL, NULL, NULL, NULL, '2023-04-04 18:28:53.988739', '2024-03-07 14:23:38.393', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 816);


--
-- TOC entry 4733 (class 0 OID 99357)
-- Dependencies: 564
-- Data for Name: persona_direccion; Type: TABLE DATA; Schema: syli; Owner: -
--

INSERT INTO syli.persona_direccion VALUES (1, '1010003199', 1, 'CALLE 63  18 N 28  CASA', NULL, NULL, 'CO', '11', '11001', NULL, NULL, NULL, NULL, 7, NULL, '2024-03-07 14:02:34.242', true);
INSERT INTO syli.persona_direccion VALUES (1, '1032477633', 1, 'CALLE 50 sur 0 este 22  casa', NULL, NULL, 'CO', '11', '11001', NULL, NULL, NULL, NULL, 7, NULL, '2024-03-07 14:23:38.748', true);


--
-- TOC entry 4734 (class 0 OID 99361)
-- Dependencies: 565
-- Data for Name: persona_telefono; Type: TABLE DATA; Schema: syli; Owner: -
--

INSERT INTO syli.persona_telefono VALUES (1, '1032477633', 1, '3188707955', 'CO', 7, '2023-07-24 16:57:08.345929', NULL);
INSERT INTO syli.persona_telefono VALUES (1, '1128266194', 14, 'carlos.taborda@sbseguros.co', 'CO', 5, '2023-07-24 16:29:13.411428', '2023-07-25 07:52:17.311543');
INSERT INTO syli.persona_telefono VALUES (1, '1032477633', 14, 'nicolas.rivera@sbseguros.co', 'CO', 7, '2023-07-24 16:57:08.140662', '2023-07-25 07:52:17.311543');
INSERT INTO syli.persona_telefono VALUES (1, '1010003199', 1, '3143933120', 'CO', 7, '2023-07-24 17:56:35.910053', NULL);
INSERT INTO syli.persona_telefono VALUES (1, '1010003199', 14, 'angie.forero@sbseguros.co', 'CO', 7, '2023-07-24 13:47:09.805648', '2023-07-25 07:52:17.311543');


--
-- TOC entry 4735 (class 0 OID 99365)
-- Dependencies: 566
-- Data for Name: tp_actividad_economica; Type: TABLE DATA; Schema: syli; Owner: -
--

INSERT INTO syli.tp_actividad_economica VALUES ('0010', 'ASALARIADOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0081', 'SIN ACTIVIDAD ECONÓMICA, SOLO PARA PERSONAS NATURALES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0082', 'PERSONAS NATURALES SUBSIDIADAS POR TERCEROS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0090', 'RENTISTAS DE CAPITAL, SOLO PARA PERSONAS NATURALES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0111', 'CULTIVO DE CAFÉ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0130', 'PROPAGACIÓN DE PLANTAS (ACTIVIDADES DE LOS VIVEROS, EXCEPTO VIVEROS FORESTALES) ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0150', 'EXPLOTACIÓN MIXTA (AGRÍCOLA Y PECUARIA) ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0161', 'ACTIVIDADES DE APOYO A LA AGRICULTURA ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0162', 'ACTIVIDADES DE APOYO A LA GANADERÍA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0164', 'TRATAMIENTO DE SEMILLAS PARA PROPAGACIÓN ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0170', 'CAZA ORDINARIA Y MEDIANTE TRAMPAS Y ACTIVIDADES DE SERVICIOS CONEXAS ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0210', 'SILVICULTURA Y OTRAS ACTIVIDADES FORESTALES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0220', 'EXTRACCIÓN DE MADERA ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0240', 'SERVICIOS DE APOYO A LA SILVICULTURA ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0510', 'EXTRACCIÓN DE HULLA (CARBÓN DE PIEDRA)', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0520', 'EXTRACCIÓN DE CARBÓN LIGNITO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0610', 'EXTRACCIÓN DE PETRÓLEO CRUDO ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0620', 'EXTRACCIÓN DE GAS NATURAL', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0710', 'EXTRACCIÓN DE MINERALES DE HIERRO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0721', 'EXTRACCIÓN DE MINERALES DE URANIO Y DE TORIO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0722', 'EXTRACCIÓN DE ORO Y OTROS METALES PRECIOSOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0723', 'EXTRACCIÓN DE MINERALES DE NÍQUEL', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0729', 'EXTRACCIÓN DE OTROS MINERALES METALÍFEROS NO FERROSOS N.C.P.', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0812', 'EXTRACCIÓN DE ARCILLAS DE USO INDUSTRIAL, CALIZA, CAOLÍN Y BENTONITAS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0891', 'EXTRACCIÓN DE MINERALES PARA LA FABRICACIÓN DE ABONOS Y PRODUCTOS QUÍMICOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0892', 'EXTRACCIÓN DE HALITA (SAL)', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1011', 'PROCESAMIENTO Y CONSERVACIÓN DE CARNE Y PRODUCTOS CÁRNICOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1012', 'PROCESAMIENTO Y CONSERVACIÓN DE PESCADOS, CRUSTÁCEOS Y MOLUSCOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1030', 'ELABORACIÓN DE ACEITES Y GRASAS DE ORIGEN VEGETAL Y ANIMAL', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1040', 'ELABORACIÓN DE PRODUCTOS LÁCTEOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1051', 'ELABORACIÓN DE PRODUCTOS DE MOLINERÍA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1052', 'ELABORACIÓN DE ALMIDONES Y PRODUCTOS DERIVADOS DEL ALMIDÓN', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1061', 'TRILLA DE CAFÉ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1062', 'DESCAFEINADO, TOSTIÓN Y MOLIENDA DEL CAFÉ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1063', 'OTROS DERIVADOS DEL CAFÉ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1071', 'ELABORACIÓN Y REFINACIÓN DE AZÚCAR', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1072', 'ELABORACIÓN DE PANELA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1081', 'ELABORACIÓN DE PRODUCTOS DE PANADERÍA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1082', 'ELABORACIÓN DE CACAO, CHOCOLATE Y PRODUCTOS DE CONFITERÍA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1083', 'ELABORACIÓN DE MACARRONES, FIDEOS, ALCUZCUZ Y PRODUCTOS FARINÁCEOS SIMILARES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1090', 'ELABORACIÓN DE ALIMENTOS PREPARADOS PARA ANIMALES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1101', 'DESTILACIÓN, RECTIFICACIÓN Y MEZCLA DE BEBIDAS ALCOHÓLICAS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1102', 'ELABORACIÓN DE BEBIDAS FERMENTADAS NO DESTILADAS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1103', 'PRODUCCIÓN DE MALTA, ELABORACIÓN DE CERVEZAS Y OTRAS BEBIDAS MALTEADAS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1104', 'ELABORACIÓN DE BEBIDAS NO ALCOHÓLICAS, PRODUCCIÓN DE AGUAS MINERALES Y DE OTRAS AGUAS EMBOTELLADAS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1311', 'PREPARACIÓN E HILATURA DE FIBRAS TEXTILES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1391', 'FABRICACIÓN DE TEJIDOS DE PUNTO Y GANCHILLO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1393', 'FABRICACIÓN DE TAPETES Y ALFOMBRAS PARA PISOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1394', 'FABRICACIÓN DE CUERDAS, CORDELES, CABLES, BRAMANTES Y REDES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1399', 'FABRICACIÓN DE OTROS ARTÍCULOS TEXTILES N.C.P.', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1410', 'CONFECCIÓN DE PRENDAS DE VESTIR, EXCEPTO PRENDAS DE PIEL', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1420', 'FABRICACIÓN DE ARTÍCULOS DE PIEL', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1430', 'FABRICACIÓN DE ARTÍCULOS DE PUNTO Y GANCHILLO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1513', 'FABRICACIÓN DE ARTÍCULOS DE VIAJE, BOLSOS DE MANO Y ARTÍCULOS SIMILARES: ARTÍCULOS DE TALABARTERÍA Y GUARNICIONERÍA ELABORADOS EN OTROS MATERIALES
', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1523', 'FABRICACIÓN DE PARTES DEL CALZADO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1610', 'ASERRADO, ACEPILLADO E IMPREGNACIÓN DE LA MADERA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1620', 'FABRICACIÓN DE HOJAS DE MADERA PARA ENCHAPADO: FABRICACIÓN DE TABLEROS CONTRACHAPADOS, TABLEROS LAMINADOS, TABLEROS DE PARTÍCULAS Y OTROS TABLEROS Y PANELES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1630', 'FABRICACIÓN DE PARTES Y PIEZAS DE MADERA, DE CARPINTERÍA Y EBANISTERÍA PARA LA CONSTRUCCIÓN
', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1640', 'FABRICACIÓN DE RECIPIENTES DE MADERA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1701', 'FABRICACIÓN DE PULPAS (PASTAS) CELULÓSICAS: PAPEL Y CARTÓN', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1702', 'FABRICACIÓN DE PAPEL Y CARTÓN ONDULADO (CORRUGADO): FABRICACIÓN DE ENVASES, EMPAQUES Y DE EMBALAJES DE PAPEL Y CARTÓN', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1812', 'ACTIVIDADES DE SERVICIOS RELACIONADOS CON LA IMPRESIÓN', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1820', 'PRODUCCIÓN DE COPIAS A PARTIR DE GRABACIONES ORIGINALES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1910', 'FABRICACIÓN DE PRODUCTOS DE HORNOS DE COQUE ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2012', 'FABRICACIÓN DE ABONOS Y COMPUESTOS INORGÁNICOS NITROGENADOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2014', 'FABRICACIÓN DE CAUCHO SINTÉTICO EN FORMAS PRIMARIAS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2021', 'FABRICACIÓN DE PLAGUICIDAS Y OTROS PRODUCTOS QUÍMICOS DE USO AGROPECUARIO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2022', 'FABRICACIÓN DE PINTURAS, BARNICES Y REVESTIMIENTOS SIMILARES, TINTAS PARA IMPRESIÓN Y MASILLAS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2023', 'FABRICACIÓN DE JABONES Y DETERGENTES, PREPARADOS PARA LIMPIAR Y PULIR: PERFUMES Y PREPARADOS DE TOCADOR', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2029', 'FABRICACIÓN DE OTROS PRODUCTOS QUÍMICOS N.C.P.', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2030', 'FABRICACIÓN DE FIBRAS SINTÉTICAS Y ARTIFICIALES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2211', 'FABRICACIÓN DE LLANTAS Y NEUMÁTICOS DE CAUCHO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2212', 'REENCAUCHE DE LLANTAS USADAS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2221', 'FABRICACIÓN DE FORMAS BÁSICAS DE PLÁSTICO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2310', 'FABRICACIÓN DE VIDRIO Y PRODUCTOS DE VIDRIO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2391', 'FABRICACIÓN DE PRODUCTOS REFRACTARIOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2393', 'FABRICACIÓN DE OTROS PRODUCTOS DE CERÁMICA Y PORCELANA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2394', 'FABRICACIÓN DE CEMENTO, CAL Y YESO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2395', 'FABRICACIÓN DE ARTÍCULOS DE HORMIGÓN, CEMENTO Y YESO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2396', 'CORTE, TALLADO Y ACABADO DE LA PIEDRA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2399', 'FABRICACIÓN DE OTROS PRODUCTOS MINERALES NO METÁLICOS N.C.P.', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2410', 'INDUSTRIAS BÁSICAS DE HIERRO Y DE ACERO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2421', 'INDUSTRIAS BÁSICAS DE METALES PRECIOSOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2432', 'FUNDICIÓN DE METALES NO FERROSOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2511', 'FABRICACIÓN DE PRODUCTOS METÁLICOS PARA USO ESTRUCTURAL', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2512', 'FABRICACIÓN DE TANQUES, DEPÓSITOS Y RECIPIENTES DE METAL, EXCEPTO LOS UTILIZADOS PARA EL ENVASE O TRANSPORTE DE MERCANCÍAS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2513', 'FABRICACIÓN DE GENERADORES DE VAPOR, EXCEPTO CALDERAS DE AGUA CALIENTE PARA CALEFACCIÓN CENTRAL', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2520', 'FABRICACIÓN DE ARMAS Y MUNICIONES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2591', 'FORJA, PRENSADO, ESTAMPADO Y LAMINADO DE METAL: PULVIMETALURGIA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2592', 'TRATAMIENTO Y REVESTIMIENTO DE METALES: MECANIZADO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2620', 'FABRICACIÓN DE COMPUTADORAS Y DE EQUIPO PERIFÉRICO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2652', 'FABRICACIÓN DE RELOJES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2660', 'FABRICACIÓN DE EQUIPO DE IRRADIACIÓN Y EQUIPO ELECTRÓNICO DE USO MÉDICO Y TERAPÉUTICO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2680', 'FABRICACIÓN DE MEDIOS MAGNÉTICOS Y ÓPTICOS PARA ALMACENAMIENTO DE DATOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2711', 'FABRICACIÓN DE MOTORES, GENERADORES Y TRANSFORMADORES ELÉCTRICOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2712', 'FABRICACIÓN DE APARATOS DE DISTRIBUCIÓN Y CONTROL DE LA ENERGÍA ELÉCTRICA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2720', 'FABRICACIÓN DE PILAS, BATERÍAS Y ACUMULADORES ELÉCTRICOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2750', 'FABRICACIÓN DE APARATOS DE USO DOMÉSTICO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2813', 'FABRICACIÓN DE OTRAS BOMBAS, COMPRESORES, GRIFOS Y VÁLVULAS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2814', 'FABRICACIÓN DE COJINETES, ENGRANAJES, TRENES DE ENGRANAJES Y PIEZAS DE TRANSMISIÓN', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2818', 'FABRICACIÓN DE HERRAMIENTAS MANUALES CON MOTOR', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2821', 'FABRICACIÓN DE MAQUINARIA AGROPECUARIA Y FORESTAL ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2822', 'FABRICACIÓN DE MÁQUINAS FORMADORAS DE METAL Y DE MÁQUINAS HERRAMIENTA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2823', 'FABRICACIÓN DE MAQUINARIA PARA LA METALURGIA ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2824', 'FABRICACIÓN DE MAQUINARIA PARA EXPLOTACIÓN DE MINAS Y CANTERAS Y PARA OBRAS DE CONSTRUCCIÓN', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2825', 'FABRICACIÓN DE MAQUINARIA PARA LA ELABORACIÓN DE ALIMENTOS, BEBIDAS Y TABACO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2910', 'FABRICACIÓN DE VEHÍCULOS AUTOMOTORES Y SUS MOTORES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2920', 'FABRICACIÓN DE CARROCERÍAS PARA VEHÍCULOS AUTOMOTORES: FABRICACIÓN DE REMOLQUES Y SEMIRREMOLQUES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('3011', 'CONSTRUCCIÓN DE BARCOS Y DE ESTRUCTURAS FLOTANTES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('3012', 'CONSTRUCCIÓN DE EMBARCACIONES DE RECREO Y DEPORTE', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('3020', 'FABRICACIÓN DE LOCOMOTORAS Y DE MATERIAL RODANTE PARA FERROCARRILES ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('3040', 'FABRICACIÓN DE VEHÍCULOS MILITARES DE COMBATE', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('3091', 'FABRICACIÓN DE MOTOCICLETAS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('3092', 'FABRICACIÓN DE BICICLETAS Y DE SILLAS DE RUEDAS PARA PERSONAS CON DISCAPACIDAD', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('3099', 'FABRICACIÓN DE OTROS TIPOS DE EQUIPO DE TRANSPORTE N.C.P.', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('3120', 'FABRICACIÓN DE COLCHONES Y SOMIERES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('3220', 'FABRICACIÓN DE INSTRUMENTOS MUSICALES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('3511', 'GENERACIÓN DE ENERGÍA ELÉCTRICA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('3512', 'TRANSMISIÓN DE ENERGÍA ELÉCTRICA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('3513', 'DISTRIBUCIÓN DE ENERGÍA ELÉCTRICA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('3514', 'COMERCIALIZACIÓN DE ENERGÍA ELÉCTRICA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('3520', 'PRODUCCIÓN DE GAS: DISTRIBUCIÓN DE COMBUSTIBLES GASEOSOS POR TUBERÍAS. ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('3600', 'CAPTACIÓN, TRATAMIENTO Y DISTRIBUCIÓN DE AGUA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('3700', 'EVACUACIÓN Y TRATAMIENTO DE AGUAS RESIDUALES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('3811', 'RECOLECCIÓN DE DESECHOS NO PELIGROSOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4111', 'CONSTRUCCIÓN DE EDIFICIOS RESIDENCIALES ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4112', 'CONSTRUCCIÓN DE EDIFICIOS NO RESIDENCIALES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4210', 'CONSTRUCCIÓN DE CARRETERAS Y VÍAS DE FERROCARRIL', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4220', 'CONSTRUCCIÓN DE PROYECTOS DE SERVICIO PÚBLICO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4321', 'INSTALACIONES ELÉCTRICAS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4330', 'TERMINACIÓN Y ACABADO DE EDIFICIOS Y OBRAS DE INGENIERÍA CIVIL', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4511', 'COMERCIO DE VEHÍCULOS AUTOMOTORES NUEVOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4512', 'COMERCIO DE VEHÍCULOS AUTOMOTORES USADOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4520', 'MANTENIMIENTO Y REPARACIÓN DE VEHÍCULOS AUTOMOTORES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4530', 'COMERCIO DE PARTES, PIEZAS (AUTOPARTES) Y ACCESORIOS (LUJOS) PARA VEHÍCULOS AUTOMOTORES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4541', 'COMERCIO DE MOTOCICLETAS Y DE SUS PARTES, PIEZAS Y ACCESORIOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4610', 'COMERCIO AL POR MAYOR A CAMBIO DE UNA RETRIBUCIÓN O POR CONTRATA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4631', 'COMERCIO AL POR MAYOR DE PRODUCTOS ALIMENTICIOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4632', 'COMERCIO AL POR MAYOR DE BEBIDAS Y TABACO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4641', 'COMERCIO AL POR MAYOR DE PRODUCTOS TEXTILES: PRODUCTOS CONFECCIONADOS PARA USO DOMÉSTICO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4642', 'COMERCIO AL POR MAYOR DE PRENDAS DE VESTIR', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4643', 'COMERCIO AL POR MAYOR DE CALZADO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4644', 'COMERCIO AL POR MAYOR DE APARATOS Y EQUIPO DE USO DOMÉSTICO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4651', 'COMERCIO AL POR MAYOR DE COMPUTADORES, EQUIPO PERIFÉRICO Y PROGRAMAS DE INFORMÁTICA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4652', 'COMERCIO AL POR MAYOR DE EQUIPO, PARTES Y PIEZAS ELECTRÓNICOS Y DE TELECOMUNICACIONES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4653', 'COMERCIO AL POR MAYOR DE MAQUINARIA Y EQUIPO AGROPECUARIOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4661', 'COMERCIO AL POR MAYOR DE COMBUSTIBLES SÓLIDOS, LÍQUIDOS, GASEOSOS Y PRODUCTOS CONEXOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4662', 'COMERCIO AL POR MAYOR DE METALES Y PRODUCTOS METALÍFEROS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4663', 'COMERCIO AL POR MAYOR DE MATERIALES DE CONSTRUCCIÓN, ARTÍCULOS DE FERRETERÍA, PINTURAS, PRODUCTOS DE VIDRIO, EQUIPO Y MATERIALES DE FONTANERÍA Y CALEFACCIÓN', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4665', 'COMERCIO AL POR MAYOR DE DESPERDICIOS, DESECHOS Y CHATARRA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4690', 'COMERCIO AL POR MAYOR NO ESPECIALIZADO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4711', 'COMERCIO AL POR MENOR EN ESTABLECIMIENTOS NO ESPECIALIZADOS CON SURTIDO COMPUESTO PRINCIPALMENTE POR ALIMENTOS, BEBIDAS O TABACO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4719', 'COMERCIO A POR MENOR EN ESTABLECIMIENTOS NO ESPECIALIZADOS, CON SURTIDO COMPUESTO PRINCIPALMENTE POR PRODUCTOS DIFERENTES DE ALIMENTOS (VÍVERES EN GENERAL), BEBIDAS Y TABACO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4721', 'COMERCIO AL POR MENOR DE PRODUCTOS AGRÍCOLAS PARA EL CONSUMO EN ESTABLECIMIENTOS ESPECIALIZADOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4722', 'COMERCIO AL POR MENOR DE LECHE, PRODUCTOS LÁCTEOS Y HUEVOS EN ESTABLECIMIENTOS ESPECIALIZADOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4723', 'COMERCIO AL POR MENOR DE CARNES (INCLUYE AVES DE CORRAL), PRODUCTOS CÁRNICOS, PESCADOS Y PRODUCTOS DE MAR EN ESTABLECIMIENTOS ESPECIALIZADOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4724', 'COMERCIO AL POR MENOR DE BEBIDAS Y PRODUCTOS DE TABACO, EN ESTABLECIMIENTOS ESPECIALIZADOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4731', 'COMERCIO AL POR MENOR DE COMBUSTIBLE PARA AUTOMOTORES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4732', 'COMERCIO AL POR MENOR DE LUBRICANTES (ACEITES Y GRASAS) ADITIVOS Y PRODUCTOS DE LIMPIEZA PARA VEHÍCULOS AUTOMOTORES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4742', 'COMERCIO AL POR MENOR DE EQUIPOS Y APARATOS DE SONIDO Y DE VIDEO, EN ESTABLECIMIENTOS ESPECIALIZADOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4751', 'COMERCIO AL POR MENOR DE PRODUCTOS TEXTILES EN ESTABLECIMIENTOS ESPECIALIZADOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4753', 'COMERCIO AL POR MENOR DE TAPICES, ALFOMBRAS Y RECUBRIMIENTOS PARA PAREDES Y PISOS EN ESTABLECIMIENTOS ESPECIALIZADOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4755', 'COMERCIO AL POR MENOR DE ARTÍCULOS Y UTENSILIOS DE USO DOMÉSTICO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4761', 'COMERCIO AL POR MENOR DE LIBROS, PERIÓDICOS, MATERIALES Y ARTÍCULOS DE PAPELERÍA Y ESCRITORIO, EN ESTABLECIMIENTOS ESPECIALIZADOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4762', 'COMERCIO AL POR MENOR DE ARTÍCULOS DEPORTIVOS, EN ESTABLECIMIENTOS ESPECIALIZADOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4771', 'COMERCIO AL POR MENOR DE PRENDAS DE VESTIR Y SUS ACCESORIOS (INCLUYE ARTÍCULOS DE PIEL) EN ESTABLECIMIENTOS ESPECIALIZADOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4772', 'COMERCIO AL POR MENOR DE TODO TIPO DE CALZADO Y ARTÍCULOS DE CUERO Y SUCEDÁNEOS DEL CUERO EN ESTABLECIMIENTOS ESPECIALIZADOS.', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4773', 'COMERCIO AL POR MENOR DE PRODUCTOS FARMACÉUTICOS Y MEDICINALES, COSMÉTICOS Y ARTÍCULOS DE TOCADOR EN ESTABLECIMIENTOS ESPECIALIZADOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4781', 'COMERCIO AL POR MENOR DE ALIMENTOS, BEBIDAS Y TABACO EN PUESTOS DE VENTA MÓVILES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4782', 'COMERCIO AL POR MENOR DE PRODUCTOS TEXTILES, PRENDAS DE VESTIR Y CALZADO, EN PUESTOS DE VENTA MÓVILES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4789', 'COMERCIO AL POR MENOR DE OTROS PRODUCTOS, EN PUESTOS DE VENTA MÓVILES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4791', 'COMERCIO AL POR MENOR REALIZADO A TRAVÉS DE INTERNET', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4792', 'COMERCIO AL POR MENOR REALIZADO A TRAVÉS DE CASAS DE VENTA O POR CORREO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4799', 'OTROS TIPOS DE COMERCIO AL POR MENOR NO REALIZADO EN ESTABLECIMIENTOS, PUESTOS DE VENTA O MERCADOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4911', 'TRANSPORTE FÉRREO DE PASAJEROS ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4912', 'TRANSPORTE FÉRREO DE CARGA ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4922', 'TRANSPORTE MIXTO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4930', 'TRANSPORTE POR TUBERÍAS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('5021', 'TRANSPORTE FLUVIAL DE PASAJEROS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('5022', 'TRANSPORTE FLUVIAL DE CARGA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('5210', 'ALMACENAMIENTO Y DEPÓSITO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('5222', 'ACTIVIDADES DE PUERTOS Y SERVICIOS COMPLEMENTARIOS PARA EL TRANSPORTE ACUÁTICO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('5224', 'MANIPULACIÓN DE CARGA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('5229', 'OTRAS ACTIVIDADES COMPLEMENTARIAS AL TRANSPORTE', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('5310', 'ACTIVIDADES POSTALES NACIONALES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('5320', 'ACTIVIDADES DE MENSAJERÍA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('5511', 'ALOJAMIENTO EN HOTELES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('5512', 'ALOJAMIENTO EN APARTA-HOTELES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('5513', 'ALOJAMIENTO EN CENTROS VACACIONALES ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('5514', 'ALOJAMIENTO RURAL', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('5519', 'OTROS TIPOS DE ALOJAMIENTOS PARA VISITANTES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('5520', 'ACTIVIDADES DE ZONAS DE CAMPING Y PARQUES PARA VEHÍCULOS RECREACIONALES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('5530', 'SERVICIOS POR HORAS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('5590', 'OTROS TIPOS DE ALOJAMIENTO N.C.P. ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('5611', 'EXPENDIO A LA MESA DE COMIDAS PREPARADAS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('5613', 'EXPENDIO DE COMIDAS PREPARADAS EN CAFETERÍAS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('5619', 'OTROS TIPOS DE EXPENDIO DE COMIDAS PREPARADAS N.C.P.', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('5621', 'CATERING PARA EVENTOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('5630', 'EXPENDIO DE BEBIDAS ALCOHÓLICAS PARA EL CONSUMO DENTRO DEL ESTABLECIMIENTO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('5913', 'ACTIVIDADES DE DISTRIBUCIÓN DE PELÍCULAS CINEMATOGRÁFICAS, VIDEOS, PROGRAMAS, ANUNCIOS Y COMERCIALES DE TELEVISIÓN ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('5914', 'ACTIVIDADES DE EXHIBICIÓN DE PELÍCULAS CINEMATOGRÁFICAS Y VIDEOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('6201', 'ACTIVIDADES DE DESARROLLO DE SISTEMAS INFORMÁTICOS (PLANIFICACIÓN, ANÁLISIS, DISEÑO, PROGRAMACIÓN, PRUEBAS).', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('6209', 'OTRAS ACTIVIDADES DE TECNOLOGÍAS DE INFORMACIÓN Y ACTIVIDADES DE SERVICIOS INFORMÁTICOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('6311', 'PROCESAMIENTO DE DATOS, ALOJAMIENTO (HOSTING) Y ACTIVIDADES RELACIONADAS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('6312', 'PORTALES WEB', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('6391', 'ACTIVIDADES DE AGENCIAS DE NOTICIAS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('6399', 'OTRAS ACTIVIDADES DE SERVICIO DE INFORMACIÓN N.C.P.', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('6411', 'BANCO CENTRAL', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('6412', 'BANCOS COMERCIALES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('6421', 'ACTIVIDADES DE LAS CORPORACIONES FINANCIERAS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('6422', 'ACTIVIDADES DE LAS COMPAÑÍAS DE FINANCIAMIENTO ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('6423', 'BANCA DE SEGUNDO PISO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('6424', 'ACTIVIDADES DE LAS COOPERATIVAS FINANCIERAS ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('6431', 'FIDEICOMISOS, FONDOS Y ENTIDADES FINANCIERAS SIMILARES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('6432', 'FONDOS DE CESANTÍAS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('6491', 'LEASING FINANCIERO (ARRENDAMIENTO FINANCIERO)', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('6492', 'ACTIVIDADES FINANCIERAS DE FONDOS DE EMPLEADOS Y OTRAS FORMAS ASOCIATIVAS DEL SECTOR SOLIDARIO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('6493', 'ACTIVIDADES DE COMPRA DE CARTERA O FACTORING', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('6494', 'OTRAS ACTIVIDADES DE DISTRIBUCIÓN DE FONDOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('6495', 'INSTITUCIONES ESPECIALES OFICIALES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('6511', 'SEGUROS GENERALES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('6512', 'SEGUROS DE VIDA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('6513', 'REASEGUROS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('6514', 'CAPITALIZACIÓN', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('6521', 'SERVICIOS DE SEGUROS SOCIALES DE SALUD ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('6522', 'SERVICIOS DE SEGUROS SOCIALES DE RIESGOS PROFESIONALES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('6531', 'RÉGIMEN DE PRIMA MEDIA CON PRESTACIÓN DEFINIDA (RPM)', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('6532', ' RÉGIMEN DE AHORRO INDIVIDUAL (RAI).', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('6611', 'ADMINISTRACIÓN DE MERCADOS FINANCIEROS ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('6612', 'CORRETAJE DE VALORES Y DE CONTRATOS DE PRODUCTOS BÁSICOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('6613', 'OTRAS ACTIVIDADES RELACIONADAS CON EL MERCADO DE VALORES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('6614', 'ACTIVIDADES DE LAS CASAS DE CAMBIO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('6615', 'ACTIVIDADES DE LOS PROFESIONALES DE COMPRA Y VENTA DE DIVISAS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('6619', 'OTRAS ACTIVIDADES AUXILIARES DE LAS ACTIVIDADES DE SERVICIOS FINANCIEROS N.C.P', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('6621', 'ACTIVIDADES DE AGENTES Y CORREDORES DE SEGUROS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('6630', 'ACTIVIDADES DE ADMINISTRACIÓN DE FONDOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('6810', 'ACTIVIDADES INMOBILIARIAS REALIZADAS CON BIENES PROPIOS O ARRENDADOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('6820', 'ACTIVIDADES INMOBILIARIAS REALIZADAS A CAMBIO DE UNA RETRIBUCIÓN O POR CONTRATA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('6910', 'ACTIVIDADES JURÍDICAS ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('6920', 'ACTIVIDADES DE CONTABILIDAD, TENEDURÍA DE LIBROS, AUDITORIA FINANCIERA Y ASESORÍA TRIBUTARIA ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('7010', 'ACTIVIDADES DE ADMINISTRACIÓN EMPRESARIAL', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('7020', 'ACTIVIDADES DE CONSULTORÍA DE GESTIÓN', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('7110', 'ACTIVIDADES DE ARQUITECTURA E INGENIERÍA Y OTRAS ACTIVIDADES CONEXAS DE CONSULTORÍA TÉCNICA ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('7120', 'ENSAYOS Y ANÁLISIS TÉCNICOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('7210', 'INVESTIGACIONES Y DESARROLLO EXPERIMENTAL EN EL CAMPO DE LAS CIENCIAS NATURALES Y LA INGENIERÍA ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('7220', 'INVESTIGACIONES Y DESARROLLO EXPERIMENTAL EN EL CAMPO DE LAS CIENCIAS SOCIALES Y LAS HUMANIDADES ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('7310', 'PUBLICIDAD', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('7320', 'ESTUDIOS DE MERCADO Y REALIZACIÓN DE ENCUESTAS DE OPINIÓN PÚBLICA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('7500', 'ACTIVIDADES VETERINARIAS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('7710', 'ALQUILER Y ARRENDAMIENTO DE VEHÍCULOS AUTOMOTORES ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('7721', 'ALQUILER Y ARRENDAMIENTO DE EQUIPO RECREATIVO Y DEPORTIVO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('7722', 'ALQUILER DE VIDEOS Y DISCOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('7729', 'ALQUILER Y ARRENDAMIENTO DE OTROS EFECTOS PERSONALES Y ENSERES DOMÉSTICOS N.C.P.', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('7740', 'ARRENDAMIENTO DE PROPIEDAD INTELECTUAL Y PRODUCTOS SIMILARES, EXCEPTO OBRAS PROTEGIDAS POR DERECHOS DE AUTOR', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('7820', 'ACTIVIDADES DE AGENCIAS DE EMPLEO TEMPORAL', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('7830', 'OTRAS ACTIVIDADES DE SUMINISTRO DE RECURSO HUMANO ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('7911', 'ACTIVIDADES DE LAS AGENCIAS DE VIAJES ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('7912', 'ACTIVIDADES DE OPERADORES TURÍSTICOS ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('8010', 'ACTIVIDADES DE SEGURIDAD PRIVADA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('8020', 'ACTIVIDADES DE SERVICIOS DE SISTEMAS DE SEGURIDAD ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('8030', 'ACTIVIDADES DE DETECTIVES E INVESTIGADORES PRIVADOS ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('8110', 'ACTIVIDADES COMBINADAS DE APOYO A INSTALACIONES ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('8121', 'LIMPIEZA GENERAL INTERIOR DE EDIFICIOS ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('8211', 'ACTIVIDADES COMBINADAS DE SERVICIOS ADMINISTRATIVOS DE OFICINA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('8220', 'ACTIVIDADES DE CENTROS DE LLAMADAS (CALL CENTER)', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('8230', 'ORGANIZACIÓN DE CONVENCIONES Y EVENTOS COMERCIALES ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('8291', 'ACTIVIDADES DE AGENCIAS DE COBRANZA Y OFICINAS DE CALIFICACIÓN CREDITICIA ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('8292', 'ACTIVIDADES DE ENVASE Y EMPAQUE ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('8299', 'OTRAS ACTIVIDADES DE SERVICIO DE APOYO A LAS EMPRESAS N.C.P.', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('8411', 'ACTIVIDADES LEGISLATIVAS DE LA ADMINISTRACIÓN PUBLICA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('8413', 'REGULACIÓN DE LAS ACTIVIDADES DE ORGANISMOS QUE PRESTAN SERVICIOS DE SALUD, EDUCATIVOS, CULTURALES Y OTROS SERVICIOS SOCIALES, EXCEPTO SERVICIOS DE SEGURIDAD SOCIAL ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('8414', 'ACTIVIDADES REGULADORAS Y FACILITADORAS DE LA ACTIVIDAD ECONÓMICA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('8415', 'ACTIVIDADES DE LOS OTROS ÓRGANOS DE CONTROL ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('8421', 'RELACIONES EXTERIORES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('8422', 'ACTIVIDADES DE DEFENSA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('8423', 'ORDEN PÚBLICO Y ACTIVIDADES DE SEGURIDAD ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('8424', 'ADMINISTRACIÓN DE JUSTICIA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('8430', 'ACTIVIDADES DE PLANES DE SEGURIDAD SOCIAL DE AFILIACIÓN OBLIGATORIA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('8512', 'EDUCACIÓN PREESCOLAR', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('8513', 'EDUCACIÓN BÁSICA PRIMARIA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('8521', 'EDUCACIÓN BÁSICA SECUNDARIA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('8522', 'EDUCACIÓN MEDIA ACADÉMICA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('8523', 'EDUCACIÓN MEDIA TÉCNICA Y DE FORMACIÓN LABORAL', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('8541', 'EDUCACIÓN TÉCNICA PROFESIONAL', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('8542', 'EDUCACIÓN TECNOLÓGICA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('8543', 'EDUCACIÓN DE INSTITUCIONES UNIVERSITARIAS O DE ESCUELAS TECNOLÓGICAS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('8544', 'EDUCACIÓN DE UNIVERSIDADES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('8551', 'FORMACIÓN ACADÉMICA NO FORMAL', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('8560', 'ACTIVIDADES DE APOYO A LA EDUCACIÓN', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('8610', 'ACTIVIDADES DE HOSPITALES Y CLÍNICAS, CON INTERNACIÓN', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('8621', 'ACTIVIDADES DE LA PRÁCTICA MÉDICA, SIN INTERNACIÓN', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('8622', 'ACTIVIDADES DE LA PRÁCTICA ODONTOLÓGICA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('8691', 'ACTIVIDADES DE APOYO DIAGNÓSTICO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('8692', 'ACTIVIDADES DE APOYO TERAPÉUTICO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('8699', 'OTRAS ACTIVIDADES DE ATENCIÓN DE LA SALUD HUMANA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('8710', 'ACTIVIDADES DE ATENCIÓN RESIDENCIAL MEDICALIZADA DE TIPO GENERAL', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('8720', 'ACTIVIDADES DE ATENCIÓN RESIDENCIAL, PARA EL CUIDADO DE PACIENTES CON RETARDO MENTAL, ENFERMEDAD MENTAL Y CONSUMO DE SUSTANCIAS PSICOACTIVAS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('8730', 'ACTIVIDADES DE ATENCIÓN EN INSTITUCIONES PARA EL CUIDADO DE PERSONAS MAYORES Y/O DISCAPACITADAS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('8790', 'OTRAS ACTIVIDADES DE ATENCIÓN EN INSTITUCIONES CON ALOJAMIENTO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('8810', 'ACTIVIDADES DE ASISTENCIA SOCIAL SIN ALOJAMIENTO PARA PERSONAS MAYORES Y DISCAPACITADAS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('8890', 'OTRAS ACTIVIDADES DE ASISTENCIA SOCIAL SIN ALOJAMIENTO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('9002', 'CREACIÓN MUSICAL', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('9003', 'CREACIÓN TEATRAL', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('9004', 'CREACIÓN AUDIOVISUAL', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('9005', 'ARTES PLÁSTICAS Y VISUALES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('9006', 'ACTIVIDADES TEATRALES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('9007', 'ACTIVIDADES DE ESPECTÁCULOS MUSICALES EN VIVO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('9008', 'OTRAS ACTIVIDADES DE ESPECTÁCULOS EN VIVO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('9101', 'ACTIVIDADES DE BIBLIOTECAS Y ARCHIVOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('9102', 'ACTIVIDADES Y FUNCIONAMIENTO DE MUSEOS, CONSERVACIÓN DE EDIFICIOS Y SITIOS HISTÓRICOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('9103', 'ACTIVIDADES DE JARDINES BOTÁNICOS, ZOOLÓGICOS Y RESERVAS NATURALES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('9200', 'ACTIVIDADES DE JUEGOS DE AZAR Y APUESTAS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('9311', 'GESTIÓN DE INSTALACIONES DEPORTIVAS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('9312', 'ACTIVIDADES DE CLUBES DEPORTIVOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('9319', 'OTRAS ACTIVIDADES DEPORTIVAS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('9321', 'ACTIVIDADES DE PARQUES DE ATRACCIONES Y PARQUES TEMÁTICOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('9411', 'ACTIVIDADES DE ASOCIACIONES EMPRESARIALES Y DE EMPLEADORES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('9412', 'ACTIVIDADES DE ASOCIACIONES PROFESIONALES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('9420', 'ACTIVIDADES DE SINDICATOS DE EMPLEADOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('9491', 'ACTIVIDADES DE ASOCIACIONES RELIGIOSAS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('9492', 'ACTIVIDADES DE ASOCIACIONES POLÍTICAS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('9511', 'MANTENIMIENTO Y REPARACIÓN DE COMPUTADORAS Y DE EQUIPO PERIFÉRICO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('9521', 'MANTENIMIENTO Y REPARACIÓN DE APARATOS ELECTRÓNICOS DE CONSUMO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('9522', 'MANTENIMIENTO Y REPARACIÓN DE APARATOS Y EQUIPOS DOMÉSTICOS Y DE JARDINERÍA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('9523', 'REPARACIÓN DE CALZADO Y ARTÍCULOS DE CUERO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('9601', 'LAVADO Y LIMPIEZA, INCLUSO LA LIMPIEZA EN SECO, DE PRODUCTOS TEXTILES Y DE PIEL ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('9602', 'PELUQUERÍA Y OTROS TRATAMIENTOS DE BELLEZA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('9603', 'POMPAS FÚNEBRES Y ACTIVIDADES RELACIONADAS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('9609', 'OTRAS ACTIVIDADES DE SERVICIOS PERSONALES N.C.P.', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('9700', 'ACTIVIDADES DE LOS HOGARES INDIVIDUALES COMO EMPLEADORES DE PERSONAL DOMÉSTICO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('9810', 'ACTIVIDADES NO DIFERENCIADAS DE LOS HOGARES INDIVIDUALES COMO PRODUCTORES DE BIENES PARA USO PROPIO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('9820', 'ACTIVIDADES NO DIFERENCIADAS DE LOS HOGARES INDIVIDUALES COMO PRODUCTORES DE SERVICIOS PARA USO PROPIO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('9900', 'ACTIVIDADES DE ORGANIZACIONES Y ENTIDADES EXTRATERRITORIALES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0112', 'CULTIVO DE ARROZ ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0113', 'CULTIVO DE HORTALIZAS, RAÍCES Y TUBÉRCULOS ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0114', 'CULTIVO DE TABACO ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0115', 'CULTIVO DE PLANTAS TEXTILES ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0119', 'OTROS CULTIVOS TRANSITORIOS N.C.P.', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0121', 'CULTIVO DE FRUTAS TROPICALES Y SUBTROPICALES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0122', 'CULTIVO DE PLÁTANO Y BANANO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0123', 'CULTIVO DE CAFÉ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0124', 'CULTIVO DE CAÑA DE AZÚCAR', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0125', 'CULTIVO DE FLOR DE CORTE', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0126', 'CULTIVO DE PALMA PARA ACEITE (PALMA AFRICANA) Y OTROS FRUTOS OLEAGINOSOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0127', 'CULTIVO DE PLANTAS CON LAS QUE SE PREPARAN BEBIDAS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0128', 'CULTIVO DE ESPECIAS Y DE PLANTAS AROMÁTICAS Y MEDICINALES ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0129', 'OTROS CULTIVOS PERMANENTES N.C.P.', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0141', 'CRÍA DE GANADO BOVINO Y BUFALINO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0142', 'CRÍA DE CABALLOS Y OTROS EQUINOS ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0143', 'CRÍA DE OVEJAS Y CABRAS ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0144', 'CRÍA DE GANADO PORCINO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0145', 'CRÍA DE AVES DE CORRAL', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0149', 'CRÍA DE OTROS ANIMALES N.C.P.', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0163', 'ACTIVIDADES POSTERIORES A LA COSECHA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0230', 'RECOLECCIÓN DE PRODUCTOS FORESTALES DIFERENTES A LA MADERA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0311', 'PESCA MARÍTIMA ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0312', 'PESCA DE AGUA DULCE ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0321', 'ACUICULTURA MARÍTIMA ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0322', 'ACUICULTURA DE AGUA DULCE', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0811', 'EXTRACCIÓN DE PIEDRA, ARENA, ARCILLAS COMUNES, YESO Y ANHIDRITA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0820', 'EXTRACCIÓN DE ESMERALDAS, PIEDRAS PRECIOSAS Y SEMIPRECIOSAS ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0899', 'EXTRACCIÓN DE OTROS MINERALES NO METÁLICOS N.C.P.', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0910', 'ACTIVIDADES DE APOYO PARA LA EXTRACCIÓN DE PETRÓLEO Y DE GAS NATURAL', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('0990', 'ACTIVIDADES DE APOYO PARA OTRAS ACTIVIDADES DE EXPLOTACIÓN DE MINAS Y CANTERAS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1020', 'PROCESAMIENTO Y CONSERVACIÓN DE FRUTAS, LEGUMBRES, HORTALIZAS Y TUBÉRCULOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1084', 'ELABORACIÓN DE COMIDAS Y PLATOS PREPARADOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1089', 'ELABORACIÓN DE OTROS PRODUCTOS ALIMENTICIOS N.C.P.', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1200', 'ELABORACIÓN DE PRODUCTOS DEL TABACO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1312', 'TEJEDURÍA DE PRODUCTOS TEXTILES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1313', 'ACABADO DE PRODUCTOS TEXTILES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1392', 'CONFECCIÓN DE ARTÍCULOS CON MATERIALES TEXTILES, EXCEPTO PRENDAS DE VESTIR', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1511', 'CURTIDO Y RECURTIDO DE CUEROS: RECURTIDO Y TEÑIDO DE PIELES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1512', 'FABRICACIÓN DE ARTÍCULOS DE VIAJE, BOLSOS DE MANO Y ARTÍCULOS SIMILARES ELABORADOS EN CUERO, Y FABRICACIÓN DE ARTÍCULOS DE TALABARTERÍA Y GUARNICIONERÍA
', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1521', 'FABRICACIÓN DE CALZADO DE CUERO Y PIEL, CON CUALQUIER TIPO DE SUELA ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1522', 'FABRICACIÓN DE OTROS TIPOS DE CALZADO, EXCEPTO CALZADO DE CUERO Y PIEL', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1690', 'FABRICACIÓN DE OTROS PRODUCTOS DE MADERA: FABRICACIÓN DE ARTÍCULOS DE CORCHO, CESTERÍA Y ESPARTERÍA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1709', 'FABRICACIÓN DE OTROS ARTÍCULOS DE PAPEL Y CARTÓN', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1811', 'ACTIVIDADES DE IMPRESIÓN', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('1921', 'FABRICACIÓN DE PRODUCTOS DE LA REFINACIÓN DEL PETRÓLEO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2011', 'FABRICACIÓN DE SUSTANCIAS Y PRODUCTOS QUÍMICOS BÁSICOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2013', 'FABRICACIÓN DE PLÁSTICOS EN FORMAS PRIMARIAS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2100', 'FABRICACIÓN DE PRODUCTOS FARMACÉUTICOS, SUSTANCIAS QUÍMICAS MEDICINALES Y PRODUCTOS BOTÁNICOS DE USO FARMACÉUTICO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2219', 'FABRICACIÓN DE FORMAS BÁSICAS DE CAUCHO Y OTROS PRODUCTOS DE CAUCHO N.C.P.', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2229', 'FABRICACIÓN DE ARTÍCULOS DE PLÁSTICO N.C.P.', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2392', 'FABRICACIÓN DE MATERIALES DE ARCILLA PARA LA CONSTRUCCIÓN', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2429', 'INDUSTRIAS BÁSICAS DE OTROS METALES NO FERROSOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2431', 'FUNDICIÓN DE HIERRO Y DE ACERO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2593', 'FABRICACIÓN DE ARTÍCULOS DE CUCHILLERÍA, HERRAMIENTAS DE MANO Y ARTÍCULOS DE FERRETERÍA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2599', 'FABRICACIÓN DE OTROS PRODUCTOS ELABORADOS DE METAL N.C.P.', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2610', 'FABRICACIÓN DE COMPONENTES Y TABLEROS ELECTRÓNICOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2630', 'FABRICACIÓN DE EQUIPOS DE COMUNICACIÓN', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2640', 'FABRICACIÓN DE APARATOS ELECTRÓNICOS DE CONSUMO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2651', 'FABRICACIÓN DE EQUIPO DE MEDICIÓN, PRUEBA, NAVEGACIÓN Y CONTROL', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2670', 'FABRICACIÓN DE INSTRUMENTOS ÓPTICOS Y EQUIPO FOTOGRÁFICO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2731', 'FABRICACIÓN DE HILOS Y CABLES ELÉCTRICOS Y DE FIBRA ÓPTICA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2732', 'FABRICACIÓN DE DISPOSITIVOS DE CABLEADO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2740', 'FABRICACIÓN DE EQUIPOS ELÉCTRICOS DE ILUMINACIÓN', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2790', 'FABRICACIÓN DE OTROS TIPOS DE EQUIPO ELÉCTRICO N.C.P.', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2811', 'FABRICACIÓN DE MOTORES, TURBINAS, Y PARTES PARA MOTORES DE COMBUSTIÓN INTERNA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2812', 'FABRICACIÓN DE EQUIPOS DE POTENCIA HIDRÁULICA Y NEUMÁTICA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2815', 'FABRICACIÓN DE HORNOS, HOGARES Y QUEMADORES INDUSTRIALES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2816', 'FABRICACIÓN DE EQUIPO DE ELEVACIÓN Y MANIPULACIÓN', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2817', 'FABRICACIÓN DE MAQUINARIA Y EQUIPO DE OFICINA (EXCEPTO COMPUTADORAS Y EQUIPO PERIFÉRICO)', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2819', 'FABRICACIÓN DE OTROS TIPOS DE MAQUINARIA Y EQUIPO DE USO GENERAL N.C.P..', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2826', 'FABRICACIÓN DE MAQUINARIA PARA LA ELABORACIÓN DE PRODUCTOS TEXTILES, PRENDAS DE VESTIR Y CUEROS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2829', 'FABRICACIÓN DE OTROS TIPOS DE MAQUINARIA Y EQUIPO DE USO ESPECIAL N.C.P.', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('2930', 'FABRICACIÓN DE PARTES, PIEZAS (AUTOPARTES) Y ACCESORIOS (LUJOS) PARA VEHÍCULOS AUTOMOTORES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('3030', 'FABRICACIÓN DE AERONAVES, NAVES ESPACIALES Y DE MAQUINARIA CONEXA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('3110', 'FABRICACIÓN DE MUEBLES ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('3210', 'FABRICACIÓN DE JOYAS, BISUTERÍA Y ARTÍCULOS CONEXOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('3230', 'FABRICACIÓN DE ARTÍCULOS Y EQUIPO PARA LA PRÁCTICA DEL DEPORTE', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('3240', 'FABRICACIÓN DE JUEGOS, JUGUETES Y ROMPECABEZAS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('3250', 'FABRICACIÓN DE INSTRUMENTOS, APARATOS Y MATERIALES MÉDICOS Y ODONTOLÓGICOS (INCLUIDO MOBILIARIO)', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('3290', 'OTRAS INDUSTRIAS MANUFACTURERAS N.C.P.', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('3311', 'MANTENIMIENTO Y REPARACIÓN ESPECIALIZADO DE PRODUCTOS ELABORADOS EN METAL', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('3312', 'MANTENIMIENTO Y REPARACIÓN ESPECIALIZADO DE MAQUINARIA Y EQUIPO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('3313', 'MANTENIMIENTO Y REPARACIÓN ESPECIALIZADO DE EQUIPO ELECTRÓNICO Y ÓPTICO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('3314', 'MANTENIMIENTO Y REPARACIÓN ESPECIALIZADO DE EQUIPO ELÉCTRICO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('3315', 'MANTENIMIENTO Y REPARACIÓN ESPECIALIZADO DE EQUIPO DE TRANSPORTE, EXCEPTO LOS VEHÍCULOS AUTOMOTORES, MOTOCICLETAS Y BICICLETAS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('3319', 'MANTENIMIENTO Y REPARACIÓN DE OTROS TIPOS DE EQUIPOS Y SUS COMPONENTES N.C.P.', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('3320', 'INSTALACIÓN ESPECIALIZADA DE MAQUINARIA Y EQUIPO INDUSTRIAL', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('3530', 'SUMINISTRO DE VAPOR Y AIRE ACONDICIONADO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('3812', 'RECOLECCIÓN DE DESECHOS PELIGROSOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('3821', 'TRATAMIENTO Y DISPOSICIÓN DE DESECHOS NO PELIGROSOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('3822', 'TRATAMIENTO Y DISPOSICIÓN DE DESECHOS PELIGROSOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('3830', 'RECUPERACIÓN DE MATERIALES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('3900', 'ACTIVIDADES DE SANEAMIENTO AMBIENTAL Y OTROS SERVICIOS DE GESTIÓN DE DESECHOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4290', 'CONSTRUCCIÓN DE OTRAS OBRAS DE INGENIERÍA CIVIL', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4311', 'DEMOLICIÓN', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4312', 'PREPARACIÓN DEL TERRENO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4322', 'INSTALACIONES DE FONTANERÍA, CALEFACCIÓN Y AIRE ACONDICIONADO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4329', 'OTRAS INSTALACIONES ESPECIALIZADAS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4390', 'OTRAS ACTIVIDADES ESPECIALIZADAS PARA LA CONSTRUCCIÓN DE EDIFICIOS Y OBRAS DE INGENIERÍA CIVIL', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4542', 'MANTENIMIENTO Y REPARACIÓN DE MOTOCICLETAS Y DE SUS PARTES Y PIEZAS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4620', 'COMERCIO AL POR MAYOR DE MATERIAS PRIMAS AGROPECUARIAS: ANIMALES VIVOS.
', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4645', 'COMERCIO AL POR MAYOR DE PRODUCTOS FARMACÉUTICOS, MEDICINALES, COSMÉTICOS Y DE TOCADOR', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4649', 'COMERCIO AL POR MAYOR DE OTROS UTENSILIOS DOMÉSTICOS N.C.P.', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4659', 'COMERCIO AL POR MAYOR DE OTROS TIPOS DE MAQUINARIA Y EQUIPO N.C.P.', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4664', 'COMERCIO AL POR MAYOR DE PRODUCTOS QUÍMICOS BÁSICOS, CAUCHOS Y PLÁSTICOS EN FORMAS PRIMARIAS Y PRODUCTOS QUÍMICOS DE USO
AGROPECUARIO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4669', 'COMERCIO AL POR MAYOR DE OTROS PRODUCTOS N.C.P.', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4729', 'COMERCIO AL POR MENOR DE OTROS PRODUCTOS ALIMENTICIOS N.C.P., EN ESTABLECIMIENTOS ESPECIALIZADOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4741', 'COMERCIO AL POR MENOR DE COMPUTADORES, EQUIPOS PERIFÉRICOS, PROGRAMAS DE INFORMÁTICA Y EQUIPOS DE TELECOMUNICACIONES EN ESTABLECIMIENTOS ESPECIALIZADOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4752', 'COMERCIO AL POR MENOR DE ARTÍCULOS DE FERRETERÍA, PINTURAS Y PRODUCTOS DE VIDRIO EN ESTABLECIMIENTOS ESPECIALIZADOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4754', 'COMERCIO AL POR MENOR DE ELECTRODOMÉSTICOS Y GASODOMESTICOS DE USO DOMÉSTICO, MUEBLES Y EQUIPOS DE ILUMINACIÓN ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4759', 'COMERCIO AL POR MENOR DE OTROS ARTÍCULOS DOMÉSTICOS EN ESTABLECIMIENTOS ESPECIALIZADOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4769', 'COMERCIO AL POR MENOR DE OTROS ARTÍCULOS CULTURALES Y DE ENTRETENIMIENTO N.C.P. EN ESTABLECIMIENTOS ESPECIALIZADOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4774', 'COMERCIO AL POR MENOR DE OTROS PRODUCTOS NUEVOS, EN ESTABLECIMIENTOS ESPECIALIZADOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4775', 'COMERCIO AL POR MENOR DE ARTÍCULOS DE SEGUNDA MANO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4921', 'TRANSPORTE DE PASAJEROS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('4923', 'TRANSPORTE DE CARGA POR CARRETERA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('5011', 'TRANSPORTE DE PASAJEROS MARÍTIMO Y DE CABOTAJE ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('5012', 'TRANSPORTE DE CARGA MARÍTIMO Y DE CABOTAJE ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('5111', 'TRANSPORTE AÉREO NACIONAL DE PASAJEROS ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('5112', 'TRANSPORTE AÉREO INTERNACIONAL DE PASAJEROS ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('5121', 'TRANSPORTE AÉREO NACIONAL DE CARGA ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('5122', 'TRANSPORTE AÉREO INTERNACIONAL DE CARGA ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('5221', 'ACTIVIDADES DE ESTACIONES, VÍAS Y SERVICIOS COMPLEMENTARIOS PARA EL TRANSPORTE TERRESTRE', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('5223', 'ACTIVIDADES DE AEROPUERTOS, SERVICIOS DE NAVEGACIÓN AÉREA Y DEMÁS ACTIVIDADES CONEXAS AL TRANSPORTE AÉREO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('5612', 'EXPENDIO POR AUTOSERVICIO DE COMIDAS PREPARADAS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('5629', 'ACTIVIDADES DE OTROS SERVICIOS DE COMIDAS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('5811', 'EDICIÓN DE LIBROS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('5812', 'EDICIÓN DE DIRECTORIOS Y LISTAS DE CORREO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('5813', 'EDICIÓN DE PERIÓDICOS, REVISTAS Y OTRAS PUBLICACIONES PERIÓDICAS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('5819', 'OTROS TRABAJOS DE EDICIÓN', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('5820', 'EDICIÓN DE PROGRAMAS DE INFORMÁTICA (SOFTWARE) ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('5911', 'ACTIVIDADES DE PRODUCCIÓN DE PELÍCULAS CINEMATOGRÁFICAS, VIDEOS, PROGRAMAS, ANUNCIOS Y COMERCIALES DE TELEVISIÓN', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('5912', 'ACTIVIDADES DE POSTPRODUCCIÓN DE PELÍCULAS CINEMATOGRÁFICAS, VIDEOS, PROGRAMAS, ANUNCIOS Y COMERCIALES DE TELEVISIÓN', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('5920', 'ACTIVIDADES DE GRABACIÓN DE SONIDO Y EDICIÓN DE MÚSICA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('6010', 'ACTIVIDADES DE PROGRAMACIÓN Y TRANSMISIÓN EN EL SERVICIO DE RADIODIFUSIÓN SONORA ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('6020', 'ACTIVIDADES DE PROGRAMACIÓN Y TRANSMISIÓN DE TELEVISIÓN', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('6110', 'ACTIVIDADES DE TELECOMUNICACIONES ALÁMBRICAS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('6120', 'ACTIVIDADES DE TELECOMUNICACIONES INALÁMBRICAS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('6130', 'ACTIVIDADES DE TELECOMUNICACIÓN SATELITAL', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('6190', 'OTRAS ACTIVIDADES DE TELECOMUNICACIONES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('6202', 'ACTIVIDADES DE CONSULTORÍA INFORMÁTICA Y ACTIVIDADES DE ADMINISTRACIÓN DE INSTALACIONES INFORMÁTICAS ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('6499', 'OTRAS ACTIVIDADES DE SERVICIO FINANCIERO, EXCEPTO LAS DE SEGUROS Y PENSIONES N.C.P.', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('6629', 'EVALUACIÓN DE RIESGOS Y DAÑOS Y OTRAS ACTIVIDADES DE SERVICIOS AUXILIARES', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('7410', 'ACTIVIDADES ESPECIALIZADAS DE DISEÑO', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('7420', 'ACTIVIDADES DE FOTOGRAFÍA ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('7490', 'OTRAS ACTIVIDADES PROFESIONALES, CIENTÍFICAS Y TÉCNICAS N.C.P.', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('7730', 'ALQUILER Y ARRENDAMIENTO DE OTROS TIPOS DE MAQUINARIA, EQUIPO Y BIENES TANGIBLES N.C.P.', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('7810', 'ACTIVIDADES DE AGENCIAS DE EMPLEO ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('7990', 'OTROS SERVICIOS DE RESERVA Y ACTIVIDADES RELACIONADAS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('8129', 'OTRAS ACTIVIDADES DE LIMPIEZA DE EDIFICIOS E INSTALACIONES INDUSTRIALES ', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('8130', ' ACTIVIDADES DE PAISAJISMO Y SERVICIOS DE MANTENIMIENTO CONEXOS', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('8219', 'FOTOCOPIADO, PREPARACIÓN DE DOCUMENTOS Y OTRAS ACTIVIDADES ESPECIALIZADAS DE APOYO A OFICINA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('8412', 'ACTIVIDADES EJECUTIVAS DE LA ADMINISTRACIÓN PUBLICA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('8530', 'ESTABLECIMIENTOS QUE COMBINAN DIFERENTES NIVELES DE EDUCACIÓN', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('8553', 'ENSEÑANZA CULTURAL', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('8559', 'OTROS TIPOS DE EDUCACIÓN N.C.P.', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('9001', 'CREACIÓN LITERARIA', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('9329', 'OTRAS ACTIVIDADES RECREATIVAS Y DE ESPARCIMIENTO N.C.P.', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('9499', 'ACTIVIDADES DE OTRAS ASOCIACIONES N.C.P.', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('9512', 'MANTENIMIENTO Y REPARACIÓN DE EQUIPOS DE COMUNICACIÓN', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('9524', 'REPARACIÓN DE MUEBLES Y ACCESORIOS PARA EL HOGAR', NULL, NULL);
INSERT INTO syli.tp_actividad_economica VALUES ('9529', 'MANTENIMIENTO Y REPARACIÓN DE OTROS EFECTOS PERSONALES Y ENSERES DOMÉSTICOS', NULL, NULL);


--
-- TOC entry 4736 (class 0 OID 99368)
-- Dependencies: 567
-- Data for Name: tp_actividad_economica_h; Type: TABLE DATA; Schema: syli; Owner: -
--

INSERT INTO syli.tp_actividad_economica_h VALUES ('0010', '0010', 'ASALARIADOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('0081', '0081', 'SIN ACTIVIDAD ECONÓMICA, SOLO PARA PERSONAS NATURALES', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('0082', '0082', 'PERSONAS NATURALES SUBSIDIADAS POR TERCEROS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('0090', '0090', 'RENTISTAS DE CAPITAL, SOLO PARA PERSONAS NATURALES', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('0111', '0111', 'CULTIVO DE CAFÉ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('0150', '0130', 'EXPLOTACIÓN MIXTA (AGRÍCOLA Y PECUARIA) ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('0161', '0140', 'ACTIVIDADES DE APOYO A LA AGRICULTURA ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('0170', '0150', 'CAZA ORDINARIA Y MEDIANTE TRAMPAS Y ACTIVIDADES DE SERVICIOS CONEXAS ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('0210', '0201', 'SILVICULTURA Y OTRAS ACTIVIDADES FORESTALES', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('0240', '0202', 'SERVICIOS DE APOYO A LA SILVICULTURA ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('0510', '1010', 'EXTRACCIÓN DE HULLA (CARBÓN DE PIEDRA)', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('0520', '1020', 'EXTRACCIÓN DE CARBÓN LIGNITO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('0610', '1110', 'EXTRACCIÓN DE PETRÓLEO CRUDO ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('0710', '1310', 'EXTRACCIÓN DE MINERALES DE HIERRO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('0721', '1200', 'EXTRACCIÓN DE MINERALES DE URANIO Y DE TORIO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('0722', '1320', 'EXTRACCIÓN DE ORO Y OTROS METALES PRECIOSOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('0723', '1331', 'EXTRACCIÓN DE MINERALES DE NÍQUEL', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('0729', '1339', 'EXTRACCIÓN DE OTROS MINERALES METALÍFEROS NO FERROSOS N.C.P.', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('0812', '1413', 'EXTRACCIÓN DE ARCILLAS DE USO INDUSTRIAL, CALIZA, CAOLÍN Y BENTONITAS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('0812', '1414', 'EXTRACCIÓN DE ARCILLAS DE USO INDUSTRIAL, CALIZA, CAOLÍN Y BENTONITAS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('0891', '1421', 'EXTRACCIÓN DE MINERALES PARA LA FABRICACIÓN DE ABONOS Y PRODUCTOS QUÍMICOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('0892', '1422', 'EXTRACCIÓN DE HALITA (SAL)', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1011', '1511', 'PROCESAMIENTO Y CONSERVACIÓN DE CARNE Y PRODUCTOS CÁRNICOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1012', '1512', 'PROCESAMIENTO Y CONSERVACIÓN DE PESCADOS, CRUSTÁCEOS Y MOLUSCOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1030', '1522', 'ELABORACIÓN DE ACEITES Y GRASAS DE ORIGEN VEGETAL Y ANIMAL', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1040', '1530', 'ELABORACIÓN DE PRODUCTOS LÁCTEOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1051', '1541', 'ELABORACIÓN DE PRODUCTOS DE MOLINERÍA', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1052', '1542', 'ELABORACIÓN DE ALMIDONES Y PRODUCTOS DERIVADOS DEL ALMIDÓN', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1061', '1561', 'TRILLA DE CAFÉ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1062', '1562', 'DESCAFEINADO, TOSTIÓN Y MOLIENDA DEL CAFÉ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1062', '1563', 'DESCAFEINADO, TOSTIÓN Y MOLIENDA DEL CAFÉ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1063', '1564', 'OTROS DERIVADOS DEL CAFÉ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1071', '1571', 'ELABORACIÓN Y REFINACIÓN DE AZÚCAR', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1072', '1572', 'ELABORACIÓN DE PANELA', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1081', '1582', 'ELABORACIÓN DE PRODUCTOS DE PANADERÍA', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1082', '1581', 'ELABORACIÓN DE CACAO, CHOCOLATE Y PRODUCTOS DE CONFITERÍA', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1083', '1583', 'ELABORACIÓN DE MACARRONES, FIDEOS, ALCUZCUZ Y PRODUCTOS FARINÁCEOS SIMILARES', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1090', '1543', 'ELABORACIÓN DE ALIMENTOS PREPARADOS PARA ANIMALES', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1101', '1591', 'DESTILACIÓN, RECTIFICACIÓN Y MEZCLA DE BEBIDAS ALCOHÓLICAS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1102', '1592', 'ELABORACIÓN DE BEBIDAS FERMENTADAS NO DESTILADAS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1103', '1593', 'PRODUCCIÓN DE MALTA, ELABORACIÓN DE CERVEZAS Y OTRAS BEBIDAS MALTEADAS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1104', '1594', 'ELABORACIÓN DE BEBIDAS NO ALCOHÓLICAS, PRODUCCIÓN DE AGUAS MINERALES Y DE OTRAS AGUAS EMBOTELLADAS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1311', '1710', 'PREPARACIÓN E HILATURA DE FIBRAS TEXTILES', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1391', '1750', 'FABRICACIÓN DE TEJIDOS DE PUNTO Y GANCHILLO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1393', '1742', 'FABRICACIÓN DE TAPETES Y ALFOMBRAS PARA PISOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1394', '1743', 'FABRICACIÓN DE CUERDAS, CORDELES, CABLES, BRAMANTES Y REDES', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1420', '1820', 'FABRICACIÓN DE ARTÍCULOS DE PIEL', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1513', '1932', 'FABRICACIÓN DE ARTÍCULOS DE VIAJE, BOLSOS DE MANO Y ARTÍCULOS SIMILARES: ARTÍCULOS DE TALABARTERÍA Y GUARNICIONERÍA ELABORADOS EN OTROS MATERIALES
', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1513', '1939', 'FABRICACIÓN DE ARTÍCULOS DE VIAJE, BOLSOS DE MANO Y ARTÍCULOS SIMILARES: ARTÍCULOS DE TALABARTERÍA Y GUARNICIONERÍA ELABORADOS EN OTROS MATERIALES
', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1523', '1926', 'FABRICACIÓN DE PARTES DEL CALZADO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1610', '2010', 'ASERRADO, ACEPILLADO E IMPREGNACIÓN DE LA MADERA', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1620', '2020', 'FABRICACIÓN DE HOJAS DE MADERA PARA ENCHAPADO: FABRICACIÓN DE TABLEROS CONTRACHAPADOS, TABLEROS LAMINADOS, TABLEROS DE PARTÍCULAS Y OTROS TABLEROS Y PANELES', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1630', '2030', 'FABRICACIÓN DE PARTES Y PIEZAS DE MADERA, DE CARPINTERÍA Y EBANISTERÍA PARA LA CONSTRUCCIÓN
', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1640', '2040', 'FABRICACIÓN DE RECIPIENTES DE MADERA', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1701', '2101', 'FABRICACIÓN DE PULPAS (PASTAS) CELULÓSICAS: PAPEL Y CARTÓN', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1702', '2102', 'FABRICACIÓN DE PAPEL Y CARTÓN ONDULADO (CORRUGADO): FABRICACIÓN DE ENVASES, EMPAQUES Y DE EMBALAJES DE PAPEL Y CARTÓN', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1812', '2230', 'ACTIVIDADES DE SERVICIOS RELACIONADOS CON LA IMPRESIÓN', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1820', '2240', 'PRODUCCIÓN DE COPIAS A PARTIR DE GRABACIONES ORIGINALES', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1910', '2310', 'FABRICACIÓN DE PRODUCTOS DE HORNOS DE COQUE ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2012', '2412', 'FABRICACIÓN DE ABONOS Y COMPUESTOS INORGÁNICOS NITROGENADOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2014', '2414', 'FABRICACIÓN DE CAUCHO SINTÉTICO EN FORMAS PRIMARIAS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2021', '2421', 'FABRICACIÓN DE PLAGUICIDAS Y OTROS PRODUCTOS QUÍMICOS DE USO AGROPECUARIO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2022', '2422', 'FABRICACIÓN DE PINTURAS, BARNICES Y REVESTIMIENTOS SIMILARES, TINTAS PARA IMPRESIÓN Y MASILLAS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2023', '2424', 'FABRICACIÓN DE JABONES Y DETERGENTES, PREPARADOS PARA LIMPIAR Y PULIR: PERFUMES Y PREPARADOS DE TOCADOR', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2211', '2511', 'FABRICACIÓN DE LLANTAS Y NEUMÁTICOS DE CAUCHO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2212', '2512', 'REENCAUCHE DE LLANTAS USADAS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2221', '2521', 'FABRICACIÓN DE FORMAS BÁSICAS DE PLÁSTICO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2310', '2610', 'FABRICACIÓN DE VIDRIO Y PRODUCTOS DE VIDRIO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2391', '2692', 'FABRICACIÓN DE PRODUCTOS REFRACTARIOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2394', '2694', 'FABRICACIÓN DE CEMENTO, CAL Y YESO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2395', '2695', 'FABRICACIÓN DE ARTÍCULOS DE HORMIGÓN, CEMENTO Y YESO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2396', '2696', 'CORTE, TALLADO Y ACABADO DE LA PIEDRA', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2410', '2710', 'INDUSTRIAS BÁSICAS DE HIERRO Y DE ACERO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2421', '2721', 'INDUSTRIAS BÁSICAS DE METALES PRECIOSOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2432', '2732', 'FUNDICIÓN DE METALES NO FERROSOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2511', '2811', 'FABRICACIÓN DE PRODUCTOS METÁLICOS PARA USO ESTRUCTURAL', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2512', '2812', 'FABRICACIÓN DE TANQUES, DEPÓSITOS Y RECIPIENTES DE METAL, EXCEPTO LOS UTILIZADOS PARA EL ENVASE O TRANSPORTE DE MERCANCÍAS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2513', '2813', 'FABRICACIÓN DE GENERADORES DE VAPOR, EXCEPTO CALDERAS DE AGUA CALIENTE PARA CALEFACCIÓN CENTRAL', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2520', '2927', 'FABRICACIÓN DE ARMAS Y MUNICIONES', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2591', '2891', 'FORJA, PRENSADO, ESTAMPADO Y LAMINADO DE METAL: PULVIMETALURGIA', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2652', '3330', 'FABRICACIÓN DE RELOJES', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2660', '3311', 'FABRICACIÓN DE EQUIPO DE IRRADIACIÓN Y EQUIPO ELECTRÓNICO DE USO MÉDICO Y TERAPÉUTICO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2720', '3140', 'FABRICACIÓN DE PILAS, BATERÍAS Y ACUMULADORES ELÉCTRICOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2750', '2930', 'FABRICACIÓN DE APARATOS DE USO DOMÉSTICO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2821', '2921', 'FABRICACIÓN DE MAQUINARIA AGROPECUARIA Y FORESTAL ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2823', '2923', 'FABRICACIÓN DE MAQUINARIA PARA LA METALURGIA ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2824', '2924', 'FABRICACIÓN DE MAQUINARIA PARA EXPLOTACIÓN DE MINAS Y CANTERAS Y PARA OBRAS DE CONSTRUCCIÓN', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2825', '2925', 'FABRICACIÓN DE MAQUINARIA PARA LA ELABORACIÓN DE ALIMENTOS, BEBIDAS Y TABACO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2910', '3410', 'FABRICACIÓN DE VEHÍCULOS AUTOMOTORES Y SUS MOTORES', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2920', '3420', 'FABRICACIÓN DE CARROCERÍAS PARA VEHÍCULOS AUTOMOTORES: FABRICACIÓN DE REMOLQUES Y SEMIRREMOLQUES', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('3011', '3511', 'CONSTRUCCIÓN DE BARCOS Y DE ESTRUCTURAS FLOTANTES', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('3012', '3512', 'CONSTRUCCIÓN DE EMBARCACIONES DE RECREO Y DEPORTE', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('3020', '3520', 'FABRICACIÓN DE LOCOMOTORAS Y DE MATERIAL RODANTE PARA FERROCARRILES ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('3092', '3592', 'FABRICACIÓN DE BICICLETAS Y DE SILLAS DE RUEDAS PARA PERSONAS CON DISCAPACIDAD', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('3120', '3614', 'FABRICACIÓN DE COLCHONES Y SOMIERES', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('3220', '3692', 'FABRICACIÓN DE INSTRUMENTOS MUSICALES', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('3511', '4010', 'GENERACIÓN DE ENERGÍA ELÉCTRICA', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('3520', '4020', 'PRODUCCIÓN DE GAS: DISTRIBUCIÓN DE COMBUSTIBLES GASEOSOS POR TUBERÍAS. ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('3600', '4100', 'CAPTACIÓN, TRATAMIENTO Y DISTRIBUCIÓN DE AGUA', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('3700', '9000', 'EVACUACIÓN Y TRATAMIENTO DE AGUAS RESIDUALES', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4111', '4521', 'CONSTRUCCIÓN DE EDIFICIOS RESIDENCIALES ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4112', '4522', 'CONSTRUCCIÓN DE EDIFICIOS NO RESIDENCIALES', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4210', '4530', 'CONSTRUCCIÓN DE CARRETERAS Y VÍAS DE FERROCARRIL', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4321', '4542', 'INSTALACIONES ELÉCTRICAS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4330', '4551', 'TERMINACIÓN Y ACABADO DE EDIFICIOS Y OBRAS DE INGENIERÍA CIVIL', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4330', '4552', 'TERMINACIÓN Y ACABADO DE EDIFICIOS Y OBRAS DE INGENIERÍA CIVIL', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4330', '4559', 'TERMINACIÓN Y ACABADO DE EDIFICIOS Y OBRAS DE INGENIERÍA CIVIL', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4511', '5011', 'COMERCIO DE VEHÍCULOS AUTOMOTORES NUEVOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4512', '5012', 'COMERCIO DE VEHÍCULOS AUTOMOTORES USADOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4520', '5020', 'MANTENIMIENTO Y REPARACIÓN DE VEHÍCULOS AUTOMOTORES', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4530', '5030', 'COMERCIO DE PARTES, PIEZAS (AUTOPARTES) Y ACCESORIOS (LUJOS) PARA VEHÍCULOS AUTOMOTORES', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4541', '5040', 'COMERCIO DE MOTOCICLETAS Y DE SUS PARTES, PIEZAS Y ACCESORIOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4610', '5111', 'COMERCIO AL POR MAYOR A CAMBIO DE UNA RETRIBUCIÓN O POR CONTRATA', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4610', '5112', 'COMERCIO AL POR MAYOR A CAMBIO DE UNA RETRIBUCIÓN O POR CONTRATA', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4610', '5113', 'COMERCIO AL POR MAYOR A CAMBIO DE UNA RETRIBUCIÓN O POR CONTRATA', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4610', '5119', 'COMERCIO AL POR MAYOR A CAMBIO DE UNA RETRIBUCIÓN O POR CONTRATA', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4631', '5125', 'COMERCIO AL POR MAYOR DE PRODUCTOS ALIMENTICIOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4632', '5127', 'COMERCIO AL POR MAYOR DE BEBIDAS Y TABACO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4641', '5131', 'COMERCIO AL POR MAYOR DE PRODUCTOS TEXTILES: PRODUCTOS CONFECCIONADOS PARA USO DOMÉSTICO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4642', '5132', 'COMERCIO AL POR MAYOR DE PRENDAS DE VESTIR', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4643', '5133', 'COMERCIO AL POR MAYOR DE CALZADO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4644', '5134', 'COMERCIO AL POR MAYOR DE APARATOS Y EQUIPO DE USO DOMÉSTICO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4651', '5164', 'COMERCIO AL POR MAYOR DE COMPUTADORES, EQUIPO PERIFÉRICO Y PROGRAMAS DE INFORMÁTICA', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4652', '5165', 'COMERCIO AL POR MAYOR DE EQUIPO, PARTES Y PIEZAS ELECTRÓNICOS Y DE TELECOMUNICACIONES', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4653', '5161', 'COMERCIO AL POR MAYOR DE MAQUINARIA Y EQUIPO AGROPECUARIOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4661', '5151', 'COMERCIO AL POR MAYOR DE COMBUSTIBLES SÓLIDOS, LÍQUIDOS, GASEOSOS Y PRODUCTOS CONEXOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4662', '5152', 'COMERCIO AL POR MAYOR DE METALES Y PRODUCTOS METALÍFEROS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4663', '5141', 'COMERCIO AL POR MAYOR DE MATERIALES DE CONSTRUCCIÓN, ARTÍCULOS DE FERRETERÍA, PINTURAS, PRODUCTOS DE VIDRIO, EQUIPO Y MATERIALES DE FONTANERÍA Y CALEFACCIÓN', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4663', '5142', 'COMERCIO AL POR MAYOR DE MATERIALES DE CONSTRUCCIÓN, ARTÍCULOS DE FERRETERÍA, PINTURAS, PRODUCTOS DE VIDRIO, EQUIPO Y MATERIALES DE FONTANERÍA Y CALEFACCIÓN', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4665', '5155', 'COMERCIO AL POR MAYOR DE DESPERDICIOS, DESECHOS Y CHATARRA', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4690', '5190', 'COMERCIO AL POR MAYOR NO ESPECIALIZADO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4711', '5211', 'COMERCIO AL POR MENOR EN ESTABLECIMIENTOS NO ESPECIALIZADOS CON SURTIDO COMPUESTO PRINCIPALMENTE POR ALIMENTOS, BEBIDAS O TABACO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4719', '5219', 'COMERCIO A POR MENOR EN ESTABLECIMIENTOS NO ESPECIALIZADOS, CON SURTIDO COMPUESTO PRINCIPALMENTE POR PRODUCTOS DIFERENTES DE ALIMENTOS (VÍVERES EN GENERAL), BEBIDAS Y TABACO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4721', '5221', 'COMERCIO AL POR MENOR DE PRODUCTOS AGRÍCOLAS PARA EL CONSUMO EN ESTABLECIMIENTOS ESPECIALIZADOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4722', '5222', 'COMERCIO AL POR MENOR DE LECHE, PRODUCTOS LÁCTEOS Y HUEVOS EN ESTABLECIMIENTOS ESPECIALIZADOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4723', '5223', 'COMERCIO AL POR MENOR DE CARNES (INCLUYE AVES DE CORRAL), PRODUCTOS CÁRNICOS, PESCADOS Y PRODUCTOS DE MAR EN ESTABLECIMIENTOS ESPECIALIZADOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4724', '5225', 'COMERCIO AL POR MENOR DE BEBIDAS Y PRODUCTOS DE TABACO, EN ESTABLECIMIENTOS ESPECIALIZADOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4731', '5051', 'COMERCIO AL POR MENOR DE COMBUSTIBLE PARA AUTOMOTORES', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4732', '5052', 'COMERCIO AL POR MENOR DE LUBRICANTES (ACEITES Y GRASAS) ADITIVOS Y PRODUCTOS DE LIMPIEZA PARA VEHÍCULOS AUTOMOTORES', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4751', '5232', 'COMERCIO AL POR MENOR DE PRODUCTOS TEXTILES EN ESTABLECIMIENTOS ESPECIALIZADOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4753', '5239', 'COMERCIO AL POR MENOR DE TAPICES, ALFOMBRAS Y RECUBRIMIENTOS PARA PAREDES Y PISOS EN ESTABLECIMIENTOS ESPECIALIZADOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4761', '5244', 'COMERCIO AL POR MENOR DE LIBROS, PERIÓDICOS, MATERIALES Y ARTÍCULOS DE PAPELERÍA Y ESCRITORIO, EN ESTABLECIMIENTOS ESPECIALIZADOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4771', '5233', 'COMERCIO AL POR MENOR DE PRENDAS DE VESTIR Y SUS ACCESORIOS (INCLUYE ARTÍCULOS DE PIEL) EN ESTABLECIMIENTOS ESPECIALIZADOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('8621', '8512', 'ACTIVIDADES DE LA PRÁCTICA MÉDICA, SIN INTERNACIÓN', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4772', '5234', 'COMERCIO AL POR MENOR DE TODO TIPO DE CALZADO Y ARTÍCULOS DE CUERO Y SUCEDÁNEOS DEL CUERO EN ESTABLECIMIENTOS ESPECIALIZADOS.', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4773', '5231', 'COMERCIO AL POR MENOR DE PRODUCTOS FARMACÉUTICOS Y MEDICINALES, COSMÉTICOS Y ARTÍCULOS DE TOCADOR EN ESTABLECIMIENTOS ESPECIALIZADOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4781', '5262', 'COMERCIO AL POR MENOR DE ALIMENTOS, BEBIDAS Y TABACO EN PUESTOS DE VENTA MÓVILES', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4791', '5269', 'COMERCIO AL POR MENOR REALIZADO A TRAVÉS DE INTERNET', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4792', '5261', 'COMERCIO AL POR MENOR REALIZADO A TRAVÉS DE CASAS DE VENTA O POR CORREO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4911', '6010', 'TRANSPORTE FÉRREO DE PASAJEROS ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4930', '6050', 'TRANSPORTE POR TUBERÍAS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('5021', '6120', 'TRANSPORTE FLUVIAL DE PASAJEROS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('5210', '6320', 'ALMACENAMIENTO Y DEPÓSITO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('5222', '6332', 'ACTIVIDADES DE PUERTOS Y SERVICIOS COMPLEMENTARIOS PARA EL TRANSPORTE ACUÁTICO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('5224', '6310', 'MANIPULACIÓN DE CARGA', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('5229', '6390', 'OTRAS ACTIVIDADES COMPLEMENTARIAS AL TRANSPORTE', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('5310', '6411', 'ACTIVIDADES POSTALES NACIONALES', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('5320', '6412', 'ACTIVIDADES DE MENSAJERÍA', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('5511', '5511', 'ALOJAMIENTO EN HOTELES', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('5513', '5513', 'ALOJAMIENTO EN CENTROS VACACIONALES ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('5514', '5519', 'ALOJAMIENTO RURAL', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('5530', '5512', 'SERVICIOS POR HORAS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('5611', '5521', 'EXPENDIO A LA MESA DE COMIDAS PREPARADAS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('5613', '5522', 'EXPENDIO DE COMIDAS PREPARADAS EN CAFETERÍAS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('5619', '5529', 'OTROS TIPOS DE EXPENDIO DE COMIDAS PREPARADAS N.C.P.', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('5621', '5525', 'CATERING PARA EVENTOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('5630', '5530', 'EXPENDIO DE BEBIDAS ALCOHÓLICAS PARA EL CONSUMO DENTRO DEL ESTABLECIMIENTO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('5914', '9212', 'ACTIVIDADES DE EXHIBICIÓN DE PELÍCULAS CINEMATOGRÁFICAS Y VIDEOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('6209', '7290', 'OTRAS ACTIVIDADES DE TECNOLOGÍAS DE INFORMACIÓN Y ACTIVIDADES DE SERVICIOS INFORMÁTICOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('6391', '9220', 'ACTIVIDADES DE AGENCIAS DE NOTICIAS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('6399', '7499', 'OTRAS ACTIVIDADES DE SERVICIO DE INFORMACIÓN N.C.P.', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('6411', '6511', 'BANCO CENTRAL', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('6412', '6512', 'BANCOS COMERCIALES', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('6421', '6513', 'ACTIVIDADES DE LAS CORPORACIONES FINANCIERAS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('6422', '6514', 'ACTIVIDADES DE LAS COMPAÑÍAS DE FINANCIAMIENTO ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('6423', '6596', 'BANCA DE SEGUNDO PISO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('6424', '6515', 'ACTIVIDADES DE LAS COOPERATIVAS FINANCIERAS ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('6431', '6717', 'FIDEICOMISOS, FONDOS Y ENTIDADES FINANCIERAS SIMILARES', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('6432', '6604', 'FONDOS DE CESANTÍAS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('6491', '6591', 'LEASING FINANCIERO (ARRENDAMIENTO FINANCIERO)', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('6492', '6592', 'ACTIVIDADES FINANCIERAS DE FONDOS DE EMPLEADOS Y OTRAS FORMAS ASOCIATIVAS DEL SECTOR SOLIDARIO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('6493', '6594', 'ACTIVIDADES DE COMPRA DE CARTERA O FACTORING', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('6494', '6599', 'OTRAS ACTIVIDADES DE DISTRIBUCIÓN DE FONDOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('6511', '6601', 'SEGUROS GENERALES', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('6512', '6602', 'SEGUROS DE VIDA', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('6513', '6603', 'REASEGUROS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('6514', '6593', 'CAPITALIZACIÓN', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('6611', '6711', 'ADMINISTRACIÓN DE MERCADOS FINANCIEROS ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('6611', '6712', 'ADMINISTRACIÓN DE MERCADOS FINANCIEROS ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('6612', '6713', 'CORRETAJE DE VALORES Y DE CONTRATOS DE PRODUCTOS BÁSICOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('6613', '6714', 'OTRAS ACTIVIDADES RELACIONADAS CON EL MERCADO DE VALORES', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('6614', '6715', 'ACTIVIDADES DE LAS CASAS DE CAMBIO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('6615', '6716', 'ACTIVIDADES DE LOS PROFESIONALES DE COMPRA Y VENTA DE DIVISAS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('6619', '6719', 'OTRAS ACTIVIDADES AUXILIARES DE LAS ACTIVIDADES DE SERVICIOS FINANCIEROS N.C.P', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('6621', '6721', 'ACTIVIDADES DE AGENTES Y CORREDORES DE SEGUROS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('6820', '7020', 'ACTIVIDADES INMOBILIARIAS REALIZADAS A CAMBIO DE UNA RETRIBUCIÓN O POR CONTRATA', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('6910', '7411', 'ACTIVIDADES JURÍDICAS ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('6920', '7412', 'ACTIVIDADES DE CONTABILIDAD, TENEDURÍA DE LIBROS, AUDITORIA FINANCIERA Y ASESORÍA TRIBUTARIA ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('7010', '7414', 'ACTIVIDADES DE ADMINISTRACIÓN EMPRESARIAL', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('7120', '7422', 'ENSAYOS Y ANÁLISIS TÉCNICOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('7210', '7310', 'INVESTIGACIONES Y DESARROLLO EXPERIMENTAL EN EL CAMPO DE LAS CIENCIAS NATURALES Y LA INGENIERÍA ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('7220', '7320', 'INVESTIGACIONES Y DESARROLLO EXPERIMENTAL EN EL CAMPO DE LAS CIENCIAS SOCIALES Y LAS HUMANIDADES ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('7310', '7430', 'PUBLICIDAD', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('7320', '7413', 'ESTUDIOS DE MERCADO Y REALIZACIÓN DE ENCUESTAS DE OPINIÓN PÚBLICA', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('7500', '8520', 'ACTIVIDADES VETERINARIAS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('7710', '7111', 'ALQUILER Y ARRENDAMIENTO DE VEHÍCULOS AUTOMOTORES ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('7721', '7130', 'ALQUILER Y ARRENDAMIENTO DE EQUIPO RECREATIVO Y DEPORTIVO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('7911', '6340', 'ACTIVIDADES DE LAS AGENCIAS DE VIAJES ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('8121', '7493', 'LIMPIEZA GENERAL INTERIOR DE EDIFICIOS ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('8292', '7495', 'ACTIVIDADES DE ENVASE Y EMPAQUE ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('8411', '7511', 'ACTIVIDADES LEGISLATIVAS DE LA ADMINISTRACIÓN PUBLICA', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('8413', '7513', 'REGULACIÓN DE LAS ACTIVIDADES DE ORGANISMOS QUE PRESTAN SERVICIOS DE SALUD, EDUCATIVOS, CULTURALES Y OTROS SERVICIOS SOCIALES, EXCEPTO SERVICIOS DE SEGURIDAD SOCIAL ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('8414', '7514', 'ACTIVIDADES REGULADORAS Y FACILITADORAS DE LA ACTIVIDAD ECONÓMICA', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('8415', '7519', 'ACTIVIDADES DE LOS OTROS ÓRGANOS DE CONTROL ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('8421', '7521', 'RELACIONES EXTERIORES', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('8422', '7522', 'ACTIVIDADES DE DEFENSA', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('8423', '7524', 'ORDEN PÚBLICO Y ACTIVIDADES DE SEGURIDAD ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('8424', '7523', 'ADMINISTRACIÓN DE JUSTICIA', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('8430', '7530', 'ACTIVIDADES DE PLANES DE SEGURIDAD SOCIAL DE AFILIACIÓN OBLIGATORIA', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('8512', '8011', 'EDUCACIÓN PREESCOLAR', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('8513', '8012', 'EDUCACIÓN BÁSICA PRIMARIA', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('8521', '8021', 'EDUCACIÓN BÁSICA SECUNDARIA', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('8522', '8022', 'EDUCACIÓN MEDIA ACADÉMICA', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('8523', '8023', 'EDUCACIÓN MEDIA TÉCNICA Y DE FORMACIÓN LABORAL', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('8541', '8030', 'EDUCACIÓN TÉCNICA PROFESIONAL', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('8551', '8090', 'FORMACIÓN ACADÉMICA NO FORMAL', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('8610', '8511', 'ACTIVIDADES DE HOSPITALES Y CLÍNICAS, CON INTERNACIÓN', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('8622', '8513', 'ACTIVIDADES DE LA PRÁCTICA ODONTOLÓGICA', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('8691', '8514', 'ACTIVIDADES DE APOYO DIAGNÓSTICO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('8692', '8515', 'ACTIVIDADES DE APOYO TERAPÉUTICO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('8699', '8519', 'OTRAS ACTIVIDADES DE ATENCIÓN DE LA SALUD HUMANA', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('8720', '8531', 'ACTIVIDADES DE ATENCIÓN RESIDENCIAL, PARA EL CUIDADO DE PACIENTES CON RETARDO MENTAL, ENFERMEDAD MENTAL Y CONSUMO DE SUSTANCIAS PSICOACTIVAS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('8810', '8532', 'ACTIVIDADES DE ASISTENCIA SOCIAL SIN ALOJAMIENTO PARA PERSONAS MAYORES Y DISCAPACITADAS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('9102', '9232', 'ACTIVIDADES Y FUNCIONAMIENTO DE MUSEOS, CONSERVACIÓN DE EDIFICIOS Y SITIOS HISTÓRICOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('9103', '9233', 'ACTIVIDADES DE JARDINES BOTÁNICOS, ZOOLÓGICOS Y RESERVAS NATURALES', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('9200', '9242', 'ACTIVIDADES DE JUEGOS DE AZAR Y APUESTAS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('9411', '9111', 'ACTIVIDADES DE ASOCIACIONES EMPRESARIALES Y DE EMPLEADORES', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('9412', '9112', 'ACTIVIDADES DE ASOCIACIONES PROFESIONALES', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('9420', '9120', 'ACTIVIDADES DE SINDICATOS DE EMPLEADOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('9491', '9191', 'ACTIVIDADES DE ASOCIACIONES RELIGIOSAS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('9492', '9192', 'ACTIVIDADES DE ASOCIACIONES POLÍTICAS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('9523', '5271', 'REPARACIÓN DE CALZADO Y ARTÍCULOS DE CUERO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('9601', '9301', 'LAVADO Y LIMPIEZA, INCLUSO LA LIMPIEZA EN SECO, DE PRODUCTOS TEXTILES Y DE PIEL ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('9602', '9302', 'PELUQUERÍA Y OTROS TRATAMIENTOS DE BELLEZA', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('9603', '9303', 'POMPAS FÚNEBRES Y ACTIVIDADES RELACIONADAS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('9700', '9500', 'ACTIVIDADES DE LOS HOGARES INDIVIDUALES COMO EMPLEADORES DE PERSONAL DOMÉSTICO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('9810', '9600', 'ACTIVIDADES NO DIFERENCIADAS DE LOS HOGARES INDIVIDUALES COMO PRODUCTORES DE BIENES PARA USO PROPIO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('9820', '9700', 'ACTIVIDADES NO DIFERENCIADAS DE LOS HOGARES INDIVIDUALES COMO PRODUCTORES DE SERVICIOS PARA USO PROPIO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('9900', '9900', 'ACTIVIDADES DE ORGANIZACIONES Y ENTIDADES EXTRATERRITORIALES', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('0111', '0115', 'CULTIVO DE CEREALES (EXCEPTO ARROZ), LEGUMBRES Y SEMILLAS OLEAGINOSAS ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('0111', '0116', 'CULTIVO DE CEREALES (EXCEPTO ARROZ), LEGUMBRES Y SEMILLAS OLEAGINOSAS ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('0111', '0118', 'CULTIVO DE CEREALES (EXCEPTO ARROZ), LEGUMBRES Y SEMILLAS OLEAGINOSAS ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('0111', '0119', 'CULTIVO DE CEREALES (EXCEPTO ARROZ), LEGUMBRES Y SEMILLAS OLEAGINOSAS ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('0113', '0112', 'CULTIVO DE HORTALIZAS, RAÍCES Y TUBÉRCULOS ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('0113', '0117', 'CULTIVO DE HORTALIZAS, RAÍCES Y TUBÉRCULOS ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('0122', '0113', 'CULTIVO DE PLÁTANO Y BANANO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('0124', '0114', 'CULTIVO DE CAÑA DE AZÚCAR', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('0141', '0121', 'CRÍA DE GANADO BOVINO Y BUFALINO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('0141', '0129', 'CRÍA DE GANADO BOVINO Y BUFALINO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('0142', '0124', 'CRÍA DE CABALLOS Y OTROS EQUINOS ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('0144', '0122', 'CRÍA DE GANADO PORCINO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('0145', '0123', 'CRÍA DE AVES DE CORRAL', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('0149', '0125', 'CRÍA DE OTROS ANIMALES N.C.P.', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('0311', '0501', 'PESCA MARÍTIMA ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('0311', '0502', 'PESCA MARÍTIMA ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('0811', '1411', 'EXTRACCIÓN DE PIEDRA, ARENA, ARCILLAS COMUNES, YESO Y ANHIDRITA', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('0811', '1412', 'EXTRACCIÓN DE PIEDRA, ARENA, ARCILLAS COMUNES, YESO Y ANHIDRITA', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('0820', '1431', 'EXTRACCIÓN DE ESMERALDAS, PIEDRAS PRECIOSAS Y SEMIPRECIOSAS ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('0820', '1432', 'EXTRACCIÓN DE ESMERALDAS, PIEDRAS PRECIOSAS Y SEMIPRECIOSAS ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('0899', '1030', 'EXTRACCIÓN DE OTROS MINERALES NO METÁLICOS N.C.P.', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('0899', '1490', 'EXTRACCIÓN DE OTROS MINERALES NO METÁLICOS N.C.P.', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('0910', '1120', 'ACTIVIDADES DE APOYO PARA LA EXTRACCIÓN DE PETRÓLEO Y DE GAS NATURAL', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('0910', '7421', 'ACTIVIDADES DE APOYO PARA LA EXTRACCIÓN DE PETRÓLEO Y DE GAS NATURAL', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('0990', '1415', 'ACTIVIDADES DE APOYO PARA OTRAS ACTIVIDADES DE EXPLOTACIÓN DE MINAS Y CANTERAS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('0990', '4512', 'ACTIVIDADES DE APOYO PARA OTRAS ACTIVIDADES DE EXPLOTACIÓN DE MINAS Y CANTERAS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1020', '1521', 'PROCESAMIENTO Y CONSERVACIÓN DE FRUTAS, LEGUMBRES, HORTALIZAS Y TUBÉRCULOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1020', '1589', 'PROCESAMIENTO Y CONSERVACIÓN DE FRUTAS, LEGUMBRES, HORTALIZAS Y TUBÉRCULOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1089', '2429', 'ELABORACIÓN DE OTROS PRODUCTOS ALIMENTICIOS N.C.P.', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1200', '1600', 'ELABORACIÓN DE PRODUCTOS DE TABACO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1312', '1720', 'TEJEDURÍA DE PRODUCTOS TEXTILES', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1312', '2699', 'TEJEDURÍA DE PRODUCTOS TEXTILES', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1313', '1730', 'ACABADO DE PRODUCTOS TEXTILES', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1313', '1749', 'ACABADO DE PRODUCTOS TEXTILES. ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1313', '1810', 'ACABADO DE PRODUCTOS TEXTILES', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1392', '1741', 'CONFECCIÓN DE ARTÍCULOS CON MATERIALES TEXTILES, EXCEPTO PRENDAS DE VESTIR', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1392', '3430', 'CONFECCIÓN DE ARTÍCULOS CON MATERIALES TEXTILES, EXCEPTO PRENDAS DE VESTIR', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1511', '1910', 'CURTIDO Y RECURTIDO DE CUEROS: RECURTIDO Y TEÑIDO DE PIELES', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1512', '1931', 'FABRICACIÓN DE ARTÍCULOS DE VIAJE, BOLSOS DE MANO Y ARTÍCULOS SIMILARES ELABORADOS EN CUERO, Y FABRICACIÓN DE ARTÍCULOS DE TALABARTERÍA Y GUARNICIONERÍA
', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1512', '3699', 'FABRICACIÓN DE ARTÍCULOS DE VIAJE, BOLSOS DE MANO Y ARTÍCULOS SIMILARES ELABORADOS EN CUERO, Y FABRICACIÓN DE ARTÍCULOS DE TALABARTERÍA Y GUARNICIONERÍA
', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1521', '1921', 'FABRICACIÓN DE CALZADO DE CUERO Y PIEL, CON CUALQUIER TIPO DE SUELA ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1521', '1925', 'FABRICACIÓN DE CALZADO DE CUERO Y PIEL, CON CUALQUIER TIPO DE SUELA ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1522', '1922', 'FABRICACIÓN DE OTROS TIPOS DE CALZADO, EXCEPTO CALZADO DE CUERO Y PIEL', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1522', '1923', 'FABRICACIÓN DE OTROS TIPOS DE CALZADO, EXCEPTO CALZADO DE CUERO Y PIEL', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1522', '1924', 'FABRICACIÓN DE OTROS TIPOS DE CALZADO, EXCEPTO CALZADO DE CUERO Y PIEL', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1522', '1929', 'FABRICACIÓN DE OTROS TIPOS DE CALZADO, EXCEPTO CALZADO DE CUERO Y PIEL', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1690', '2090', 'FABRICACIÓN DE OTROS PRODUCTOS DE MADERA: FABRICACIÓN DE ARTÍCULOS DE CORCHO, CESTERÍA Y ESPARTERÍA', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1709', '2109', 'FABRICACIÓN DE OTROS ARTÍCULOS DE PAPEL Y CARTÓN', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1709', '2220', 'FABRICACIÓN DE OTROS ARTÍCULOS DE PAPEL Y CARTÓN', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1811', '2892', 'ACTIVIDADES DE IMPRESIÓN', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1921', '2321', 'FABRICACIÓN DE PRODUCTOS DE LA REFINACIÓN DEL PETRÓLEO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('1921', '2322', 'FABRICACIÓN DE PRODUCTOS DE LA REFINACIÓN DEL PETRÓLEO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2011', '2330', 'FABRICACIÓN DE SUSTANCIAS Y PRODUCTOS QUÍMICOS BÁSICOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2011', '2411', 'FABRICACIÓN DE SUSTANCIAS Y PRODUCTOS QUÍMICOS BÁSICOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2013', '2413', 'FABRICACIÓN DE PLÁSTICOS EN FORMAS PRIMARIAS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2013', '2430', 'FABRICACIÓN DE PLÁSTICOS EN FORMAS PRIMARIAS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2100', '2423', 'FABRICACIÓN DE PRODUCTOS FARMACÉUTICOS, SUSTANCIAS QUÍMICAS MEDICINALES Y PRODUCTOS BOTÁNICOS DE USO FARMACÉUTICO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2219', '2513', 'FABRICACIÓN DE FORMAS BÁSICAS DE CAUCHO Y OTROS PRODUCTOS DE CAUCHO N.C.P.', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2219', '2519', 'FABRICACIÓN DE FORMAS BÁSICAS DE CAUCHO Y OTROS PRODUCTOS DE CAUCHO N.C.P.', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2229', '2529', 'FABRICACIÓN DE ARTÍCULOS DE PLÁSTICO N.C.P.', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2392', '2691', 'FABRICACIÓN DE MATERIALES DE ARCILLA PARA LA CONSTRUCCIÓN', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2392', '2693', 'FABRICACIÓN DE MATERIALES DE ARCILLA PARA LA CONSTRUCCIÓN', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2429', '2729', 'INDUSTRIAS BÁSICAS DE OTROS METALES NO FERROSOS ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2431', '2731', 'FUNDICIÓN DE HIERRO Y DE ACERO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2593', '2893', 'FABRICACIÓN DE ARTÍCULOS DE CUCHILLERÍA, HERRAMIENTAS DE MANO Y ARTÍCULOS DE FERRETERÍA', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2593', '2899', 'FABRICACIÓN DE ARTÍCULOS DE CUCHILLERÍA, HERRAMIENTAS DE MANO Y ARTÍCULOS DE FERRETERÍA', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2599', '3190', 'FABRICACIÓN DE OTROS PRODUCTOS ELABORADOS DE METAL N.C.P.', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2610', '3000', 'FABRICACIÓN DE COMPONENTES Y TABLEROS ELECTRÓNICOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2610', '3110', 'FABRICACIÓN DE COMPONENTES Y TABLEROS ELECTRÓNICOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2610', '3120', 'FABRICACIÓN DE COMPONENTES Y TABLEROS ELECTRÓNICOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2610', '3130', 'FABRICACIÓN DE COMPONENTES Y TABLEROS ELECTRÓNICOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2610', '3210', 'FABRICACIÓN DE COMPONENTES Y TABLEROS ELECTRÓNICOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2610', '3230', 'FABRICACIÓN DE COMPONENTES Y TABLEROS ELECTRÓNICOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2630', '3220', 'FABRICACIÓN DE EQUIPOS DE COMUNICACIÓN', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2640', '3694', 'FABRICACIÓN DE APARATOS ELECTRÓNICOS DE CONSUMO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2651', '3312', 'FABRICACIÓN DE EQUIPO DE MEDICIÓN, PRUEBA, NAVEGACIÓN Y CONTROL', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2651', '3313', 'FABRICACIÓN DE EQUIPO DE MEDICIÓN, PRUEBA, NAVEGACIÓN Y CONTROL', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2670', '3320', 'FABRICACIÓN DE INSTRUMENTOS ÓPTICOS Y EQUIPO FOTOGRÁFICO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2740', '3150', 'FABRICACIÓN DE EQUIPOS ELÉCTRICOS DE ILUMINACIÓN', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2790', '2922', 'FABRICACIÓN DE OTROS TIPOS DE EQUIPO ELÉCTRICO N.C.P.', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2790', '2929', 'FABRICACIÓN DE OTROS TIPOS DE EQUIPO ELÉCTRICO N.C.P.', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2811', '2911', 'FABRICACIÓN DE MOTORES, TURBINAS, Y PARTES PARA MOTORES DE COMBUSTIÓN INTERNA', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2811', '3530', 'FABRICACIÓN DE MOTORES, TURBINAS, Y PARTES PARA MOTORES DE COMBUSTIÓN INTERNA', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2811', '3591', 'FABRICACIÓN DE MOTORES, TURBINAS, Y PARTES PARA MOTORES DE COMBUSTIÓN INTERNA', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2812', '2912', 'FABRICACIÓN DE EQUIPOS DE POTENCIA HIDRÁULICA Y NEUMÁTICA', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2812', '2913', 'FABRICACIÓN DE EQUIPOS DE POTENCIA HIDRÁULICA Y NEUMÁTICA', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2815', '2914', 'FABRICACIÓN DE HORNOS, HOGARES Y QUEMADORES INDUSTRIALES', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2816', '2915', 'FABRICACIÓN DE EQUIPO DE ELEVACIÓN Y MANIPULACIÓN', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2816', '3599', 'FABRICACIÓN DE EQUIPO DE ELEVACIÓN Y MANIPULACIÓN', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2819', '2919', 'FABRICACIÓN DE OTROS TIPOS DE MAQUINARIA Y EQUIPO DE USO GENERAL N.C.P..', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('2826', '2926', 'FABRICACIÓN DE MAQUINARIA PARA LA ELABORACIÓN DE PRODUCTOS TEXTILES, PRENDAS DE VESTIR Y CUEROS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('3110', '3611', 'FABRICACIÓN DE MUEBLES ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('3110', '3612', 'FABRICACIÓN DE MUEBLES ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('3110', '3613', 'FABRICACIÓN DE MUEBLES ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('3110', '3619', 'FABRICACIÓN DE MUEBLES ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('3210', '3691', 'FABRICACIÓN DE JOYAS, BISUTERÍA Y ARTÍCULOS CONEXOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('3230', '3693', 'FABRICACIÓN DE ARTÍCULOS Y EQUIPO PARA LA PRÁCTICA DEL DEPORTE', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('3290', '2211', 'OTRAS INDUSTRIAS MANUFACTURERAS N.C.P.', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('3312', '5170', 'MANTENIMIENTO Y REPARACIÓN ESPECIALIZADO DE MAQUINARIA Y EQUIPO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('3312', '7250', 'MANTENIMIENTO Y REPARACIÓN ESPECIALIZADO DE MAQUINARIA Y EQUIPO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('3315', '6339', 'MANTENIMIENTO Y REPARACIÓN ESPECIALIZADO DE EQUIPO DE TRANSPORTE, EXCEPTO LOS VEHÍCULOS AUTOMOTORES, MOTOCICLETAS Y BICICLETAS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('3530', '4030', 'SUMINISTRO DE VAPOR Y AIRE ACONDICIONADO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('3830', '3710', 'RECUPERACIÓN DE MATERIALES', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('3830', '3720', 'RECUPERACIÓN DE MATERIALES', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4290', '7010', 'CONSTRUCCIÓN DE OTRAS OBRAS DE INGENIERÍA CIVIL', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4311', '4511', 'DEMOLICIÓN', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4322', '4541', 'INSTALACIONES DE FONTANERÍA, CALEFACCIÓN Y AIRE ACONDICIONADO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4322', '4543', 'INSTALACIONES DE FONTANERÍA, CALEFACCIÓN Y AIRE ACONDICIONADO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4322', '4549', 'INSTALACIONES DE FONTANERÍA, CALEFACCIÓN Y AIRE ACONDICIONADO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4329', '4549', 'OTRAS INSTALACIONES ESPECIALIZADAS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4390', '4560', 'OTRAS ACTIVIDADES ESPECIALIZADAS PARA LA CONSTRUCCIÓN DE EDIFICIOS Y OBRAS DE INGENIERÍA CIVIL', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4620', '5121', 'COMERCIO AL POR MAYOR DE MATERIAS PRIMAS AGROPECUARIAS: ANIMALES VIVOS.
', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4620', '5122', 'COMERCIO AL POR MAYOR DE MATERIAS PRIMAS AGROPECUARIAS: ANIMALES VIVOS.
', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4620', '5123', 'COMERCIO AL POR MAYOR DE MATERIAS PRIMAS AGROPECUARIAS: ANIMALES VIVOS.
', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4620', '5124', 'COMERCIO AL POR MAYOR DE MATERIAS PRIMAS AGROPECUARIAS: ANIMALES VIVOS.
', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4620', '5126', 'COMERCIO AL POR MAYOR DE MATERIAS PRIMAS AGROPECUARIAS: ANIMALES VIVOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4645', '5135', 'COMERCIO AL POR MAYOR DE PRODUCTOS FARMACÉUTICOS, MEDICINALES, COSMÉTICOS Y DE TOCADOR', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4645', '5136', 'COMERCIO AL POR MAYOR DE PRODUCTOS FARMACÉUTICOS, MEDICINALES, COSMÉTICOS Y DE TOCADOR', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4649', '5137', 'COMERCIO AL POR MAYOR DE OTROS UTENSILIOS DOMÉSTICOS N.C.P.', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4649', '5139', 'COMERCIO AL POR MAYOR DE OTROS UTENSILIOS DOMÉSTICOS N.C.P.', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4659', '5136', 'COMERCIO AL POR MAYOR DE OTROS TIPOS DE MAQUINARIA Y EQUIPO N.C.P.', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4659', '5162', 'COMERCIO AL POR MAYOR DE OTROS TIPOS DE MAQUINARIA Y EQUIPO N.C.P.', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4659', '5163', 'COMERCIO AL POR MAYOR DE OTROS TIPOS DE MAQUINARIA Y EQUIPO N.C.P.', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4659', '5169', 'COMERCIO AL POR MAYOR DE OTROS TIPOS DE MAQUINARIA Y EQUIPO N.C.P.', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4664', '5153', 'COMERCIO AL POR MAYOR DE PRODUCTOS QUÍMICOS BÁSICOS, CAUCHOS Y PLÁSTICOS EN FORMAS PRIMARIAS Y PRODUCTOS QUÍMICOS DE USO
AGROPECUARIO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('8412', '7515', 'ACTIVIDADES EJECUTIVAS DE LA ADMINISTRACIÓN PUBLICA', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4664', '5159', 'COMERCIO AL POR MAYOR DE PRODUCTOS QUÍMICOS BÁSICOS, CAUCHOS Y PLÁSTICOS EN FORMAS PRIMARIAS Y PRODUCTOS QUÍMICOS DE USO
AGROPECUARIO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4669', '5137', 'COMERCIO AL POR MAYOR DE OTROS PRODUCTOS N.C.P.', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4669', '5154', 'COMERCIO AL POR MAYOR DE OTROS PRODUCTOS N.C.P.', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4729', '5224', 'COMERCIO AL POR MENOR DE OTROS PRODUCTOS ALIMENTICIOS N.C.P., EN ESTABLECIMIENTOS ESPECIALIZADOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4729', '5229', 'COMERCIO AL POR MENOR DE OTROS PRODUCTOS ALIMENTICIOS N.C.P., EN ESTABLECIMIENTOS ESPECIALIZADOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4741', '5235', 'COMERCIO AL POR MENOR DE COMPUTADORES, EQUIPOS PERIFÉRICOS, PROGRAMAS DE INFORMÁTICA Y EQUIPOS DE TELECOMUNICACIONES EN ESTABLECIMIENTOS ESPECIALIZADOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4741', '5243', 'COMERCIO AL POR MENOR DE COMPUTADORES, EQUIPOS PERIFÉRICOS, PROGRAMAS DE INFORMÁTICA Y EQUIPOS DE TELECOMUNICACIONES EN ESTABLECIMIENTOS ESPECIALIZADOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4752', '5241', 'COMERCIO AL POR MENOR DE ARTÍCULOS DE FERRETERÍA, PINTURAS Y PRODUCTOS DE VIDRIO EN ESTABLECIMIENTOS ESPECIALIZADOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4752', '5242', 'COMERCIO AL POR MENOR DE ARTÍCULOS DE FERRETERÍA, PINTURAS Y PRODUCTOS DE VIDRIO EN ESTABLECIMIENTOS ESPECIALIZADOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4754', '5236', 'COMERCIO AL POR MENOR DE ELECTRODOMÉSTICOS Y GASODOMESTICOS DE USO DOMÉSTICO, MUEBLES Y EQUIPOS DE ILUMINACIÓN ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4754', '5237', 'COMERCIO AL POR MENOR DE ELECTRODOMÉSTICOS Y GASODOMESTICOS DE USO DOMÉSTICO, MUEBLES Y EQUIPOS DE ILUMINACIÓN ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4774', '5245', 'COMERCIO AL POR MENOR DE OTROS PRODUCTOS NUEVOS EN ESTABLECIMIENTOS ESPECIALIZADOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4774', '5246', 'COMERCIO AL POR MENOR DE OTROS PRODUCTOS NUEVOS EN ESTABLECIMIENTOS ESPECIALIZADOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4774', '5249', 'COMERCIO AL POR MENOR DE OTROS PRODUCTOS NUEVOS EN ESTABLECIMIENTOS ESPECIALIZADOS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4775', '5251', 'COMERCIO AL POR MENOR DE ARTÍCULOS DE SEGUNDA MANO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4775', '5252', 'COMERCIO AL POR MENOR DE ARTÍCULOS DE SEGUNDA MANO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4921', '6021', 'TRANSPORTE DE PASAJEROS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4921', '6022', 'TRANSPORTE DE PASAJEROS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4921', '6023', 'TRANSPORTE DE PASAJEROS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4921', '6031', 'TRANSPORTE DE PASAJEROS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4921', '6032', 'TRANSPORTE DE PASAJEROS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4921', '6039', 'TRANSPORTE DE PASAJEROS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4923', '6041', 'TRANSPORTE DE CARGA POR CARRETERA', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4923', '6042', 'TRANSPORTE DE CARGA POR CARRETERA', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4923', '6043', 'TRANSPORTE DE CARGA POR CARRETERA', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('4923', '6044', 'TRANSPORTE DE CARGA POR CARRETERA', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('5011', '6111', 'TRANSPORTE DE PASAJEROS MARÍTIMO Y DE CABOTAJE ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('5011', '6112', 'TRANSPORTE DE PASAJEROS MARÍTIMO Y DE CABOTAJE ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('5111', '6211', 'TRANSPORTE AÉREO NACIONAL DE PASAJEROS ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('5111', '6220', 'TRANSPORTE AÉREO NACIONAL DE PASAJEROS ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('5112', '6213', 'TRANSPORTE AÉREO INTERNACIONAL DE PASAJEROS ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('5121', '6212', 'TRANSPORTE AÉREO NACIONAL DE CARGA ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('5122', '6214', 'TRANSPORTE AÉREO INTERNACIONAL DE CARGA ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('5221', '6331', 'ACTIVIDADES DE ESTACIONES, VÍAS Y SERVICIOS COMPLEMENTARIOS PARA EL TRANSPORTE TERRESTRE', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('5223', '6333', 'ACTIVIDADES DE AEROPUERTOS, SERVICIOS DE NAVEGACIÓN AÉREA Y DEMÁS ACTIVIDADES CONEXAS AL TRANSPORTE AÉREO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('5612', '5523', 'EXPENDIO POR AUTOSERVICIO DE COMIDAS PREPARADAS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('5612', '5524', 'EXPENDIO POR AUTOSERVICIO DE COMIDAS PREPARADAS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('5811', '7240', 'EDICIÓN DE LIBROS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('5813', '2212', 'EDICIÓN DE PERIÓDICOS, REVISTAS Y OTRAS PUBLICACIONES PERIÓDICAS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('5813', '2219', 'EDICIÓN DE PERIÓDICOS, REVISTAS Y OTRAS PUBLICACIONE PERIÓDICAS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('5820', '7220', 'EDICIÓN DE PROGRAMAS DE INFORMÁTICA (SOFTWARE) ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('5911', '9211', 'ACTIVIDADES DE PRODUCCIÓN DE PELÍCULAS CINEMATOGRÁFICAS, VIDEOS, PROGRAMAS, ANUNCIOS Y COMERCIALES DE TELEVISIÓN', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('5911', '9213', 'ACTIVIDADES DE PRODUCCIÓN DE PELÍCULAS CINEMATOGRÁFICAS, VIDEOS, PROGRAMAS, ANUNCIOS Y COMERCIALES DE TELEVISIÓN.', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('5912', '9231', 'ACTIVIDADES DE POSTPRODUCCIÓN DE PELÍCULAS CINEMATOGRÁFICAS, VIDEOS, PROGRAMAS, ANUNCIOS Y COMERCIALES DE TELEVISIÓN', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('5920', '2213', 'ACTIVIDADES DE GRABACIÓN DE SONIDO Y EDICIÓN DE MÚSICA', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('6110', '6421', 'ACTIVIDADES DE TELECOMUNICACIONES ALÁMBRICAS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('6110', '6422', 'ACTIVIDADES DE TELECOMUNICACIONES ALÁMBRICAS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('6110', '6423', 'ACTIVIDADES DE TELECOMUNICACIONES ALÁMBRICAS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('6110', '6424', 'ACTIVIDADES DE TELECOMUNICACIONES ALÁMBRICAS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('6190', '6429', 'OTRAS ACTIVIDADES DE TELECOMUNICACIONES', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('6202', '7210', 'ACTIVIDADES DE CONSULTORÍA INFORMÁTICA Y ACTIVIDADES DE ADMINISTRACIÓN DE INSTALACIONES INFORMÁTICAS ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('6202', '7230', 'ACTIVIDADES DE CONSULTORÍA INFORMÁTICA Y ACTIVIDADES DE ADMINISTRACIÓN DE INSTALACIONES INFORMÁTICAS ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('6499', '6519', 'OTRAS ACTIVIDADES DE SERVICIO FINANCIERO, EXCEPTO LAS DE SEGUROS Y PENSIONES N.C.P.', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('6499', '6595', 'OTRAS ACTIVIDADES DE SERVICIO FINANCIERO, EXCEPTO LAS DE SEGUROS Y PENSIONES N.C.P.', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('6629', '6722', 'EVALUACIÓN DE RIESGOS Y DAÑOS Y OTRAS ACTIVIDADES DE SERVICIOS AUXILIARES', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('7420', '7494', 'ACTIVIDADES DE FOTOGRAFÍA ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('7490', '7492', 'OTRAS ACTIVIDADES PROFESIONALES, CIENTÍFICAS Y TÉCNICAS N.C.P.', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('7730', '7112', 'ALQUILER Y ARRENDAMIENTO DE OTROS TIPOS DE MAQUINARIA, EQUIPO Y BIENES TANGIBLES N.C.P.', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('7730', '7113', 'ALQUILER Y ARRENDAMIENTO DE OTROS TIPOS DE MAQUINARIA, EQUIPO Y BIENES TANGIBLES N.C.P.', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('7730', '7121', 'ALQUILER Y ARRENDAMIENTO DE OTROS TIPOS DE MAQUINARIA, EQUIPO Y BIENES TANGIBLES N.C.P.', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('7730', '7122', 'ALQUILER Y ARRENDAMIENTO DE OTROS TIPOS DE MAQUINARIA, EQUIPO Y BIENES TANGIBLES N.C.P.', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('7730', '7123', 'ALQUILER Y ARRENDAMIENTO DE OTROS TIPOS DE MAQUINARIA, EQUIPO Y BIENES TANGIBLES N.C.P.', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('7730', '7129', 'ALQUILER Y ARRENDAMIENTO DE OTROS TIPOS DE MAQUINARIA, EQUIPO Y BIENES TANGIBLES N.C.P.', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('7810', '7491', 'ACTIVIDADES DE AGENCIAS DE EMPLEO ', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('7810', '9249', 'ACTIVIDADES DE AGENCIAS DE EMPLEO', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('7990', '9214', 'OTROS SERVICIOS DE RESERVA Y ACTIVIDADES RELACIONADAS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('7990', '9219', 'OTROS SERVICIOS DE RESERVA Y ACTIVIDADES RELACIONADAS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('7990', '9241', 'OTROS SERVICIOS DE RESERVA Y ACTIVIDADES RELACIONADAS', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('8412', '7512', 'ACTIVIDADES EJECUTIVAS DE LA ADMINISTRACIÓN PUBLICA', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('8552', '9309', 'ENSEÑANZA DEPORTIVA Y RECREATIVA', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('9499', '9199', 'ACTIVIDADES DE OTRAS ASOCIACIONES N.C.P.', '2019-10-08 20:51:16.731366', NULL);
INSERT INTO syli.tp_actividad_economica_h VALUES ('9512', '5272', 'MANTENIMIENTO Y REPARACIÓN DE EQUIPOS DE COMUNICACIÓN', '2019-10-08 20:51:16.731366', NULL);


--
-- TOC entry 4737 (class 0 OID 99372)
-- Dependencies: 568
-- Data for Name: tp_calle; Type: TABLE DATA; Schema: syli; Owner: -
--

INSERT INTO syli.tp_calle VALUES (5, 'AVENIDA', NULL, NULL, true);
INSERT INTO syli.tp_calle VALUES (9, 'AVENIDA CALLE', NULL, NULL, true);
INSERT INTO syli.tp_calle VALUES (10, 'AVENIDA CARRERA', NULL, NULL, true);
INSERT INTO syli.tp_calle VALUES (1, 'CALLE', NULL, NULL, true);
INSERT INTO syli.tp_calle VALUES (2, 'CARRERA', NULL, NULL, true);
INSERT INTO syli.tp_calle VALUES (11, 'CIRCULAR', NULL, NULL, true);
INSERT INTO syli.tp_calle VALUES (8, 'CIRCUNVALAR', NULL, NULL, true);
INSERT INTO syli.tp_calle VALUES (3, 'DIAGONAL', NULL, NULL, true);
INSERT INTO syli.tp_calle VALUES (4, 'TRANSVERSAL', NULL, NULL, true);
INSERT INTO syli.tp_calle VALUES (6, 'BULEVAR', NULL, NULL, true);
INSERT INTO syli.tp_calle VALUES (7, 'AUTOPISTA', NULL, NULL, true);


--
-- TOC entry 4738 (class 0 OID 99376)
-- Dependencies: 569
-- Data for Name: tp_dir_barrio; Type: TABLE DATA; Schema: syli; Owner: -
--

INSERT INTO syli.tp_dir_barrio VALUES ('BR', 'BARRIO', '2020-02-25 19:31:00.110621', NULL);
INSERT INTO syli.tp_dir_barrio VALUES ('CD', 'CIUDADELA', '2020-02-25 19:31:00.110621', NULL);
INSERT INTO syli.tp_dir_barrio VALUES ('SM', 'SUPERMANZANA', '2020-02-25 19:31:00.110621', NULL);


--
-- TOC entry 4739 (class 0 OID 99380)
-- Dependencies: 570
-- Data for Name: tp_dir_cuadrante; Type: TABLE DATA; Schema: syli; Owner: -
--

INSERT INTO syli.tp_dir_cuadrante VALUES (1, 'NORTE', 'N', '2020-02-25 19:31:00.09238', NULL);
INSERT INTO syli.tp_dir_cuadrante VALUES (2, 'SUR', 'S', '2020-02-25 19:31:00.09238', NULL);
INSERT INTO syli.tp_dir_cuadrante VALUES (3, 'ESTE', 'E', '2020-02-25 19:31:00.09238', NULL);
INSERT INTO syli.tp_dir_cuadrante VALUES (4, 'OESTE', 'O', '2020-02-25 19:31:00.09238', NULL);


--
-- TOC entry 4740 (class 0 OID 99384)
-- Dependencies: 571
-- Data for Name: tp_dir_manzana; Type: TABLE DATA; Schema: syli; Owner: -
--

INSERT INTO syli.tp_dir_manzana VALUES ('BQ', 'BLOQUE', '2020-02-25 19:31:00.153525', NULL);
INSERT INTO syli.tp_dir_manzana VALUES ('CU', 'CÉLULA', '2020-02-25 19:31:00.153525', NULL);
INSERT INTO syli.tp_dir_manzana VALUES ('CO', 'CONJUNTO RESIDENCIAL', '2020-02-25 19:31:00.153525', NULL);
INSERT INTO syli.tp_dir_manzana VALUES ('ET', 'ETAPA', '2020-02-25 19:31:00.153525', NULL);
INSERT INTO syli.tp_dir_manzana VALUES ('UR', 'URBANIZACIÓN', '2020-02-25 19:31:00.153525', NULL);
INSERT INTO syli.tp_dir_manzana VALUES ('SC', 'SECTOR', '2020-02-25 19:31:00.153525', NULL);
INSERT INTO syli.tp_dir_manzana VALUES ('TO', 'TORRE', '2020-02-25 19:31:00.153525', NULL);
INSERT INTO syli.tp_dir_manzana VALUES ('ZN', 'ZONA', '2020-02-25 19:31:00.153525', NULL);


--
-- TOC entry 4741 (class 0 OID 99388)
-- Dependencies: 572
-- Data for Name: tp_dir_predio; Type: TABLE DATA; Schema: syli; Owner: -
--

INSERT INTO syli.tp_dir_predio VALUES ('MZ', 'MANZANA', '2020-02-25 19:31:00.173753', NULL);
INSERT INTO syli.tp_dir_predio VALUES ('IN', 'INTERIOR', '2020-02-25 19:31:00.173753', NULL);
INSERT INTO syli.tp_dir_predio VALUES ('SC', 'SECTOR', '2020-02-25 19:31:00.173753', NULL);
INSERT INTO syli.tp_dir_predio VALUES ('ET', 'ETAPA', '2020-02-25 19:31:00.173753', NULL);
INSERT INTO syli.tp_dir_predio VALUES ('ED', 'EDIFICIO', '2020-02-25 19:31:00.173753', NULL);
INSERT INTO syli.tp_dir_predio VALUES ('MD', 'MÓDULO', '2020-02-25 19:31:00.173753', NULL);
INSERT INTO syli.tp_dir_predio VALUES ('TO', 'TORRE', '2020-02-25 19:31:00.173753', NULL);


--
-- TOC entry 4742 (class 0 OID 99392)
-- Dependencies: 573
-- Data for Name: tp_direccion; Type: TABLE DATA; Schema: syli; Owner: -
--

INSERT INTO syli.tp_direccion VALUES (1, 'DOMICILIO', 'DOM', '2019-08-28 21:23:11.082566', NULL, false);
INSERT INTO syli.tp_direccion VALUES (2, 'COMERCIAL', 'COM', '2019-08-28 21:23:11.082566', NULL, false);
INSERT INTO syli.tp_direccion VALUES (3, 'OFICINA', 'OFC', '2019-08-28 21:23:11.082566', NULL, false);
INSERT INTO syli.tp_direccion VALUES (4, 'RESIDENCIA', 'RES', '2019-08-28 21:23:11.082566', NULL, false);
INSERT INTO syli.tp_direccion VALUES (5, 'APARTADO', 'APT', '2019-08-28 21:23:11.082566', NULL, false);
INSERT INTO syli.tp_direccion VALUES (6, 'COMERCIAL 2', 'COM2', '2019-08-28 21:23:11.082566', NULL, false);
INSERT INTO syli.tp_direccion VALUES (7, 'COMERCIAL 3', 'COM3', '2019-08-28 21:23:11.082566', NULL, false);
INSERT INTO syli.tp_direccion VALUES (8, 'COMERCIAL 4', 'COM4', '2019-08-28 21:23:11.082566', NULL, false);
INSERT INTO syli.tp_direccion VALUES (9, 'COMERCIAL 5', 'COM5', '2019-08-28 21:23:11.082566', NULL, false);
INSERT INTO syli.tp_direccion VALUES (10, 'COMERCIAL 6', 'COM6', '2019-08-28 21:23:11.082566', NULL, false);
INSERT INTO syli.tp_direccion VALUES (11, 'COMERCIAL 7', 'COM7', '2019-08-28 21:23:11.082566', NULL, false);
INSERT INTO syli.tp_direccion VALUES (12, 'OTRAS', 'OTR', '2019-08-28 21:23:11.082566', NULL, false);
INSERT INTO syli.tp_direccion VALUES (13, 'PAGINA WEB', 'WEB', '2019-08-28 21:23:11.082566', NULL, false);
INSERT INTO syli.tp_direccion VALUES (14, 'LABORAL', 'LAB', '2019-08-28 21:23:11.082566', NULL, false);


--
-- TOC entry 4743 (class 0 OID 99397)
-- Dependencies: 574
-- Data for Name: tp_estado_civil; Type: TABLE DATA; Schema: syli; Owner: -
--

INSERT INTO syli.tp_estado_civil VALUES (1, 'SOLTERO', '2019-08-28 21:23:10.835482', NULL);
INSERT INTO syli.tp_estado_civil VALUES (2, 'CASADO', '2019-08-28 21:23:10.835482', NULL);
INSERT INTO syli.tp_estado_civil VALUES (3, 'VIUDO', '2019-08-28 21:23:10.835482', NULL);
INSERT INTO syli.tp_estado_civil VALUES (4, 'DIVORCIADO', '2019-08-28 21:23:10.835482', NULL);
INSERT INTO syli.tp_estado_civil VALUES (5, 'UNIÓN LIBRE', '2019-08-28 21:23:10.835482', NULL);
INSERT INTO syli.tp_estado_civil VALUES (6, 'SEPARADO', '2019-08-28 21:23:10.835482', NULL);
INSERT INTO syli.tp_estado_civil VALUES (7, 'OTRO', '2019-08-28 21:23:10.835482', NULL);
INSERT INTO syli.tp_estado_civil VALUES (0, 'NO INFORMADO', '2020-07-02 04:05:48.467576', NULL);


--
-- TOC entry 4744 (class 0 OID 99401)
-- Dependencies: 575
-- Data for Name: tp_ipc; Type: TABLE DATA; Schema: syli; Owner: -
--

INSERT INTO syli.tp_ipc VALUES (1967, 12, 0, 7.9000, 7.9000, 7.9000, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (1968, 12, 0, 6.4600, 6.4600, 6.4600, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (1969, 12, 0, 8.9000, 8.9000, 8.9000, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (1970, 12, 0, 7.0600, 7.0600, 7.0600, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (1971, 12, 0, 12.8400, 12.8400, 12.8400, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (1972, 12, 0, 13.5300, 13.5300, 13.5300, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (1973, 12, 0, 22.4900, 22.4900, 22.4900, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (1974, 12, 0, 25.0000, 25.0000, 25.0000, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (1975, 12, 0, 17.5200, 17.5200, 17.5200, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (1976, 12, 0, 25.6000, 25.6000, 25.6000, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (1977, 12, 0, 27.4500, 27.4500, 27.4500, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (1978, 12, 0, 19.7500, 19.7500, 19.7500, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (1979, 12, 0, 28.8100, 28.8100, 28.8100, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (1980, 12, 0, 25.9600, 25.9600, 25.9600, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (1981, 12, 0, 26.3600, 26.3600, 26.3600, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (1982, 12, 0, 24.0300, 24.0300, 24.0300, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (1983, 12, 0, 16.6200, 16.6200, 16.6200, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (1984, 12, 0, 18.2800, 18.2800, 18.2800, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (1985, 12, 0, 22.4500, 22.4500, 22.4500, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (1986, 12, 0, 20.9500, 20.9500, 20.9500, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (1987, 12, 0, 24.0200, 24.0200, 24.0200, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (1988, 12, 0, 28.1200, 28.1200, 28.1200, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (1989, 12, 0, 26.1200, 26.1200, 26.1200, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (1990, 12, 0, 32.3600, 32.3600, 32.3600, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (1991, 12, 0, 26.8200, 26.8200, 26.8200, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (1992, 12, 0, 25.1300, 25.1300, 25.1300, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (1993, 12, 0, 22.6000, 22.6000, 22.6000, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (1994, 12, 0, 22.5900, 22.5900, 22.5900, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (1995, 12, 0, 19.4600, 19.4600, 19.4600, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (1996, 12, 0, 21.6300, 21.6300, 21.6300, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (1997, 12, 0, 17.6800, 17.6800, 17.6800, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (1998, 12, 0, 16.7000, 16.7000, 16.7000, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (1999, 12, 0, 9.2300, 9.2300, 9.2300, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2000, 12, 0, 8.7500, 8.7500, 8.7500, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2001, 12, 0, 7.6500, 7.6500, 7.6500, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2002, 12, 0, 6.9900, 6.9900, 6.9900, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2003, 12, 0, 6.4900, 6.4900, 6.4900, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2004, 12, 0, 5.5000, 5.5000, 5.5000, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2005, 12, 0, 4.8500, 4.8500, 4.8500, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2006, 12, 0, 4.4800, 4.4800, 4.4800, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2007, 12, 0, 5.6900, 5.6900, 5.6900, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2008, 12, 0, 7.6700, 7.6700, 7.6700, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2009, 1, 100.59, 0.5900, 0.5900, 7.1800, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2009, 2, 101.43, 0.8400, 1.4300, 6.4700, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2009, 3, 101.94, 0.5000, 1.9400, 6.1400, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2009, 4, 102.26, 0.3200, 2.2600, 5.7300, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2009, 5, 102.28, 0.0100, 2.2800, 4.7700, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2009, 6, 102.22, 0.0600, 2.2200, 3.8100, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2009, 7, 102.18, 0.0400, 2.1800, 3.2800, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2009, 8, 102.23, 0.0400, 2.2300, 3.1300, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2009, 9, 102.12, 0.1100, 2.1200, 3.2100, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2009, 10, 101.98, 0.1300, 1.9800, 2.7200, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2009, 11, 101.92, 0.0700, 1.9200, 2.3700, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2009, 12, 102, 0.0800, 2.0000, 2.0000, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2010, 1, 102.7, 0.6900, 0.6900, 2.1000, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2010, 2, 103.55, 0.8300, 1.5200, 2.0900, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2010, 3, 103.81, 0.2500, 1.7700, 1.8300, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2010, 4, 104.29, 0.4600, 2.2500, 1.9900, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2010, 5, 104.4, 0.1100, 2.3500, 2.0700, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2010, 6, 104.52, 0.1100, 2.4700, 2.2500, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2010, 7, 104.47, -0.0500, 2.4200, 2.2400, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2010, 8, 104.59, 0.1100, 2.5400, 2.3100, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2010, 9, 104.45, -0.1300, 2.4000, 2.2800, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2010, 10, 104.36, -0.0900, 2.3100, 2.3300, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2010, 11, 104.56, 0.1900, 2.5100, 2.5900, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2010, 12, 105.24, 0.6500, 3.1800, 3.1800, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2011, 1, 106.19, 0.9000, 0.9000, 3.4000, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2011, 2, 106.83, 0.6000, 1.5100, 3.1700, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2011, 3, 107.12, 0.2700, 1.7900, 3.1900, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2011, 4, 107.25, 0.1200, 1.9100, 2.8400, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2011, 5, 107.55, 0.2800, 2.1900, 3.0200, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2011, 6, 107.9, 0.3300, 2.5300, 3.2300, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2011, 7, 108.05, 0.1400, 2.6700, 3.4300, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2011, 8, 108.01, -0.0400, 2.6300, 3.2700, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2011, 9, 108.35, 0.3100, 2.9600, 3.7300, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2011, 10, 108.55, 0.1800, 3.1500, 4.0100, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2011, 11, 108.7, 0.1400, 3.2900, 3.9600, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2011, 12, 109.16, 0.4200, 3.7200, 3.7200, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2012, 1, 109.96, 0.7300, 0.7300, 3.5500, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2012, 2, 110.63, 0.6100, 1.3500, 3.5600, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2012, 3, 110.76, 0.1200, 1.4700, 3.4000, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2012, 4, 110.92, 0.1400, 1.6100, 3.4200, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2012, 5, 111.25, 0.3000, 1.9100, 3.4400, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2012, 6, 111.35, 0.0900, 2.0100, 3.2000, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2012, 7, 111.32, -0.0300, 1.9800, 3.0300, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2012, 8, 111.37, 0.0400, 2.0200, 3.1100, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2012, 9, 111.69, 0.2900, 2.3200, 3.0800, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2012, 10, 111.87, 0.1600, 2.4800, 3.0600, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2012, 11, 111.72, -0.1300, 2.3500, 2.7800, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2012, 12, 111.82, 0.0900, 2.4400, 2.4400, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2013, 1, 112.15, 0.3000, 0.3000, 1.9900, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2013, 2, 112.65, 0.4500, 0.7400, 1.8300, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2013, 3, 112.88, 0.2000, 0.9500, 1.9100, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2013, 4, 113.16, 0.2500, 1.2000, 2.0200, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2013, 5, 113.48, 0.2800, 1.4800, 2.0000, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2013, 6, 113.75, 0.2400, 1.7300, 2.1600, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2013, 7, 113.8, 0.0400, 1.7700, 2.2300, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2013, 8, 113.89, 0.0800, 1.8500, 2.2600, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2013, 9, 114.23, 0.3000, 2.1600, 2.2700, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2013, 10, 113.93, -0.2600, 1.8900, 1.8400, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2013, 11, 113.68, -0.2200, 1.6600, 1.7500, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2013, 12, 113.98, 0.2600, 1.9300, 1.9300, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2014, 1, 114.54, 0.4900, 0.4900, 2.1300, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2014, 2, 115.26, 0.6300, 1.1200, 2.3200, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2014, 3, 115.71, 0.3900, 1.5200, 2.5100, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2014, 4, 116.24, 0.4600, 1.9800, 2.7200, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2014, 5, 116.81, 0.4900, 2.4800, 2.9300, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2014, 6, 116.91, 0.0900, 2.5700, 2.7800, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2014, 7, 117.09, 0.1500, 2.7300, 2.8900, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2014, 8, 117.33, 0.2000, 2.9400, 3.0200, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2014, 9, 117.49, 0.1400, 3.0800, 2.8500, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2014, 10, 117.68, 0.1600, 3.2500, 3.2900, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2014, 11, 117.84, 0.1400, 3.3900, 3.6600, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2014, 12, 118.15, 0.2600, 3.6600, 3.6600, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2015, 1, 118.91, 0.6400, 0.6400, 3.8200, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2015, 2, 120.28, 1.1500, 1.8000, 4.3600, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2015, 3, 120.98, 0.5800, 2.4000, 4.5500, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2015, 4, 121.63, 0.5400, 2.9500, 4.6400, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2015, 5, 121.95, 0.2600, 3.2200, 4.4000, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2015, 6, 122.08, 0.1100, 3.3300, 4.4200, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2015, 7, 122.31, 0.1900, 3.5200, 4.4600, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2015, 8, 122.9, 0.4800, 4.0200, 4.7500, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2015, 9, 123.78, 0.7200, 4.7600, 5.3500, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2015, 10, 124.62, 0.6800, 5.4700, 5.8900, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2015, 11, 125.37, 0.6000, 6.1100, 6.3900, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2015, 12, 126149, 0.6200, 6.7700, 6.7700, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2016, 1, 127.78, 1.2900, 1.4900, 7.4500, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2016, 2, 129.41, 1.2800, 2.5900, 7.5900, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2016, 3, 130.63, 0.9400, 3.5500, 7.9800, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2016, 4, 131.28192, 0.5000, 4.0700, 7.9300, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2016, 5, 131.95119, 0.5100, 4.6000, 8.2000, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2016, 6, 132.58412, 0.4800, 5.6500, 8.6000, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2016, 7, 133.27352, 0.5200, 5.6500, 8.9700, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2016, 8, 132.84716, -0.3200, 5.3100, 8.1000, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2016, 9, 132.77698, -0.0500, 5.2500, 7.2700, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2016, 10, 132.69744, 0.1100, 5.3100, 6.4800, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2016, 11, 132.84598, 0.1100, 5.3100, 5.9600, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2016, 12, 133.39977, 0.4200, 5.7500, 5.7500, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2017, 1, 134.76594, 1.0200, 1.0200, 5.4700, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2017, 2, 136.12133, 1.0100, 2.0400, 5.1800, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2017, 3, 136.76, 0.4700, 2.5000, 4.6900, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2017, 4, 137.40327, 0.4700, 3.0000, 4.6600, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2017, 5, 137.71286, 0.2300, 3.2300, 4.3700, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2017, 6, 137.87074, 0.3700, 3.3500, 3.9900, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2017, 7, 137.80022, -0.0500, 3.3000, 3.4000, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2017, 8, 137.99321, 0.1400, 3.4400, 3.8700, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2017, 9, 138.04879, -0.0400, 3.4900, 3.9700, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2017, 10, 138.07187, 0.0200, 3.5000, 4.0500, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2017, 11, 138.32156, -0.1800, 3.6900, 4.1200, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2017, 12, 138.85399, 0.3800, 4.0900, 4.0900, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2018, 1, 139.72469, -0.6300, 0.6300, 3.6800, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2018, 2, 140.71151, 0.7100, 1.3400, 3.3700, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2018, 3, 141.04936, -0.2400, 1.5800, 3.1400, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2018, 4, 141.70071, 0.4600, 2.0500, 3.1300, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2018, 5, 142.06016, -0.2500, 2.3100, 3.1600, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2018, 6, 142.27987, 0.1500, 2.4700, 3.2000, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2018, 7, 142.09842, -0.1300, 2.3400, 3.1200, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2018, 8, 142.20685, -0.1200, 2.4600, 3.1000, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2018, 9, 141.50332, 0.1600, 2.6300, 3.2300, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2018, 10, 142.67484, 0.1200, 2.7500, 3.3300, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2018, 11, 142.84204, 0.1200, 2.8700, 3.2700, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2018, 12, 143.26676, 0.3000, 3.1800, 3.1800, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2019, 1, 100.59856, 0.6000, 0.6000, 3.1500, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2019, 2, 101.17675, 0.5700, 1.1800, 3.0100, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2019, 3, 101.61572, 0.4300, 1.6200, 3.2100, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2019, 4, 102.11886, 0.5000, 2.1200, 3.2500, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2019, 5, 102.44, 0.3100, 2.4400, 3.3100, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2019, 6, 1027100, 0.2700, 2.7100, 3.4300, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2019, 7, 102.94, 0.2200, 2.9400, 3.7900, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2019, 8, 103.03, 0.0900, 3.0300, 3.7500, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2019, 9, 103.26, 0.2300, 3.2600, 3.8200, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2019, 10, 103.43, 0.1600, 3.4300, 3.8600, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2019, 11, 103.54, 0.1000, 3.5400, 3.8400, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2019, 12, 103.8, 0.2600, 3.8000, 3.8000, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2020, 1, 104.24, 0.4200, 3.6200, 3.6200, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2020, 12, 0, 0.0000, 1.6100, 0.0000, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2021, 1, 104.24, 0.4200, 3.6200, 3.6200, NULL, NULL);
INSERT INTO syli.tp_ipc VALUES (2021, 12, 105.62, 0.3600, 5.6200, 5.6200, NULL, '2022-02-07');


--
-- TOC entry 4745 (class 0 OID 99404)
-- Dependencies: 576
-- Data for Name: tp_moneda; Type: TABLE DATA; Schema: syli; Owner: -
--

INSERT INTO syli.tp_moneda VALUES (0, '$', 'PESOS', 4, 'COP', '2019-08-28 21:23:11.338221', NULL);
INSERT INTO syli.tp_moneda VALUES (1, 'US$', 'DOLAR AMERICANO', 4, 'USD', '2019-08-28 21:23:11.338221', NULL);
INSERT INTO syli.tp_moneda VALUES (2, 'UP', 'UPACS', 4, 'COP', '2019-08-28 21:23:11.338221', NULL);
INSERT INTO syli.tp_moneda VALUES (3, 'FR', 'FRANCOS SUIZOS', 4, 'CHF', '2019-08-28 21:23:11.338221', NULL);
INSERT INTO syli.tp_moneda VALUES (5, 'DM', 'MARCOS ALEMANES', 4, 'EUR', '2019-08-28 21:23:11.338221', NULL);
INSERT INTO syli.tp_moneda VALUES (6, 'MS', 'MARCOS SUIZOS', 4, 'EUR', '2019-08-28 21:23:11.338221', NULL);
INSERT INTO syli.tp_moneda VALUES (7, 'LB', 'LIBRAS ESTERLINAS', 4, 'GBP', '2019-08-28 21:23:11.338221', NULL);
INSERT INTO syli.tp_moneda VALUES (8, 'BL', 'BOLIVARES', 4, 'BOB', '2019-08-28 21:23:11.338221', NULL);
INSERT INTO syli.tp_moneda VALUES (9, 'CZ', 'CRUZADOS', 4, 'BRL', '2019-08-28 21:23:11.338221', NULL);
INSERT INTO syli.tp_moneda VALUES (10, 'PM', 'PESOS MEXICANOS', 4, 'MXN', '2019-08-28 21:23:11.338221', NULL);
INSERT INTO syli.tp_moneda VALUES (11, 'SR', 'SUCRES', 4, 'ECS', '2019-08-28 21:23:11.338221', NULL);
INSERT INTO syli.tp_moneda VALUES (12, 'QZ', 'QUETZALES', 4, 'GTQ', '2019-08-28 21:23:11.338221', NULL);
INSERT INTO syli.tp_moneda VALUES (13, 'PZ', 'PESETAS ESPAÐOLAS', 4, 'EUR', '2019-08-28 21:23:11.338221', NULL);
INSERT INTO syli.tp_moneda VALUES (14, 'FH', 'FLORINES HOLANDESES', 4, 'EUR', '2019-08-28 21:23:11.338221', NULL);
INSERT INTO syli.tp_moneda VALUES (16, 'EU', 'EURO', 4, 'EUR', '2019-08-28 21:23:11.338221', NULL);
INSERT INTO syli.tp_moneda VALUES (17, 'DC', 'DOLAR CANADIENSE', 4, 'CAD', '2019-08-28 21:23:11.338221', NULL);


--
-- TOC entry 4746 (class 0 OID 99408)
-- Dependencies: 577
-- Data for Name: tp_origen; Type: TABLE DATA; Schema: syli; Owner: -
--

INSERT INTO syli.tp_origen VALUES (8, 'or8', '2024-05-31 10:10:32.701091', NULL);
INSERT INTO syli.tp_origen VALUES (7, 'or7', '2023-01-05 07:32:23.292078', NULL);
INSERT INTO syli.tp_origen VALUES (6, 'or6', NULL, NULL);
INSERT INTO syli.tp_origen VALUES (5, 'or5', '2020-04-14 19:57:33.123983', NULL);
INSERT INTO syli.tp_origen VALUES (4, 'or4', '2022-03-31 01:26:31.759766', NULL);
INSERT INTO syli.tp_origen VALUES (3, 'or3', '2020-01-29 20:30:58.216245', NULL);
INSERT INTO syli.tp_origen VALUES (1, 'or1', '2020-01-29 20:30:58.216245', NULL);


--
-- TOC entry 4747 (class 0 OID 99412)
-- Dependencies: 578
-- Data for Name: tp_pais; Type: TABLE DATA; Schema: syli; Owner: -
--

INSERT INTO syli.tp_pais VALUES ('MF', 'SAN MARTÍN (PARTE FRANCESA)', 0, 198, '2019-11-20 19:58:51.462483', NULL, false, '663', '', 'MAF', '663', false);
INSERT INTO syli.tp_pais VALUES ('AN', 'ANTILLAS HOLANDESAS', 0, 8, '2019-11-20 19:58:51.462483', NULL, false, NULL, NULL, NULL, NULL, false);
INSERT INTO syli.tp_pais VALUES ('SY', 'SIRIA (REPUBLICA ARABE DE)', 0, 210, '2019-11-20 19:58:51.462483', NULL, true, '171', '744', 'SYR', '760', false);
INSERT INTO syli.tp_pais VALUES ('AF', 'AFGHANISTAN', 0, 1, '2019-11-20 19:58:51.462483', NULL, true, '43', '013', 'AFG', '004', false);
INSERT INTO syli.tp_pais VALUES ('BI', 'BURUNDI', 63, 33, '2019-11-20 19:58:51.462483', NULL, true, '63', '115', 'BDI', '108', false);
INSERT INTO syli.tp_pais VALUES ('CG', 'CONGO', 72, 47, '2019-11-20 19:58:51.462483', NULL, true, '72', '177', 'COG', '178', false);
INSERT INTO syli.tp_pais VALUES ('CU', 'CUBA', 73, 53, '2019-11-20 19:58:51.462483', NULL, true, '73', '199', 'CUB', '192', false);
INSERT INTO syli.tp_pais VALUES ('IQ', 'IRAQ', 218, 93, '2019-11-20 19:58:51.462483', NULL, true, '218', '369', 'IRQ', '368', false);
INSERT INTO syli.tp_pais VALUES ('IR', 'IRAN', 104, 95, '2019-11-20 19:58:51.462483', NULL, true, '104', '372', 'IRN', '364', false);
INSERT INTO syli.tp_pais VALUES ('KP', 'COREA DEL NORTE', 0, 0, '2019-11-20 19:58:51.462483', NULL, true, '114', '187', 'PRK', '408', false);
INSERT INTO syli.tp_pais VALUES ('ML', 'MALI', 127, 142, '2019-11-20 19:58:51.462483', NULL, true, '127', '464', 'MLI', '466', false);
INSERT INTO syli.tp_pais VALUES ('RU', 'RUSIA', 643, 192, '2019-11-20 19:58:51.462483', NULL, true, '643', '676', 'RUS', '643', false);
INSERT INTO syli.tp_pais VALUES ('SD', 'SUDAN', 168, 215, '2019-11-20 19:58:51.462483', NULL, true, '168', '759', 'SDN', '729', false);
INSERT INTO syli.tp_pais VALUES ('SO', 'SOMALIA', 161, 211, '2019-11-20 19:58:51.462483', NULL, true, '161', '748', 'SOM', '706', false);
INSERT INTO syli.tp_pais VALUES ('UA', 'UCRANIA', 0, 236, '2019-11-20 19:58:51.462483', NULL, true, '230', '830', 'UKR', '804', false);
INSERT INTO syli.tp_pais VALUES ('AL', 'ALBANIA', 44, 2, '2019-11-20 19:58:51.462483', NULL, true, '44', '017', 'ALB', '008', false);
INSERT INTO syli.tp_pais VALUES ('DE', 'ALEMANIA', 0, 3, '2019-11-20 19:58:51.462483', NULL, false, '12', '023', 'DEU', '276', false);
INSERT INTO syli.tp_pais VALUES ('XB', 'ESCOCIA', 0, 0, '2019-11-20 19:58:51.462483', NULL, false, NULL, NULL, NULL, NULL, false);
INSERT INTO syli.tp_pais VALUES ('KA', 'GRAN CAYMAN', 0, 102, '2019-11-20 19:58:51.462483', NULL, false, NULL, NULL, NULL, NULL, false);
INSERT INTO syli.tp_pais VALUES ('DZ', 'ALGERIA', 0, 11, '2019-11-20 19:58:51.462483', NULL, false, '45', '059', 'DZA', '012', false);
INSERT INTO syli.tp_pais VALUES ('AD', 'ANDORRA', 46, 4, '2019-11-20 19:58:51.462483', NULL, false, '46', '037', 'AND', '020', false);
INSERT INTO syli.tp_pais VALUES ('IC', 'ISLAS DEL CANAL', 0, 0, '2019-11-20 19:58:51.462483', NULL, false, NULL, NULL, NULL, NULL, false);
INSERT INTO syli.tp_pais VALUES ('YU', 'YUGOESLAVIA', 0, 0, '2019-11-20 19:58:51.462483', NULL, false, NULL, NULL, NULL, NULL, false);
INSERT INTO syli.tp_pais VALUES ('ZF', 'ZONA FRANCA', 0, 0, '2019-11-20 19:58:51.462483', NULL, false, NULL, NULL, NULL, NULL, false);
INSERT INTO syli.tp_pais VALUES ('AO', 'ANGOLA', 47, 5, '2019-11-20 19:58:51.462483', NULL, false, '47', '040', 'AGO', '024', false);
INSERT INTO syli.tp_pais VALUES ('AI', 'ANGUILA', 660, 6, '2019-11-20 19:58:51.462483', NULL, false, '660', '041', 'AIA', '660', false);
INSERT INTO syli.tp_pais VALUES ('AG', 'ANTIGUA Y BARBUDA', 0, 7, '2019-11-20 19:58:51.462483', NULL, false, '219', '043', 'ATG', '028', false);
INSERT INTO syli.tp_pais VALUES ('SA', 'ARABIA SAUDITA', 0, 10, '2019-11-20 19:58:51.462483', NULL, false, '155', '053', 'SAU', '682', false);
INSERT INTO syli.tp_pais VALUES ('AR', 'ARGENTINA', 27, 12, '2019-11-20 19:58:51.462483', NULL, false, '27', '053', 'ARG', '032', false);
INSERT INTO syli.tp_pais VALUES ('AM', 'ARMENIA', 0, 13, '2019-11-20 19:58:51.462483', NULL, false, '', '026', 'ARM', '051', false);
INSERT INTO syli.tp_pais VALUES ('AW', 'ARUBA', 533, 14, '2019-11-20 19:58:51.462483', NULL, false, '533', '027', 'ABW', '533', false);
INSERT INTO syli.tp_pais VALUES ('AU', 'AUSTRALIA', 48, 15, '2019-11-20 19:58:51.462483', NULL, false, '48', '069', 'AUS', '036', false);
INSERT INTO syli.tp_pais VALUES ('AT', 'AUSTRIA', 15, 16, '2019-11-20 19:58:51.462483', NULL, false, '15', '072', 'AUT', '040', false);
INSERT INTO syli.tp_pais VALUES ('BS', 'BAHAMAS (LAS)', 49, 18, '2019-11-20 19:58:51.462483', NULL, false, '49', '077', 'BHS', '044', false);
INSERT INTO syli.tp_pais VALUES ('BH', 'BAHRAIN', 50, 19, '2019-11-20 19:58:51.462483', NULL, false, '50', '080', 'BHR', '048', false);
INSERT INTO syli.tp_pais VALUES ('BD', 'BANGLADESH', 52, 20, '2019-11-20 19:58:51.462483', NULL, false, '52', '081', 'BGD', '050', false);
INSERT INTO syli.tp_pais VALUES ('BB', 'BARBADOS', 53, 21, '2019-11-20 19:58:51.462483', NULL, false, '53', '083', 'BRB', '052', false);
INSERT INTO syli.tp_pais VALUES ('BE', 'BELGICA', 0, 35, '2019-11-20 19:58:51.462483', NULL, false, '54', '087', 'BEL', '056', false);
INSERT INTO syli.tp_pais VALUES ('BZ', 'BELICE', 0, 22, '2019-11-20 19:58:51.462483', NULL, false, '35', '', 'BLZ', '084', false);
INSERT INTO syli.tp_pais VALUES ('BJ', 'BENIN', 55, 23, '2019-11-20 19:58:51.462483', NULL, false, '55', '229', 'BEN', '204', false);
INSERT INTO syli.tp_pais VALUES ('BM', 'BERMUDA', 0, 24, '2019-11-20 19:58:51.462483', NULL, false, '205', '090', 'BMU', '060', false);
INSERT INTO syli.tp_pais VALUES ('BO', 'BOLIVIA ', 57, 26, '2019-11-20 19:58:51.462483', NULL, false, '57', '097', 'BOL', '068', false);
INSERT INTO syli.tp_pais VALUES ('BW', 'BOTSWANA', 58, 28, '2019-11-20 19:58:51.462483', NULL, false, '58', '101', 'BWA', '072', false);
INSERT INTO syli.tp_pais VALUES ('BR', 'BRASIL', 0, 29, '2019-11-20 19:58:51.462483', NULL, false, '59', '105', 'BRA', '076', false);
INSERT INTO syli.tp_pais VALUES ('BN', 'BRUNEI', 0, 30, '2019-11-20 19:58:51.462483', NULL, false, '60', '108', 'BRN', '096', false);
INSERT INTO syli.tp_pais VALUES ('BG', 'BULGARIA', 61, 31, '2019-11-20 19:58:51.462483', NULL, false, '61', '111', 'BGR', '100', false);
INSERT INTO syli.tp_pais VALUES ('BT', 'BUTAN', 56, 34, '2019-11-20 19:58:51.462483', NULL, false, '56', '119', 'BTN', '064', false);
INSERT INTO syli.tp_pais VALUES ('CV', 'CABO VERDE', 0, 36, '2019-11-20 19:58:51.462483', NULL, false, '66', '127', 'CPV', '132', false);
INSERT INTO syli.tp_pais VALUES ('CM', 'CAMEROON', 0, 38, '2019-11-20 19:58:51.462483', NULL, false, '65', '145', 'CMR', '120', false);
INSERT INTO syli.tp_pais VALUES ('CA', 'CANADA', 30, 39, '2019-11-20 19:58:51.462483', NULL, false, '30', '149', 'CAN', '124', false);
INSERT INTO syli.tp_pais VALUES ('TD', 'CHAD', 68, 40, '2019-11-20 19:58:51.462483', NULL, false, '68', '203', 'TCD', '148', false);
INSERT INTO syli.tp_pais VALUES ('CL', 'CHILE', 25, 41, '2019-11-20 19:58:51.462483', NULL, false, '25', '211', 'CHL', '152', false);
INSERT INTO syli.tp_pais VALUES ('CN', 'CHINA', 69, 42, '2019-11-20 19:58:51.462483', NULL, false, '69', '215', 'CHN', '156', false);
INSERT INTO syli.tp_pais VALUES ('CY', 'CHIPRE', 0, 43, '2019-11-20 19:58:51.462483', NULL, false, '74', '221', 'CYP', '196', false);
INSERT INTO syli.tp_pais VALUES ('VA', 'CIUDAD DEL VATICANO', 0, 44, '2019-11-20 19:58:51.462483', NULL, false, '', '159', 'VAT', '336', false);
INSERT INTO syli.tp_pais VALUES ('CO', 'COLOMBIA', 10, 45, '2019-11-20 19:58:51.462483', NULL, false, '10', '169', 'COL', '170', false);
INSERT INTO syli.tp_pais VALUES ('KM', 'COMOROS', 0, 46, '2019-11-20 19:58:51.462483', NULL, false, '71', '173', 'COM', '174', false);
INSERT INTO syli.tp_pais VALUES ('KR', 'COREA DEL SUR', 0, 0, '2019-11-20 19:58:51.462483', NULL, false, '115', '190', 'KOR', '410', false);
INSERT INTO syli.tp_pais VALUES ('CI', 'COSTA DE MARFIL', 384, 51, '2019-11-20 19:58:51.462483', NULL, false, '384', '193', 'CIV', '384', false);
INSERT INTO syli.tp_pais VALUES ('CR', 'COSTA RICA', 5, 50, '2019-11-20 19:58:51.462483', NULL, false, '5', '196', 'CRI', '188', false);
INSERT INTO syli.tp_pais VALUES ('HR', 'CROACIA', 0, 52, '2019-11-20 19:58:51.462483', NULL, false, '232', '198', 'HRV', '191', false);
INSERT INTO syli.tp_pais VALUES ('CW', 'CURAZAO', 0, 0, '2022-01-20 17:29:11.725699', NULL, false, '214', '', 'CUW', '531', false);
INSERT INTO syli.tp_pais VALUES ('DK', 'DINAMARCA', 0, 54, '2019-11-20 19:58:51.462483', NULL, false, '77', '232', 'DNK', '208', false);
INSERT INTO syli.tp_pais VALUES ('DJ', 'DJIBOUTI', 78, 0, '2019-11-20 19:58:51.462483', NULL, false, '78', '783', 'DJI', '262', false);
INSERT INTO syli.tp_pais VALUES ('DM', 'DOMINICA', 79, 55, '2019-11-20 19:58:51.462483', NULL, false, '79', '235', 'DMA', '212', false);
INSERT INTO syli.tp_pais VALUES ('EC', 'ECUADOR', 20, 56, '2019-11-20 19:58:51.462483', NULL, false, '20', '239', 'ECU', '218', false);
INSERT INTO syli.tp_pais VALUES ('EG', 'EGIPTO', 0, 57, '2019-11-20 19:58:51.462483', NULL, false, '81', '240', 'EGY', '818', false);
INSERT INTO syli.tp_pais VALUES ('SV', 'EL SALVADOR', 83, 58, '2019-11-20 19:58:51.462483', NULL, false, '83', '242', 'SLV', '222', false);
INSERT INTO syli.tp_pais VALUES ('AE', 'EMIRATOS ARABES UNIDOS', 0, 59, '2019-11-20 19:58:51.462483', NULL, false, '182', '244', 'ARE', '784', false);
INSERT INTO syli.tp_pais VALUES ('ER', 'ERITREA', 196, 60, '2019-11-20 19:58:51.462483', NULL, false, '196', '243', 'ERI', '232', false);
INSERT INTO syli.tp_pais VALUES ('SK', 'ESLOVAQUIA', 0, 0, '2019-11-20 19:58:51.462483', NULL, false, '234', '246', 'SVK', '703', false);
INSERT INTO syli.tp_pais VALUES ('SI', 'ESLOVENIA', 0, 62, '2019-11-20 19:58:51.462483', NULL, false, '233', '247', 'SVN', '705', false);
INSERT INTO syli.tp_pais VALUES ('ES', 'ESPAÑA', 0, 63, '2019-11-20 19:58:51.462483', NULL, false, '14', '245', 'ESP', '724', false);
INSERT INTO syli.tp_pais VALUES ('US', 'ESTADOS UNIDOS', 0, 64, '2019-11-20 19:58:51.462483', NULL, false, '2', '249', 'USA', '840', false);
INSERT INTO syli.tp_pais VALUES ('EE', 'ESTONIA', 0, 65, '2019-11-20 19:58:51.462483', NULL, false, '', '251', 'EST', '233', false);
INSERT INTO syli.tp_pais VALUES ('ET', 'ETIOPIA', 0, 66, '2019-11-20 19:58:51.462483', NULL, false, '85', '243', 'ETH', '231', false);
INSERT INTO syli.tp_pais VALUES ('SZ', 'ESWATINI', 0, 213, '2019-11-20 19:58:51.462483', NULL, false, '170', '773', 'SWZ', '748', false);
INSERT INTO syli.tp_pais VALUES ('PH', 'FILIPINAS', 0, 67, '2019-11-20 19:58:51.462483', NULL, false, '146', '267', 'PHL', '608', false);
INSERT INTO syli.tp_pais VALUES ('FI', 'FINLANDIA', 0, 68, '2019-11-20 19:58:51.462483', NULL, false, '87', '271', 'FIN', '246', false);
INSERT INTO syli.tp_pais VALUES ('FR', 'FRANCIA', 0, 70, '2019-11-20 19:58:51.462483', NULL, false, '11', '275', 'FRA', '250', false);
INSERT INTO syli.tp_pais VALUES ('GA', 'GABON', 89, 71, '2019-11-20 19:58:51.462483', NULL, false, '89', '281', 'GAB', '266', false);
INSERT INTO syli.tp_pais VALUES ('GM', 'GAMBIA (THE)', 270, 72, '2019-11-20 19:58:51.462483', NULL, false, '270', '285', 'GMB', '270', false);
INSERT INTO syli.tp_pais VALUES ('GE', 'GEORGIA', 268, 73, '2019-11-20 19:58:51.462483', NULL, false, '268', '287', 'GEO', '268', false);
INSERT INTO syli.tp_pais VALUES ('GH', 'GHANA', 90, 74, '2019-11-20 19:58:51.462483', NULL, false, '90', '289', 'GHA', '288', false);
INSERT INTO syli.tp_pais VALUES ('GI', 'GIBRALTAR', 224, 75, '2019-11-20 19:58:51.462483', NULL, false, '224', '293', 'GIB', '292', false);
INSERT INTO syli.tp_pais VALUES ('GD', 'GRANADA', 0, 76, '2019-11-20 19:58:51.462483', NULL, false, '94', '297', 'GRD', '308', false);
INSERT INTO syli.tp_pais VALUES ('GR', 'GRECIA', 0, 77, '2019-11-20 19:58:51.462483', NULL, false, '93', '301', 'GRC', '300', false);
INSERT INTO syli.tp_pais VALUES ('GL', 'GROENLANDIA', 304, 78, '2019-11-20 19:58:51.462483', NULL, false, '304', '305', 'GRL', '304', false);
INSERT INTO syli.tp_pais VALUES ('GP', 'GUADALUPE', 312, 79, '2019-11-20 19:58:51.462483', NULL, false, '312', '309', 'GLP', '312', false);
INSERT INTO syli.tp_pais VALUES ('GU', 'GUAM', 213, 80, '2019-11-20 19:58:51.462483', NULL, false, '213', '313', 'GUM', '316', false);
INSERT INTO syli.tp_pais VALUES ('GT', 'GUATEMALA', 23, 81, '2019-11-20 19:58:51.462483', NULL, false, '23', '317', 'GTM', '320', false);
INSERT INTO syli.tp_pais VALUES ('GF', 'GUAYANA FRANCESA', 254, 82, '2019-11-20 19:58:51.462483', NULL, false, '254', '325', 'GUF', '254', false);
INSERT INTO syli.tp_pais VALUES ('GG', 'GUERNSEY', 235, 83, '2019-11-20 19:58:51.462483', NULL, false, '235', '', 'GGY', '831', false);
INSERT INTO syli.tp_pais VALUES ('GN', 'GUINEA', 95, 84, '2019-11-20 19:58:51.462483', NULL, false, '95', '329', 'GIN', '324', false);
INSERT INTO syli.tp_pais VALUES ('GQ', 'GUINEA ECUATORIAL', 0, 86, '2019-11-20 19:58:51.462483', NULL, false, '84', '331', 'GNQ', '226', false);
INSERT INTO syli.tp_pais VALUES ('GW', 'GUINEA-BISAU', 0, 85, '2019-11-20 19:58:51.462483', NULL, false, '96', '334', 'GNB', '624', false);
INSERT INTO syli.tp_pais VALUES ('GY', 'GUYANA', 97, 87, '2019-11-20 19:58:51.462483', NULL, false, '97', '337', 'GUY', '328', false);
INSERT INTO syli.tp_pais VALUES ('HT', 'HAITI', 98, 88, '2019-11-20 19:58:51.462483', NULL, false, '98', '341', 'HTI', '332', false);
INSERT INTO syli.tp_pais VALUES ('HN', 'HONDURAS', 99, 89, '2019-11-20 19:58:51.462483', NULL, false, '99', '345', 'HND', '340', false);
INSERT INTO syli.tp_pais VALUES ('HK', 'HONG KONG', 0, 0, '2019-11-20 19:58:51.462483', NULL, true, '', '351', 'HKG', '344', false);
INSERT INTO syli.tp_pais VALUES ('HU', 'HUNGRIA', 0, 90, '2019-11-20 19:58:51.462483', NULL, false, '100', '375', 'HUN', '348', false);
INSERT INTO syli.tp_pais VALUES ('IN', 'INDIA', 102, 91, '2019-11-20 19:58:51.462483', NULL, false, '102', '361', 'IND', '356', false);
INSERT INTO syli.tp_pais VALUES ('ID', 'INDONESIA', 103, 92, '2019-11-20 19:58:51.462483', NULL, false, '103', '365', 'IDN', '360', false);
INSERT INTO syli.tp_pais VALUES ('IE', 'IRLANDA', 372, 94, '2019-11-20 19:58:51.462483', NULL, false, '372', '375', 'IRL', '372', false);
INSERT INTO syli.tp_pais VALUES ('IM', 'ISLA DE MAN', 0, 100, '2019-11-20 19:58:51.462483', NULL, false, '236', '', 'IMN', '833', false);
INSERT INTO syli.tp_pais VALUES ('CX', 'ISLA DE NAVIDAD', 0, 97, '2019-11-20 19:58:51.462483', NULL, false, '', '511', 'CXR', '162', false);
INSERT INTO syli.tp_pais VALUES ('NF', 'ISLA NORFOLK', 0, 99, '2019-11-20 19:58:51.462483', NULL, false, '', '535', 'NFK', '574', false);
INSERT INTO syli.tp_pais VALUES ('IS', 'ISLANDIA', 0, 101, '2019-11-20 19:58:51.462483', NULL, false, '101', '', 'ISL', '352', false);
INSERT INTO syli.tp_pais VALUES ('KY', 'ISLAS CAIMAN', 0, 102, '2019-11-20 19:58:51.462483', NULL, false, '223', '137', 'CYM', '136', false);
INSERT INTO syli.tp_pais VALUES ('CC', 'ISLAS COCOS', 0, 103, '2019-11-20 19:58:51.462483', NULL, false, '', '165', 'CCK', '166', false);
INSERT INTO syli.tp_pais VALUES ('CK', 'ISLAS COOK', 0, 104, '2019-11-20 19:58:51.462483', NULL, false, '', '183', 'COK', '184', false);
INSERT INTO syli.tp_pais VALUES ('FO', 'ISLAS FEROE', 0, 105, '2019-11-20 19:58:51.462483', NULL, false, '', '', 'FRO', '234', false);
INSERT INTO syli.tp_pais VALUES ('MH', 'ISLAS MARSHALL', 584, 110, '2019-11-20 19:58:51.462483', NULL, false, '584', '472', 'MHL', '584', false);
INSERT INTO syli.tp_pais VALUES ('PN', 'ISLAS PITCAIRN', 0, 176, '2019-11-20 19:58:51.462483', NULL, false, '612', '583', 'PCN', '612', false);
INSERT INTO syli.tp_pais VALUES ('TC', 'ISLAS TURCAS Y CAICOS', 796, 112, '2019-11-20 19:58:51.462483', NULL, false, '796', '823', 'TCA', '796', false);
INSERT INTO syli.tp_pais VALUES ('UM', 'ISLAS ULTRAMARINAS MENORES DE LOS ESTADOS UNIDOS', 0, 115, '2019-11-20 19:58:51.462483', NULL, false, '581', '', 'UMI', '581', false);
INSERT INTO syli.tp_pais VALUES ('VG', 'ISLAS VIRGENES BRITANICAS', 0, 113, '2019-11-20 19:58:51.462483', NULL, false, '3', '863', 'VGB', '092', false);
INSERT INTO syli.tp_pais VALUES ('VI', 'ISLAS VIRGENES DE LOS ESTADOS UNIDOS', 0, 114, '2019-11-20 19:58:51.462483', NULL, false, '850', '866', 'VIR', '850', false);
INSERT INTO syli.tp_pais VALUES ('IL', 'ISRAEL', 106, 117, '2019-11-20 19:58:51.462483', NULL, false, '106', '383', 'ISR', '376', false);
INSERT INTO syli.tp_pais VALUES ('IT', 'ITALIA', 0, 118, '2019-11-20 19:58:51.462483', NULL, false, '7', '386', 'ITA', '380', false);
INSERT INTO syli.tp_pais VALUES ('JM', 'JAMAICA', 108, 119, '2019-11-20 19:58:51.462483', NULL, false, '108', '391', 'JAM', '388', false);
INSERT INTO syli.tp_pais VALUES ('JP', 'JAPON', 0, 120, '2019-11-20 19:58:51.462483', NULL, false, '16', '399', 'JPN', '392', false);
INSERT INTO syli.tp_pais VALUES ('JE', 'JERSEY', 0, 0, '2019-11-20 19:58:51.462483', NULL, false, '832', '', 'JEY', '832', false);
INSERT INTO syli.tp_pais VALUES ('JO', 'JORDANIA', 0, 122, '2019-11-20 19:58:51.462483', NULL, false, '109', '403', 'JOR', '400', false);
INSERT INTO syli.tp_pais VALUES ('KZ', 'KAZAJISTAN', 0, 0, '2019-11-20 19:58:51.462483', NULL, false, '228', '406', 'KAZ', '398', false);
INSERT INTO syli.tp_pais VALUES ('KE', 'KENIA', 111, 124, '2019-11-20 19:58:51.462483', NULL, false, '111', '410', 'KEN', '404', false);
INSERT INTO syli.tp_pais VALUES ('KG', 'KIRGUISTAN', 0, 0, '2019-11-20 19:58:51.462483', NULL, false, '229', '412', 'KGZ', '417', false);
INSERT INTO syli.tp_pais VALUES ('KW', 'KUWAIT', 116, 127, '2019-11-20 19:58:51.462483', NULL, false, '116', '413', 'KWT', '414', false);
INSERT INTO syli.tp_pais VALUES ('LA', 'LAO, (LA) REPUBLICA DEMOCRATICA POPULAR', 0, 0, '2019-11-20 19:58:51.462483', NULL, false, '117', '420', 'LAO', '418', false);
INSERT INTO syli.tp_pais VALUES ('LS', 'LESOTO', 119, 129, '2019-11-20 19:58:51.462483', NULL, false, '119', '426', 'LSO', '426', false);
INSERT INTO syli.tp_pais VALUES ('LV', 'LETONIA', 428, 130, '2019-11-20 19:58:51.462483', NULL, false, '428', '429', 'LVA', '428', false);
INSERT INTO syli.tp_pais VALUES ('LB', 'LIBANO', 0, 136, '2019-11-20 19:58:51.462483', NULL, true, '118', '431', 'LBN', '422', false);
INSERT INTO syli.tp_pais VALUES ('LY', 'LIBIA', 0, 0, '2019-11-20 19:58:51.462483', NULL, true, '121', '438', 'LBY', '434', false);
INSERT INTO syli.tp_pais VALUES ('LI', 'LIECHTENSTEIN', 122, 133, '2019-11-20 19:58:51.462483', NULL, false, '122', '440', 'LIE', '438', false);
INSERT INTO syli.tp_pais VALUES ('LT', 'LITUANIA', 0, 134, '2019-11-20 19:58:51.462483', NULL, false, '226', '443', 'LTU', '440', false);
INSERT INTO syli.tp_pais VALUES ('LU', 'LUXEMBURGO', 0, 135, '2019-11-20 19:58:51.462483', NULL, false, '123', '445', 'LUX', '442', false);
INSERT INTO syli.tp_pais VALUES ('MO', 'MACAO', 216, 0, '2019-11-20 19:58:51.462483', NULL, false, '216', '447', 'MAC', '446', false);
INSERT INTO syli.tp_pais VALUES ('MG', 'MADAGASCAR', 124, 138, '2019-11-20 19:58:51.462483', NULL, false, '124', '450', 'MDG', '450', false);
INSERT INTO syli.tp_pais VALUES ('MY', 'MALASIA', 0, 139, '2019-11-20 19:58:51.462483', NULL, false, '42', '455', 'MYS', '458', false);
INSERT INTO syli.tp_pais VALUES ('MW', 'MALAWI', 125, 140, '2019-11-20 19:58:51.462483', NULL, false, '125', '458', 'MWI', '454', false);
INSERT INTO syli.tp_pais VALUES ('MV', 'MALDIVAS', 0, 141, '2019-11-20 19:58:51.462483', NULL, false, '126', '461', 'MDV', '462', false);
INSERT INTO syli.tp_pais VALUES ('MT', 'MALTA', 13, 143, '2019-11-20 19:58:51.462483', NULL, false, '13', '467', 'MLT', '470', false);
INSERT INTO syli.tp_pais VALUES ('MA', 'MARRUECOS', 0, 144, '2019-11-20 19:58:51.462483', NULL, false, '132', '474', 'MAR', '504', false);
INSERT INTO syli.tp_pais VALUES ('MQ', 'MARTINICA', 474, 145, '2019-11-20 19:58:51.462483', NULL, false, '474', '477', 'MTQ', '474', false);
INSERT INTO syli.tp_pais VALUES ('MU', 'MAURICIO', 0, 146, '2019-11-20 19:58:51.462483', NULL, false, '129', '485', 'MUS', '480', false);
INSERT INTO syli.tp_pais VALUES ('MR', 'MAURITANIA', 128, 147, '2019-11-20 19:58:51.462483', NULL, false, '128', '488', 'MRT', '478', false);
INSERT INTO syli.tp_pais VALUES ('YT', 'MAYOTTE', 0, 148, '2019-11-20 19:58:51.462483', NULL, false, '', '', 'MYT', '175', false);
INSERT INTO syli.tp_pais VALUES ('MX', 'MEXICO', 70, 156, '2019-11-20 19:58:51.462483', NULL, false, '70', '493', 'MEX', '484', false);
INSERT INTO syli.tp_pais VALUES ('MD', 'MOLDAVIA', 0, 150, '2019-11-20 19:58:51.462483', NULL, false, '498', '496', 'MDA', '498', false);
INSERT INTO syli.tp_pais VALUES ('MC', 'MONACO', 130, 157, '2019-11-20 19:58:51.462483', NULL, false, '130', '498', 'MCO', '492', false);
INSERT INTO syli.tp_pais VALUES ('MN', 'MONGOLIA', 0, 151, '2019-11-20 19:58:51.462483', NULL, false, '131', '497', 'MNG', '496', false);
INSERT INTO syli.tp_pais VALUES ('MS', 'MONTSERRAT', 0, 0, '2019-11-20 19:58:51.462483', NULL, false, '500', '501', 'MSR', '500', false);
INSERT INTO syli.tp_pais VALUES ('MZ', 'MOZAMBIQUE', 133, 154, '2019-11-20 19:58:51.462483', NULL, false, '133', '505', 'MOZ', '508', false);
INSERT INTO syli.tp_pais VALUES ('NA', 'NAMIBIA', 134, 158, '2019-11-20 19:58:51.462483', NULL, false, '134', '507', 'NAM', '516', false);
INSERT INTO syli.tp_pais VALUES ('NR', 'NAURU', 135, 159, '2019-11-20 19:58:51.462483', NULL, false, '135', '508', 'NRU', '520', false);
INSERT INTO syli.tp_pais VALUES ('NP', 'NEPAL', 136, 160, '2019-11-20 19:58:51.462483', NULL, false, '136', '517', 'NPL', '524', false);
INSERT INTO syli.tp_pais VALUES ('NU', 'NIUE', 0, 98, '2019-11-20 19:58:51.462483', NULL, false, '570', '531', 'NIU', '570', false);
INSERT INTO syli.tp_pais VALUES ('NI', 'NICARAGUA', 4, 161, '2019-11-20 19:58:51.462483', NULL, true, '4', '521', 'NIC', '558', false);
INSERT INTO syli.tp_pais VALUES ('NE', 'NIGER', 139, 166, '2019-11-20 19:58:51.462483', NULL, false, '139', '525', 'NER', '562', false);
INSERT INTO syli.tp_pais VALUES ('NG', 'NIGERIA', 140, 162, '2019-11-20 19:58:51.462483', NULL, false, '140', '528', 'NGA', '566', false);
INSERT INTO syli.tp_pais VALUES ('NO', 'NORUEGA', 0, 163, '2019-11-20 19:58:51.462483', NULL, false, '141', '538', 'NOR', '578', false);
INSERT INTO syli.tp_pais VALUES ('NC', 'NUEVA CALEDONIA', 540, 164, '2019-11-20 19:58:51.462483', NULL, false, '540', '542', 'NCL', '540', false);
INSERT INTO syli.tp_pais VALUES ('NZ', 'NUEVA ZELANDA', 0, 0, '2019-11-20 19:58:51.462483', NULL, false, '41', '548', 'NZL', '554', false);
INSERT INTO syli.tp_pais VALUES ('OM', 'OMAN', 0, 167, '2019-11-20 19:58:51.462483', NULL, false, '512', '556', 'OMN', '512', false);
INSERT INTO syli.tp_pais VALUES ('PK', 'PAKISTAN', 143, 168, '2019-11-20 19:58:51.462483', NULL, false, '143', '576', 'PAK', '586', false);
INSERT INTO syli.tp_pais VALUES ('PA', 'PANAMA', 6, 171, '2019-11-20 19:58:51.462483', NULL, false, '6', '580', 'PAN', '591', false);
INSERT INTO syli.tp_pais VALUES ('PG', 'PAPUA NUEVA GUINEA', 0, 172, '2019-11-20 19:58:51.462483', NULL, false, '144', '545', 'PNG', '598', false);
INSERT INTO syli.tp_pais VALUES ('PY', 'PARAGUAY', 19, 173, '2019-11-20 19:58:51.462483', NULL, false, '19', '586', 'PRY', '600', false);
INSERT INTO syli.tp_pais VALUES ('PE', 'PERU', 0, 64, '2019-11-20 19:58:51.462483', NULL, false, '18', '589', 'PER', '604', false);
INSERT INTO syli.tp_pais VALUES ('PF', 'POLINESIA FRANCESA', 258, 177, '2019-11-20 19:58:51.462483', NULL, false, '258', '599', 'PYF', '258', false);
INSERT INTO syli.tp_pais VALUES ('PL', 'POLONIA', 0, 178, '2019-11-20 19:58:51.462483', NULL, false, '147', '603', 'POL', '616', false);
INSERT INTO syli.tp_pais VALUES ('PT', 'PORTUGAL', 148, 179, '2019-11-20 19:58:51.462483', NULL, false, '148', '607', 'PRT', '620', false);
INSERT INTO syli.tp_pais VALUES ('PR', 'PUERTO RICO', 1, 180, '2019-11-20 19:58:51.462483', NULL, false, '1', '611', 'PRI', '630', false);
INSERT INTO syli.tp_pais VALUES ('QA', 'QATAR', 149, 181, '2019-11-20 19:58:51.462483', NULL, false, '149', '618', 'QAT', '634', false);
INSERT INTO syli.tp_pais VALUES ('CZ', 'REPUBLICA CHECA', 0, 186, '2019-11-20 19:58:51.462483', NULL, false, '', '644', 'CZE', '203', false);
INSERT INTO syli.tp_pais VALUES ('DO', 'REPUBLICA DOMINICANA', 0, 188, '2019-11-20 19:58:51.462483', NULL, false, '80', '647', 'DOM', '214', false);
INSERT INTO syli.tp_pais VALUES ('RE', 'REUNION', 0, 189, '2019-11-20 19:58:51.462483', NULL, false, '', '660', 'REU', '638', false);
INSERT INTO syli.tp_pais VALUES ('RW', 'RUANDA', 152, 190, '2019-11-20 19:58:51.462483', NULL, false, '152', '675', 'RWA', '646', false);
INSERT INTO syli.tp_pais VALUES ('RO', 'RUMANIA', 0, 191, '2019-11-20 19:58:51.462483', NULL, false, '151', '670', 'ROU', '642', false);
INSERT INTO syli.tp_pais VALUES ('WS', 'SAMOA', 882, 193, '2019-11-20 19:58:51.462483', NULL, false, '882', '687', 'WSM', '882', false);
INSERT INTO syli.tp_pais VALUES ('AS', 'SAMOA AMERICANA', 0, 194, '2019-11-20 19:58:51.462483', NULL, false, '', '690', 'ASM', '016', false);
INSERT INTO syli.tp_pais VALUES ('KN', 'SAN CRISTOBAL Y NIEVES', 0, 0, '2019-11-20 19:58:51.462483', NULL, false, '659', '695', 'KNA', '659', false);
INSERT INTO syli.tp_pais VALUES ('SM', 'SAN MARINO', 153, 197, '2019-11-20 19:58:51.462483', NULL, false, '153', '697', 'SMR', '674', false);
INSERT INTO syli.tp_pais VALUES ('CF', 'REPUBLICA CENTROAFRICANA', 0, 185, '2019-11-20 19:58:51.462483', NULL, true, '67', '640', 'CAF', '140', false);
INSERT INTO syli.tp_pais VALUES ('PM', 'SAN PEDRO Y MIQUELON', 0, 0, '2019-11-20 19:58:51.462483', NULL, false, '666', '700', 'SPM', '666', false);
INSERT INTO syli.tp_pais VALUES ('VC', 'SAN VICENTE Y LAS GRANADINAS', 0, 200, '2019-11-20 19:58:51.462483', NULL, false, '670', '705', 'VCT', '670', false);
INSERT INTO syli.tp_pais VALUES ('SH', 'SANTA ELENA, ASCENSION Y TRISTAN DE ACUÑA', 654, 201, '2019-11-20 19:58:51.462483', NULL, false, '654', '710', 'SHN', '654', false);
INSERT INTO syli.tp_pais VALUES ('LC', 'SANTA LUCIA', 0, 202, '2019-11-20 19:58:51.462483', NULL, false, '166', '715', 'LCA', '662', false);
INSERT INTO syli.tp_pais VALUES ('ST', 'SANTO TOME Y PRINCIPE', 0, 203, '2019-11-20 19:58:51.462483', NULL, false, '154', '720', 'STP', '678', false);
INSERT INTO syli.tp_pais VALUES ('SN', 'SENEGAL', 156, 204, '2019-11-20 19:58:51.462483', NULL, false, '156', '728', 'SEN', '686', false);
INSERT INTO syli.tp_pais VALUES ('RS', 'SERBIA', 0, 206, '2022-01-20 17:29:11.725699', NULL, true, '688', '', 'SRB', '688', false);
INSERT INTO syli.tp_pais VALUES ('SC', 'SEYCHELLES', 157, 207, '2019-11-20 19:58:51.462483', NULL, false, '157', '731', 'SYC', '690', false);
INSERT INTO syli.tp_pais VALUES ('SL', 'SIERRA LEONA', 158, 208, '2019-11-20 19:58:51.462483', NULL, false, '158', '735', 'SLE', '694', false);
INSERT INTO syli.tp_pais VALUES ('SG', 'SINGAPUR', 159, 209, '2019-11-20 19:58:51.462483', NULL, false, '159', '741', 'SGP', '702', false);
INSERT INTO syli.tp_pais VALUES ('LR', 'LIBERIA', 120, 131, '2019-11-20 19:58:51.462483', NULL, true, '120', '434', 'LBR', '430', false);
INSERT INTO syli.tp_pais VALUES ('LK', 'SRI LANKA', 165, 212, '2019-11-20 19:58:51.462483', NULL, false, '165', '750', 'LKA', '144', false);
INSERT INTO syli.tp_pais VALUES ('ZA', 'SUDAFRICA', 0, 214, '2019-11-20 19:58:51.462483', NULL, false, '162', '756', 'ZAF', '710', false);
INSERT INTO syli.tp_pais VALUES ('SE', 'SUECIA', 0, 216, '2019-11-20 19:58:51.462483', NULL, false, '17', '764', 'SWE', '752', false);
INSERT INTO syli.tp_pais VALUES ('CH', 'SUIZA', 0, 217, '2019-11-20 19:58:51.462483', NULL, false, '24', '767', 'CHE', '756', false);
INSERT INTO syli.tp_pais VALUES ('SR', 'SURINAM', 169, 218, '2019-11-20 19:58:51.462483', NULL, false, '169', '770', 'SUR', '740', false);
INSERT INTO syli.tp_pais VALUES ('TH', 'TAILANDIA', 0, 221, '2019-11-20 19:58:51.462483', NULL, false, '174', '776', 'THA', '764', false);
INSERT INTO syli.tp_pais VALUES ('TW', 'TAIWAN (REPUBLICA DE CHINA)', 0, 222, '2019-11-20 19:58:51.462483', NULL, false, '172', '218', 'TWN', '158', false);
INSERT INTO syli.tp_pais VALUES ('TZ', 'TANZANIA', 0, 223, '2019-11-20 19:58:51.462483', NULL, false, '173', '780', 'TZA', '834', false);
INSERT INTO syli.tp_pais VALUES ('TG', 'TOGO', 175, 228, '2019-11-20 19:58:51.462483', NULL, false, '175', '800', 'TGO', '768', false);
INSERT INTO syli.tp_pais VALUES ('TK', 'TOKELAU', 772, 229, '2019-11-20 19:58:51.462483', NULL, false, '772', '805', 'TKL', '772', false);
INSERT INTO syli.tp_pais VALUES ('TO', 'TONGA', 176, 230, '2019-11-20 19:58:51.462483', NULL, false, '176', '810', 'TON', '776', false);
INSERT INTO syli.tp_pais VALUES ('TT', 'TRINIDAD Y TOBAGO', 0, 231, '2019-11-20 19:58:51.462483', NULL, false, '177', '815', 'TTO', '780', false);
INSERT INTO syli.tp_pais VALUES ('TN', 'TUNEZ', 178, 235, '2019-11-20 19:58:51.462483', NULL, false, '178', '820', 'TUN', '788', false);
INSERT INTO syli.tp_pais VALUES ('TM', 'TURKMENISTAN', 0, 232, '2019-11-20 19:58:51.462483', NULL, false, '795', '825', 'TKM', '795', false);
INSERT INTO syli.tp_pais VALUES ('TR', 'TURQUIA', 0, 233, '2019-11-20 19:58:51.462483', NULL, false, '179', '827', 'TUR', '792', false);
INSERT INTO syli.tp_pais VALUES ('UG', 'UGANDA', 181, 237, '2019-11-20 19:58:51.462483', NULL, false, '181', '833', 'UGA', '800', false);
INSERT INTO syli.tp_pais VALUES ('UY', 'URUGUAY', 21, 238, '2019-11-20 19:58:51.462483', NULL, false, '21', '845', 'URY', '858', false);
INSERT INTO syli.tp_pais VALUES ('UZ', 'UZBEKISTAN', 0, 239, '2019-11-20 19:58:51.462483', NULL, false, '231', '847', 'UZB', '860', false);
INSERT INTO syli.tp_pais VALUES ('VU', 'VANUATU', 548, 240, '2019-11-20 19:58:51.462483', NULL, false, '548', '551', 'VUT', '548', false);
INSERT INTO syli.tp_pais VALUES ('VN', 'VIETNAM', 0, 242, '2019-11-20 19:58:51.462483', NULL, false, '189', '855', 'VNM', '704', false);
INSERT INTO syli.tp_pais VALUES ('WF', 'WALLIS Y FUTUNA', 0, 243, '2019-11-20 19:58:51.462483', NULL, false, '876', '875', 'WLF', '876', false);
INSERT INTO syli.tp_pais VALUES ('ZM', 'ZAMBIA', 220, 246, '2019-11-20 19:58:51.462483', NULL, false, '220', '', 'ZMB', '894', false);
INSERT INTO syli.tp_pais VALUES ('AX', 'ALAND ISLANDS', 0, 0, '2022-01-20 17:29:11.725699', NULL, false, '248', '', 'ALA', '248', false);
INSERT INTO syli.tp_pais VALUES ('AQ', 'ANTARTIDA', 0, 0, '2022-01-20 17:29:11.725699', NULL, false, '', '', 'ATA', '010', false);
INSERT INTO syli.tp_pais VALUES ('AZ', 'AZERBAIJAN', 0, 0, '2022-01-20 17:29:11.725699', NULL, false, '227', '074', 'AZE', '031', false);
INSERT INTO syli.tp_pais VALUES ('BY', 'BIELORRUSIA', 0, 0, '2022-01-20 17:29:11.725699', NULL, true, '', '091', 'BLR', '112', false);
INSERT INTO syli.tp_pais VALUES ('BQ', 'BONAIRE, SAN EUSTAQUIO Y SABA', 0, 0, '2022-01-20 17:29:11.725699', NULL, false, '', '', 'BES', '535', false);
INSERT INTO syli.tp_pais VALUES ('BA', 'BOSNIA Y HERZEGOVINA', 0, 0, '2022-01-20 17:29:11.725699', NULL, true, '', '029', 'BIH', '070', false);
INSERT INTO syli.tp_pais VALUES ('BF', 'BURKINA FASO', 0, 0, '2022-01-20 17:29:11.725699', NULL, false, '854', '031', 'BFA', '854', false);
INSERT INTO syli.tp_pais VALUES ('KH', 'CAMBODIA', 0, 0, '2022-01-20 17:29:11.725699', NULL, false, '64', '141', 'KHM', '116', false);
INSERT INTO syli.tp_pais VALUES ('FJ', 'FIJI', 0, 0, '2022-01-20 17:29:11.725699', NULL, false, '86', '870', 'FJI', '242', false);
INSERT INTO syli.tp_pais VALUES ('BV', 'ISLA BOUVET', 0, 0, '2022-01-20 17:29:11.725699', NULL, false, '', '', 'BVT', '074', false);
INSERT INTO syli.tp_pais VALUES ('GS', 'ISLAS GEORGIAS DEL SUR Y SANDWICH DEL SUR', 0, 0, '2022-01-20 17:29:11.725699', NULL, false, '239', '', 'SGS', '239', false);
INSERT INTO syli.tp_pais VALUES ('HM', 'ISLAS HEARD Y MCDONALD', 0, 0, '2022-01-20 17:29:11.725699', NULL, false, '334', '', 'HMD', '334', false);
INSERT INTO syli.tp_pais VALUES ('FK', 'ISLAS MALVINAS', 0, 0, '2022-01-20 17:29:11.725699', NULL, false, '238', '', 'FLK', '238', false);
INSERT INTO syli.tp_pais VALUES ('MP', 'ISLAS MARIANAS DEL NORTE', 0, 0, '2022-01-20 17:29:11.725699', NULL, false, '580', '469', 'MNP', '580', false);
INSERT INTO syli.tp_pais VALUES ('SB', 'ISLAS SALOMON', 0, 0, '2022-01-20 17:29:11.725699', NULL, false, '160', '677', 'SLB', '090', false);
INSERT INTO syli.tp_pais VALUES ('KI', 'KIRIBATI', 0, 0, '2022-01-20 17:29:11.725699', NULL, false, '91', '', 'KIR', '296', false);
INSERT INTO syli.tp_pais VALUES ('MK', 'MACEDONIA DEL NORTE', 0, 0, '2022-01-20 17:29:11.725699', NULL, true, '807', '448', 'MKD', '807', false);
INSERT INTO syli.tp_pais VALUES ('ME', 'MONTENEGRO', 0, 0, '2022-01-20 17:29:11.725699', NULL, true, '499', '', 'MNE', '499', false);
INSERT INTO syli.tp_pais VALUES ('MM', 'MYANMAR', 0, 0, '2022-01-20 17:29:11.725699', NULL, false, '198', '093', 'MMR', '104', false);
INSERT INTO syli.tp_pais VALUES ('NL', 'PAISES BAJOS', 0, 0, '2019-11-20 19:58:51.462483', NULL, false, '137', '573', 'NLD', '528', false);
INSERT INTO syli.tp_pais VALUES ('PW', 'PALAOS', 0, 0, '2022-01-20 17:29:11.725699', NULL, false, '585', '578', 'PLW', '585', false);
INSERT INTO syli.tp_pais VALUES ('PS', 'PALESTINA', 0, 0, '2022-01-20 17:29:11.725699', NULL, false, '275', '897', 'PSE', '275', false);
INSERT INTO syli.tp_pais VALUES ('GB', 'REINO UNIDO', 0, 0, '2019-11-20 19:58:51.462483', NULL, false, '9', '628', 'GBR', '826', false);
INSERT INTO syli.tp_pais VALUES ('EH', 'REPUBLICA ARABE SAHARAUI DEMOCRATICA', 0, 0, '2022-01-20 17:29:11.725699', NULL, false, '', '', 'ESH', '732', false);
INSERT INTO syli.tp_pais VALUES ('CD', 'REPUBLICA DEMOCRATICA DEL CONGO', 0, 0, '2022-01-20 17:29:11.725699', NULL, true, '', '888', 'COD', '180', false);
INSERT INTO syli.tp_pais VALUES ('BL', 'SAN BARTOLOME', 0, 0, '2022-01-20 17:29:11.725699', NULL, false, '652', '', 'BLM', '652', false);
INSERT INTO syli.tp_pais VALUES ('SS', 'SUDAN DEL SUR', 0, 0, '2022-01-20 17:29:11.725699', NULL, true, '', '', 'SSD', '728', false);
INSERT INTO syli.tp_pais VALUES ('SJ', 'SVALBARD Y JAN MAYEN', 0, 0, '2022-01-20 17:29:11.725699', NULL, false, '744', '', 'SJM', '744', false);
INSERT INTO syli.tp_pais VALUES ('TJ', 'TAYIKISTAN', 0, 0, '2022-01-20 17:29:11.725699', NULL, false, '762', '774', 'TJK', '762', false);
INSERT INTO syli.tp_pais VALUES ('IO', 'TERRITORIO BRITANICO DEL OCEANO INDICO', 0, 0, '2022-01-20 17:29:11.725699', NULL, false, '', '787', 'IOT', '086', false);
INSERT INTO syli.tp_pais VALUES ('TF', 'TIERRAS AUSTRALES Y ANTARTICAS FRANCESAS', 0, 0, '2022-01-20 17:29:11.725699', NULL, false, '260', '', 'ATF', '260', false);
INSERT INTO syli.tp_pais VALUES ('TL', 'TIMOR ORIENTAL', 0, 0, '2022-01-20 17:29:11.725699', NULL, false, '626', '788', 'TLS', '626', false);
INSERT INTO syli.tp_pais VALUES ('TV', 'TUVALU', 0, 0, '2022-01-20 17:29:11.725699', NULL, false, '180', '828', 'TUV', '798', false);
INSERT INTO syli.tp_pais VALUES ('YE', 'YEMEN', 192, 244, '2019-11-20 19:58:51.462483', NULL, true, '192', '880', 'YEM', '887', false);
INSERT INTO syli.tp_pais VALUES ('ZW', 'ZIMBABUE', 0, 247, '2019-11-20 19:58:51.462483', NULL, true, '197', '665', 'ZWE', '716', false);
INSERT INTO syli.tp_pais VALUES ('VE', 'VENEZUELA (REPUBLICA BOLIVARIANA DE)', 188, 241, '2019-11-20 19:58:51.462483', NULL, false, '188', '850', 'VEN', '862', false);
INSERT INTO syli.tp_pais VALUES ('FM', 'MICRONESIA (ESTADOS FEDERADOS DE)', 0, 0, '2022-01-20 17:29:11.725699', NULL, false, '583', '494', 'FSM', '583', false);
INSERT INTO syli.tp_pais VALUES ('SX', 'SAN MARTÍN (PARTE HOLANDESA)', 0, 0, '2022-01-20 17:29:11.725699', NULL, false, '', '', 'SXM', '534', false);


--
-- TOC entry 4748 (class 0 OID 99418)
-- Dependencies: 579
-- Data for Name: tp_telefono; Type: TABLE DATA; Schema: syli; Owner: -
--

INSERT INTO syli.tp_telefono VALUES (1, 'CELULAR', 'CEL', '2019-08-28 21:26:03.255033', NULL);
INSERT INTO syli.tp_telefono VALUES (2, 'FIJO', 'FIJ', '2019-08-28 21:26:03.255033', NULL);
INSERT INTO syli.tp_telefono VALUES (3, 'OFICINA', 'OFC', '2019-08-28 21:26:03.255033', NULL);
INSERT INTO syli.tp_telefono VALUES (4, 'RESIDENCIA', 'RES', '2019-08-28 21:26:03.255033', NULL);
INSERT INTO syli.tp_telefono VALUES (5, 'FAX', 'FAX', '2019-08-28 21:26:03.255033', NULL);
INSERT INTO syli.tp_telefono VALUES (6, 'CELULAR 2', 'CEL2', '2019-08-28 21:26:03.255033', NULL);
INSERT INTO syli.tp_telefono VALUES (7, 'FIJO 2', 'FIJ2', '2019-08-28 21:26:03.255033', NULL);
INSERT INTO syli.tp_telefono VALUES (8, 'OFICINA 2', 'OFC2', '2019-08-28 21:26:03.255033', NULL);
INSERT INTO syli.tp_telefono VALUES (9, 'RESIDENCIA 2', 'RES2', '2019-08-28 21:26:03.255033', NULL);
INSERT INTO syli.tp_telefono VALUES (10, 'FAX 2', 'FX2', '2019-08-28 21:26:03.255033', NULL);
INSERT INTO syli.tp_telefono VALUES (11, 'OTROS', 'OTS', '2019-08-28 21:26:03.255033', NULL);
INSERT INTO syli.tp_telefono VALUES (12, 'FAX EMPRESA', 'FAXE', '2019-08-28 21:26:03.255033', NULL);
INSERT INTO syli.tp_telefono VALUES (13, 'PBX/CONMUTADOR', 'PBX', '2019-08-28 21:26:03.255033', NULL);
INSERT INTO syli.tp_telefono VALUES (14, 'EMAIL', 'EMA', '2019-08-28 21:26:03.255033', NULL);
INSERT INTO syli.tp_telefono VALUES (15, 'BEEPER', 'BEE', '2019-08-28 21:26:03.255033', NULL);
INSERT INTO syli.tp_telefono VALUES (16, 'LABORAL', 'LAB', '2019-08-28 21:26:03.255033', NULL);


--
-- TOC entry 4749 (class 0 OID 99422)
-- Dependencies: 580
-- Data for Name: tp_transaccion; Type: TABLE DATA; Schema: syli; Owner: -
--

INSERT INTO syli.tp_transaccion VALUES (1, 1, 1, 1, 'Cotización Póliza Nueva', '2023-02-05 22:42:16.819734', '2023-11-09 17:19:08.186328');
INSERT INTO syli.tp_transaccion VALUES (1, 2, 1, 1, 'Emisión Póliza Nueva', '2023-02-05 22:42:16.819734', '2023-11-09 17:19:08.186328');
INSERT INTO syli.tp_transaccion VALUES (1, 3, 1, 1, 'Ingreso a la plataforma', '2023-02-05 22:42:16.819734', '2023-11-09 17:19:08.186328');
INSERT INTO syli.tp_transaccion VALUES (1, 4, 1, 1, 'Ingreso en el cotizador', '2023-02-05 22:42:16.819734', '2023-11-09 17:19:08.186328');
INSERT INTO syli.tp_transaccion VALUES (1, 5, 1, 1, 'Ingreso a crear nueva cotización', '2023-02-05 22:42:16.819734', '2023-11-09 17:19:08.186328');
INSERT INTO syli.tp_transaccion VALUES (1, 6, 1, 1, 'Ingreso a continuar una cotización', '2023-02-05 22:42:16.819734', '2023-11-09 17:19:08.186328');
INSERT INTO syli.tp_transaccion VALUES (1, 7, 1, 1, 'Ingreso al módulo de reportes', '2023-02-05 22:42:16.819734', '2023-11-09 17:19:08.186328');
INSERT INTO syli.tp_transaccion VALUES (1, 8, 1, 1, 'Ingreso a la parametrización de tomador', '2023-02-05 22:42:16.819734', '2023-11-09 17:19:08.186328');
INSERT INTO syli.tp_transaccion VALUES (1, 9, 1, 1, 'Ingreso a la parametrización de planes', '2023-02-05 22:42:16.819734', '2023-11-09 17:19:08.186328');
INSERT INTO syli.tp_transaccion VALUES (1, 10, 1, 1, 'Ingreso a la parametrización de campaña', '2023-02-05 22:42:16.819734', '2023-11-09 17:19:08.186328');
INSERT INTO syli.tp_transaccion VALUES (1, 11, 1, 1, 'Ingreso a reportes de email', '2023-02-05 22:42:16.819734', '2023-11-09 17:19:08.186328');
INSERT INTO syli.tp_transaccion VALUES (1, 12, 1, 1, 'Ingreso a la parametrización de errores', '2023-02-05 22:42:16.819734', '2023-11-09 17:19:08.186328');


--
-- TOC entry 4750 (class 0 OID 99425)
-- Dependencies: 581
-- Data for Name: tp_zonas; Type: TABLE DATA; Schema: syli; Owner: -
--

INSERT INTO syli.tp_zonas VALUES (1, 1, 'ZONA BOGOTA', '2020-01-29 20:30:57.295061', NULL);
INSERT INTO syli.tp_zonas VALUES (1, 2, 'RESTO PAIS', '2020-01-29 20:30:57.295061', NULL);
INSERT INTO syli.tp_zonas VALUES (2, 1, 'ZONA 1', '2020-01-29 20:30:57.295061', NULL);
INSERT INTO syli.tp_zonas VALUES (2, 2, 'ZONA 2', '2020-01-29 20:30:57.295061', NULL);
INSERT INTO syli.tp_zonas VALUES (2, 3, 'ZONA 3', '2020-01-29 20:30:57.295061', NULL);
INSERT INTO syli.tp_zonas VALUES (3, 1, 'ZONE 1', '2020-12-23 20:41:40.822111', NULL);
INSERT INTO syli.tp_zonas VALUES (3, 2, 'ZONE 2', '2020-12-23 20:41:40.822111', NULL);
INSERT INTO syli.tp_zonas VALUES (3, 3, 'ZONE 3', '2020-12-23 20:41:40.822111', NULL);
INSERT INTO syli.tp_zonas VALUES (3, 4, 'ZONE 4', '2020-12-23 20:41:40.822111', NULL);
INSERT INTO syli.tp_zonas VALUES (3, 5, 'ZONE 5', '2020-12-23 20:41:40.822111', NULL);
INSERT INTO syli.tp_zonas VALUES (3, 6, 'ZONE 6', '2020-12-23 20:41:40.822111', NULL);
INSERT INTO syli.tp_zonas VALUES (3, 7, 'ZONE 7', '2020-12-23 20:41:40.822111', NULL);
INSERT INTO syli.tp_zonas VALUES (3, 8, 'ZONE 8', '2020-12-23 20:41:40.822111', NULL);
INSERT INTO syli.tp_zonas VALUES (3, 9, 'ZONE 9', '2020-12-23 20:41:40.822111', NULL);
INSERT INTO syli.tp_zonas VALUES (3, 10, 'ZONE 10', '2020-12-23 20:41:40.822111', NULL);
INSERT INTO syli.tp_zonas VALUES (3, 11, 'ZONE 11', '2020-12-23 20:41:40.822111', NULL);
INSERT INTO syli.tp_zonas VALUES (3, 12, 'ZONE 12', '2020-12-23 20:41:40.822111', NULL);
INSERT INTO syli.tp_zonas VALUES (3, 13, 'ZONE 13', '2020-12-23 20:41:40.822111', NULL);
INSERT INTO syli.tp_zonas VALUES (3, 14, 'ZONE 15 - Bogotá', '2020-12-23 20:41:40.822111', NULL);
INSERT INTO syli.tp_zonas VALUES (3, 15, 'ZONE 14 - Cali', '2020-12-23 20:41:40.822111', NULL);
INSERT INTO syli.tp_zonas VALUES (3, 16, 'ZONE 16 - Manizales', '2022-03-30 20:27:19.020594', NULL);
INSERT INTO syli.tp_zonas VALUES (3, 17, 'ZONE 17 - Villavicencio', '2022-03-30 20:27:19.020594', NULL);


--
-- TOC entry 4751 (class 0 OID 99429)
-- Dependencies: 582
-- Data for Name: usuario_app; Type: TABLE DATA; Schema: syli; Owner: -
--

INSERT INTO syli.usuario_app VALUES (1, 1026, 1, 1, '1032477633', true, 'NICOLAS RIVERA GOMEZ', '', '2023-04-04 18:40:51.719889', '2023-07-25 08:41:26.896426', 1);
INSERT INTO syli.usuario_app VALUES (1, 1027, 1, 1, '1010003199', true, 'ANGIE FORERO', '', '2023-04-04 18:56:06.440601', '2023-07-25 08:41:26.896426', 1);
INSERT INTO syli.usuario_app VALUES (1, 1028, 1, 1, '1128266194', true, 'CARLOS TABORDA', '', '2023-04-04 18:56:07.286776', '2023-07-25 08:41:26.896426', 1);


--
-- TOC entry 4516 (class 2606 OID 99435)
-- Name: aplicacion pk_aplicacion; Type: CONSTRAINT; Schema: syli; Owner: -
--

ALTER TABLE ONLY syli.aplicacion
    ADD CONSTRAINT pk_aplicacion PRIMARY KEY (codigo_aplicativo);


--
-- TOC entry 4518 (class 2606 OID 99437)
-- Name: modulo_app pk_modulo_app; Type: CONSTRAINT; Schema: syli; Owner: -
--

ALTER TABLE ONLY syli.modulo_app
    ADD CONSTRAINT pk_modulo_app PRIMARY KEY (codigo_aplicativo, codigo_modulo);


--
-- TOC entry 4520 (class 2606 OID 99439)
-- Name: perfil_app pk_perfil_app; Type: CONSTRAINT; Schema: syli; Owner: -
--

ALTER TABLE ONLY syli.perfil_app
    ADD CONSTRAINT pk_perfil_app PRIMARY KEY (codigo_aplicativo, codigo_perfil);


--
-- TOC entry 4522 (class 2606 OID 99441)
-- Name: persona pk_persona; Type: CONSTRAINT; Schema: syli; Owner: -
--

ALTER TABLE ONLY syli.persona
    ADD CONSTRAINT pk_persona PRIMARY KEY (tipo_documento, numero_documento);


--
-- TOC entry 4524 (class 2606 OID 99443)
-- Name: persona_direccion pk_persona_direccion; Type: CONSTRAINT; Schema: syli; Owner: -
--

ALTER TABLE ONLY syli.persona_direccion
    ADD CONSTRAINT pk_persona_direccion PRIMARY KEY (tipo_documento, numero_documento, codigo_tipo_direccion);


--
-- TOC entry 4526 (class 2606 OID 99445)
-- Name: persona_telefono pk_persona_telefono; Type: CONSTRAINT; Schema: syli; Owner: -
--

ALTER TABLE ONLY syli.persona_telefono
    ADD CONSTRAINT pk_persona_telefono PRIMARY KEY (tipo_documento, numero_documento, codigo_tipo_telefono);


--
-- TOC entry 4528 (class 2606 OID 99447)
-- Name: tp_actividad_economica pk_tp_actividad_economica; Type: CONSTRAINT; Schema: syli; Owner: -
--

ALTER TABLE ONLY syli.tp_actividad_economica
    ADD CONSTRAINT pk_tp_actividad_economica PRIMARY KEY (codigo_ciiu);


--
-- TOC entry 4530 (class 2606 OID 99449)
-- Name: tp_actividad_economica_h pk_tp_actividad_economica_h; Type: CONSTRAINT; Schema: syli; Owner: -
--

ALTER TABLE ONLY syli.tp_actividad_economica_h
    ADD CONSTRAINT pk_tp_actividad_economica_h PRIMARY KEY (codigo_ciiud, codigo_ciiud_anterior);


--
-- TOC entry 4532 (class 2606 OID 99451)
-- Name: tp_calle pk_tp_calle; Type: CONSTRAINT; Schema: syli; Owner: -
--

ALTER TABLE ONLY syli.tp_calle
    ADD CONSTRAINT pk_tp_calle PRIMARY KEY (codigo_tipo_calle);


--
-- TOC entry 4534 (class 2606 OID 99453)
-- Name: tp_dir_barrio pk_tp_dir_barrio; Type: CONSTRAINT; Schema: syli; Owner: -
--

ALTER TABLE ONLY syli.tp_dir_barrio
    ADD CONSTRAINT pk_tp_dir_barrio PRIMARY KEY (codigo_barrio);


--
-- TOC entry 4536 (class 2606 OID 99455)
-- Name: tp_dir_cuadrante pk_tp_dir_cuadrante; Type: CONSTRAINT; Schema: syli; Owner: -
--

ALTER TABLE ONLY syli.tp_dir_cuadrante
    ADD CONSTRAINT pk_tp_dir_cuadrante PRIMARY KEY (codigo_cuadrante);


--
-- TOC entry 4538 (class 2606 OID 99457)
-- Name: tp_dir_manzana pk_tp_dir_manzana; Type: CONSTRAINT; Schema: syli; Owner: -
--

ALTER TABLE ONLY syli.tp_dir_manzana
    ADD CONSTRAINT pk_tp_dir_manzana PRIMARY KEY (codigo_manzana);


--
-- TOC entry 4540 (class 2606 OID 99459)
-- Name: tp_dir_predio pk_tp_dir_predio; Type: CONSTRAINT; Schema: syli; Owner: -
--

ALTER TABLE ONLY syli.tp_dir_predio
    ADD CONSTRAINT pk_tp_dir_predio PRIMARY KEY (codigo_predio);


--
-- TOC entry 4542 (class 2606 OID 99461)
-- Name: tp_direccion pk_tp_direccion; Type: CONSTRAINT; Schema: syli; Owner: -
--

ALTER TABLE ONLY syli.tp_direccion
    ADD CONSTRAINT pk_tp_direccion PRIMARY KEY (codigo_tipo_direccion);


--
-- TOC entry 4544 (class 2606 OID 99463)
-- Name: tp_estado_civil pk_tp_estado_civil; Type: CONSTRAINT; Schema: syli; Owner: -
--

ALTER TABLE ONLY syli.tp_estado_civil
    ADD CONSTRAINT pk_tp_estado_civil PRIMARY KEY (codigo_estado_civil);


--
-- TOC entry 4546 (class 2606 OID 99465)
-- Name: tp_ipc pk_tp_ipc; Type: CONSTRAINT; Schema: syli; Owner: -
--

ALTER TABLE ONLY syli.tp_ipc
    ADD CONSTRAINT pk_tp_ipc PRIMARY KEY (anio_ipc, mes_ipc);


--
-- TOC entry 4548 (class 2606 OID 99467)
-- Name: tp_moneda pk_tp_moneda; Type: CONSTRAINT; Schema: syli; Owner: -
--

ALTER TABLE ONLY syli.tp_moneda
    ADD CONSTRAINT pk_tp_moneda PRIMARY KEY (codigo_moneda);


--
-- TOC entry 4550 (class 2606 OID 99469)
-- Name: tp_origen pk_tp_origen; Type: CONSTRAINT; Schema: syli; Owner: -
--

ALTER TABLE ONLY syli.tp_origen
    ADD CONSTRAINT pk_tp_origen PRIMARY KEY (codigo_origen);


--
-- TOC entry 4552 (class 2606 OID 99471)
-- Name: tp_pais pk_tp_pais; Type: CONSTRAINT; Schema: syli; Owner: -
--

ALTER TABLE ONLY syli.tp_pais
    ADD CONSTRAINT pk_tp_pais PRIMARY KEY (codigo_pais);


--
-- TOC entry 4554 (class 2606 OID 99473)
-- Name: tp_telefono pk_tp_telefono; Type: CONSTRAINT; Schema: syli; Owner: -
--

ALTER TABLE ONLY syli.tp_telefono
    ADD CONSTRAINT pk_tp_telefono PRIMARY KEY (codigo_tipo_telefono);


--
-- TOC entry 4556 (class 2606 OID 99475)
-- Name: tp_transaccion pk_tp_transaccion; Type: CONSTRAINT; Schema: syli; Owner: -
--

ALTER TABLE ONLY syli.tp_transaccion
    ADD CONSTRAINT pk_tp_transaccion PRIMARY KEY (codigo_aplicativo, codigo_transaccion);


--
-- TOC entry 4558 (class 2606 OID 99477)
-- Name: tp_zonas pk_tp_zonas; Type: CONSTRAINT; Schema: syli; Owner: -
--

ALTER TABLE ONLY syli.tp_zonas
    ADD CONSTRAINT pk_tp_zonas PRIMARY KEY (codigo_tipo_zona, codigo_zona);


--
-- TOC entry 4560 (class 2606 OID 99479)
-- Name: usuario_app pk_usuario_app; Type: CONSTRAINT; Schema: syli; Owner: -
--

ALTER TABLE ONLY syli.usuario_app
    ADD CONSTRAINT pk_usuario_app PRIMARY KEY (codigo_aplicativo, codigo_usuario);


--
-- TOC entry 4562 (class 2606 OID 99481)
-- Name: usuario_app unique_usuario_front; Type: CONSTRAINT; Schema: syli; Owner: -
--

ALTER TABLE ONLY syli.usuario_app
    ADD CONSTRAINT unique_usuario_front UNIQUE (tipo_documento, numero_documento, codigo_front);


--
-- TOC entry 4564 (class 2606 OID 99483)
-- Name: usuario_app uq_app_usuario; Type: CONSTRAINT; Schema: syli; Owner: -
--

ALTER TABLE ONLY syli.usuario_app
    ADD CONSTRAINT uq_app_usuario UNIQUE (codigo_aplicativo, numero_documento);


--
-- TOC entry 4565 (class 2606 OID 99484)
-- Name: modulo_app fk_modulo_app_app; Type: FK CONSTRAINT; Schema: syli; Owner: -
--

ALTER TABLE ONLY syli.modulo_app
    ADD CONSTRAINT fk_modulo_app_app FOREIGN KEY (codigo_aplicativo) REFERENCES syli.aplicacion(codigo_aplicativo);


--
-- TOC entry 4566 (class 2606 OID 99489)
-- Name: perfil_app fk_perfil_app_app; Type: FK CONSTRAINT; Schema: syli; Owner: -
--

ALTER TABLE ONLY syli.perfil_app
    ADD CONSTRAINT fk_perfil_app_app FOREIGN KEY (codigo_aplicativo) REFERENCES syli.aplicacion(codigo_aplicativo);


--
-- TOC entry 4567 (class 2606 OID 99494)
-- Name: persona fk_persona_actecon; Type: FK CONSTRAINT; Schema: syli; Owner: -
--

ALTER TABLE ONLY syli.persona
    ADD CONSTRAINT fk_persona_actecon FOREIGN KEY (codigo_ciiu) REFERENCES syli.tp_actividad_economica(codigo_ciiu);


--
-- TOC entry 4570 (class 2606 OID 99499)
-- Name: persona_direccion fk_persona_dir; Type: FK CONSTRAINT; Schema: syli; Owner: -
--

ALTER TABLE ONLY syli.persona_direccion
    ADD CONSTRAINT fk_persona_dir FOREIGN KEY (tipo_documento, numero_documento) REFERENCES syli.persona(tipo_documento, numero_documento);


--
-- TOC entry 4568 (class 2606 OID 99504)
-- Name: persona fk_persona_estcivil; Type: FK CONSTRAINT; Schema: syli; Owner: -
--

ALTER TABLE ONLY syli.persona
    ADD CONSTRAINT fk_persona_estcivil FOREIGN KEY (codigo_estado_civil) REFERENCES syli.tp_estado_civil(codigo_estado_civil);


--
-- TOC entry 4573 (class 2606 OID 99509)
-- Name: persona_telefono fk_persona_paistel; Type: FK CONSTRAINT; Schema: syli; Owner: -
--

ALTER TABLE ONLY syli.persona_telefono
    ADD CONSTRAINT fk_persona_paistel FOREIGN KEY (codigo_pais) REFERENCES syli.tp_pais(codigo_pais);


--
-- TOC entry 4571 (class 2606 OID 99514)
-- Name: persona_direccion fk_persona_tdir; Type: FK CONSTRAINT; Schema: syli; Owner: -
--

ALTER TABLE ONLY syli.persona_direccion
    ADD CONSTRAINT fk_persona_tdir FOREIGN KEY (codigo_tipo_direccion) REFERENCES syli.tp_direccion(codigo_tipo_direccion);


--
-- TOC entry 4574 (class 2606 OID 99519)
-- Name: persona_telefono fk_persona_tel; Type: FK CONSTRAINT; Schema: syli; Owner: -
--

ALTER TABLE ONLY syli.persona_telefono
    ADD CONSTRAINT fk_persona_tel FOREIGN KEY (tipo_documento, numero_documento) REFERENCES syli.persona(tipo_documento, numero_documento);


--
-- TOC entry 4575 (class 2606 OID 99524)
-- Name: persona_telefono fk_persona_telorig; Type: FK CONSTRAINT; Schema: syli; Owner: -
--

ALTER TABLE ONLY syli.persona_telefono
    ADD CONSTRAINT fk_persona_telorig FOREIGN KEY (origen) REFERENCES syli.tp_origen(codigo_origen);


--
-- TOC entry 4576 (class 2606 OID 99529)
-- Name: persona_telefono fk_persona_teltipo; Type: FK CONSTRAINT; Schema: syli; Owner: -
--

ALTER TABLE ONLY syli.persona_telefono
    ADD CONSTRAINT fk_persona_teltipo FOREIGN KEY (codigo_tipo_telefono) REFERENCES syli.tp_telefono(codigo_tipo_telefono);


--
-- TOC entry 4572 (class 2606 OID 99534)
-- Name: persona_direccion fk_persona_torig; Type: FK CONSTRAINT; Schema: syli; Owner: -
--

ALTER TABLE ONLY syli.persona_direccion
    ADD CONSTRAINT fk_persona_torig FOREIGN KEY (origen) REFERENCES syli.tp_origen(codigo_origen);


--
-- TOC entry 4569 (class 2606 OID 99539)
-- Name: persona fk_personap_torig; Type: FK CONSTRAINT; Schema: syli; Owner: -
--

ALTER TABLE ONLY syli.persona
    ADD CONSTRAINT fk_personap_torig FOREIGN KEY (origen) REFERENCES syli.tp_origen(codigo_origen);


--
-- TOC entry 4577 (class 2606 OID 99544)
-- Name: tp_transaccion fk_tp_transaccion_app; Type: FK CONSTRAINT; Schema: syli; Owner: -
--

ALTER TABLE ONLY syli.tp_transaccion
    ADD CONSTRAINT fk_tp_transaccion_app FOREIGN KEY (codigo_aplicativo) REFERENCES syli.aplicacion(codigo_aplicativo);


--
-- TOC entry 4578 (class 2606 OID 99549)
-- Name: tp_transaccion fk_tp_transaccion_modulo; Type: FK CONSTRAINT; Schema: syli; Owner: -
--

ALTER TABLE ONLY syli.tp_transaccion
    ADD CONSTRAINT fk_tp_transaccion_modulo FOREIGN KEY (codigo_aplicativo, codigo_modulo) REFERENCES syli.modulo_app(codigo_aplicativo, codigo_modulo);


--
-- TOC entry 4579 (class 2606 OID 99554)
-- Name: usuario_app fk_usuario_app_app; Type: FK CONSTRAINT; Schema: syli; Owner: -
--

ALTER TABLE ONLY syli.usuario_app
    ADD CONSTRAINT fk_usuario_app_app FOREIGN KEY (codigo_aplicativo) REFERENCES syli.aplicacion(codigo_aplicativo);


--
-- TOC entry 4580 (class 2606 OID 99559)
-- Name: usuario_app fk_usuario_app_perfil; Type: FK CONSTRAINT; Schema: syli; Owner: -
--

ALTER TABLE ONLY syli.usuario_app
    ADD CONSTRAINT fk_usuario_app_perfil FOREIGN KEY (codigo_aplicativo, codigo_perfil) REFERENCES syli.perfil_app(codigo_aplicativo, codigo_perfil);


--
-- TOC entry 4581 (class 2606 OID 99564)
-- Name: usuario_app fk_usuario_app_persona; Type: FK CONSTRAINT; Schema: syli; Owner: -
--

ALTER TABLE ONLY syli.usuario_app
    ADD CONSTRAINT fk_usuario_app_persona FOREIGN KEY (tipo_documento, numero_documento) REFERENCES syli.persona(tipo_documento, numero_documento);


-- Completed on 2025-04-30 07:30:02 -05

--
-- PostgreSQL database dump complete
--
