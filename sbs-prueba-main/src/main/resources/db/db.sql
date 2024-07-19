--
-- PostgreSQL database dump
--

-- Dumped from database version 12.19 (Ubuntu 12.19-1.pgdg22.04+1)
-- Dumped by pg_dump version 16.3 (Ubuntu 16.3-1.pgdg22.04+1)

-- Started on 2024-07-08 16:06:54 -05

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
-- TOC entry 8 (class 2615 OID 354869)
-- Name: syli; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA syli;


ALTER SCHEMA syli OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 204 (class 1259 OID 354878)
-- Name: aplicacion; Type: TABLE; Schema: syli; Owner: postgres
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


ALTER TABLE syli.aplicacion OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 354902)
-- Name: modulo_app; Type: TABLE; Schema: syli; Owner: postgres
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


ALTER TABLE syli.modulo_app OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 354905)
-- Name: perfil_app; Type: TABLE; Schema: syli; Owner: postgres
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


ALTER TABLE syli.perfil_app OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 354870)
-- Name: persona; Type: TABLE; Schema: syli; Owner: postgres
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


ALTER TABLE syli.persona OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 354917)
-- Name: persona_direccion; Type: TABLE; Schema: syli; Owner: postgres
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


ALTER TABLE syli.persona_direccion OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 354933)
-- Name: persona_telefono; Type: TABLE; Schema: syli; Owner: postgres
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


ALTER TABLE syli.persona_telefono OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 354944)
-- Name: tp_actividad_economica; Type: TABLE; Schema: syli; Owner: postgres
--

CREATE TABLE syli.tp_actividad_economica (
    codigo_ciiu character varying(4) NOT NULL,
    descripcion_ciiu character varying(200) NOT NULL,
    fecha_alta timestamp without time zone,
    fecha_modificacion timestamp without time zone
);


ALTER TABLE syli.tp_actividad_economica OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 354947)
-- Name: tp_actividad_economica_h; Type: TABLE; Schema: syli; Owner: postgres
--

CREATE TABLE syli.tp_actividad_economica_h (
    codigo_ciiud character varying(4) NOT NULL,
    codigo_ciiud_anterior character varying(4) NOT NULL,
    descripcion_ciiud_anterior character varying(200) NOT NULL,
    fecha_alta timestamp without time zone DEFAULT now(),
    fecha_modificacion timestamp without time zone
);


ALTER TABLE syli.tp_actividad_economica_h OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 354951)
-- Name: tp_calle; Type: TABLE; Schema: syli; Owner: postgres
--

CREATE TABLE syli.tp_calle (
    codigo_tipo_calle numeric(2,0) NOT NULL,
    descripcion_tipo_calle character varying(100) NOT NULL,
    fecha_alta timestamp without time zone,
    fecha_modificacion timestamp without time zone,
    activa boolean DEFAULT true
);


ALTER TABLE syli.tp_calle OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 354955)
-- Name: tp_dir_barrio; Type: TABLE; Schema: syli; Owner: postgres
--

CREATE TABLE syli.tp_dir_barrio (
    codigo_barrio character varying(2) NOT NULL,
    descripcion_barrio character varying(30) NOT NULL,
    fecha_alta timestamp without time zone DEFAULT now(),
    fecha_modificacion timestamp without time zone
);


ALTER TABLE syli.tp_dir_barrio OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 354959)
-- Name: tp_dir_cuadrante; Type: TABLE; Schema: syli; Owner: postgres
--

CREATE TABLE syli.tp_dir_cuadrante (
    codigo_cuadrante numeric(1,0) NOT NULL,
    descripcion_cuadrante character varying(30) NOT NULL,
    abreviatura_cuadrante character varying(2),
    fecha_alta timestamp without time zone DEFAULT now(),
    fecha_modificacion timestamp without time zone
);


ALTER TABLE syli.tp_dir_cuadrante OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 354963)
-- Name: tp_dir_manzana; Type: TABLE; Schema: syli; Owner: postgres
--

CREATE TABLE syli.tp_dir_manzana (
    codigo_manzana character varying(2) NOT NULL,
    descripcion_manzana character varying(30) NOT NULL,
    fecha_alta timestamp without time zone DEFAULT now(),
    fecha_modificacion timestamp without time zone
);


ALTER TABLE syli.tp_dir_manzana OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 354967)
-- Name: tp_dir_predio; Type: TABLE; Schema: syli; Owner: postgres
--

CREATE TABLE syli.tp_dir_predio (
    codigo_predio character varying(2) NOT NULL,
    descripcion_predio character varying(30) NOT NULL,
    fecha_alta timestamp without time zone DEFAULT now(),
    fecha_modificacion timestamp without time zone
);


ALTER TABLE syli.tp_dir_predio OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 354971)
-- Name: tp_direccion; Type: TABLE; Schema: syli; Owner: postgres
--

CREATE TABLE syli.tp_direccion (
    codigo_tipo_direccion numeric(4,0) NOT NULL,
    descripcion_tipo_direccion character varying(30),
    abreviatura_tipo_direccion character varying(4),
    fecha_alta timestamp without time zone DEFAULT now(),
    fecha_modificacion timestamp without time zone,
    activo boolean DEFAULT false NOT NULL
);


ALTER TABLE syli.tp_direccion OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 354976)
-- Name: tp_estado_civil; Type: TABLE; Schema: syli; Owner: postgres
--

CREATE TABLE syli.tp_estado_civil (
    codigo_estado_civil numeric(2,0) NOT NULL,
    descripcion_estado_civil character varying(30) NOT NULL,
    fecha_alta timestamp without time zone DEFAULT now(),
    fecha_modificacion timestamp without time zone
);


ALTER TABLE syli.tp_estado_civil OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 354980)
-- Name: tp_ipc; Type: TABLE; Schema: syli; Owner: postgres
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


ALTER TABLE syli.tp_ipc OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 354983)
-- Name: tp_moneda; Type: TABLE; Schema: syli; Owner: postgres
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


ALTER TABLE syli.tp_moneda OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 354987)
-- Name: tp_origen; Type: TABLE; Schema: syli; Owner: postgres
--

CREATE TABLE syli.tp_origen (
    codigo_origen numeric(2,0) NOT NULL,
    descripcion_origen character varying(50) NOT NULL,
    fecha_alta timestamp without time zone DEFAULT now(),
    fecha_modificacion timestamp without time zone
);


ALTER TABLE syli.tp_origen OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 354991)
-- Name: tp_pais; Type: TABLE; Schema: syli; Owner: postgres
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


ALTER TABLE syli.tp_pais OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 355005)
-- Name: tp_telefono; Type: TABLE; Schema: syli; Owner: postgres
--

CREATE TABLE syli.tp_telefono (
    codigo_tipo_telefono numeric(4,0) NOT NULL,
    descripcion_tipo_telefono character varying(30) NOT NULL,
    abreviatura_tipo_telefono character varying(4) NOT NULL,
    fecha_alta timestamp without time zone DEFAULT now(),
    fecha_modificacion timestamp without time zone
);


ALTER TABLE syli.tp_telefono OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 355009)
-- Name: tp_transaccion; Type: TABLE; Schema: syli; Owner: postgres
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


ALTER TABLE syli.tp_transaccion OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 355016)
-- Name: tp_zonas; Type: TABLE; Schema: syli; Owner: postgres
--

CREATE TABLE syli.tp_zonas (
    codigo_tipo_zona numeric(2,0) NOT NULL,
    codigo_zona numeric(8,0) NOT NULL,
    descripcion_zona character varying(50) NOT NULL,
    fecha_alta timestamp without time zone DEFAULT now(),
    fecha_modificacion timestamp without time zone
);


ALTER TABLE syli.tp_zonas OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 355020)
-- Name: usuario_app; Type: TABLE; Schema: syli; Owner: postgres
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


ALTER TABLE syli.usuario_app OWNER TO postgres;

--
-- TOC entry 3215 (class 0 OID 354878)
-- Dependencies: 204
-- Data for Name: aplicacion; Type: TABLE DATA; Schema: syli; Owner: postgres
--

COPY syli.aplicacion (codigo_aplicativo, descripcion_aplicativo, abreviatura_aplicativo, sn_activo, fecha_alta, fecha_modificacion, codigo_front) FROM stdin;
3	Copropiedades - Pymes	CP	t	2021-12-01 00:58:55.766902	\N	2
2	SipaNew	SN	t	2020-07-26 01:45:16.372371	\N	2
5	SBS-Web	SBSW	t	\N	\N	2
4	Document Certifier	DC	t	2022-03-31 01:26:31.282666	\N	2
1	Mercadeo Empresarial	MS	t	2022-11-02 00:59:30.315077	2023-01-04 00:03:59.130503	1
\.


--
-- TOC entry 3216 (class 0 OID 354902)
-- Dependencies: 205
-- Data for Name: modulo_app; Type: TABLE DATA; Schema: syli; Owner: postgres
--

COPY syli.modulo_app (codigo_aplicativo, codigo_modulo, descripcion_modulo, imagen, titulo_modulo, activo, numero_accion, numero_opcion, fecha_alta, fecha_modificacion, codigo_componente) FROM stdin;
5	1	Plataforma SBS	PlataformaSBS.png	Plataforma SBS	f	\N	\N	\N	\N	\N
1	11	MODULO INGESTAS	reports_Icon.png	Modulo cargue de ingestas	f	\N	\N	\N	\N	\N
1	2	Reportes de Mercadeo Empresarial	ReportesDeMercadeoEmpresarial.png	Reportes de Mercadeo Empresarial	f	\N	\N	\N	2022-12-29 11:17:49.615772	\N
1	1	Cotizador MS	CotizadorMS.png	Cotizador MS	t	\N	\N	\N	2022-12-29 11:17:49.615772	\N
1	9	MODULO REPORTES	reports_Icon.png	 Modulo de reportes para ME (VISTA REPORTES)	t	\N	\N	\N	2023-11-09 17:37:51.689501	\N
1	10	MODULO ADMINISTRADOR	reports_Icon.png	Modulo Administrativo	t	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3217 (class 0 OID 354905)
-- Dependencies: 206
-- Data for Name: perfil_app; Type: TABLE DATA; Schema: syli; Owner: postgres
--

COPY syli.perfil_app (codigo_aplicativo, codigo_perfil, descripcion_perfil, sn_activo, fecha_alta, fecha_modificacion, sn_ramo_comercial_todos, sn_clave_pdf, sn_sucursal_todos) FROM stdin;
2	5	Modyo	t	\N	\N	f	f	t
2	4	CONSULTAS ITAU	t	2020-10-15 12:35:16.25983	\N	t	t	t
2	7	Analytics	t	2022-02-15 03:37:17.21132	\N	t	t	t
5	1	SBS Web	t	\N	\N	\N	\N	t
4	1	GENERACION QR	t	2022-03-31 01:26:31.282666	\N	f	t	t
2	2	CONSULTAS	t	2020-07-15 03:32:02.832578	\N	t	f	t
2	1	Administrador	t	\N	\N	t	f	t
1	4	Consulta Sipa	t	2022-11-02 00:59:30.380505	\N	f	f	f
1	5	Administrador de Usuarios	t	2022-11-02 00:59:30.380505	\N	f	f	f
2	9	SipaItauConsultas-Copropiedades	t	\N	\N	f	f	f
3	1	ACTUALIZACION COPROPIEDAD	t	2022-06-10 00:00:00	2022-06-13 14:15:51.686153	f	f	t
3	2	CONSULTAS COPROPIEDAD	t	2022-06-10 18:40:56.775834	2022-06-13 14:15:51.686153	f	f	t
3	3	CONSULTAS+ACTUALIZACION COPROPIEDAD	t	2022-06-13 14:15:51.686153	\N	f	f	t
2	8	CONSULTAS ITAU - ACTUALIZA COPROPIEDAD	t	2022-06-10 00:00:00	2022-06-13 14:15:51.686153	f	f	t
3	6	CONSULTA CP	t	2021-12-01 00:58:55.766902	\N	f	f	t
2	3	Consultas AXA	t	2020-10-01 01:46:52.195111	\N	f	f	t
1	10	Reportes ME	t	\N	2022-12-29 11:48:58.816639	f	f	t
1	1	Super Usuario ME	t	\N	2023-01-04 00:08:53.319285	f	f	t
1	3	Administrativo ME (parametrizaciones)	t	2022-11-02 00:59:30.380505	\N	f	f	f
1	2	Reportes ME	t	2022-11-02 00:59:30.380505	\N	f	f	f
\.


--
-- TOC entry 3214 (class 0 OID 354870)
-- Dependencies: 203
-- Data for Name: persona; Type: TABLE DATA; Schema: syli; Owner: postgres
--

COPY syli.persona (tipo_documento, numero_documento, digito_verificacion_nit, fecha_expedicion_documento, persona_natural, nombres, apellido1, apellido2, nombre_completo_razon_social, genero, fecha_nacimiento, estrato, ocupacion, numero_hijos, origen, fecha_formulario_sarlaft, codigo_estado_civil, profesion_oficio, pais_nacimiento, departamento_nacimiento, municipio_nacimiento, empleado, peso, estatura, habeas_data, grupo_sanguineo, rh_sanguineo, codigo_eps, fecha_creacion, fecha_actualizacion, fecha_defuncion, autoriza_historia_clinica, sarlaft_vigente, codigo_ciiu, fecha_alta, fecha_modificacion, token_recaudo, subtoken_recaudo, fecha_vigencia_desde_eps, fecha_vigencia_hasta_eps, codigo_regimen_eps, codigo_estado_afiliacion, codigo_tipo_afiliado_eps, id_log_transaccional) FROM stdin;
1	1128266194	\N	\N	\N	CARLOS	TABORDA	\N	CARLOS TABORDA	2	1981-06-20	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	2023-07-25	\N	\N	\N	\N	2023-04-04 18:51:21.239702	2023-07-25 07:52:17.311543	\N	\N	2023-04-04 18:51:21.239702	\N	\N	\N	\N	\N
1	1010003199	1	2018-09-24	\N	ANGIE	FORERO	GARCIA	ANGIE FORERO GARCIA	1	2000-09-11	\N	\N	\N	7	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	EPS008	\N	2024-03-07	\N	\N	\N	\N	2023-04-04 18:51:16.435328	2024-03-07 14:02:33.892	\N	\N	\N	\N	\N	\N	\N	808
1	1032477633	1	2014-01-17	\N	NICOLAS	RIVERA	GOMEZ	NICOLAS RIVERA GOMEZ	2	1996-01-02	\N	\N	\N	7	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	EPS008	\N	2024-03-07	\N	\N	\N	\N	2023-04-04 18:28:53.988739	2024-03-07 14:23:38.393	\N	\N	\N	\N	\N	\N	\N	816
\.


--
-- TOC entry 3218 (class 0 OID 354917)
-- Dependencies: 207
-- Data for Name: persona_direccion; Type: TABLE DATA; Schema: syli; Owner: postgres
--

COPY syli.persona_direccion (tipo_documento, numero_documento, codigo_tipo_direccion, direccion, direccion_estandarizada, codigo_postal, codigo_pais, codigo_departamento, codigo_municipio, numero_latitud, numero_longitud, codigo_zona, codigo_localidad, origen, fecha_alta, fecha_modificacion, urbana) FROM stdin;
1	1010003199	1	CALLE 63  18 N 28  CASA	\N	\N	CO	11	11001	\N	\N	\N	\N	7	\N	2024-03-07 14:02:34.242	t
1	1032477633	1	CALLE 50 sur 0 este 22  casa	\N	\N	CO	11	11001	\N	\N	\N	\N	7	\N	2024-03-07 14:23:38.748	t
\.


--
-- TOC entry 3219 (class 0 OID 354933)
-- Dependencies: 208
-- Data for Name: persona_telefono; Type: TABLE DATA; Schema: syli; Owner: postgres
--

COPY syli.persona_telefono (tipo_documento, numero_documento, codigo_tipo_telefono, telefono, codigo_pais, origen, fecha_alta, fecha_modificacion) FROM stdin;
1	1032477633	1	3188707955	CO	7	2023-07-24 16:57:08.345929	\N
1	1128266194	14	carlos.taborda@sbseguros.co	CO	5	2023-07-24 16:29:13.411428	2023-07-25 07:52:17.311543
1	1032477633	14	nicolas.rivera@sbseguros.co	CO	7	2023-07-24 16:57:08.140662	2023-07-25 07:52:17.311543
1	1010003199	1	3143933120	CO	7	2023-07-24 17:56:35.910053	\N
1	1010003199	14	angie.forero@sbseguros.co	CO	7	2023-07-24 13:47:09.805648	2023-07-25 07:52:17.311543
\.


--
-- TOC entry 3220 (class 0 OID 354944)
-- Dependencies: 209
-- Data for Name: tp_actividad_economica; Type: TABLE DATA; Schema: syli; Owner: postgres
--

COPY syli.tp_actividad_economica (codigo_ciiu, descripcion_ciiu, fecha_alta, fecha_modificacion) FROM stdin;
0010	ASALARIADOS	\N	\N
0081	SIN ACTIVIDAD ECONÓMICA, SOLO PARA PERSONAS NATURALES	\N	\N
0082	PERSONAS NATURALES SUBSIDIADAS POR TERCEROS	\N	\N
0090	RENTISTAS DE CAPITAL, SOLO PARA PERSONAS NATURALES	\N	\N
0111	CULTIVO DE CAFÉ	\N	\N
0130	PROPAGACIÓN DE PLANTAS (ACTIVIDADES DE LOS VIVEROS, EXCEPTO VIVEROS FORESTALES) 	\N	\N
0150	EXPLOTACIÓN MIXTA (AGRÍCOLA Y PECUARIA) 	\N	\N
0161	ACTIVIDADES DE APOYO A LA AGRICULTURA 	\N	\N
0162	ACTIVIDADES DE APOYO A LA GANADERÍA	\N	\N
0164	TRATAMIENTO DE SEMILLAS PARA PROPAGACIÓN 	\N	\N
0170	CAZA ORDINARIA Y MEDIANTE TRAMPAS Y ACTIVIDADES DE SERVICIOS CONEXAS 	\N	\N
0210	SILVICULTURA Y OTRAS ACTIVIDADES FORESTALES	\N	\N
0220	EXTRACCIÓN DE MADERA 	\N	\N
0240	SERVICIOS DE APOYO A LA SILVICULTURA 	\N	\N
0510	EXTRACCIÓN DE HULLA (CARBÓN DE PIEDRA)	\N	\N
0520	EXTRACCIÓN DE CARBÓN LIGNITO	\N	\N
0610	EXTRACCIÓN DE PETRÓLEO CRUDO 	\N	\N
0620	EXTRACCIÓN DE GAS NATURAL	\N	\N
0710	EXTRACCIÓN DE MINERALES DE HIERRO	\N	\N
0721	EXTRACCIÓN DE MINERALES DE URANIO Y DE TORIO	\N	\N
0722	EXTRACCIÓN DE ORO Y OTROS METALES PRECIOSOS	\N	\N
0723	EXTRACCIÓN DE MINERALES DE NÍQUEL	\N	\N
0729	EXTRACCIÓN DE OTROS MINERALES METALÍFEROS NO FERROSOS N.C.P.	\N	\N
0812	EXTRACCIÓN DE ARCILLAS DE USO INDUSTRIAL, CALIZA, CAOLÍN Y BENTONITAS	\N	\N
0891	EXTRACCIÓN DE MINERALES PARA LA FABRICACIÓN DE ABONOS Y PRODUCTOS QUÍMICOS	\N	\N
0892	EXTRACCIÓN DE HALITA (SAL)	\N	\N
1011	PROCESAMIENTO Y CONSERVACIÓN DE CARNE Y PRODUCTOS CÁRNICOS	\N	\N
1012	PROCESAMIENTO Y CONSERVACIÓN DE PESCADOS, CRUSTÁCEOS Y MOLUSCOS	\N	\N
1030	ELABORACIÓN DE ACEITES Y GRASAS DE ORIGEN VEGETAL Y ANIMAL	\N	\N
1040	ELABORACIÓN DE PRODUCTOS LÁCTEOS	\N	\N
1051	ELABORACIÓN DE PRODUCTOS DE MOLINERÍA	\N	\N
1052	ELABORACIÓN DE ALMIDONES Y PRODUCTOS DERIVADOS DEL ALMIDÓN	\N	\N
1061	TRILLA DE CAFÉ	\N	\N
1062	DESCAFEINADO, TOSTIÓN Y MOLIENDA DEL CAFÉ	\N	\N
1063	OTROS DERIVADOS DEL CAFÉ	\N	\N
1071	ELABORACIÓN Y REFINACIÓN DE AZÚCAR	\N	\N
1072	ELABORACIÓN DE PANELA	\N	\N
1081	ELABORACIÓN DE PRODUCTOS DE PANADERÍA	\N	\N
1082	ELABORACIÓN DE CACAO, CHOCOLATE Y PRODUCTOS DE CONFITERÍA	\N	\N
1083	ELABORACIÓN DE MACARRONES, FIDEOS, ALCUZCUZ Y PRODUCTOS FARINÁCEOS SIMILARES	\N	\N
1090	ELABORACIÓN DE ALIMENTOS PREPARADOS PARA ANIMALES	\N	\N
1101	DESTILACIÓN, RECTIFICACIÓN Y MEZCLA DE BEBIDAS ALCOHÓLICAS	\N	\N
1102	ELABORACIÓN DE BEBIDAS FERMENTADAS NO DESTILADAS	\N	\N
1103	PRODUCCIÓN DE MALTA, ELABORACIÓN DE CERVEZAS Y OTRAS BEBIDAS MALTEADAS	\N	\N
1104	ELABORACIÓN DE BEBIDAS NO ALCOHÓLICAS, PRODUCCIÓN DE AGUAS MINERALES Y DE OTRAS AGUAS EMBOTELLADAS	\N	\N
1311	PREPARACIÓN E HILATURA DE FIBRAS TEXTILES	\N	\N
1391	FABRICACIÓN DE TEJIDOS DE PUNTO Y GANCHILLO	\N	\N
1393	FABRICACIÓN DE TAPETES Y ALFOMBRAS PARA PISOS	\N	\N
1394	FABRICACIÓN DE CUERDAS, CORDELES, CABLES, BRAMANTES Y REDES	\N	\N
1399	FABRICACIÓN DE OTROS ARTÍCULOS TEXTILES N.C.P.	\N	\N
1410	CONFECCIÓN DE PRENDAS DE VESTIR, EXCEPTO PRENDAS DE PIEL	\N	\N
1420	FABRICACIÓN DE ARTÍCULOS DE PIEL	\N	\N
1430	FABRICACIÓN DE ARTÍCULOS DE PUNTO Y GANCHILLO	\N	\N
1513	FABRICACIÓN DE ARTÍCULOS DE VIAJE, BOLSOS DE MANO Y ARTÍCULOS SIMILARES: ARTÍCULOS DE TALABARTERÍA Y GUARNICIONERÍA ELABORADOS EN OTROS MATERIALES\n	\N	\N
1523	FABRICACIÓN DE PARTES DEL CALZADO	\N	\N
1610	ASERRADO, ACEPILLADO E IMPREGNACIÓN DE LA MADERA	\N	\N
1620	FABRICACIÓN DE HOJAS DE MADERA PARA ENCHAPADO: FABRICACIÓN DE TABLEROS CONTRACHAPADOS, TABLEROS LAMINADOS, TABLEROS DE PARTÍCULAS Y OTROS TABLEROS Y PANELES	\N	\N
1630	FABRICACIÓN DE PARTES Y PIEZAS DE MADERA, DE CARPINTERÍA Y EBANISTERÍA PARA LA CONSTRUCCIÓN\n	\N	\N
1640	FABRICACIÓN DE RECIPIENTES DE MADERA	\N	\N
1701	FABRICACIÓN DE PULPAS (PASTAS) CELULÓSICAS: PAPEL Y CARTÓN	\N	\N
1702	FABRICACIÓN DE PAPEL Y CARTÓN ONDULADO (CORRUGADO): FABRICACIÓN DE ENVASES, EMPAQUES Y DE EMBALAJES DE PAPEL Y CARTÓN	\N	\N
1812	ACTIVIDADES DE SERVICIOS RELACIONADOS CON LA IMPRESIÓN	\N	\N
1820	PRODUCCIÓN DE COPIAS A PARTIR DE GRABACIONES ORIGINALES	\N	\N
1910	FABRICACIÓN DE PRODUCTOS DE HORNOS DE COQUE 	\N	\N
2012	FABRICACIÓN DE ABONOS Y COMPUESTOS INORGÁNICOS NITROGENADOS	\N	\N
2014	FABRICACIÓN DE CAUCHO SINTÉTICO EN FORMAS PRIMARIAS	\N	\N
2021	FABRICACIÓN DE PLAGUICIDAS Y OTROS PRODUCTOS QUÍMICOS DE USO AGROPECUARIO	\N	\N
2022	FABRICACIÓN DE PINTURAS, BARNICES Y REVESTIMIENTOS SIMILARES, TINTAS PARA IMPRESIÓN Y MASILLAS	\N	\N
2023	FABRICACIÓN DE JABONES Y DETERGENTES, PREPARADOS PARA LIMPIAR Y PULIR: PERFUMES Y PREPARADOS DE TOCADOR	\N	\N
2029	FABRICACIÓN DE OTROS PRODUCTOS QUÍMICOS N.C.P.	\N	\N
2030	FABRICACIÓN DE FIBRAS SINTÉTICAS Y ARTIFICIALES	\N	\N
2211	FABRICACIÓN DE LLANTAS Y NEUMÁTICOS DE CAUCHO	\N	\N
2212	REENCAUCHE DE LLANTAS USADAS	\N	\N
2221	FABRICACIÓN DE FORMAS BÁSICAS DE PLÁSTICO	\N	\N
2310	FABRICACIÓN DE VIDRIO Y PRODUCTOS DE VIDRIO	\N	\N
2391	FABRICACIÓN DE PRODUCTOS REFRACTARIOS	\N	\N
2393	FABRICACIÓN DE OTROS PRODUCTOS DE CERÁMICA Y PORCELANA	\N	\N
2394	FABRICACIÓN DE CEMENTO, CAL Y YESO	\N	\N
2395	FABRICACIÓN DE ARTÍCULOS DE HORMIGÓN, CEMENTO Y YESO	\N	\N
2396	CORTE, TALLADO Y ACABADO DE LA PIEDRA	\N	\N
2399	FABRICACIÓN DE OTROS PRODUCTOS MINERALES NO METÁLICOS N.C.P.	\N	\N
2410	INDUSTRIAS BÁSICAS DE HIERRO Y DE ACERO	\N	\N
2421	INDUSTRIAS BÁSICAS DE METALES PRECIOSOS	\N	\N
2432	FUNDICIÓN DE METALES NO FERROSOS	\N	\N
2511	FABRICACIÓN DE PRODUCTOS METÁLICOS PARA USO ESTRUCTURAL	\N	\N
2512	FABRICACIÓN DE TANQUES, DEPÓSITOS Y RECIPIENTES DE METAL, EXCEPTO LOS UTILIZADOS PARA EL ENVASE O TRANSPORTE DE MERCANCÍAS	\N	\N
2513	FABRICACIÓN DE GENERADORES DE VAPOR, EXCEPTO CALDERAS DE AGUA CALIENTE PARA CALEFACCIÓN CENTRAL	\N	\N
2520	FABRICACIÓN DE ARMAS Y MUNICIONES	\N	\N
2591	FORJA, PRENSADO, ESTAMPADO Y LAMINADO DE METAL: PULVIMETALURGIA	\N	\N
2592	TRATAMIENTO Y REVESTIMIENTO DE METALES: MECANIZADO	\N	\N
2620	FABRICACIÓN DE COMPUTADORAS Y DE EQUIPO PERIFÉRICO	\N	\N
2652	FABRICACIÓN DE RELOJES	\N	\N
2660	FABRICACIÓN DE EQUIPO DE IRRADIACIÓN Y EQUIPO ELECTRÓNICO DE USO MÉDICO Y TERAPÉUTICO	\N	\N
2680	FABRICACIÓN DE MEDIOS MAGNÉTICOS Y ÓPTICOS PARA ALMACENAMIENTO DE DATOS	\N	\N
2711	FABRICACIÓN DE MOTORES, GENERADORES Y TRANSFORMADORES ELÉCTRICOS	\N	\N
2712	FABRICACIÓN DE APARATOS DE DISTRIBUCIÓN Y CONTROL DE LA ENERGÍA ELÉCTRICA	\N	\N
2720	FABRICACIÓN DE PILAS, BATERÍAS Y ACUMULADORES ELÉCTRICOS	\N	\N
2750	FABRICACIÓN DE APARATOS DE USO DOMÉSTICO	\N	\N
2813	FABRICACIÓN DE OTRAS BOMBAS, COMPRESORES, GRIFOS Y VÁLVULAS	\N	\N
2814	FABRICACIÓN DE COJINETES, ENGRANAJES, TRENES DE ENGRANAJES Y PIEZAS DE TRANSMISIÓN	\N	\N
2818	FABRICACIÓN DE HERRAMIENTAS MANUALES CON MOTOR	\N	\N
2821	FABRICACIÓN DE MAQUINARIA AGROPECUARIA Y FORESTAL 	\N	\N
2822	FABRICACIÓN DE MÁQUINAS FORMADORAS DE METAL Y DE MÁQUINAS HERRAMIENTA	\N	\N
2823	FABRICACIÓN DE MAQUINARIA PARA LA METALURGIA 	\N	\N
2824	FABRICACIÓN DE MAQUINARIA PARA EXPLOTACIÓN DE MINAS Y CANTERAS Y PARA OBRAS DE CONSTRUCCIÓN	\N	\N
2825	FABRICACIÓN DE MAQUINARIA PARA LA ELABORACIÓN DE ALIMENTOS, BEBIDAS Y TABACO	\N	\N
2910	FABRICACIÓN DE VEHÍCULOS AUTOMOTORES Y SUS MOTORES	\N	\N
2920	FABRICACIÓN DE CARROCERÍAS PARA VEHÍCULOS AUTOMOTORES: FABRICACIÓN DE REMOLQUES Y SEMIRREMOLQUES	\N	\N
3011	CONSTRUCCIÓN DE BARCOS Y DE ESTRUCTURAS FLOTANTES	\N	\N
3012	CONSTRUCCIÓN DE EMBARCACIONES DE RECREO Y DEPORTE	\N	\N
3020	FABRICACIÓN DE LOCOMOTORAS Y DE MATERIAL RODANTE PARA FERROCARRILES 	\N	\N
3040	FABRICACIÓN DE VEHÍCULOS MILITARES DE COMBATE	\N	\N
3091	FABRICACIÓN DE MOTOCICLETAS	\N	\N
3092	FABRICACIÓN DE BICICLETAS Y DE SILLAS DE RUEDAS PARA PERSONAS CON DISCAPACIDAD	\N	\N
3099	FABRICACIÓN DE OTROS TIPOS DE EQUIPO DE TRANSPORTE N.C.P.	\N	\N
3120	FABRICACIÓN DE COLCHONES Y SOMIERES	\N	\N
3220	FABRICACIÓN DE INSTRUMENTOS MUSICALES	\N	\N
3511	GENERACIÓN DE ENERGÍA ELÉCTRICA	\N	\N
3512	TRANSMISIÓN DE ENERGÍA ELÉCTRICA	\N	\N
3513	DISTRIBUCIÓN DE ENERGÍA ELÉCTRICA	\N	\N
3514	COMERCIALIZACIÓN DE ENERGÍA ELÉCTRICA	\N	\N
3520	PRODUCCIÓN DE GAS: DISTRIBUCIÓN DE COMBUSTIBLES GASEOSOS POR TUBERÍAS. 	\N	\N
3600	CAPTACIÓN, TRATAMIENTO Y DISTRIBUCIÓN DE AGUA	\N	\N
3700	EVACUACIÓN Y TRATAMIENTO DE AGUAS RESIDUALES	\N	\N
3811	RECOLECCIÓN DE DESECHOS NO PELIGROSOS	\N	\N
4111	CONSTRUCCIÓN DE EDIFICIOS RESIDENCIALES 	\N	\N
4112	CONSTRUCCIÓN DE EDIFICIOS NO RESIDENCIALES	\N	\N
4210	CONSTRUCCIÓN DE CARRETERAS Y VÍAS DE FERROCARRIL	\N	\N
4220	CONSTRUCCIÓN DE PROYECTOS DE SERVICIO PÚBLICO	\N	\N
4321	INSTALACIONES ELÉCTRICAS	\N	\N
4330	TERMINACIÓN Y ACABADO DE EDIFICIOS Y OBRAS DE INGENIERÍA CIVIL	\N	\N
4511	COMERCIO DE VEHÍCULOS AUTOMOTORES NUEVOS	\N	\N
4512	COMERCIO DE VEHÍCULOS AUTOMOTORES USADOS	\N	\N
4520	MANTENIMIENTO Y REPARACIÓN DE VEHÍCULOS AUTOMOTORES	\N	\N
4530	COMERCIO DE PARTES, PIEZAS (AUTOPARTES) Y ACCESORIOS (LUJOS) PARA VEHÍCULOS AUTOMOTORES	\N	\N
4541	COMERCIO DE MOTOCICLETAS Y DE SUS PARTES, PIEZAS Y ACCESORIOS	\N	\N
4610	COMERCIO AL POR MAYOR A CAMBIO DE UNA RETRIBUCIÓN O POR CONTRATA	\N	\N
4631	COMERCIO AL POR MAYOR DE PRODUCTOS ALIMENTICIOS	\N	\N
4632	COMERCIO AL POR MAYOR DE BEBIDAS Y TABACO	\N	\N
4641	COMERCIO AL POR MAYOR DE PRODUCTOS TEXTILES: PRODUCTOS CONFECCIONADOS PARA USO DOMÉSTICO	\N	\N
4642	COMERCIO AL POR MAYOR DE PRENDAS DE VESTIR	\N	\N
4643	COMERCIO AL POR MAYOR DE CALZADO	\N	\N
4644	COMERCIO AL POR MAYOR DE APARATOS Y EQUIPO DE USO DOMÉSTICO	\N	\N
4651	COMERCIO AL POR MAYOR DE COMPUTADORES, EQUIPO PERIFÉRICO Y PROGRAMAS DE INFORMÁTICA	\N	\N
4652	COMERCIO AL POR MAYOR DE EQUIPO, PARTES Y PIEZAS ELECTRÓNICOS Y DE TELECOMUNICACIONES	\N	\N
4653	COMERCIO AL POR MAYOR DE MAQUINARIA Y EQUIPO AGROPECUARIOS	\N	\N
4661	COMERCIO AL POR MAYOR DE COMBUSTIBLES SÓLIDOS, LÍQUIDOS, GASEOSOS Y PRODUCTOS CONEXOS	\N	\N
4662	COMERCIO AL POR MAYOR DE METALES Y PRODUCTOS METALÍFEROS	\N	\N
4663	COMERCIO AL POR MAYOR DE MATERIALES DE CONSTRUCCIÓN, ARTÍCULOS DE FERRETERÍA, PINTURAS, PRODUCTOS DE VIDRIO, EQUIPO Y MATERIALES DE FONTANERÍA Y CALEFACCIÓN	\N	\N
4665	COMERCIO AL POR MAYOR DE DESPERDICIOS, DESECHOS Y CHATARRA	\N	\N
4690	COMERCIO AL POR MAYOR NO ESPECIALIZADO	\N	\N
4711	COMERCIO AL POR MENOR EN ESTABLECIMIENTOS NO ESPECIALIZADOS CON SURTIDO COMPUESTO PRINCIPALMENTE POR ALIMENTOS, BEBIDAS O TABACO	\N	\N
4719	COMERCIO A POR MENOR EN ESTABLECIMIENTOS NO ESPECIALIZADOS, CON SURTIDO COMPUESTO PRINCIPALMENTE POR PRODUCTOS DIFERENTES DE ALIMENTOS (VÍVERES EN GENERAL), BEBIDAS Y TABACO	\N	\N
4721	COMERCIO AL POR MENOR DE PRODUCTOS AGRÍCOLAS PARA EL CONSUMO EN ESTABLECIMIENTOS ESPECIALIZADOS	\N	\N
4722	COMERCIO AL POR MENOR DE LECHE, PRODUCTOS LÁCTEOS Y HUEVOS EN ESTABLECIMIENTOS ESPECIALIZADOS	\N	\N
4723	COMERCIO AL POR MENOR DE CARNES (INCLUYE AVES DE CORRAL), PRODUCTOS CÁRNICOS, PESCADOS Y PRODUCTOS DE MAR EN ESTABLECIMIENTOS ESPECIALIZADOS	\N	\N
4724	COMERCIO AL POR MENOR DE BEBIDAS Y PRODUCTOS DE TABACO, EN ESTABLECIMIENTOS ESPECIALIZADOS	\N	\N
4731	COMERCIO AL POR MENOR DE COMBUSTIBLE PARA AUTOMOTORES	\N	\N
4732	COMERCIO AL POR MENOR DE LUBRICANTES (ACEITES Y GRASAS) ADITIVOS Y PRODUCTOS DE LIMPIEZA PARA VEHÍCULOS AUTOMOTORES	\N	\N
4742	COMERCIO AL POR MENOR DE EQUIPOS Y APARATOS DE SONIDO Y DE VIDEO, EN ESTABLECIMIENTOS ESPECIALIZADOS	\N	\N
4751	COMERCIO AL POR MENOR DE PRODUCTOS TEXTILES EN ESTABLECIMIENTOS ESPECIALIZADOS	\N	\N
4753	COMERCIO AL POR MENOR DE TAPICES, ALFOMBRAS Y RECUBRIMIENTOS PARA PAREDES Y PISOS EN ESTABLECIMIENTOS ESPECIALIZADOS	\N	\N
4755	COMERCIO AL POR MENOR DE ARTÍCULOS Y UTENSILIOS DE USO DOMÉSTICO	\N	\N
4761	COMERCIO AL POR MENOR DE LIBROS, PERIÓDICOS, MATERIALES Y ARTÍCULOS DE PAPELERÍA Y ESCRITORIO, EN ESTABLECIMIENTOS ESPECIALIZADOS	\N	\N
4762	COMERCIO AL POR MENOR DE ARTÍCULOS DEPORTIVOS, EN ESTABLECIMIENTOS ESPECIALIZADOS	\N	\N
4771	COMERCIO AL POR MENOR DE PRENDAS DE VESTIR Y SUS ACCESORIOS (INCLUYE ARTÍCULOS DE PIEL) EN ESTABLECIMIENTOS ESPECIALIZADOS	\N	\N
4772	COMERCIO AL POR MENOR DE TODO TIPO DE CALZADO Y ARTÍCULOS DE CUERO Y SUCEDÁNEOS DEL CUERO EN ESTABLECIMIENTOS ESPECIALIZADOS.	\N	\N
4773	COMERCIO AL POR MENOR DE PRODUCTOS FARMACÉUTICOS Y MEDICINALES, COSMÉTICOS Y ARTÍCULOS DE TOCADOR EN ESTABLECIMIENTOS ESPECIALIZADOS	\N	\N
4781	COMERCIO AL POR MENOR DE ALIMENTOS, BEBIDAS Y TABACO EN PUESTOS DE VENTA MÓVILES	\N	\N
4782	COMERCIO AL POR MENOR DE PRODUCTOS TEXTILES, PRENDAS DE VESTIR Y CALZADO, EN PUESTOS DE VENTA MÓVILES	\N	\N
4789	COMERCIO AL POR MENOR DE OTROS PRODUCTOS, EN PUESTOS DE VENTA MÓVILES	\N	\N
4791	COMERCIO AL POR MENOR REALIZADO A TRAVÉS DE INTERNET	\N	\N
4792	COMERCIO AL POR MENOR REALIZADO A TRAVÉS DE CASAS DE VENTA O POR CORREO	\N	\N
4799	OTROS TIPOS DE COMERCIO AL POR MENOR NO REALIZADO EN ESTABLECIMIENTOS, PUESTOS DE VENTA O MERCADOS	\N	\N
4911	TRANSPORTE FÉRREO DE PASAJEROS 	\N	\N
4912	TRANSPORTE FÉRREO DE CARGA 	\N	\N
4922	TRANSPORTE MIXTO	\N	\N
4930	TRANSPORTE POR TUBERÍAS	\N	\N
5021	TRANSPORTE FLUVIAL DE PASAJEROS	\N	\N
5022	TRANSPORTE FLUVIAL DE CARGA	\N	\N
5210	ALMACENAMIENTO Y DEPÓSITO	\N	\N
5222	ACTIVIDADES DE PUERTOS Y SERVICIOS COMPLEMENTARIOS PARA EL TRANSPORTE ACUÁTICO	\N	\N
5224	MANIPULACIÓN DE CARGA	\N	\N
5229	OTRAS ACTIVIDADES COMPLEMENTARIAS AL TRANSPORTE	\N	\N
5310	ACTIVIDADES POSTALES NACIONALES	\N	\N
5320	ACTIVIDADES DE MENSAJERÍA	\N	\N
5511	ALOJAMIENTO EN HOTELES	\N	\N
5512	ALOJAMIENTO EN APARTA-HOTELES	\N	\N
5513	ALOJAMIENTO EN CENTROS VACACIONALES 	\N	\N
5514	ALOJAMIENTO RURAL	\N	\N
5519	OTROS TIPOS DE ALOJAMIENTOS PARA VISITANTES	\N	\N
5520	ACTIVIDADES DE ZONAS DE CAMPING Y PARQUES PARA VEHÍCULOS RECREACIONALES	\N	\N
5530	SERVICIOS POR HORAS	\N	\N
5590	OTROS TIPOS DE ALOJAMIENTO N.C.P. 	\N	\N
5611	EXPENDIO A LA MESA DE COMIDAS PREPARADAS	\N	\N
5613	EXPENDIO DE COMIDAS PREPARADAS EN CAFETERÍAS	\N	\N
5619	OTROS TIPOS DE EXPENDIO DE COMIDAS PREPARADAS N.C.P.	\N	\N
5621	CATERING PARA EVENTOS	\N	\N
5630	EXPENDIO DE BEBIDAS ALCOHÓLICAS PARA EL CONSUMO DENTRO DEL ESTABLECIMIENTO	\N	\N
5913	ACTIVIDADES DE DISTRIBUCIÓN DE PELÍCULAS CINEMATOGRÁFICAS, VIDEOS, PROGRAMAS, ANUNCIOS Y COMERCIALES DE TELEVISIÓN 	\N	\N
5914	ACTIVIDADES DE EXHIBICIÓN DE PELÍCULAS CINEMATOGRÁFICAS Y VIDEOS	\N	\N
6201	ACTIVIDADES DE DESARROLLO DE SISTEMAS INFORMÁTICOS (PLANIFICACIÓN, ANÁLISIS, DISEÑO, PROGRAMACIÓN, PRUEBAS).	\N	\N
6209	OTRAS ACTIVIDADES DE TECNOLOGÍAS DE INFORMACIÓN Y ACTIVIDADES DE SERVICIOS INFORMÁTICOS	\N	\N
6311	PROCESAMIENTO DE DATOS, ALOJAMIENTO (HOSTING) Y ACTIVIDADES RELACIONADAS	\N	\N
6312	PORTALES WEB	\N	\N
6391	ACTIVIDADES DE AGENCIAS DE NOTICIAS	\N	\N
6399	OTRAS ACTIVIDADES DE SERVICIO DE INFORMACIÓN N.C.P.	\N	\N
6411	BANCO CENTRAL	\N	\N
6412	BANCOS COMERCIALES	\N	\N
6421	ACTIVIDADES DE LAS CORPORACIONES FINANCIERAS	\N	\N
6422	ACTIVIDADES DE LAS COMPAÑÍAS DE FINANCIAMIENTO 	\N	\N
6423	BANCA DE SEGUNDO PISO	\N	\N
6424	ACTIVIDADES DE LAS COOPERATIVAS FINANCIERAS 	\N	\N
6431	FIDEICOMISOS, FONDOS Y ENTIDADES FINANCIERAS SIMILARES	\N	\N
6432	FONDOS DE CESANTÍAS	\N	\N
6491	LEASING FINANCIERO (ARRENDAMIENTO FINANCIERO)	\N	\N
6492	ACTIVIDADES FINANCIERAS DE FONDOS DE EMPLEADOS Y OTRAS FORMAS ASOCIATIVAS DEL SECTOR SOLIDARIO	\N	\N
6493	ACTIVIDADES DE COMPRA DE CARTERA O FACTORING	\N	\N
6494	OTRAS ACTIVIDADES DE DISTRIBUCIÓN DE FONDOS	\N	\N
6495	INSTITUCIONES ESPECIALES OFICIALES	\N	\N
6511	SEGUROS GENERALES	\N	\N
6512	SEGUROS DE VIDA	\N	\N
6513	REASEGUROS	\N	\N
6514	CAPITALIZACIÓN	\N	\N
6521	SERVICIOS DE SEGUROS SOCIALES DE SALUD 	\N	\N
6522	SERVICIOS DE SEGUROS SOCIALES DE RIESGOS PROFESIONALES	\N	\N
6531	RÉGIMEN DE PRIMA MEDIA CON PRESTACIÓN DEFINIDA (RPM)	\N	\N
6532	 RÉGIMEN DE AHORRO INDIVIDUAL (RAI).	\N	\N
6611	ADMINISTRACIÓN DE MERCADOS FINANCIEROS 	\N	\N
6612	CORRETAJE DE VALORES Y DE CONTRATOS DE PRODUCTOS BÁSICOS	\N	\N
6613	OTRAS ACTIVIDADES RELACIONADAS CON EL MERCADO DE VALORES	\N	\N
6614	ACTIVIDADES DE LAS CASAS DE CAMBIO	\N	\N
6615	ACTIVIDADES DE LOS PROFESIONALES DE COMPRA Y VENTA DE DIVISAS	\N	\N
6619	OTRAS ACTIVIDADES AUXILIARES DE LAS ACTIVIDADES DE SERVICIOS FINANCIEROS N.C.P	\N	\N
6621	ACTIVIDADES DE AGENTES Y CORREDORES DE SEGUROS	\N	\N
6630	ACTIVIDADES DE ADMINISTRACIÓN DE FONDOS	\N	\N
6810	ACTIVIDADES INMOBILIARIAS REALIZADAS CON BIENES PROPIOS O ARRENDADOS	\N	\N
6820	ACTIVIDADES INMOBILIARIAS REALIZADAS A CAMBIO DE UNA RETRIBUCIÓN O POR CONTRATA	\N	\N
6910	ACTIVIDADES JURÍDICAS 	\N	\N
6920	ACTIVIDADES DE CONTABILIDAD, TENEDURÍA DE LIBROS, AUDITORIA FINANCIERA Y ASESORÍA TRIBUTARIA 	\N	\N
7010	ACTIVIDADES DE ADMINISTRACIÓN EMPRESARIAL	\N	\N
7020	ACTIVIDADES DE CONSULTORÍA DE GESTIÓN	\N	\N
7110	ACTIVIDADES DE ARQUITECTURA E INGENIERÍA Y OTRAS ACTIVIDADES CONEXAS DE CONSULTORÍA TÉCNICA 	\N	\N
7120	ENSAYOS Y ANÁLISIS TÉCNICOS	\N	\N
7210	INVESTIGACIONES Y DESARROLLO EXPERIMENTAL EN EL CAMPO DE LAS CIENCIAS NATURALES Y LA INGENIERÍA 	\N	\N
7220	INVESTIGACIONES Y DESARROLLO EXPERIMENTAL EN EL CAMPO DE LAS CIENCIAS SOCIALES Y LAS HUMANIDADES 	\N	\N
7310	PUBLICIDAD	\N	\N
7320	ESTUDIOS DE MERCADO Y REALIZACIÓN DE ENCUESTAS DE OPINIÓN PÚBLICA	\N	\N
7500	ACTIVIDADES VETERINARIAS	\N	\N
7710	ALQUILER Y ARRENDAMIENTO DE VEHÍCULOS AUTOMOTORES 	\N	\N
7721	ALQUILER Y ARRENDAMIENTO DE EQUIPO RECREATIVO Y DEPORTIVO	\N	\N
7722	ALQUILER DE VIDEOS Y DISCOS	\N	\N
7729	ALQUILER Y ARRENDAMIENTO DE OTROS EFECTOS PERSONALES Y ENSERES DOMÉSTICOS N.C.P.	\N	\N
7740	ARRENDAMIENTO DE PROPIEDAD INTELECTUAL Y PRODUCTOS SIMILARES, EXCEPTO OBRAS PROTEGIDAS POR DERECHOS DE AUTOR	\N	\N
7820	ACTIVIDADES DE AGENCIAS DE EMPLEO TEMPORAL	\N	\N
7830	OTRAS ACTIVIDADES DE SUMINISTRO DE RECURSO HUMANO 	\N	\N
7911	ACTIVIDADES DE LAS AGENCIAS DE VIAJES 	\N	\N
7912	ACTIVIDADES DE OPERADORES TURÍSTICOS 	\N	\N
8010	ACTIVIDADES DE SEGURIDAD PRIVADA	\N	\N
8020	ACTIVIDADES DE SERVICIOS DE SISTEMAS DE SEGURIDAD 	\N	\N
8030	ACTIVIDADES DE DETECTIVES E INVESTIGADORES PRIVADOS 	\N	\N
8110	ACTIVIDADES COMBINADAS DE APOYO A INSTALACIONES 	\N	\N
8121	LIMPIEZA GENERAL INTERIOR DE EDIFICIOS 	\N	\N
8211	ACTIVIDADES COMBINADAS DE SERVICIOS ADMINISTRATIVOS DE OFICINA	\N	\N
8220	ACTIVIDADES DE CENTROS DE LLAMADAS (CALL CENTER)	\N	\N
8230	ORGANIZACIÓN DE CONVENCIONES Y EVENTOS COMERCIALES 	\N	\N
8291	ACTIVIDADES DE AGENCIAS DE COBRANZA Y OFICINAS DE CALIFICACIÓN CREDITICIA 	\N	\N
8292	ACTIVIDADES DE ENVASE Y EMPAQUE 	\N	\N
8299	OTRAS ACTIVIDADES DE SERVICIO DE APOYO A LAS EMPRESAS N.C.P.	\N	\N
8411	ACTIVIDADES LEGISLATIVAS DE LA ADMINISTRACIÓN PUBLICA	\N	\N
8413	REGULACIÓN DE LAS ACTIVIDADES DE ORGANISMOS QUE PRESTAN SERVICIOS DE SALUD, EDUCATIVOS, CULTURALES Y OTROS SERVICIOS SOCIALES, EXCEPTO SERVICIOS DE SEGURIDAD SOCIAL 	\N	\N
8414	ACTIVIDADES REGULADORAS Y FACILITADORAS DE LA ACTIVIDAD ECONÓMICA	\N	\N
8415	ACTIVIDADES DE LOS OTROS ÓRGANOS DE CONTROL 	\N	\N
8421	RELACIONES EXTERIORES	\N	\N
8422	ACTIVIDADES DE DEFENSA	\N	\N
8423	ORDEN PÚBLICO Y ACTIVIDADES DE SEGURIDAD 	\N	\N
8424	ADMINISTRACIÓN DE JUSTICIA	\N	\N
8430	ACTIVIDADES DE PLANES DE SEGURIDAD SOCIAL DE AFILIACIÓN OBLIGATORIA	\N	\N
8512	EDUCACIÓN PREESCOLAR	\N	\N
8513	EDUCACIÓN BÁSICA PRIMARIA	\N	\N
8521	EDUCACIÓN BÁSICA SECUNDARIA	\N	\N
8522	EDUCACIÓN MEDIA ACADÉMICA	\N	\N
8523	EDUCACIÓN MEDIA TÉCNICA Y DE FORMACIÓN LABORAL	\N	\N
8541	EDUCACIÓN TÉCNICA PROFESIONAL	\N	\N
8542	EDUCACIÓN TECNOLÓGICA	\N	\N
8543	EDUCACIÓN DE INSTITUCIONES UNIVERSITARIAS O DE ESCUELAS TECNOLÓGICAS	\N	\N
8544	EDUCACIÓN DE UNIVERSIDADES	\N	\N
8551	FORMACIÓN ACADÉMICA NO FORMAL	\N	\N
8560	ACTIVIDADES DE APOYO A LA EDUCACIÓN	\N	\N
8610	ACTIVIDADES DE HOSPITALES Y CLÍNICAS, CON INTERNACIÓN	\N	\N
8621	ACTIVIDADES DE LA PRÁCTICA MÉDICA, SIN INTERNACIÓN	\N	\N
8622	ACTIVIDADES DE LA PRÁCTICA ODONTOLÓGICA	\N	\N
8691	ACTIVIDADES DE APOYO DIAGNÓSTICO	\N	\N
8692	ACTIVIDADES DE APOYO TERAPÉUTICO	\N	\N
8699	OTRAS ACTIVIDADES DE ATENCIÓN DE LA SALUD HUMANA	\N	\N
8710	ACTIVIDADES DE ATENCIÓN RESIDENCIAL MEDICALIZADA DE TIPO GENERAL	\N	\N
8720	ACTIVIDADES DE ATENCIÓN RESIDENCIAL, PARA EL CUIDADO DE PACIENTES CON RETARDO MENTAL, ENFERMEDAD MENTAL Y CONSUMO DE SUSTANCIAS PSICOACTIVAS	\N	\N
8730	ACTIVIDADES DE ATENCIÓN EN INSTITUCIONES PARA EL CUIDADO DE PERSONAS MAYORES Y/O DISCAPACITADAS	\N	\N
8790	OTRAS ACTIVIDADES DE ATENCIÓN EN INSTITUCIONES CON ALOJAMIENTO	\N	\N
8810	ACTIVIDADES DE ASISTENCIA SOCIAL SIN ALOJAMIENTO PARA PERSONAS MAYORES Y DISCAPACITADAS	\N	\N
8890	OTRAS ACTIVIDADES DE ASISTENCIA SOCIAL SIN ALOJAMIENTO	\N	\N
9002	CREACIÓN MUSICAL	\N	\N
9003	CREACIÓN TEATRAL	\N	\N
9004	CREACIÓN AUDIOVISUAL	\N	\N
9005	ARTES PLÁSTICAS Y VISUALES	\N	\N
9006	ACTIVIDADES TEATRALES	\N	\N
9007	ACTIVIDADES DE ESPECTÁCULOS MUSICALES EN VIVO	\N	\N
9008	OTRAS ACTIVIDADES DE ESPECTÁCULOS EN VIVO	\N	\N
9101	ACTIVIDADES DE BIBLIOTECAS Y ARCHIVOS	\N	\N
9102	ACTIVIDADES Y FUNCIONAMIENTO DE MUSEOS, CONSERVACIÓN DE EDIFICIOS Y SITIOS HISTÓRICOS	\N	\N
9103	ACTIVIDADES DE JARDINES BOTÁNICOS, ZOOLÓGICOS Y RESERVAS NATURALES	\N	\N
9200	ACTIVIDADES DE JUEGOS DE AZAR Y APUESTAS	\N	\N
9311	GESTIÓN DE INSTALACIONES DEPORTIVAS	\N	\N
9312	ACTIVIDADES DE CLUBES DEPORTIVOS	\N	\N
9319	OTRAS ACTIVIDADES DEPORTIVAS	\N	\N
9321	ACTIVIDADES DE PARQUES DE ATRACCIONES Y PARQUES TEMÁTICOS	\N	\N
9411	ACTIVIDADES DE ASOCIACIONES EMPRESARIALES Y DE EMPLEADORES	\N	\N
9412	ACTIVIDADES DE ASOCIACIONES PROFESIONALES	\N	\N
9420	ACTIVIDADES DE SINDICATOS DE EMPLEADOS	\N	\N
9491	ACTIVIDADES DE ASOCIACIONES RELIGIOSAS	\N	\N
9492	ACTIVIDADES DE ASOCIACIONES POLÍTICAS	\N	\N
9511	MANTENIMIENTO Y REPARACIÓN DE COMPUTADORAS Y DE EQUIPO PERIFÉRICO	\N	\N
9521	MANTENIMIENTO Y REPARACIÓN DE APARATOS ELECTRÓNICOS DE CONSUMO	\N	\N
9522	MANTENIMIENTO Y REPARACIÓN DE APARATOS Y EQUIPOS DOMÉSTICOS Y DE JARDINERÍA	\N	\N
9523	REPARACIÓN DE CALZADO Y ARTÍCULOS DE CUERO	\N	\N
9601	LAVADO Y LIMPIEZA, INCLUSO LA LIMPIEZA EN SECO, DE PRODUCTOS TEXTILES Y DE PIEL 	\N	\N
9602	PELUQUERÍA Y OTROS TRATAMIENTOS DE BELLEZA	\N	\N
9603	POMPAS FÚNEBRES Y ACTIVIDADES RELACIONADAS	\N	\N
9609	OTRAS ACTIVIDADES DE SERVICIOS PERSONALES N.C.P.	\N	\N
9700	ACTIVIDADES DE LOS HOGARES INDIVIDUALES COMO EMPLEADORES DE PERSONAL DOMÉSTICO	\N	\N
9810	ACTIVIDADES NO DIFERENCIADAS DE LOS HOGARES INDIVIDUALES COMO PRODUCTORES DE BIENES PARA USO PROPIO	\N	\N
9820	ACTIVIDADES NO DIFERENCIADAS DE LOS HOGARES INDIVIDUALES COMO PRODUCTORES DE SERVICIOS PARA USO PROPIO	\N	\N
9900	ACTIVIDADES DE ORGANIZACIONES Y ENTIDADES EXTRATERRITORIALES	\N	\N
0112	CULTIVO DE ARROZ 	\N	\N
0113	CULTIVO DE HORTALIZAS, RAÍCES Y TUBÉRCULOS 	\N	\N
0114	CULTIVO DE TABACO 	\N	\N
0115	CULTIVO DE PLANTAS TEXTILES 	\N	\N
0119	OTROS CULTIVOS TRANSITORIOS N.C.P.	\N	\N
0121	CULTIVO DE FRUTAS TROPICALES Y SUBTROPICALES	\N	\N
0122	CULTIVO DE PLÁTANO Y BANANO	\N	\N
0123	CULTIVO DE CAFÉ	\N	\N
0124	CULTIVO DE CAÑA DE AZÚCAR	\N	\N
0125	CULTIVO DE FLOR DE CORTE	\N	\N
0126	CULTIVO DE PALMA PARA ACEITE (PALMA AFRICANA) Y OTROS FRUTOS OLEAGINOSOS	\N	\N
0127	CULTIVO DE PLANTAS CON LAS QUE SE PREPARAN BEBIDAS	\N	\N
0128	CULTIVO DE ESPECIAS Y DE PLANTAS AROMÁTICAS Y MEDICINALES 	\N	\N
0129	OTROS CULTIVOS PERMANENTES N.C.P.	\N	\N
0141	CRÍA DE GANADO BOVINO Y BUFALINO	\N	\N
0142	CRÍA DE CABALLOS Y OTROS EQUINOS 	\N	\N
0143	CRÍA DE OVEJAS Y CABRAS 	\N	\N
0144	CRÍA DE GANADO PORCINO	\N	\N
0145	CRÍA DE AVES DE CORRAL	\N	\N
0149	CRÍA DE OTROS ANIMALES N.C.P.	\N	\N
0163	ACTIVIDADES POSTERIORES A LA COSECHA	\N	\N
0230	RECOLECCIÓN DE PRODUCTOS FORESTALES DIFERENTES A LA MADERA	\N	\N
0311	PESCA MARÍTIMA 	\N	\N
0312	PESCA DE AGUA DULCE 	\N	\N
0321	ACUICULTURA MARÍTIMA 	\N	\N
0322	ACUICULTURA DE AGUA DULCE	\N	\N
0811	EXTRACCIÓN DE PIEDRA, ARENA, ARCILLAS COMUNES, YESO Y ANHIDRITA	\N	\N
0820	EXTRACCIÓN DE ESMERALDAS, PIEDRAS PRECIOSAS Y SEMIPRECIOSAS 	\N	\N
0899	EXTRACCIÓN DE OTROS MINERALES NO METÁLICOS N.C.P.	\N	\N
0910	ACTIVIDADES DE APOYO PARA LA EXTRACCIÓN DE PETRÓLEO Y DE GAS NATURAL	\N	\N
0990	ACTIVIDADES DE APOYO PARA OTRAS ACTIVIDADES DE EXPLOTACIÓN DE MINAS Y CANTERAS	\N	\N
1020	PROCESAMIENTO Y CONSERVACIÓN DE FRUTAS, LEGUMBRES, HORTALIZAS Y TUBÉRCULOS	\N	\N
1084	ELABORACIÓN DE COMIDAS Y PLATOS PREPARADOS	\N	\N
1089	ELABORACIÓN DE OTROS PRODUCTOS ALIMENTICIOS N.C.P.	\N	\N
1200	ELABORACIÓN DE PRODUCTOS DEL TABACO	\N	\N
1312	TEJEDURÍA DE PRODUCTOS TEXTILES	\N	\N
1313	ACABADO DE PRODUCTOS TEXTILES	\N	\N
1392	CONFECCIÓN DE ARTÍCULOS CON MATERIALES TEXTILES, EXCEPTO PRENDAS DE VESTIR	\N	\N
1511	CURTIDO Y RECURTIDO DE CUEROS: RECURTIDO Y TEÑIDO DE PIELES	\N	\N
1512	FABRICACIÓN DE ARTÍCULOS DE VIAJE, BOLSOS DE MANO Y ARTÍCULOS SIMILARES ELABORADOS EN CUERO, Y FABRICACIÓN DE ARTÍCULOS DE TALABARTERÍA Y GUARNICIONERÍA\n	\N	\N
1521	FABRICACIÓN DE CALZADO DE CUERO Y PIEL, CON CUALQUIER TIPO DE SUELA 	\N	\N
1522	FABRICACIÓN DE OTROS TIPOS DE CALZADO, EXCEPTO CALZADO DE CUERO Y PIEL	\N	\N
1690	FABRICACIÓN DE OTROS PRODUCTOS DE MADERA: FABRICACIÓN DE ARTÍCULOS DE CORCHO, CESTERÍA Y ESPARTERÍA	\N	\N
1709	FABRICACIÓN DE OTROS ARTÍCULOS DE PAPEL Y CARTÓN	\N	\N
1811	ACTIVIDADES DE IMPRESIÓN	\N	\N
1921	FABRICACIÓN DE PRODUCTOS DE LA REFINACIÓN DEL PETRÓLEO	\N	\N
2011	FABRICACIÓN DE SUSTANCIAS Y PRODUCTOS QUÍMICOS BÁSICOS	\N	\N
2013	FABRICACIÓN DE PLÁSTICOS EN FORMAS PRIMARIAS	\N	\N
2100	FABRICACIÓN DE PRODUCTOS FARMACÉUTICOS, SUSTANCIAS QUÍMICAS MEDICINALES Y PRODUCTOS BOTÁNICOS DE USO FARMACÉUTICO	\N	\N
2219	FABRICACIÓN DE FORMAS BÁSICAS DE CAUCHO Y OTROS PRODUCTOS DE CAUCHO N.C.P.	\N	\N
2229	FABRICACIÓN DE ARTÍCULOS DE PLÁSTICO N.C.P.	\N	\N
2392	FABRICACIÓN DE MATERIALES DE ARCILLA PARA LA CONSTRUCCIÓN	\N	\N
2429	INDUSTRIAS BÁSICAS DE OTROS METALES NO FERROSOS	\N	\N
2431	FUNDICIÓN DE HIERRO Y DE ACERO	\N	\N
2593	FABRICACIÓN DE ARTÍCULOS DE CUCHILLERÍA, HERRAMIENTAS DE MANO Y ARTÍCULOS DE FERRETERÍA	\N	\N
2599	FABRICACIÓN DE OTROS PRODUCTOS ELABORADOS DE METAL N.C.P.	\N	\N
2610	FABRICACIÓN DE COMPONENTES Y TABLEROS ELECTRÓNICOS	\N	\N
2630	FABRICACIÓN DE EQUIPOS DE COMUNICACIÓN	\N	\N
2640	FABRICACIÓN DE APARATOS ELECTRÓNICOS DE CONSUMO	\N	\N
2651	FABRICACIÓN DE EQUIPO DE MEDICIÓN, PRUEBA, NAVEGACIÓN Y CONTROL	\N	\N
2670	FABRICACIÓN DE INSTRUMENTOS ÓPTICOS Y EQUIPO FOTOGRÁFICO	\N	\N
2731	FABRICACIÓN DE HILOS Y CABLES ELÉCTRICOS Y DE FIBRA ÓPTICA	\N	\N
2732	FABRICACIÓN DE DISPOSITIVOS DE CABLEADO	\N	\N
2740	FABRICACIÓN DE EQUIPOS ELÉCTRICOS DE ILUMINACIÓN	\N	\N
2790	FABRICACIÓN DE OTROS TIPOS DE EQUIPO ELÉCTRICO N.C.P.	\N	\N
2811	FABRICACIÓN DE MOTORES, TURBINAS, Y PARTES PARA MOTORES DE COMBUSTIÓN INTERNA	\N	\N
2812	FABRICACIÓN DE EQUIPOS DE POTENCIA HIDRÁULICA Y NEUMÁTICA	\N	\N
2815	FABRICACIÓN DE HORNOS, HOGARES Y QUEMADORES INDUSTRIALES	\N	\N
2816	FABRICACIÓN DE EQUIPO DE ELEVACIÓN Y MANIPULACIÓN	\N	\N
2817	FABRICACIÓN DE MAQUINARIA Y EQUIPO DE OFICINA (EXCEPTO COMPUTADORAS Y EQUIPO PERIFÉRICO)	\N	\N
2819	FABRICACIÓN DE OTROS TIPOS DE MAQUINARIA Y EQUIPO DE USO GENERAL N.C.P..	\N	\N
2826	FABRICACIÓN DE MAQUINARIA PARA LA ELABORACIÓN DE PRODUCTOS TEXTILES, PRENDAS DE VESTIR Y CUEROS	\N	\N
2829	FABRICACIÓN DE OTROS TIPOS DE MAQUINARIA Y EQUIPO DE USO ESPECIAL N.C.P.	\N	\N
2930	FABRICACIÓN DE PARTES, PIEZAS (AUTOPARTES) Y ACCESORIOS (LUJOS) PARA VEHÍCULOS AUTOMOTORES	\N	\N
3030	FABRICACIÓN DE AERONAVES, NAVES ESPACIALES Y DE MAQUINARIA CONEXA	\N	\N
3110	FABRICACIÓN DE MUEBLES 	\N	\N
3210	FABRICACIÓN DE JOYAS, BISUTERÍA Y ARTÍCULOS CONEXOS	\N	\N
3230	FABRICACIÓN DE ARTÍCULOS Y EQUIPO PARA LA PRÁCTICA DEL DEPORTE	\N	\N
3240	FABRICACIÓN DE JUEGOS, JUGUETES Y ROMPECABEZAS	\N	\N
3250	FABRICACIÓN DE INSTRUMENTOS, APARATOS Y MATERIALES MÉDICOS Y ODONTOLÓGICOS (INCLUIDO MOBILIARIO)	\N	\N
3290	OTRAS INDUSTRIAS MANUFACTURERAS N.C.P.	\N	\N
3311	MANTENIMIENTO Y REPARACIÓN ESPECIALIZADO DE PRODUCTOS ELABORADOS EN METAL	\N	\N
3312	MANTENIMIENTO Y REPARACIÓN ESPECIALIZADO DE MAQUINARIA Y EQUIPO	\N	\N
3313	MANTENIMIENTO Y REPARACIÓN ESPECIALIZADO DE EQUIPO ELECTRÓNICO Y ÓPTICO	\N	\N
3314	MANTENIMIENTO Y REPARACIÓN ESPECIALIZADO DE EQUIPO ELÉCTRICO	\N	\N
3315	MANTENIMIENTO Y REPARACIÓN ESPECIALIZADO DE EQUIPO DE TRANSPORTE, EXCEPTO LOS VEHÍCULOS AUTOMOTORES, MOTOCICLETAS Y BICICLETAS	\N	\N
3319	MANTENIMIENTO Y REPARACIÓN DE OTROS TIPOS DE EQUIPOS Y SUS COMPONENTES N.C.P.	\N	\N
3320	INSTALACIÓN ESPECIALIZADA DE MAQUINARIA Y EQUIPO INDUSTRIAL	\N	\N
3530	SUMINISTRO DE VAPOR Y AIRE ACONDICIONADO	\N	\N
3812	RECOLECCIÓN DE DESECHOS PELIGROSOS	\N	\N
3821	TRATAMIENTO Y DISPOSICIÓN DE DESECHOS NO PELIGROSOS	\N	\N
3822	TRATAMIENTO Y DISPOSICIÓN DE DESECHOS PELIGROSOS	\N	\N
3830	RECUPERACIÓN DE MATERIALES	\N	\N
3900	ACTIVIDADES DE SANEAMIENTO AMBIENTAL Y OTROS SERVICIOS DE GESTIÓN DE DESECHOS	\N	\N
4290	CONSTRUCCIÓN DE OTRAS OBRAS DE INGENIERÍA CIVIL	\N	\N
4311	DEMOLICIÓN	\N	\N
4312	PREPARACIÓN DEL TERRENO	\N	\N
4322	INSTALACIONES DE FONTANERÍA, CALEFACCIÓN Y AIRE ACONDICIONADO	\N	\N
4329	OTRAS INSTALACIONES ESPECIALIZADAS	\N	\N
4390	OTRAS ACTIVIDADES ESPECIALIZADAS PARA LA CONSTRUCCIÓN DE EDIFICIOS Y OBRAS DE INGENIERÍA CIVIL	\N	\N
4542	MANTENIMIENTO Y REPARACIÓN DE MOTOCICLETAS Y DE SUS PARTES Y PIEZAS	\N	\N
4620	COMERCIO AL POR MAYOR DE MATERIAS PRIMAS AGROPECUARIAS: ANIMALES VIVOS.\n	\N	\N
4645	COMERCIO AL POR MAYOR DE PRODUCTOS FARMACÉUTICOS, MEDICINALES, COSMÉTICOS Y DE TOCADOR	\N	\N
4649	COMERCIO AL POR MAYOR DE OTROS UTENSILIOS DOMÉSTICOS N.C.P.	\N	\N
4659	COMERCIO AL POR MAYOR DE OTROS TIPOS DE MAQUINARIA Y EQUIPO N.C.P.	\N	\N
4664	COMERCIO AL POR MAYOR DE PRODUCTOS QUÍMICOS BÁSICOS, CAUCHOS Y PLÁSTICOS EN FORMAS PRIMARIAS Y PRODUCTOS QUÍMICOS DE USO\nAGROPECUARIO	\N	\N
4669	COMERCIO AL POR MAYOR DE OTROS PRODUCTOS N.C.P.	\N	\N
4729	COMERCIO AL POR MENOR DE OTROS PRODUCTOS ALIMENTICIOS N.C.P., EN ESTABLECIMIENTOS ESPECIALIZADOS	\N	\N
4741	COMERCIO AL POR MENOR DE COMPUTADORES, EQUIPOS PERIFÉRICOS, PROGRAMAS DE INFORMÁTICA Y EQUIPOS DE TELECOMUNICACIONES EN ESTABLECIMIENTOS ESPECIALIZADOS	\N	\N
4752	COMERCIO AL POR MENOR DE ARTÍCULOS DE FERRETERÍA, PINTURAS Y PRODUCTOS DE VIDRIO EN ESTABLECIMIENTOS ESPECIALIZADOS	\N	\N
4754	COMERCIO AL POR MENOR DE ELECTRODOMÉSTICOS Y GASODOMESTICOS DE USO DOMÉSTICO, MUEBLES Y EQUIPOS DE ILUMINACIÓN 	\N	\N
4759	COMERCIO AL POR MENOR DE OTROS ARTÍCULOS DOMÉSTICOS EN ESTABLECIMIENTOS ESPECIALIZADOS	\N	\N
4769	COMERCIO AL POR MENOR DE OTROS ARTÍCULOS CULTURALES Y DE ENTRETENIMIENTO N.C.P. EN ESTABLECIMIENTOS ESPECIALIZADOS	\N	\N
4774	COMERCIO AL POR MENOR DE OTROS PRODUCTOS NUEVOS, EN ESTABLECIMIENTOS ESPECIALIZADOS	\N	\N
4775	COMERCIO AL POR MENOR DE ARTÍCULOS DE SEGUNDA MANO	\N	\N
4921	TRANSPORTE DE PASAJEROS	\N	\N
4923	TRANSPORTE DE CARGA POR CARRETERA	\N	\N
5011	TRANSPORTE DE PASAJEROS MARÍTIMO Y DE CABOTAJE 	\N	\N
5012	TRANSPORTE DE CARGA MARÍTIMO Y DE CABOTAJE 	\N	\N
5111	TRANSPORTE AÉREO NACIONAL DE PASAJEROS 	\N	\N
5112	TRANSPORTE AÉREO INTERNACIONAL DE PASAJEROS 	\N	\N
5121	TRANSPORTE AÉREO NACIONAL DE CARGA 	\N	\N
5122	TRANSPORTE AÉREO INTERNACIONAL DE CARGA 	\N	\N
5221	ACTIVIDADES DE ESTACIONES, VÍAS Y SERVICIOS COMPLEMENTARIOS PARA EL TRANSPORTE TERRESTRE	\N	\N
5223	ACTIVIDADES DE AEROPUERTOS, SERVICIOS DE NAVEGACIÓN AÉREA Y DEMÁS ACTIVIDADES CONEXAS AL TRANSPORTE AÉREO	\N	\N
5612	EXPENDIO POR AUTOSERVICIO DE COMIDAS PREPARADAS	\N	\N
5629	ACTIVIDADES DE OTROS SERVICIOS DE COMIDAS	\N	\N
5811	EDICIÓN DE LIBROS	\N	\N
5812	EDICIÓN DE DIRECTORIOS Y LISTAS DE CORREO	\N	\N
5813	EDICIÓN DE PERIÓDICOS, REVISTAS Y OTRAS PUBLICACIONES PERIÓDICAS	\N	\N
5819	OTROS TRABAJOS DE EDICIÓN	\N	\N
5820	EDICIÓN DE PROGRAMAS DE INFORMÁTICA (SOFTWARE) 	\N	\N
5911	ACTIVIDADES DE PRODUCCIÓN DE PELÍCULAS CINEMATOGRÁFICAS, VIDEOS, PROGRAMAS, ANUNCIOS Y COMERCIALES DE TELEVISIÓN	\N	\N
5912	ACTIVIDADES DE POSTPRODUCCIÓN DE PELÍCULAS CINEMATOGRÁFICAS, VIDEOS, PROGRAMAS, ANUNCIOS Y COMERCIALES DE TELEVISIÓN	\N	\N
5920	ACTIVIDADES DE GRABACIÓN DE SONIDO Y EDICIÓN DE MÚSICA	\N	\N
6010	ACTIVIDADES DE PROGRAMACIÓN Y TRANSMISIÓN EN EL SERVICIO DE RADIODIFUSIÓN SONORA 	\N	\N
6020	ACTIVIDADES DE PROGRAMACIÓN Y TRANSMISIÓN DE TELEVISIÓN	\N	\N
6110	ACTIVIDADES DE TELECOMUNICACIONES ALÁMBRICAS	\N	\N
6120	ACTIVIDADES DE TELECOMUNICACIONES INALÁMBRICAS	\N	\N
6130	ACTIVIDADES DE TELECOMUNICACIÓN SATELITAL	\N	\N
6190	OTRAS ACTIVIDADES DE TELECOMUNICACIONES	\N	\N
6202	ACTIVIDADES DE CONSULTORÍA INFORMÁTICA Y ACTIVIDADES DE ADMINISTRACIÓN DE INSTALACIONES INFORMÁTICAS 	\N	\N
6499	OTRAS ACTIVIDADES DE SERVICIO FINANCIERO, EXCEPTO LAS DE SEGUROS Y PENSIONES N.C.P.	\N	\N
6629	EVALUACIÓN DE RIESGOS Y DAÑOS Y OTRAS ACTIVIDADES DE SERVICIOS AUXILIARES	\N	\N
7410	ACTIVIDADES ESPECIALIZADAS DE DISEÑO	\N	\N
7420	ACTIVIDADES DE FOTOGRAFÍA 	\N	\N
7490	OTRAS ACTIVIDADES PROFESIONALES, CIENTÍFICAS Y TÉCNICAS N.C.P.	\N	\N
7730	ALQUILER Y ARRENDAMIENTO DE OTROS TIPOS DE MAQUINARIA, EQUIPO Y BIENES TANGIBLES N.C.P.	\N	\N
7810	ACTIVIDADES DE AGENCIAS DE EMPLEO 	\N	\N
7990	OTROS SERVICIOS DE RESERVA Y ACTIVIDADES RELACIONADAS	\N	\N
8129	OTRAS ACTIVIDADES DE LIMPIEZA DE EDIFICIOS E INSTALACIONES INDUSTRIALES 	\N	\N
8130	 ACTIVIDADES DE PAISAJISMO Y SERVICIOS DE MANTENIMIENTO CONEXOS	\N	\N
8219	FOTOCOPIADO, PREPARACIÓN DE DOCUMENTOS Y OTRAS ACTIVIDADES ESPECIALIZADAS DE APOYO A OFICINA	\N	\N
8412	ACTIVIDADES EJECUTIVAS DE LA ADMINISTRACIÓN PUBLICA	\N	\N
8530	ESTABLECIMIENTOS QUE COMBINAN DIFERENTES NIVELES DE EDUCACIÓN	\N	\N
8553	ENSEÑANZA CULTURAL	\N	\N
8559	OTROS TIPOS DE EDUCACIÓN N.C.P.	\N	\N
9001	CREACIÓN LITERARIA	\N	\N
9329	OTRAS ACTIVIDADES RECREATIVAS Y DE ESPARCIMIENTO N.C.P.	\N	\N
9499	ACTIVIDADES DE OTRAS ASOCIACIONES N.C.P.	\N	\N
9512	MANTENIMIENTO Y REPARACIÓN DE EQUIPOS DE COMUNICACIÓN	\N	\N
9524	REPARACIÓN DE MUEBLES Y ACCESORIOS PARA EL HOGAR	\N	\N
9529	MANTENIMIENTO Y REPARACIÓN DE OTROS EFECTOS PERSONALES Y ENSERES DOMÉSTICOS	\N	\N
\.


--
-- TOC entry 3221 (class 0 OID 354947)
-- Dependencies: 210
-- Data for Name: tp_actividad_economica_h; Type: TABLE DATA; Schema: syli; Owner: postgres
--

COPY syli.tp_actividad_economica_h (codigo_ciiud, codigo_ciiud_anterior, descripcion_ciiud_anterior, fecha_alta, fecha_modificacion) FROM stdin;
0010	0010	ASALARIADOS	2019-10-08 20:51:16.731366	\N
0081	0081	SIN ACTIVIDAD ECONÓMICA, SOLO PARA PERSONAS NATURALES	2019-10-08 20:51:16.731366	\N
0082	0082	PERSONAS NATURALES SUBSIDIADAS POR TERCEROS	2019-10-08 20:51:16.731366	\N
0090	0090	RENTISTAS DE CAPITAL, SOLO PARA PERSONAS NATURALES	2019-10-08 20:51:16.731366	\N
0111	0111	CULTIVO DE CAFÉ	2019-10-08 20:51:16.731366	\N
0150	0130	EXPLOTACIÓN MIXTA (AGRÍCOLA Y PECUARIA) 	2019-10-08 20:51:16.731366	\N
0161	0140	ACTIVIDADES DE APOYO A LA AGRICULTURA 	2019-10-08 20:51:16.731366	\N
0170	0150	CAZA ORDINARIA Y MEDIANTE TRAMPAS Y ACTIVIDADES DE SERVICIOS CONEXAS 	2019-10-08 20:51:16.731366	\N
0210	0201	SILVICULTURA Y OTRAS ACTIVIDADES FORESTALES	2019-10-08 20:51:16.731366	\N
0240	0202	SERVICIOS DE APOYO A LA SILVICULTURA 	2019-10-08 20:51:16.731366	\N
0510	1010	EXTRACCIÓN DE HULLA (CARBÓN DE PIEDRA)	2019-10-08 20:51:16.731366	\N
0520	1020	EXTRACCIÓN DE CARBÓN LIGNITO	2019-10-08 20:51:16.731366	\N
0610	1110	EXTRACCIÓN DE PETRÓLEO CRUDO 	2019-10-08 20:51:16.731366	\N
0710	1310	EXTRACCIÓN DE MINERALES DE HIERRO	2019-10-08 20:51:16.731366	\N
0721	1200	EXTRACCIÓN DE MINERALES DE URANIO Y DE TORIO	2019-10-08 20:51:16.731366	\N
0722	1320	EXTRACCIÓN DE ORO Y OTROS METALES PRECIOSOS	2019-10-08 20:51:16.731366	\N
0723	1331	EXTRACCIÓN DE MINERALES DE NÍQUEL	2019-10-08 20:51:16.731366	\N
0729	1339	EXTRACCIÓN DE OTROS MINERALES METALÍFEROS NO FERROSOS N.C.P.	2019-10-08 20:51:16.731366	\N
0812	1413	EXTRACCIÓN DE ARCILLAS DE USO INDUSTRIAL, CALIZA, CAOLÍN Y BENTONITAS	2019-10-08 20:51:16.731366	\N
0812	1414	EXTRACCIÓN DE ARCILLAS DE USO INDUSTRIAL, CALIZA, CAOLÍN Y BENTONITAS	2019-10-08 20:51:16.731366	\N
0891	1421	EXTRACCIÓN DE MINERALES PARA LA FABRICACIÓN DE ABONOS Y PRODUCTOS QUÍMICOS	2019-10-08 20:51:16.731366	\N
0892	1422	EXTRACCIÓN DE HALITA (SAL)	2019-10-08 20:51:16.731366	\N
1011	1511	PROCESAMIENTO Y CONSERVACIÓN DE CARNE Y PRODUCTOS CÁRNICOS	2019-10-08 20:51:16.731366	\N
1012	1512	PROCESAMIENTO Y CONSERVACIÓN DE PESCADOS, CRUSTÁCEOS Y MOLUSCOS	2019-10-08 20:51:16.731366	\N
1030	1522	ELABORACIÓN DE ACEITES Y GRASAS DE ORIGEN VEGETAL Y ANIMAL	2019-10-08 20:51:16.731366	\N
1040	1530	ELABORACIÓN DE PRODUCTOS LÁCTEOS	2019-10-08 20:51:16.731366	\N
1051	1541	ELABORACIÓN DE PRODUCTOS DE MOLINERÍA	2019-10-08 20:51:16.731366	\N
1052	1542	ELABORACIÓN DE ALMIDONES Y PRODUCTOS DERIVADOS DEL ALMIDÓN	2019-10-08 20:51:16.731366	\N
1061	1561	TRILLA DE CAFÉ	2019-10-08 20:51:16.731366	\N
1062	1562	DESCAFEINADO, TOSTIÓN Y MOLIENDA DEL CAFÉ	2019-10-08 20:51:16.731366	\N
1062	1563	DESCAFEINADO, TOSTIÓN Y MOLIENDA DEL CAFÉ	2019-10-08 20:51:16.731366	\N
1063	1564	OTROS DERIVADOS DEL CAFÉ	2019-10-08 20:51:16.731366	\N
1071	1571	ELABORACIÓN Y REFINACIÓN DE AZÚCAR	2019-10-08 20:51:16.731366	\N
1072	1572	ELABORACIÓN DE PANELA	2019-10-08 20:51:16.731366	\N
1081	1582	ELABORACIÓN DE PRODUCTOS DE PANADERÍA	2019-10-08 20:51:16.731366	\N
1082	1581	ELABORACIÓN DE CACAO, CHOCOLATE Y PRODUCTOS DE CONFITERÍA	2019-10-08 20:51:16.731366	\N
1083	1583	ELABORACIÓN DE MACARRONES, FIDEOS, ALCUZCUZ Y PRODUCTOS FARINÁCEOS SIMILARES	2019-10-08 20:51:16.731366	\N
1090	1543	ELABORACIÓN DE ALIMENTOS PREPARADOS PARA ANIMALES	2019-10-08 20:51:16.731366	\N
1101	1591	DESTILACIÓN, RECTIFICACIÓN Y MEZCLA DE BEBIDAS ALCOHÓLICAS	2019-10-08 20:51:16.731366	\N
1102	1592	ELABORACIÓN DE BEBIDAS FERMENTADAS NO DESTILADAS	2019-10-08 20:51:16.731366	\N
1103	1593	PRODUCCIÓN DE MALTA, ELABORACIÓN DE CERVEZAS Y OTRAS BEBIDAS MALTEADAS	2019-10-08 20:51:16.731366	\N
1104	1594	ELABORACIÓN DE BEBIDAS NO ALCOHÓLICAS, PRODUCCIÓN DE AGUAS MINERALES Y DE OTRAS AGUAS EMBOTELLADAS	2019-10-08 20:51:16.731366	\N
1311	1710	PREPARACIÓN E HILATURA DE FIBRAS TEXTILES	2019-10-08 20:51:16.731366	\N
1391	1750	FABRICACIÓN DE TEJIDOS DE PUNTO Y GANCHILLO	2019-10-08 20:51:16.731366	\N
1393	1742	FABRICACIÓN DE TAPETES Y ALFOMBRAS PARA PISOS	2019-10-08 20:51:16.731366	\N
1394	1743	FABRICACIÓN DE CUERDAS, CORDELES, CABLES, BRAMANTES Y REDES	2019-10-08 20:51:16.731366	\N
1420	1820	FABRICACIÓN DE ARTÍCULOS DE PIEL	2019-10-08 20:51:16.731366	\N
1513	1932	FABRICACIÓN DE ARTÍCULOS DE VIAJE, BOLSOS DE MANO Y ARTÍCULOS SIMILARES: ARTÍCULOS DE TALABARTERÍA Y GUARNICIONERÍA ELABORADOS EN OTROS MATERIALES\n	2019-10-08 20:51:16.731366	\N
1513	1939	FABRICACIÓN DE ARTÍCULOS DE VIAJE, BOLSOS DE MANO Y ARTÍCULOS SIMILARES: ARTÍCULOS DE TALABARTERÍA Y GUARNICIONERÍA ELABORADOS EN OTROS MATERIALES\n	2019-10-08 20:51:16.731366	\N
1523	1926	FABRICACIÓN DE PARTES DEL CALZADO	2019-10-08 20:51:16.731366	\N
1610	2010	ASERRADO, ACEPILLADO E IMPREGNACIÓN DE LA MADERA	2019-10-08 20:51:16.731366	\N
1620	2020	FABRICACIÓN DE HOJAS DE MADERA PARA ENCHAPADO: FABRICACIÓN DE TABLEROS CONTRACHAPADOS, TABLEROS LAMINADOS, TABLEROS DE PARTÍCULAS Y OTROS TABLEROS Y PANELES	2019-10-08 20:51:16.731366	\N
1630	2030	FABRICACIÓN DE PARTES Y PIEZAS DE MADERA, DE CARPINTERÍA Y EBANISTERÍA PARA LA CONSTRUCCIÓN\n	2019-10-08 20:51:16.731366	\N
1640	2040	FABRICACIÓN DE RECIPIENTES DE MADERA	2019-10-08 20:51:16.731366	\N
1701	2101	FABRICACIÓN DE PULPAS (PASTAS) CELULÓSICAS: PAPEL Y CARTÓN	2019-10-08 20:51:16.731366	\N
1702	2102	FABRICACIÓN DE PAPEL Y CARTÓN ONDULADO (CORRUGADO): FABRICACIÓN DE ENVASES, EMPAQUES Y DE EMBALAJES DE PAPEL Y CARTÓN	2019-10-08 20:51:16.731366	\N
1812	2230	ACTIVIDADES DE SERVICIOS RELACIONADOS CON LA IMPRESIÓN	2019-10-08 20:51:16.731366	\N
1820	2240	PRODUCCIÓN DE COPIAS A PARTIR DE GRABACIONES ORIGINALES	2019-10-08 20:51:16.731366	\N
1910	2310	FABRICACIÓN DE PRODUCTOS DE HORNOS DE COQUE 	2019-10-08 20:51:16.731366	\N
2012	2412	FABRICACIÓN DE ABONOS Y COMPUESTOS INORGÁNICOS NITROGENADOS	2019-10-08 20:51:16.731366	\N
2014	2414	FABRICACIÓN DE CAUCHO SINTÉTICO EN FORMAS PRIMARIAS	2019-10-08 20:51:16.731366	\N
2021	2421	FABRICACIÓN DE PLAGUICIDAS Y OTROS PRODUCTOS QUÍMICOS DE USO AGROPECUARIO	2019-10-08 20:51:16.731366	\N
2022	2422	FABRICACIÓN DE PINTURAS, BARNICES Y REVESTIMIENTOS SIMILARES, TINTAS PARA IMPRESIÓN Y MASILLAS	2019-10-08 20:51:16.731366	\N
2023	2424	FABRICACIÓN DE JABONES Y DETERGENTES, PREPARADOS PARA LIMPIAR Y PULIR: PERFUMES Y PREPARADOS DE TOCADOR	2019-10-08 20:51:16.731366	\N
2211	2511	FABRICACIÓN DE LLANTAS Y NEUMÁTICOS DE CAUCHO	2019-10-08 20:51:16.731366	\N
2212	2512	REENCAUCHE DE LLANTAS USADAS	2019-10-08 20:51:16.731366	\N
2221	2521	FABRICACIÓN DE FORMAS BÁSICAS DE PLÁSTICO	2019-10-08 20:51:16.731366	\N
2310	2610	FABRICACIÓN DE VIDRIO Y PRODUCTOS DE VIDRIO	2019-10-08 20:51:16.731366	\N
2391	2692	FABRICACIÓN DE PRODUCTOS REFRACTARIOS	2019-10-08 20:51:16.731366	\N
2394	2694	FABRICACIÓN DE CEMENTO, CAL Y YESO	2019-10-08 20:51:16.731366	\N
2395	2695	FABRICACIÓN DE ARTÍCULOS DE HORMIGÓN, CEMENTO Y YESO	2019-10-08 20:51:16.731366	\N
2396	2696	CORTE, TALLADO Y ACABADO DE LA PIEDRA	2019-10-08 20:51:16.731366	\N
2410	2710	INDUSTRIAS BÁSICAS DE HIERRO Y DE ACERO	2019-10-08 20:51:16.731366	\N
2421	2721	INDUSTRIAS BÁSICAS DE METALES PRECIOSOS	2019-10-08 20:51:16.731366	\N
2432	2732	FUNDICIÓN DE METALES NO FERROSOS	2019-10-08 20:51:16.731366	\N
2511	2811	FABRICACIÓN DE PRODUCTOS METÁLICOS PARA USO ESTRUCTURAL	2019-10-08 20:51:16.731366	\N
2512	2812	FABRICACIÓN DE TANQUES, DEPÓSITOS Y RECIPIENTES DE METAL, EXCEPTO LOS UTILIZADOS PARA EL ENVASE O TRANSPORTE DE MERCANCÍAS	2019-10-08 20:51:16.731366	\N
2513	2813	FABRICACIÓN DE GENERADORES DE VAPOR, EXCEPTO CALDERAS DE AGUA CALIENTE PARA CALEFACCIÓN CENTRAL	2019-10-08 20:51:16.731366	\N
2520	2927	FABRICACIÓN DE ARMAS Y MUNICIONES	2019-10-08 20:51:16.731366	\N
2591	2891	FORJA, PRENSADO, ESTAMPADO Y LAMINADO DE METAL: PULVIMETALURGIA	2019-10-08 20:51:16.731366	\N
2652	3330	FABRICACIÓN DE RELOJES	2019-10-08 20:51:16.731366	\N
2660	3311	FABRICACIÓN DE EQUIPO DE IRRADIACIÓN Y EQUIPO ELECTRÓNICO DE USO MÉDICO Y TERAPÉUTICO	2019-10-08 20:51:16.731366	\N
2720	3140	FABRICACIÓN DE PILAS, BATERÍAS Y ACUMULADORES ELÉCTRICOS	2019-10-08 20:51:16.731366	\N
2750	2930	FABRICACIÓN DE APARATOS DE USO DOMÉSTICO	2019-10-08 20:51:16.731366	\N
2821	2921	FABRICACIÓN DE MAQUINARIA AGROPECUARIA Y FORESTAL 	2019-10-08 20:51:16.731366	\N
2823	2923	FABRICACIÓN DE MAQUINARIA PARA LA METALURGIA 	2019-10-08 20:51:16.731366	\N
2824	2924	FABRICACIÓN DE MAQUINARIA PARA EXPLOTACIÓN DE MINAS Y CANTERAS Y PARA OBRAS DE CONSTRUCCIÓN	2019-10-08 20:51:16.731366	\N
2825	2925	FABRICACIÓN DE MAQUINARIA PARA LA ELABORACIÓN DE ALIMENTOS, BEBIDAS Y TABACO	2019-10-08 20:51:16.731366	\N
2910	3410	FABRICACIÓN DE VEHÍCULOS AUTOMOTORES Y SUS MOTORES	2019-10-08 20:51:16.731366	\N
2920	3420	FABRICACIÓN DE CARROCERÍAS PARA VEHÍCULOS AUTOMOTORES: FABRICACIÓN DE REMOLQUES Y SEMIRREMOLQUES	2019-10-08 20:51:16.731366	\N
3011	3511	CONSTRUCCIÓN DE BARCOS Y DE ESTRUCTURAS FLOTANTES	2019-10-08 20:51:16.731366	\N
3012	3512	CONSTRUCCIÓN DE EMBARCACIONES DE RECREO Y DEPORTE	2019-10-08 20:51:16.731366	\N
3020	3520	FABRICACIÓN DE LOCOMOTORAS Y DE MATERIAL RODANTE PARA FERROCARRILES 	2019-10-08 20:51:16.731366	\N
3092	3592	FABRICACIÓN DE BICICLETAS Y DE SILLAS DE RUEDAS PARA PERSONAS CON DISCAPACIDAD	2019-10-08 20:51:16.731366	\N
3120	3614	FABRICACIÓN DE COLCHONES Y SOMIERES	2019-10-08 20:51:16.731366	\N
3220	3692	FABRICACIÓN DE INSTRUMENTOS MUSICALES	2019-10-08 20:51:16.731366	\N
3511	4010	GENERACIÓN DE ENERGÍA ELÉCTRICA	2019-10-08 20:51:16.731366	\N
3520	4020	PRODUCCIÓN DE GAS: DISTRIBUCIÓN DE COMBUSTIBLES GASEOSOS POR TUBERÍAS. 	2019-10-08 20:51:16.731366	\N
3600	4100	CAPTACIÓN, TRATAMIENTO Y DISTRIBUCIÓN DE AGUA	2019-10-08 20:51:16.731366	\N
3700	9000	EVACUACIÓN Y TRATAMIENTO DE AGUAS RESIDUALES	2019-10-08 20:51:16.731366	\N
4111	4521	CONSTRUCCIÓN DE EDIFICIOS RESIDENCIALES 	2019-10-08 20:51:16.731366	\N
4112	4522	CONSTRUCCIÓN DE EDIFICIOS NO RESIDENCIALES	2019-10-08 20:51:16.731366	\N
4210	4530	CONSTRUCCIÓN DE CARRETERAS Y VÍAS DE FERROCARRIL	2019-10-08 20:51:16.731366	\N
4321	4542	INSTALACIONES ELÉCTRICAS	2019-10-08 20:51:16.731366	\N
4330	4551	TERMINACIÓN Y ACABADO DE EDIFICIOS Y OBRAS DE INGENIERÍA CIVIL	2019-10-08 20:51:16.731366	\N
4330	4552	TERMINACIÓN Y ACABADO DE EDIFICIOS Y OBRAS DE INGENIERÍA CIVIL	2019-10-08 20:51:16.731366	\N
4330	4559	TERMINACIÓN Y ACABADO DE EDIFICIOS Y OBRAS DE INGENIERÍA CIVIL	2019-10-08 20:51:16.731366	\N
4511	5011	COMERCIO DE VEHÍCULOS AUTOMOTORES NUEVOS	2019-10-08 20:51:16.731366	\N
4512	5012	COMERCIO DE VEHÍCULOS AUTOMOTORES USADOS	2019-10-08 20:51:16.731366	\N
4520	5020	MANTENIMIENTO Y REPARACIÓN DE VEHÍCULOS AUTOMOTORES	2019-10-08 20:51:16.731366	\N
4530	5030	COMERCIO DE PARTES, PIEZAS (AUTOPARTES) Y ACCESORIOS (LUJOS) PARA VEHÍCULOS AUTOMOTORES	2019-10-08 20:51:16.731366	\N
4541	5040	COMERCIO DE MOTOCICLETAS Y DE SUS PARTES, PIEZAS Y ACCESORIOS	2019-10-08 20:51:16.731366	\N
4610	5111	COMERCIO AL POR MAYOR A CAMBIO DE UNA RETRIBUCIÓN O POR CONTRATA	2019-10-08 20:51:16.731366	\N
4610	5112	COMERCIO AL POR MAYOR A CAMBIO DE UNA RETRIBUCIÓN O POR CONTRATA	2019-10-08 20:51:16.731366	\N
4610	5113	COMERCIO AL POR MAYOR A CAMBIO DE UNA RETRIBUCIÓN O POR CONTRATA	2019-10-08 20:51:16.731366	\N
4610	5119	COMERCIO AL POR MAYOR A CAMBIO DE UNA RETRIBUCIÓN O POR CONTRATA	2019-10-08 20:51:16.731366	\N
4631	5125	COMERCIO AL POR MAYOR DE PRODUCTOS ALIMENTICIOS	2019-10-08 20:51:16.731366	\N
4632	5127	COMERCIO AL POR MAYOR DE BEBIDAS Y TABACO	2019-10-08 20:51:16.731366	\N
4641	5131	COMERCIO AL POR MAYOR DE PRODUCTOS TEXTILES: PRODUCTOS CONFECCIONADOS PARA USO DOMÉSTICO	2019-10-08 20:51:16.731366	\N
4642	5132	COMERCIO AL POR MAYOR DE PRENDAS DE VESTIR	2019-10-08 20:51:16.731366	\N
4643	5133	COMERCIO AL POR MAYOR DE CALZADO	2019-10-08 20:51:16.731366	\N
4644	5134	COMERCIO AL POR MAYOR DE APARATOS Y EQUIPO DE USO DOMÉSTICO	2019-10-08 20:51:16.731366	\N
4651	5164	COMERCIO AL POR MAYOR DE COMPUTADORES, EQUIPO PERIFÉRICO Y PROGRAMAS DE INFORMÁTICA	2019-10-08 20:51:16.731366	\N
4652	5165	COMERCIO AL POR MAYOR DE EQUIPO, PARTES Y PIEZAS ELECTRÓNICOS Y DE TELECOMUNICACIONES	2019-10-08 20:51:16.731366	\N
4653	5161	COMERCIO AL POR MAYOR DE MAQUINARIA Y EQUIPO AGROPECUARIOS	2019-10-08 20:51:16.731366	\N
4661	5151	COMERCIO AL POR MAYOR DE COMBUSTIBLES SÓLIDOS, LÍQUIDOS, GASEOSOS Y PRODUCTOS CONEXOS	2019-10-08 20:51:16.731366	\N
4662	5152	COMERCIO AL POR MAYOR DE METALES Y PRODUCTOS METALÍFEROS	2019-10-08 20:51:16.731366	\N
4663	5141	COMERCIO AL POR MAYOR DE MATERIALES DE CONSTRUCCIÓN, ARTÍCULOS DE FERRETERÍA, PINTURAS, PRODUCTOS DE VIDRIO, EQUIPO Y MATERIALES DE FONTANERÍA Y CALEFACCIÓN	2019-10-08 20:51:16.731366	\N
4663	5142	COMERCIO AL POR MAYOR DE MATERIALES DE CONSTRUCCIÓN, ARTÍCULOS DE FERRETERÍA, PINTURAS, PRODUCTOS DE VIDRIO, EQUIPO Y MATERIALES DE FONTANERÍA Y CALEFACCIÓN	2019-10-08 20:51:16.731366	\N
4665	5155	COMERCIO AL POR MAYOR DE DESPERDICIOS, DESECHOS Y CHATARRA	2019-10-08 20:51:16.731366	\N
4690	5190	COMERCIO AL POR MAYOR NO ESPECIALIZADO	2019-10-08 20:51:16.731366	\N
4711	5211	COMERCIO AL POR MENOR EN ESTABLECIMIENTOS NO ESPECIALIZADOS CON SURTIDO COMPUESTO PRINCIPALMENTE POR ALIMENTOS, BEBIDAS O TABACO	2019-10-08 20:51:16.731366	\N
4719	5219	COMERCIO A POR MENOR EN ESTABLECIMIENTOS NO ESPECIALIZADOS, CON SURTIDO COMPUESTO PRINCIPALMENTE POR PRODUCTOS DIFERENTES DE ALIMENTOS (VÍVERES EN GENERAL), BEBIDAS Y TABACO	2019-10-08 20:51:16.731366	\N
4721	5221	COMERCIO AL POR MENOR DE PRODUCTOS AGRÍCOLAS PARA EL CONSUMO EN ESTABLECIMIENTOS ESPECIALIZADOS	2019-10-08 20:51:16.731366	\N
4722	5222	COMERCIO AL POR MENOR DE LECHE, PRODUCTOS LÁCTEOS Y HUEVOS EN ESTABLECIMIENTOS ESPECIALIZADOS	2019-10-08 20:51:16.731366	\N
4723	5223	COMERCIO AL POR MENOR DE CARNES (INCLUYE AVES DE CORRAL), PRODUCTOS CÁRNICOS, PESCADOS Y PRODUCTOS DE MAR EN ESTABLECIMIENTOS ESPECIALIZADOS	2019-10-08 20:51:16.731366	\N
4724	5225	COMERCIO AL POR MENOR DE BEBIDAS Y PRODUCTOS DE TABACO, EN ESTABLECIMIENTOS ESPECIALIZADOS	2019-10-08 20:51:16.731366	\N
4731	5051	COMERCIO AL POR MENOR DE COMBUSTIBLE PARA AUTOMOTORES	2019-10-08 20:51:16.731366	\N
4732	5052	COMERCIO AL POR MENOR DE LUBRICANTES (ACEITES Y GRASAS) ADITIVOS Y PRODUCTOS DE LIMPIEZA PARA VEHÍCULOS AUTOMOTORES	2019-10-08 20:51:16.731366	\N
4751	5232	COMERCIO AL POR MENOR DE PRODUCTOS TEXTILES EN ESTABLECIMIENTOS ESPECIALIZADOS	2019-10-08 20:51:16.731366	\N
4753	5239	COMERCIO AL POR MENOR DE TAPICES, ALFOMBRAS Y RECUBRIMIENTOS PARA PAREDES Y PISOS EN ESTABLECIMIENTOS ESPECIALIZADOS	2019-10-08 20:51:16.731366	\N
4761	5244	COMERCIO AL POR MENOR DE LIBROS, PERIÓDICOS, MATERIALES Y ARTÍCULOS DE PAPELERÍA Y ESCRITORIO, EN ESTABLECIMIENTOS ESPECIALIZADOS	2019-10-08 20:51:16.731366	\N
4771	5233	COMERCIO AL POR MENOR DE PRENDAS DE VESTIR Y SUS ACCESORIOS (INCLUYE ARTÍCULOS DE PIEL) EN ESTABLECIMIENTOS ESPECIALIZADOS	2019-10-08 20:51:16.731366	\N
8621	8512	ACTIVIDADES DE LA PRÁCTICA MÉDICA, SIN INTERNACIÓN	2019-10-08 20:51:16.731366	\N
4772	5234	COMERCIO AL POR MENOR DE TODO TIPO DE CALZADO Y ARTÍCULOS DE CUERO Y SUCEDÁNEOS DEL CUERO EN ESTABLECIMIENTOS ESPECIALIZADOS.	2019-10-08 20:51:16.731366	\N
4773	5231	COMERCIO AL POR MENOR DE PRODUCTOS FARMACÉUTICOS Y MEDICINALES, COSMÉTICOS Y ARTÍCULOS DE TOCADOR EN ESTABLECIMIENTOS ESPECIALIZADOS	2019-10-08 20:51:16.731366	\N
4781	5262	COMERCIO AL POR MENOR DE ALIMENTOS, BEBIDAS Y TABACO EN PUESTOS DE VENTA MÓVILES	2019-10-08 20:51:16.731366	\N
4791	5269	COMERCIO AL POR MENOR REALIZADO A TRAVÉS DE INTERNET	2019-10-08 20:51:16.731366	\N
4792	5261	COMERCIO AL POR MENOR REALIZADO A TRAVÉS DE CASAS DE VENTA O POR CORREO	2019-10-08 20:51:16.731366	\N
4911	6010	TRANSPORTE FÉRREO DE PASAJEROS 	2019-10-08 20:51:16.731366	\N
4930	6050	TRANSPORTE POR TUBERÍAS	2019-10-08 20:51:16.731366	\N
5021	6120	TRANSPORTE FLUVIAL DE PASAJEROS	2019-10-08 20:51:16.731366	\N
5210	6320	ALMACENAMIENTO Y DEPÓSITO	2019-10-08 20:51:16.731366	\N
5222	6332	ACTIVIDADES DE PUERTOS Y SERVICIOS COMPLEMENTARIOS PARA EL TRANSPORTE ACUÁTICO	2019-10-08 20:51:16.731366	\N
5224	6310	MANIPULACIÓN DE CARGA	2019-10-08 20:51:16.731366	\N
5229	6390	OTRAS ACTIVIDADES COMPLEMENTARIAS AL TRANSPORTE	2019-10-08 20:51:16.731366	\N
5310	6411	ACTIVIDADES POSTALES NACIONALES	2019-10-08 20:51:16.731366	\N
5320	6412	ACTIVIDADES DE MENSAJERÍA	2019-10-08 20:51:16.731366	\N
5511	5511	ALOJAMIENTO EN HOTELES	2019-10-08 20:51:16.731366	\N
5513	5513	ALOJAMIENTO EN CENTROS VACACIONALES 	2019-10-08 20:51:16.731366	\N
5514	5519	ALOJAMIENTO RURAL	2019-10-08 20:51:16.731366	\N
5530	5512	SERVICIOS POR HORAS	2019-10-08 20:51:16.731366	\N
5611	5521	EXPENDIO A LA MESA DE COMIDAS PREPARADAS	2019-10-08 20:51:16.731366	\N
5613	5522	EXPENDIO DE COMIDAS PREPARADAS EN CAFETERÍAS	2019-10-08 20:51:16.731366	\N
5619	5529	OTROS TIPOS DE EXPENDIO DE COMIDAS PREPARADAS N.C.P.	2019-10-08 20:51:16.731366	\N
5621	5525	CATERING PARA EVENTOS	2019-10-08 20:51:16.731366	\N
5630	5530	EXPENDIO DE BEBIDAS ALCOHÓLICAS PARA EL CONSUMO DENTRO DEL ESTABLECIMIENTO	2019-10-08 20:51:16.731366	\N
5914	9212	ACTIVIDADES DE EXHIBICIÓN DE PELÍCULAS CINEMATOGRÁFICAS Y VIDEOS	2019-10-08 20:51:16.731366	\N
6209	7290	OTRAS ACTIVIDADES DE TECNOLOGÍAS DE INFORMACIÓN Y ACTIVIDADES DE SERVICIOS INFORMÁTICOS	2019-10-08 20:51:16.731366	\N
6391	9220	ACTIVIDADES DE AGENCIAS DE NOTICIAS	2019-10-08 20:51:16.731366	\N
6399	7499	OTRAS ACTIVIDADES DE SERVICIO DE INFORMACIÓN N.C.P.	2019-10-08 20:51:16.731366	\N
6411	6511	BANCO CENTRAL	2019-10-08 20:51:16.731366	\N
6412	6512	BANCOS COMERCIALES	2019-10-08 20:51:16.731366	\N
6421	6513	ACTIVIDADES DE LAS CORPORACIONES FINANCIERAS	2019-10-08 20:51:16.731366	\N
6422	6514	ACTIVIDADES DE LAS COMPAÑÍAS DE FINANCIAMIENTO 	2019-10-08 20:51:16.731366	\N
6423	6596	BANCA DE SEGUNDO PISO	2019-10-08 20:51:16.731366	\N
6424	6515	ACTIVIDADES DE LAS COOPERATIVAS FINANCIERAS 	2019-10-08 20:51:16.731366	\N
6431	6717	FIDEICOMISOS, FONDOS Y ENTIDADES FINANCIERAS SIMILARES	2019-10-08 20:51:16.731366	\N
6432	6604	FONDOS DE CESANTÍAS	2019-10-08 20:51:16.731366	\N
6491	6591	LEASING FINANCIERO (ARRENDAMIENTO FINANCIERO)	2019-10-08 20:51:16.731366	\N
6492	6592	ACTIVIDADES FINANCIERAS DE FONDOS DE EMPLEADOS Y OTRAS FORMAS ASOCIATIVAS DEL SECTOR SOLIDARIO	2019-10-08 20:51:16.731366	\N
6493	6594	ACTIVIDADES DE COMPRA DE CARTERA O FACTORING	2019-10-08 20:51:16.731366	\N
6494	6599	OTRAS ACTIVIDADES DE DISTRIBUCIÓN DE FONDOS	2019-10-08 20:51:16.731366	\N
6511	6601	SEGUROS GENERALES	2019-10-08 20:51:16.731366	\N
6512	6602	SEGUROS DE VIDA	2019-10-08 20:51:16.731366	\N
6513	6603	REASEGUROS	2019-10-08 20:51:16.731366	\N
6514	6593	CAPITALIZACIÓN	2019-10-08 20:51:16.731366	\N
6611	6711	ADMINISTRACIÓN DE MERCADOS FINANCIEROS 	2019-10-08 20:51:16.731366	\N
6611	6712	ADMINISTRACIÓN DE MERCADOS FINANCIEROS 	2019-10-08 20:51:16.731366	\N
6612	6713	CORRETAJE DE VALORES Y DE CONTRATOS DE PRODUCTOS BÁSICOS	2019-10-08 20:51:16.731366	\N
6613	6714	OTRAS ACTIVIDADES RELACIONADAS CON EL MERCADO DE VALORES	2019-10-08 20:51:16.731366	\N
6614	6715	ACTIVIDADES DE LAS CASAS DE CAMBIO	2019-10-08 20:51:16.731366	\N
6615	6716	ACTIVIDADES DE LOS PROFESIONALES DE COMPRA Y VENTA DE DIVISAS	2019-10-08 20:51:16.731366	\N
6619	6719	OTRAS ACTIVIDADES AUXILIARES DE LAS ACTIVIDADES DE SERVICIOS FINANCIEROS N.C.P	2019-10-08 20:51:16.731366	\N
6621	6721	ACTIVIDADES DE AGENTES Y CORREDORES DE SEGUROS	2019-10-08 20:51:16.731366	\N
6820	7020	ACTIVIDADES INMOBILIARIAS REALIZADAS A CAMBIO DE UNA RETRIBUCIÓN O POR CONTRATA	2019-10-08 20:51:16.731366	\N
6910	7411	ACTIVIDADES JURÍDICAS 	2019-10-08 20:51:16.731366	\N
6920	7412	ACTIVIDADES DE CONTABILIDAD, TENEDURÍA DE LIBROS, AUDITORIA FINANCIERA Y ASESORÍA TRIBUTARIA 	2019-10-08 20:51:16.731366	\N
7010	7414	ACTIVIDADES DE ADMINISTRACIÓN EMPRESARIAL	2019-10-08 20:51:16.731366	\N
7120	7422	ENSAYOS Y ANÁLISIS TÉCNICOS	2019-10-08 20:51:16.731366	\N
7210	7310	INVESTIGACIONES Y DESARROLLO EXPERIMENTAL EN EL CAMPO DE LAS CIENCIAS NATURALES Y LA INGENIERÍA 	2019-10-08 20:51:16.731366	\N
7220	7320	INVESTIGACIONES Y DESARROLLO EXPERIMENTAL EN EL CAMPO DE LAS CIENCIAS SOCIALES Y LAS HUMANIDADES 	2019-10-08 20:51:16.731366	\N
7310	7430	PUBLICIDAD	2019-10-08 20:51:16.731366	\N
7320	7413	ESTUDIOS DE MERCADO Y REALIZACIÓN DE ENCUESTAS DE OPINIÓN PÚBLICA	2019-10-08 20:51:16.731366	\N
7500	8520	ACTIVIDADES VETERINARIAS	2019-10-08 20:51:16.731366	\N
7710	7111	ALQUILER Y ARRENDAMIENTO DE VEHÍCULOS AUTOMOTORES 	2019-10-08 20:51:16.731366	\N
7721	7130	ALQUILER Y ARRENDAMIENTO DE EQUIPO RECREATIVO Y DEPORTIVO	2019-10-08 20:51:16.731366	\N
7911	6340	ACTIVIDADES DE LAS AGENCIAS DE VIAJES 	2019-10-08 20:51:16.731366	\N
8121	7493	LIMPIEZA GENERAL INTERIOR DE EDIFICIOS 	2019-10-08 20:51:16.731366	\N
8292	7495	ACTIVIDADES DE ENVASE Y EMPAQUE 	2019-10-08 20:51:16.731366	\N
8411	7511	ACTIVIDADES LEGISLATIVAS DE LA ADMINISTRACIÓN PUBLICA	2019-10-08 20:51:16.731366	\N
8413	7513	REGULACIÓN DE LAS ACTIVIDADES DE ORGANISMOS QUE PRESTAN SERVICIOS DE SALUD, EDUCATIVOS, CULTURALES Y OTROS SERVICIOS SOCIALES, EXCEPTO SERVICIOS DE SEGURIDAD SOCIAL 	2019-10-08 20:51:16.731366	\N
8414	7514	ACTIVIDADES REGULADORAS Y FACILITADORAS DE LA ACTIVIDAD ECONÓMICA	2019-10-08 20:51:16.731366	\N
8415	7519	ACTIVIDADES DE LOS OTROS ÓRGANOS DE CONTROL 	2019-10-08 20:51:16.731366	\N
8421	7521	RELACIONES EXTERIORES	2019-10-08 20:51:16.731366	\N
8422	7522	ACTIVIDADES DE DEFENSA	2019-10-08 20:51:16.731366	\N
8423	7524	ORDEN PÚBLICO Y ACTIVIDADES DE SEGURIDAD 	2019-10-08 20:51:16.731366	\N
8424	7523	ADMINISTRACIÓN DE JUSTICIA	2019-10-08 20:51:16.731366	\N
8430	7530	ACTIVIDADES DE PLANES DE SEGURIDAD SOCIAL DE AFILIACIÓN OBLIGATORIA	2019-10-08 20:51:16.731366	\N
8512	8011	EDUCACIÓN PREESCOLAR	2019-10-08 20:51:16.731366	\N
8513	8012	EDUCACIÓN BÁSICA PRIMARIA	2019-10-08 20:51:16.731366	\N
8521	8021	EDUCACIÓN BÁSICA SECUNDARIA	2019-10-08 20:51:16.731366	\N
8522	8022	EDUCACIÓN MEDIA ACADÉMICA	2019-10-08 20:51:16.731366	\N
8523	8023	EDUCACIÓN MEDIA TÉCNICA Y DE FORMACIÓN LABORAL	2019-10-08 20:51:16.731366	\N
8541	8030	EDUCACIÓN TÉCNICA PROFESIONAL	2019-10-08 20:51:16.731366	\N
8551	8090	FORMACIÓN ACADÉMICA NO FORMAL	2019-10-08 20:51:16.731366	\N
8610	8511	ACTIVIDADES DE HOSPITALES Y CLÍNICAS, CON INTERNACIÓN	2019-10-08 20:51:16.731366	\N
8622	8513	ACTIVIDADES DE LA PRÁCTICA ODONTOLÓGICA	2019-10-08 20:51:16.731366	\N
8691	8514	ACTIVIDADES DE APOYO DIAGNÓSTICO	2019-10-08 20:51:16.731366	\N
8692	8515	ACTIVIDADES DE APOYO TERAPÉUTICO	2019-10-08 20:51:16.731366	\N
8699	8519	OTRAS ACTIVIDADES DE ATENCIÓN DE LA SALUD HUMANA	2019-10-08 20:51:16.731366	\N
8720	8531	ACTIVIDADES DE ATENCIÓN RESIDENCIAL, PARA EL CUIDADO DE PACIENTES CON RETARDO MENTAL, ENFERMEDAD MENTAL Y CONSUMO DE SUSTANCIAS PSICOACTIVAS	2019-10-08 20:51:16.731366	\N
8810	8532	ACTIVIDADES DE ASISTENCIA SOCIAL SIN ALOJAMIENTO PARA PERSONAS MAYORES Y DISCAPACITADAS	2019-10-08 20:51:16.731366	\N
9102	9232	ACTIVIDADES Y FUNCIONAMIENTO DE MUSEOS, CONSERVACIÓN DE EDIFICIOS Y SITIOS HISTÓRICOS	2019-10-08 20:51:16.731366	\N
9103	9233	ACTIVIDADES DE JARDINES BOTÁNICOS, ZOOLÓGICOS Y RESERVAS NATURALES	2019-10-08 20:51:16.731366	\N
9200	9242	ACTIVIDADES DE JUEGOS DE AZAR Y APUESTAS	2019-10-08 20:51:16.731366	\N
9411	9111	ACTIVIDADES DE ASOCIACIONES EMPRESARIALES Y DE EMPLEADORES	2019-10-08 20:51:16.731366	\N
9412	9112	ACTIVIDADES DE ASOCIACIONES PROFESIONALES	2019-10-08 20:51:16.731366	\N
9420	9120	ACTIVIDADES DE SINDICATOS DE EMPLEADOS	2019-10-08 20:51:16.731366	\N
9491	9191	ACTIVIDADES DE ASOCIACIONES RELIGIOSAS	2019-10-08 20:51:16.731366	\N
9492	9192	ACTIVIDADES DE ASOCIACIONES POLÍTICAS	2019-10-08 20:51:16.731366	\N
9523	5271	REPARACIÓN DE CALZADO Y ARTÍCULOS DE CUERO	2019-10-08 20:51:16.731366	\N
9601	9301	LAVADO Y LIMPIEZA, INCLUSO LA LIMPIEZA EN SECO, DE PRODUCTOS TEXTILES Y DE PIEL 	2019-10-08 20:51:16.731366	\N
9602	9302	PELUQUERÍA Y OTROS TRATAMIENTOS DE BELLEZA	2019-10-08 20:51:16.731366	\N
9603	9303	POMPAS FÚNEBRES Y ACTIVIDADES RELACIONADAS	2019-10-08 20:51:16.731366	\N
9700	9500	ACTIVIDADES DE LOS HOGARES INDIVIDUALES COMO EMPLEADORES DE PERSONAL DOMÉSTICO	2019-10-08 20:51:16.731366	\N
9810	9600	ACTIVIDADES NO DIFERENCIADAS DE LOS HOGARES INDIVIDUALES COMO PRODUCTORES DE BIENES PARA USO PROPIO	2019-10-08 20:51:16.731366	\N
9820	9700	ACTIVIDADES NO DIFERENCIADAS DE LOS HOGARES INDIVIDUALES COMO PRODUCTORES DE SERVICIOS PARA USO PROPIO	2019-10-08 20:51:16.731366	\N
9900	9900	ACTIVIDADES DE ORGANIZACIONES Y ENTIDADES EXTRATERRITORIALES	2019-10-08 20:51:16.731366	\N
0111	0115	CULTIVO DE CEREALES (EXCEPTO ARROZ), LEGUMBRES Y SEMILLAS OLEAGINOSAS 	2019-10-08 20:51:16.731366	\N
0111	0116	CULTIVO DE CEREALES (EXCEPTO ARROZ), LEGUMBRES Y SEMILLAS OLEAGINOSAS 	2019-10-08 20:51:16.731366	\N
0111	0118	CULTIVO DE CEREALES (EXCEPTO ARROZ), LEGUMBRES Y SEMILLAS OLEAGINOSAS 	2019-10-08 20:51:16.731366	\N
0111	0119	CULTIVO DE CEREALES (EXCEPTO ARROZ), LEGUMBRES Y SEMILLAS OLEAGINOSAS 	2019-10-08 20:51:16.731366	\N
0113	0112	CULTIVO DE HORTALIZAS, RAÍCES Y TUBÉRCULOS 	2019-10-08 20:51:16.731366	\N
0113	0117	CULTIVO DE HORTALIZAS, RAÍCES Y TUBÉRCULOS 	2019-10-08 20:51:16.731366	\N
0122	0113	CULTIVO DE PLÁTANO Y BANANO	2019-10-08 20:51:16.731366	\N
0124	0114	CULTIVO DE CAÑA DE AZÚCAR	2019-10-08 20:51:16.731366	\N
0141	0121	CRÍA DE GANADO BOVINO Y BUFALINO	2019-10-08 20:51:16.731366	\N
0141	0129	CRÍA DE GANADO BOVINO Y BUFALINO	2019-10-08 20:51:16.731366	\N
0142	0124	CRÍA DE CABALLOS Y OTROS EQUINOS 	2019-10-08 20:51:16.731366	\N
0144	0122	CRÍA DE GANADO PORCINO	2019-10-08 20:51:16.731366	\N
0145	0123	CRÍA DE AVES DE CORRAL	2019-10-08 20:51:16.731366	\N
0149	0125	CRÍA DE OTROS ANIMALES N.C.P.	2019-10-08 20:51:16.731366	\N
0311	0501	PESCA MARÍTIMA 	2019-10-08 20:51:16.731366	\N
0311	0502	PESCA MARÍTIMA 	2019-10-08 20:51:16.731366	\N
0811	1411	EXTRACCIÓN DE PIEDRA, ARENA, ARCILLAS COMUNES, YESO Y ANHIDRITA	2019-10-08 20:51:16.731366	\N
0811	1412	EXTRACCIÓN DE PIEDRA, ARENA, ARCILLAS COMUNES, YESO Y ANHIDRITA	2019-10-08 20:51:16.731366	\N
0820	1431	EXTRACCIÓN DE ESMERALDAS, PIEDRAS PRECIOSAS Y SEMIPRECIOSAS 	2019-10-08 20:51:16.731366	\N
0820	1432	EXTRACCIÓN DE ESMERALDAS, PIEDRAS PRECIOSAS Y SEMIPRECIOSAS 	2019-10-08 20:51:16.731366	\N
0899	1030	EXTRACCIÓN DE OTROS MINERALES NO METÁLICOS N.C.P.	2019-10-08 20:51:16.731366	\N
0899	1490	EXTRACCIÓN DE OTROS MINERALES NO METÁLICOS N.C.P.	2019-10-08 20:51:16.731366	\N
0910	1120	ACTIVIDADES DE APOYO PARA LA EXTRACCIÓN DE PETRÓLEO Y DE GAS NATURAL	2019-10-08 20:51:16.731366	\N
0910	7421	ACTIVIDADES DE APOYO PARA LA EXTRACCIÓN DE PETRÓLEO Y DE GAS NATURAL	2019-10-08 20:51:16.731366	\N
0990	1415	ACTIVIDADES DE APOYO PARA OTRAS ACTIVIDADES DE EXPLOTACIÓN DE MINAS Y CANTERAS	2019-10-08 20:51:16.731366	\N
0990	4512	ACTIVIDADES DE APOYO PARA OTRAS ACTIVIDADES DE EXPLOTACIÓN DE MINAS Y CANTERAS	2019-10-08 20:51:16.731366	\N
1020	1521	PROCESAMIENTO Y CONSERVACIÓN DE FRUTAS, LEGUMBRES, HORTALIZAS Y TUBÉRCULOS	2019-10-08 20:51:16.731366	\N
1020	1589	PROCESAMIENTO Y CONSERVACIÓN DE FRUTAS, LEGUMBRES, HORTALIZAS Y TUBÉRCULOS	2019-10-08 20:51:16.731366	\N
1089	2429	ELABORACIÓN DE OTROS PRODUCTOS ALIMENTICIOS N.C.P.	2019-10-08 20:51:16.731366	\N
1200	1600	ELABORACIÓN DE PRODUCTOS DE TABACO	2019-10-08 20:51:16.731366	\N
1312	1720	TEJEDURÍA DE PRODUCTOS TEXTILES	2019-10-08 20:51:16.731366	\N
1312	2699	TEJEDURÍA DE PRODUCTOS TEXTILES	2019-10-08 20:51:16.731366	\N
1313	1730	ACABADO DE PRODUCTOS TEXTILES	2019-10-08 20:51:16.731366	\N
1313	1749	ACABADO DE PRODUCTOS TEXTILES. 	2019-10-08 20:51:16.731366	\N
1313	1810	ACABADO DE PRODUCTOS TEXTILES	2019-10-08 20:51:16.731366	\N
1392	1741	CONFECCIÓN DE ARTÍCULOS CON MATERIALES TEXTILES, EXCEPTO PRENDAS DE VESTIR	2019-10-08 20:51:16.731366	\N
1392	3430	CONFECCIÓN DE ARTÍCULOS CON MATERIALES TEXTILES, EXCEPTO PRENDAS DE VESTIR	2019-10-08 20:51:16.731366	\N
1511	1910	CURTIDO Y RECURTIDO DE CUEROS: RECURTIDO Y TEÑIDO DE PIELES	2019-10-08 20:51:16.731366	\N
1512	1931	FABRICACIÓN DE ARTÍCULOS DE VIAJE, BOLSOS DE MANO Y ARTÍCULOS SIMILARES ELABORADOS EN CUERO, Y FABRICACIÓN DE ARTÍCULOS DE TALABARTERÍA Y GUARNICIONERÍA\n	2019-10-08 20:51:16.731366	\N
1512	3699	FABRICACIÓN DE ARTÍCULOS DE VIAJE, BOLSOS DE MANO Y ARTÍCULOS SIMILARES ELABORADOS EN CUERO, Y FABRICACIÓN DE ARTÍCULOS DE TALABARTERÍA Y GUARNICIONERÍA\n	2019-10-08 20:51:16.731366	\N
1521	1921	FABRICACIÓN DE CALZADO DE CUERO Y PIEL, CON CUALQUIER TIPO DE SUELA 	2019-10-08 20:51:16.731366	\N
1521	1925	FABRICACIÓN DE CALZADO DE CUERO Y PIEL, CON CUALQUIER TIPO DE SUELA 	2019-10-08 20:51:16.731366	\N
1522	1922	FABRICACIÓN DE OTROS TIPOS DE CALZADO, EXCEPTO CALZADO DE CUERO Y PIEL	2019-10-08 20:51:16.731366	\N
1522	1923	FABRICACIÓN DE OTROS TIPOS DE CALZADO, EXCEPTO CALZADO DE CUERO Y PIEL	2019-10-08 20:51:16.731366	\N
1522	1924	FABRICACIÓN DE OTROS TIPOS DE CALZADO, EXCEPTO CALZADO DE CUERO Y PIEL	2019-10-08 20:51:16.731366	\N
1522	1929	FABRICACIÓN DE OTROS TIPOS DE CALZADO, EXCEPTO CALZADO DE CUERO Y PIEL	2019-10-08 20:51:16.731366	\N
1690	2090	FABRICACIÓN DE OTROS PRODUCTOS DE MADERA: FABRICACIÓN DE ARTÍCULOS DE CORCHO, CESTERÍA Y ESPARTERÍA	2019-10-08 20:51:16.731366	\N
1709	2109	FABRICACIÓN DE OTROS ARTÍCULOS DE PAPEL Y CARTÓN	2019-10-08 20:51:16.731366	\N
1709	2220	FABRICACIÓN DE OTROS ARTÍCULOS DE PAPEL Y CARTÓN	2019-10-08 20:51:16.731366	\N
1811	2892	ACTIVIDADES DE IMPRESIÓN	2019-10-08 20:51:16.731366	\N
1921	2321	FABRICACIÓN DE PRODUCTOS DE LA REFINACIÓN DEL PETRÓLEO	2019-10-08 20:51:16.731366	\N
1921	2322	FABRICACIÓN DE PRODUCTOS DE LA REFINACIÓN DEL PETRÓLEO	2019-10-08 20:51:16.731366	\N
2011	2330	FABRICACIÓN DE SUSTANCIAS Y PRODUCTOS QUÍMICOS BÁSICOS	2019-10-08 20:51:16.731366	\N
2011	2411	FABRICACIÓN DE SUSTANCIAS Y PRODUCTOS QUÍMICOS BÁSICOS	2019-10-08 20:51:16.731366	\N
2013	2413	FABRICACIÓN DE PLÁSTICOS EN FORMAS PRIMARIAS	2019-10-08 20:51:16.731366	\N
2013	2430	FABRICACIÓN DE PLÁSTICOS EN FORMAS PRIMARIAS	2019-10-08 20:51:16.731366	\N
2100	2423	FABRICACIÓN DE PRODUCTOS FARMACÉUTICOS, SUSTANCIAS QUÍMICAS MEDICINALES Y PRODUCTOS BOTÁNICOS DE USO FARMACÉUTICO	2019-10-08 20:51:16.731366	\N
2219	2513	FABRICACIÓN DE FORMAS BÁSICAS DE CAUCHO Y OTROS PRODUCTOS DE CAUCHO N.C.P.	2019-10-08 20:51:16.731366	\N
2219	2519	FABRICACIÓN DE FORMAS BÁSICAS DE CAUCHO Y OTROS PRODUCTOS DE CAUCHO N.C.P.	2019-10-08 20:51:16.731366	\N
2229	2529	FABRICACIÓN DE ARTÍCULOS DE PLÁSTICO N.C.P.	2019-10-08 20:51:16.731366	\N
2392	2691	FABRICACIÓN DE MATERIALES DE ARCILLA PARA LA CONSTRUCCIÓN	2019-10-08 20:51:16.731366	\N
2392	2693	FABRICACIÓN DE MATERIALES DE ARCILLA PARA LA CONSTRUCCIÓN	2019-10-08 20:51:16.731366	\N
2429	2729	INDUSTRIAS BÁSICAS DE OTROS METALES NO FERROSOS 	2019-10-08 20:51:16.731366	\N
2431	2731	FUNDICIÓN DE HIERRO Y DE ACERO	2019-10-08 20:51:16.731366	\N
2593	2893	FABRICACIÓN DE ARTÍCULOS DE CUCHILLERÍA, HERRAMIENTAS DE MANO Y ARTÍCULOS DE FERRETERÍA	2019-10-08 20:51:16.731366	\N
2593	2899	FABRICACIÓN DE ARTÍCULOS DE CUCHILLERÍA, HERRAMIENTAS DE MANO Y ARTÍCULOS DE FERRETERÍA	2019-10-08 20:51:16.731366	\N
2599	3190	FABRICACIÓN DE OTROS PRODUCTOS ELABORADOS DE METAL N.C.P.	2019-10-08 20:51:16.731366	\N
2610	3000	FABRICACIÓN DE COMPONENTES Y TABLEROS ELECTRÓNICOS	2019-10-08 20:51:16.731366	\N
2610	3110	FABRICACIÓN DE COMPONENTES Y TABLEROS ELECTRÓNICOS	2019-10-08 20:51:16.731366	\N
2610	3120	FABRICACIÓN DE COMPONENTES Y TABLEROS ELECTRÓNICOS	2019-10-08 20:51:16.731366	\N
2610	3130	FABRICACIÓN DE COMPONENTES Y TABLEROS ELECTRÓNICOS	2019-10-08 20:51:16.731366	\N
2610	3210	FABRICACIÓN DE COMPONENTES Y TABLEROS ELECTRÓNICOS	2019-10-08 20:51:16.731366	\N
2610	3230	FABRICACIÓN DE COMPONENTES Y TABLEROS ELECTRÓNICOS	2019-10-08 20:51:16.731366	\N
2630	3220	FABRICACIÓN DE EQUIPOS DE COMUNICACIÓN	2019-10-08 20:51:16.731366	\N
2640	3694	FABRICACIÓN DE APARATOS ELECTRÓNICOS DE CONSUMO	2019-10-08 20:51:16.731366	\N
2651	3312	FABRICACIÓN DE EQUIPO DE MEDICIÓN, PRUEBA, NAVEGACIÓN Y CONTROL	2019-10-08 20:51:16.731366	\N
2651	3313	FABRICACIÓN DE EQUIPO DE MEDICIÓN, PRUEBA, NAVEGACIÓN Y CONTROL	2019-10-08 20:51:16.731366	\N
2670	3320	FABRICACIÓN DE INSTRUMENTOS ÓPTICOS Y EQUIPO FOTOGRÁFICO	2019-10-08 20:51:16.731366	\N
2740	3150	FABRICACIÓN DE EQUIPOS ELÉCTRICOS DE ILUMINACIÓN	2019-10-08 20:51:16.731366	\N
2790	2922	FABRICACIÓN DE OTROS TIPOS DE EQUIPO ELÉCTRICO N.C.P.	2019-10-08 20:51:16.731366	\N
2790	2929	FABRICACIÓN DE OTROS TIPOS DE EQUIPO ELÉCTRICO N.C.P.	2019-10-08 20:51:16.731366	\N
2811	2911	FABRICACIÓN DE MOTORES, TURBINAS, Y PARTES PARA MOTORES DE COMBUSTIÓN INTERNA	2019-10-08 20:51:16.731366	\N
2811	3530	FABRICACIÓN DE MOTORES, TURBINAS, Y PARTES PARA MOTORES DE COMBUSTIÓN INTERNA	2019-10-08 20:51:16.731366	\N
2811	3591	FABRICACIÓN DE MOTORES, TURBINAS, Y PARTES PARA MOTORES DE COMBUSTIÓN INTERNA	2019-10-08 20:51:16.731366	\N
2812	2912	FABRICACIÓN DE EQUIPOS DE POTENCIA HIDRÁULICA Y NEUMÁTICA	2019-10-08 20:51:16.731366	\N
2812	2913	FABRICACIÓN DE EQUIPOS DE POTENCIA HIDRÁULICA Y NEUMÁTICA	2019-10-08 20:51:16.731366	\N
2815	2914	FABRICACIÓN DE HORNOS, HOGARES Y QUEMADORES INDUSTRIALES	2019-10-08 20:51:16.731366	\N
2816	2915	FABRICACIÓN DE EQUIPO DE ELEVACIÓN Y MANIPULACIÓN	2019-10-08 20:51:16.731366	\N
2816	3599	FABRICACIÓN DE EQUIPO DE ELEVACIÓN Y MANIPULACIÓN	2019-10-08 20:51:16.731366	\N
2819	2919	FABRICACIÓN DE OTROS TIPOS DE MAQUINARIA Y EQUIPO DE USO GENERAL N.C.P..	2019-10-08 20:51:16.731366	\N
2826	2926	FABRICACIÓN DE MAQUINARIA PARA LA ELABORACIÓN DE PRODUCTOS TEXTILES, PRENDAS DE VESTIR Y CUEROS	2019-10-08 20:51:16.731366	\N
3110	3611	FABRICACIÓN DE MUEBLES 	2019-10-08 20:51:16.731366	\N
3110	3612	FABRICACIÓN DE MUEBLES 	2019-10-08 20:51:16.731366	\N
3110	3613	FABRICACIÓN DE MUEBLES 	2019-10-08 20:51:16.731366	\N
3110	3619	FABRICACIÓN DE MUEBLES 	2019-10-08 20:51:16.731366	\N
3210	3691	FABRICACIÓN DE JOYAS, BISUTERÍA Y ARTÍCULOS CONEXOS	2019-10-08 20:51:16.731366	\N
3230	3693	FABRICACIÓN DE ARTÍCULOS Y EQUIPO PARA LA PRÁCTICA DEL DEPORTE	2019-10-08 20:51:16.731366	\N
3290	2211	OTRAS INDUSTRIAS MANUFACTURERAS N.C.P.	2019-10-08 20:51:16.731366	\N
3312	5170	MANTENIMIENTO Y REPARACIÓN ESPECIALIZADO DE MAQUINARIA Y EQUIPO	2019-10-08 20:51:16.731366	\N
3312	7250	MANTENIMIENTO Y REPARACIÓN ESPECIALIZADO DE MAQUINARIA Y EQUIPO	2019-10-08 20:51:16.731366	\N
3315	6339	MANTENIMIENTO Y REPARACIÓN ESPECIALIZADO DE EQUIPO DE TRANSPORTE, EXCEPTO LOS VEHÍCULOS AUTOMOTORES, MOTOCICLETAS Y BICICLETAS	2019-10-08 20:51:16.731366	\N
3530	4030	SUMINISTRO DE VAPOR Y AIRE ACONDICIONADO	2019-10-08 20:51:16.731366	\N
3830	3710	RECUPERACIÓN DE MATERIALES	2019-10-08 20:51:16.731366	\N
3830	3720	RECUPERACIÓN DE MATERIALES	2019-10-08 20:51:16.731366	\N
4290	7010	CONSTRUCCIÓN DE OTRAS OBRAS DE INGENIERÍA CIVIL	2019-10-08 20:51:16.731366	\N
4311	4511	DEMOLICIÓN	2019-10-08 20:51:16.731366	\N
4322	4541	INSTALACIONES DE FONTANERÍA, CALEFACCIÓN Y AIRE ACONDICIONADO	2019-10-08 20:51:16.731366	\N
4322	4543	INSTALACIONES DE FONTANERÍA, CALEFACCIÓN Y AIRE ACONDICIONADO	2019-10-08 20:51:16.731366	\N
4322	4549	INSTALACIONES DE FONTANERÍA, CALEFACCIÓN Y AIRE ACONDICIONADO	2019-10-08 20:51:16.731366	\N
4329	4549	OTRAS INSTALACIONES ESPECIALIZADAS	2019-10-08 20:51:16.731366	\N
4390	4560	OTRAS ACTIVIDADES ESPECIALIZADAS PARA LA CONSTRUCCIÓN DE EDIFICIOS Y OBRAS DE INGENIERÍA CIVIL	2019-10-08 20:51:16.731366	\N
4620	5121	COMERCIO AL POR MAYOR DE MATERIAS PRIMAS AGROPECUARIAS: ANIMALES VIVOS.\n	2019-10-08 20:51:16.731366	\N
4620	5122	COMERCIO AL POR MAYOR DE MATERIAS PRIMAS AGROPECUARIAS: ANIMALES VIVOS.\n	2019-10-08 20:51:16.731366	\N
4620	5123	COMERCIO AL POR MAYOR DE MATERIAS PRIMAS AGROPECUARIAS: ANIMALES VIVOS.\n	2019-10-08 20:51:16.731366	\N
4620	5124	COMERCIO AL POR MAYOR DE MATERIAS PRIMAS AGROPECUARIAS: ANIMALES VIVOS.\n	2019-10-08 20:51:16.731366	\N
4620	5126	COMERCIO AL POR MAYOR DE MATERIAS PRIMAS AGROPECUARIAS: ANIMALES VIVOS	2019-10-08 20:51:16.731366	\N
4645	5135	COMERCIO AL POR MAYOR DE PRODUCTOS FARMACÉUTICOS, MEDICINALES, COSMÉTICOS Y DE TOCADOR	2019-10-08 20:51:16.731366	\N
4645	5136	COMERCIO AL POR MAYOR DE PRODUCTOS FARMACÉUTICOS, MEDICINALES, COSMÉTICOS Y DE TOCADOR	2019-10-08 20:51:16.731366	\N
4649	5137	COMERCIO AL POR MAYOR DE OTROS UTENSILIOS DOMÉSTICOS N.C.P.	2019-10-08 20:51:16.731366	\N
4649	5139	COMERCIO AL POR MAYOR DE OTROS UTENSILIOS DOMÉSTICOS N.C.P.	2019-10-08 20:51:16.731366	\N
4659	5136	COMERCIO AL POR MAYOR DE OTROS TIPOS DE MAQUINARIA Y EQUIPO N.C.P.	2019-10-08 20:51:16.731366	\N
4659	5162	COMERCIO AL POR MAYOR DE OTROS TIPOS DE MAQUINARIA Y EQUIPO N.C.P.	2019-10-08 20:51:16.731366	\N
4659	5163	COMERCIO AL POR MAYOR DE OTROS TIPOS DE MAQUINARIA Y EQUIPO N.C.P.	2019-10-08 20:51:16.731366	\N
4659	5169	COMERCIO AL POR MAYOR DE OTROS TIPOS DE MAQUINARIA Y EQUIPO N.C.P.	2019-10-08 20:51:16.731366	\N
4664	5153	COMERCIO AL POR MAYOR DE PRODUCTOS QUÍMICOS BÁSICOS, CAUCHOS Y PLÁSTICOS EN FORMAS PRIMARIAS Y PRODUCTOS QUÍMICOS DE USO\nAGROPECUARIO	2019-10-08 20:51:16.731366	\N
8412	7515	ACTIVIDADES EJECUTIVAS DE LA ADMINISTRACIÓN PUBLICA	2019-10-08 20:51:16.731366	\N
4664	5159	COMERCIO AL POR MAYOR DE PRODUCTOS QUÍMICOS BÁSICOS, CAUCHOS Y PLÁSTICOS EN FORMAS PRIMARIAS Y PRODUCTOS QUÍMICOS DE USO\nAGROPECUARIO	2019-10-08 20:51:16.731366	\N
4669	5137	COMERCIO AL POR MAYOR DE OTROS PRODUCTOS N.C.P.	2019-10-08 20:51:16.731366	\N
4669	5154	COMERCIO AL POR MAYOR DE OTROS PRODUCTOS N.C.P.	2019-10-08 20:51:16.731366	\N
4729	5224	COMERCIO AL POR MENOR DE OTROS PRODUCTOS ALIMENTICIOS N.C.P., EN ESTABLECIMIENTOS ESPECIALIZADOS	2019-10-08 20:51:16.731366	\N
4729	5229	COMERCIO AL POR MENOR DE OTROS PRODUCTOS ALIMENTICIOS N.C.P., EN ESTABLECIMIENTOS ESPECIALIZADOS	2019-10-08 20:51:16.731366	\N
4741	5235	COMERCIO AL POR MENOR DE COMPUTADORES, EQUIPOS PERIFÉRICOS, PROGRAMAS DE INFORMÁTICA Y EQUIPOS DE TELECOMUNICACIONES EN ESTABLECIMIENTOS ESPECIALIZADOS	2019-10-08 20:51:16.731366	\N
4741	5243	COMERCIO AL POR MENOR DE COMPUTADORES, EQUIPOS PERIFÉRICOS, PROGRAMAS DE INFORMÁTICA Y EQUIPOS DE TELECOMUNICACIONES EN ESTABLECIMIENTOS ESPECIALIZADOS	2019-10-08 20:51:16.731366	\N
4752	5241	COMERCIO AL POR MENOR DE ARTÍCULOS DE FERRETERÍA, PINTURAS Y PRODUCTOS DE VIDRIO EN ESTABLECIMIENTOS ESPECIALIZADOS	2019-10-08 20:51:16.731366	\N
4752	5242	COMERCIO AL POR MENOR DE ARTÍCULOS DE FERRETERÍA, PINTURAS Y PRODUCTOS DE VIDRIO EN ESTABLECIMIENTOS ESPECIALIZADOS	2019-10-08 20:51:16.731366	\N
4754	5236	COMERCIO AL POR MENOR DE ELECTRODOMÉSTICOS Y GASODOMESTICOS DE USO DOMÉSTICO, MUEBLES Y EQUIPOS DE ILUMINACIÓN 	2019-10-08 20:51:16.731366	\N
4754	5237	COMERCIO AL POR MENOR DE ELECTRODOMÉSTICOS Y GASODOMESTICOS DE USO DOMÉSTICO, MUEBLES Y EQUIPOS DE ILUMINACIÓN 	2019-10-08 20:51:16.731366	\N
4774	5245	COMERCIO AL POR MENOR DE OTROS PRODUCTOS NUEVOS EN ESTABLECIMIENTOS ESPECIALIZADOS	2019-10-08 20:51:16.731366	\N
4774	5246	COMERCIO AL POR MENOR DE OTROS PRODUCTOS NUEVOS EN ESTABLECIMIENTOS ESPECIALIZADOS	2019-10-08 20:51:16.731366	\N
4774	5249	COMERCIO AL POR MENOR DE OTROS PRODUCTOS NUEVOS EN ESTABLECIMIENTOS ESPECIALIZADOS	2019-10-08 20:51:16.731366	\N
4775	5251	COMERCIO AL POR MENOR DE ARTÍCULOS DE SEGUNDA MANO	2019-10-08 20:51:16.731366	\N
4775	5252	COMERCIO AL POR MENOR DE ARTÍCULOS DE SEGUNDA MANO	2019-10-08 20:51:16.731366	\N
4921	6021	TRANSPORTE DE PASAJEROS	2019-10-08 20:51:16.731366	\N
4921	6022	TRANSPORTE DE PASAJEROS	2019-10-08 20:51:16.731366	\N
4921	6023	TRANSPORTE DE PASAJEROS	2019-10-08 20:51:16.731366	\N
4921	6031	TRANSPORTE DE PASAJEROS	2019-10-08 20:51:16.731366	\N
4921	6032	TRANSPORTE DE PASAJEROS	2019-10-08 20:51:16.731366	\N
4921	6039	TRANSPORTE DE PASAJEROS	2019-10-08 20:51:16.731366	\N
4923	6041	TRANSPORTE DE CARGA POR CARRETERA	2019-10-08 20:51:16.731366	\N
4923	6042	TRANSPORTE DE CARGA POR CARRETERA	2019-10-08 20:51:16.731366	\N
4923	6043	TRANSPORTE DE CARGA POR CARRETERA	2019-10-08 20:51:16.731366	\N
4923	6044	TRANSPORTE DE CARGA POR CARRETERA	2019-10-08 20:51:16.731366	\N
5011	6111	TRANSPORTE DE PASAJEROS MARÍTIMO Y DE CABOTAJE 	2019-10-08 20:51:16.731366	\N
5011	6112	TRANSPORTE DE PASAJEROS MARÍTIMO Y DE CABOTAJE 	2019-10-08 20:51:16.731366	\N
5111	6211	TRANSPORTE AÉREO NACIONAL DE PASAJEROS 	2019-10-08 20:51:16.731366	\N
5111	6220	TRANSPORTE AÉREO NACIONAL DE PASAJEROS 	2019-10-08 20:51:16.731366	\N
5112	6213	TRANSPORTE AÉREO INTERNACIONAL DE PASAJEROS 	2019-10-08 20:51:16.731366	\N
5121	6212	TRANSPORTE AÉREO NACIONAL DE CARGA 	2019-10-08 20:51:16.731366	\N
5122	6214	TRANSPORTE AÉREO INTERNACIONAL DE CARGA 	2019-10-08 20:51:16.731366	\N
5221	6331	ACTIVIDADES DE ESTACIONES, VÍAS Y SERVICIOS COMPLEMENTARIOS PARA EL TRANSPORTE TERRESTRE	2019-10-08 20:51:16.731366	\N
5223	6333	ACTIVIDADES DE AEROPUERTOS, SERVICIOS DE NAVEGACIÓN AÉREA Y DEMÁS ACTIVIDADES CONEXAS AL TRANSPORTE AÉREO	2019-10-08 20:51:16.731366	\N
5612	5523	EXPENDIO POR AUTOSERVICIO DE COMIDAS PREPARADAS	2019-10-08 20:51:16.731366	\N
5612	5524	EXPENDIO POR AUTOSERVICIO DE COMIDAS PREPARADAS	2019-10-08 20:51:16.731366	\N
5811	7240	EDICIÓN DE LIBROS	2019-10-08 20:51:16.731366	\N
5813	2212	EDICIÓN DE PERIÓDICOS, REVISTAS Y OTRAS PUBLICACIONES PERIÓDICAS	2019-10-08 20:51:16.731366	\N
5813	2219	EDICIÓN DE PERIÓDICOS, REVISTAS Y OTRAS PUBLICACIONE PERIÓDICAS	2019-10-08 20:51:16.731366	\N
5820	7220	EDICIÓN DE PROGRAMAS DE INFORMÁTICA (SOFTWARE) 	2019-10-08 20:51:16.731366	\N
5911	9211	ACTIVIDADES DE PRODUCCIÓN DE PELÍCULAS CINEMATOGRÁFICAS, VIDEOS, PROGRAMAS, ANUNCIOS Y COMERCIALES DE TELEVISIÓN	2019-10-08 20:51:16.731366	\N
5911	9213	ACTIVIDADES DE PRODUCCIÓN DE PELÍCULAS CINEMATOGRÁFICAS, VIDEOS, PROGRAMAS, ANUNCIOS Y COMERCIALES DE TELEVISIÓN.	2019-10-08 20:51:16.731366	\N
5912	9231	ACTIVIDADES DE POSTPRODUCCIÓN DE PELÍCULAS CINEMATOGRÁFICAS, VIDEOS, PROGRAMAS, ANUNCIOS Y COMERCIALES DE TELEVISIÓN	2019-10-08 20:51:16.731366	\N
5920	2213	ACTIVIDADES DE GRABACIÓN DE SONIDO Y EDICIÓN DE MÚSICA	2019-10-08 20:51:16.731366	\N
6110	6421	ACTIVIDADES DE TELECOMUNICACIONES ALÁMBRICAS	2019-10-08 20:51:16.731366	\N
6110	6422	ACTIVIDADES DE TELECOMUNICACIONES ALÁMBRICAS	2019-10-08 20:51:16.731366	\N
6110	6423	ACTIVIDADES DE TELECOMUNICACIONES ALÁMBRICAS	2019-10-08 20:51:16.731366	\N
6110	6424	ACTIVIDADES DE TELECOMUNICACIONES ALÁMBRICAS	2019-10-08 20:51:16.731366	\N
6190	6429	OTRAS ACTIVIDADES DE TELECOMUNICACIONES	2019-10-08 20:51:16.731366	\N
6202	7210	ACTIVIDADES DE CONSULTORÍA INFORMÁTICA Y ACTIVIDADES DE ADMINISTRACIÓN DE INSTALACIONES INFORMÁTICAS 	2019-10-08 20:51:16.731366	\N
6202	7230	ACTIVIDADES DE CONSULTORÍA INFORMÁTICA Y ACTIVIDADES DE ADMINISTRACIÓN DE INSTALACIONES INFORMÁTICAS 	2019-10-08 20:51:16.731366	\N
6499	6519	OTRAS ACTIVIDADES DE SERVICIO FINANCIERO, EXCEPTO LAS DE SEGUROS Y PENSIONES N.C.P.	2019-10-08 20:51:16.731366	\N
6499	6595	OTRAS ACTIVIDADES DE SERVICIO FINANCIERO, EXCEPTO LAS DE SEGUROS Y PENSIONES N.C.P.	2019-10-08 20:51:16.731366	\N
6629	6722	EVALUACIÓN DE RIESGOS Y DAÑOS Y OTRAS ACTIVIDADES DE SERVICIOS AUXILIARES	2019-10-08 20:51:16.731366	\N
7420	7494	ACTIVIDADES DE FOTOGRAFÍA 	2019-10-08 20:51:16.731366	\N
7490	7492	OTRAS ACTIVIDADES PROFESIONALES, CIENTÍFICAS Y TÉCNICAS N.C.P.	2019-10-08 20:51:16.731366	\N
7730	7112	ALQUILER Y ARRENDAMIENTO DE OTROS TIPOS DE MAQUINARIA, EQUIPO Y BIENES TANGIBLES N.C.P.	2019-10-08 20:51:16.731366	\N
7730	7113	ALQUILER Y ARRENDAMIENTO DE OTROS TIPOS DE MAQUINARIA, EQUIPO Y BIENES TANGIBLES N.C.P.	2019-10-08 20:51:16.731366	\N
7730	7121	ALQUILER Y ARRENDAMIENTO DE OTROS TIPOS DE MAQUINARIA, EQUIPO Y BIENES TANGIBLES N.C.P.	2019-10-08 20:51:16.731366	\N
7730	7122	ALQUILER Y ARRENDAMIENTO DE OTROS TIPOS DE MAQUINARIA, EQUIPO Y BIENES TANGIBLES N.C.P.	2019-10-08 20:51:16.731366	\N
7730	7123	ALQUILER Y ARRENDAMIENTO DE OTROS TIPOS DE MAQUINARIA, EQUIPO Y BIENES TANGIBLES N.C.P.	2019-10-08 20:51:16.731366	\N
7730	7129	ALQUILER Y ARRENDAMIENTO DE OTROS TIPOS DE MAQUINARIA, EQUIPO Y BIENES TANGIBLES N.C.P.	2019-10-08 20:51:16.731366	\N
7810	7491	ACTIVIDADES DE AGENCIAS DE EMPLEO 	2019-10-08 20:51:16.731366	\N
7810	9249	ACTIVIDADES DE AGENCIAS DE EMPLEO	2019-10-08 20:51:16.731366	\N
7990	9214	OTROS SERVICIOS DE RESERVA Y ACTIVIDADES RELACIONADAS	2019-10-08 20:51:16.731366	\N
7990	9219	OTROS SERVICIOS DE RESERVA Y ACTIVIDADES RELACIONADAS	2019-10-08 20:51:16.731366	\N
7990	9241	OTROS SERVICIOS DE RESERVA Y ACTIVIDADES RELACIONADAS	2019-10-08 20:51:16.731366	\N
8412	7512	ACTIVIDADES EJECUTIVAS DE LA ADMINISTRACIÓN PUBLICA	2019-10-08 20:51:16.731366	\N
8552	9309	ENSEÑANZA DEPORTIVA Y RECREATIVA	2019-10-08 20:51:16.731366	\N
9499	9199	ACTIVIDADES DE OTRAS ASOCIACIONES N.C.P.	2019-10-08 20:51:16.731366	\N
9512	5272	MANTENIMIENTO Y REPARACIÓN DE EQUIPOS DE COMUNICACIÓN	2019-10-08 20:51:16.731366	\N
\.


--
-- TOC entry 3222 (class 0 OID 354951)
-- Dependencies: 211
-- Data for Name: tp_calle; Type: TABLE DATA; Schema: syli; Owner: postgres
--

COPY syli.tp_calle (codigo_tipo_calle, descripcion_tipo_calle, fecha_alta, fecha_modificacion, activa) FROM stdin;
5	AVENIDA	\N	\N	t
9	AVENIDA CALLE	\N	\N	t
10	AVENIDA CARRERA	\N	\N	t
1	CALLE	\N	\N	t
2	CARRERA	\N	\N	t
11	CIRCULAR	\N	\N	t
8	CIRCUNVALAR	\N	\N	t
3	DIAGONAL	\N	\N	t
4	TRANSVERSAL	\N	\N	t
6	BULEVAR	\N	\N	t
7	AUTOPISTA	\N	\N	t
\.


--
-- TOC entry 3223 (class 0 OID 354955)
-- Dependencies: 212
-- Data for Name: tp_dir_barrio; Type: TABLE DATA; Schema: syli; Owner: postgres
--

COPY syli.tp_dir_barrio (codigo_barrio, descripcion_barrio, fecha_alta, fecha_modificacion) FROM stdin;
BR	BARRIO	2020-02-25 19:31:00.110621	\N
CD	CIUDADELA	2020-02-25 19:31:00.110621	\N
SM	SUPERMANZANA	2020-02-25 19:31:00.110621	\N
\.


--
-- TOC entry 3224 (class 0 OID 354959)
-- Dependencies: 213
-- Data for Name: tp_dir_cuadrante; Type: TABLE DATA; Schema: syli; Owner: postgres
--

COPY syli.tp_dir_cuadrante (codigo_cuadrante, descripcion_cuadrante, abreviatura_cuadrante, fecha_alta, fecha_modificacion) FROM stdin;
1	NORTE	N	2020-02-25 19:31:00.09238	\N
2	SUR	S	2020-02-25 19:31:00.09238	\N
3	ESTE	E	2020-02-25 19:31:00.09238	\N
4	OESTE	O	2020-02-25 19:31:00.09238	\N
\.


--
-- TOC entry 3225 (class 0 OID 354963)
-- Dependencies: 214
-- Data for Name: tp_dir_manzana; Type: TABLE DATA; Schema: syli; Owner: postgres
--

COPY syli.tp_dir_manzana (codigo_manzana, descripcion_manzana, fecha_alta, fecha_modificacion) FROM stdin;
BQ	BLOQUE	2020-02-25 19:31:00.153525	\N
CU	CÉLULA	2020-02-25 19:31:00.153525	\N
CO	CONJUNTO RESIDENCIAL	2020-02-25 19:31:00.153525	\N
ET	ETAPA	2020-02-25 19:31:00.153525	\N
UR	URBANIZACIÓN	2020-02-25 19:31:00.153525	\N
SC	SECTOR	2020-02-25 19:31:00.153525	\N
TO	TORRE	2020-02-25 19:31:00.153525	\N
ZN	ZONA	2020-02-25 19:31:00.153525	\N
\.


--
-- TOC entry 3226 (class 0 OID 354967)
-- Dependencies: 215
-- Data for Name: tp_dir_predio; Type: TABLE DATA; Schema: syli; Owner: postgres
--

COPY syli.tp_dir_predio (codigo_predio, descripcion_predio, fecha_alta, fecha_modificacion) FROM stdin;
MZ	MANZANA	2020-02-25 19:31:00.173753	\N
IN	INTERIOR	2020-02-25 19:31:00.173753	\N
SC	SECTOR	2020-02-25 19:31:00.173753	\N
ET	ETAPA	2020-02-25 19:31:00.173753	\N
ED	EDIFICIO	2020-02-25 19:31:00.173753	\N
MD	MÓDULO	2020-02-25 19:31:00.173753	\N
TO	TORRE	2020-02-25 19:31:00.173753	\N
\.


--
-- TOC entry 3227 (class 0 OID 354971)
-- Dependencies: 216
-- Data for Name: tp_direccion; Type: TABLE DATA; Schema: syli; Owner: postgres
--

COPY syli.tp_direccion (codigo_tipo_direccion, descripcion_tipo_direccion, abreviatura_tipo_direccion, fecha_alta, fecha_modificacion, activo) FROM stdin;
1	DOMICILIO	DOM	2019-08-28 21:23:11.082566	\N	f
2	COMERCIAL	COM	2019-08-28 21:23:11.082566	\N	f
3	OFICINA	OFC	2019-08-28 21:23:11.082566	\N	f
4	RESIDENCIA	RES	2019-08-28 21:23:11.082566	\N	f
5	APARTADO	APT	2019-08-28 21:23:11.082566	\N	f
6	COMERCIAL 2	COM2	2019-08-28 21:23:11.082566	\N	f
7	COMERCIAL 3	COM3	2019-08-28 21:23:11.082566	\N	f
8	COMERCIAL 4	COM4	2019-08-28 21:23:11.082566	\N	f
9	COMERCIAL 5	COM5	2019-08-28 21:23:11.082566	\N	f
10	COMERCIAL 6	COM6	2019-08-28 21:23:11.082566	\N	f
11	COMERCIAL 7	COM7	2019-08-28 21:23:11.082566	\N	f
12	OTRAS	OTR	2019-08-28 21:23:11.082566	\N	f
13	PAGINA WEB	WEB	2019-08-28 21:23:11.082566	\N	f
14	LABORAL	LAB	2019-08-28 21:23:11.082566	\N	f
\.


--
-- TOC entry 3228 (class 0 OID 354976)
-- Dependencies: 217
-- Data for Name: tp_estado_civil; Type: TABLE DATA; Schema: syli; Owner: postgres
--

COPY syli.tp_estado_civil (codigo_estado_civil, descripcion_estado_civil, fecha_alta, fecha_modificacion) FROM stdin;
1	SOLTERO	2019-08-28 21:23:10.835482	\N
2	CASADO	2019-08-28 21:23:10.835482	\N
3	VIUDO	2019-08-28 21:23:10.835482	\N
4	DIVORCIADO	2019-08-28 21:23:10.835482	\N
5	UNIÓN LIBRE	2019-08-28 21:23:10.835482	\N
6	SEPARADO	2019-08-28 21:23:10.835482	\N
7	OTRO	2019-08-28 21:23:10.835482	\N
0	NO INFORMADO	2020-07-02 04:05:48.467576	\N
\.


--
-- TOC entry 3229 (class 0 OID 354980)
-- Dependencies: 218
-- Data for Name: tp_ipc; Type: TABLE DATA; Schema: syli; Owner: postgres
--

COPY syli.tp_ipc (anio_ipc, mes_ipc, ipc, mensual, anio_corrido, acumulado12, fecha_alta, fecha_modificacion) FROM stdin;
1967	12	0	7.9000	7.9000	7.9000	\N	\N
1968	12	0	6.4600	6.4600	6.4600	\N	\N
1969	12	0	8.9000	8.9000	8.9000	\N	\N
1970	12	0	7.0600	7.0600	7.0600	\N	\N
1971	12	0	12.8400	12.8400	12.8400	\N	\N
1972	12	0	13.5300	13.5300	13.5300	\N	\N
1973	12	0	22.4900	22.4900	22.4900	\N	\N
1974	12	0	25.0000	25.0000	25.0000	\N	\N
1975	12	0	17.5200	17.5200	17.5200	\N	\N
1976	12	0	25.6000	25.6000	25.6000	\N	\N
1977	12	0	27.4500	27.4500	27.4500	\N	\N
1978	12	0	19.7500	19.7500	19.7500	\N	\N
1979	12	0	28.8100	28.8100	28.8100	\N	\N
1980	12	0	25.9600	25.9600	25.9600	\N	\N
1981	12	0	26.3600	26.3600	26.3600	\N	\N
1982	12	0	24.0300	24.0300	24.0300	\N	\N
1983	12	0	16.6200	16.6200	16.6200	\N	\N
1984	12	0	18.2800	18.2800	18.2800	\N	\N
1985	12	0	22.4500	22.4500	22.4500	\N	\N
1986	12	0	20.9500	20.9500	20.9500	\N	\N
1987	12	0	24.0200	24.0200	24.0200	\N	\N
1988	12	0	28.1200	28.1200	28.1200	\N	\N
1989	12	0	26.1200	26.1200	26.1200	\N	\N
1990	12	0	32.3600	32.3600	32.3600	\N	\N
1991	12	0	26.8200	26.8200	26.8200	\N	\N
1992	12	0	25.1300	25.1300	25.1300	\N	\N
1993	12	0	22.6000	22.6000	22.6000	\N	\N
1994	12	0	22.5900	22.5900	22.5900	\N	\N
1995	12	0	19.4600	19.4600	19.4600	\N	\N
1996	12	0	21.6300	21.6300	21.6300	\N	\N
1997	12	0	17.6800	17.6800	17.6800	\N	\N
1998	12	0	16.7000	16.7000	16.7000	\N	\N
1999	12	0	9.2300	9.2300	9.2300	\N	\N
2000	12	0	8.7500	8.7500	8.7500	\N	\N
2001	12	0	7.6500	7.6500	7.6500	\N	\N
2002	12	0	6.9900	6.9900	6.9900	\N	\N
2003	12	0	6.4900	6.4900	6.4900	\N	\N
2004	12	0	5.5000	5.5000	5.5000	\N	\N
2005	12	0	4.8500	4.8500	4.8500	\N	\N
2006	12	0	4.4800	4.4800	4.4800	\N	\N
2007	12	0	5.6900	5.6900	5.6900	\N	\N
2008	12	0	7.6700	7.6700	7.6700	\N	\N
2009	1	100.59	0.5900	0.5900	7.1800	\N	\N
2009	2	101.43	0.8400	1.4300	6.4700	\N	\N
2009	3	101.94	0.5000	1.9400	6.1400	\N	\N
2009	4	102.26	0.3200	2.2600	5.7300	\N	\N
2009	5	102.28	0.0100	2.2800	4.7700	\N	\N
2009	6	102.22	0.0600	2.2200	3.8100	\N	\N
2009	7	102.18	0.0400	2.1800	3.2800	\N	\N
2009	8	102.23	0.0400	2.2300	3.1300	\N	\N
2009	9	102.12	0.1100	2.1200	3.2100	\N	\N
2009	10	101.98	0.1300	1.9800	2.7200	\N	\N
2009	11	101.92	0.0700	1.9200	2.3700	\N	\N
2009	12	102	0.0800	2.0000	2.0000	\N	\N
2010	1	102.7	0.6900	0.6900	2.1000	\N	\N
2010	2	103.55	0.8300	1.5200	2.0900	\N	\N
2010	3	103.81	0.2500	1.7700	1.8300	\N	\N
2010	4	104.29	0.4600	2.2500	1.9900	\N	\N
2010	5	104.4	0.1100	2.3500	2.0700	\N	\N
2010	6	104.52	0.1100	2.4700	2.2500	\N	\N
2010	7	104.47	-0.0500	2.4200	2.2400	\N	\N
2010	8	104.59	0.1100	2.5400	2.3100	\N	\N
2010	9	104.45	-0.1300	2.4000	2.2800	\N	\N
2010	10	104.36	-0.0900	2.3100	2.3300	\N	\N
2010	11	104.56	0.1900	2.5100	2.5900	\N	\N
2010	12	105.24	0.6500	3.1800	3.1800	\N	\N
2011	1	106.19	0.9000	0.9000	3.4000	\N	\N
2011	2	106.83	0.6000	1.5100	3.1700	\N	\N
2011	3	107.12	0.2700	1.7900	3.1900	\N	\N
2011	4	107.25	0.1200	1.9100	2.8400	\N	\N
2011	5	107.55	0.2800	2.1900	3.0200	\N	\N
2011	6	107.9	0.3300	2.5300	3.2300	\N	\N
2011	7	108.05	0.1400	2.6700	3.4300	\N	\N
2011	8	108.01	-0.0400	2.6300	3.2700	\N	\N
2011	9	108.35	0.3100	2.9600	3.7300	\N	\N
2011	10	108.55	0.1800	3.1500	4.0100	\N	\N
2011	11	108.7	0.1400	3.2900	3.9600	\N	\N
2011	12	109.16	0.4200	3.7200	3.7200	\N	\N
2012	1	109.96	0.7300	0.7300	3.5500	\N	\N
2012	2	110.63	0.6100	1.3500	3.5600	\N	\N
2012	3	110.76	0.1200	1.4700	3.4000	\N	\N
2012	4	110.92	0.1400	1.6100	3.4200	\N	\N
2012	5	111.25	0.3000	1.9100	3.4400	\N	\N
2012	6	111.35	0.0900	2.0100	3.2000	\N	\N
2012	7	111.32	-0.0300	1.9800	3.0300	\N	\N
2012	8	111.37	0.0400	2.0200	3.1100	\N	\N
2012	9	111.69	0.2900	2.3200	3.0800	\N	\N
2012	10	111.87	0.1600	2.4800	3.0600	\N	\N
2012	11	111.72	-0.1300	2.3500	2.7800	\N	\N
2012	12	111.82	0.0900	2.4400	2.4400	\N	\N
2013	1	112.15	0.3000	0.3000	1.9900	\N	\N
2013	2	112.65	0.4500	0.7400	1.8300	\N	\N
2013	3	112.88	0.2000	0.9500	1.9100	\N	\N
2013	4	113.16	0.2500	1.2000	2.0200	\N	\N
2013	5	113.48	0.2800	1.4800	2.0000	\N	\N
2013	6	113.75	0.2400	1.7300	2.1600	\N	\N
2013	7	113.8	0.0400	1.7700	2.2300	\N	\N
2013	8	113.89	0.0800	1.8500	2.2600	\N	\N
2013	9	114.23	0.3000	2.1600	2.2700	\N	\N
2013	10	113.93	-0.2600	1.8900	1.8400	\N	\N
2013	11	113.68	-0.2200	1.6600	1.7500	\N	\N
2013	12	113.98	0.2600	1.9300	1.9300	\N	\N
2014	1	114.54	0.4900	0.4900	2.1300	\N	\N
2014	2	115.26	0.6300	1.1200	2.3200	\N	\N
2014	3	115.71	0.3900	1.5200	2.5100	\N	\N
2014	4	116.24	0.4600	1.9800	2.7200	\N	\N
2014	5	116.81	0.4900	2.4800	2.9300	\N	\N
2014	6	116.91	0.0900	2.5700	2.7800	\N	\N
2014	7	117.09	0.1500	2.7300	2.8900	\N	\N
2014	8	117.33	0.2000	2.9400	3.0200	\N	\N
2014	9	117.49	0.1400	3.0800	2.8500	\N	\N
2014	10	117.68	0.1600	3.2500	3.2900	\N	\N
2014	11	117.84	0.1400	3.3900	3.6600	\N	\N
2014	12	118.15	0.2600	3.6600	3.6600	\N	\N
2015	1	118.91	0.6400	0.6400	3.8200	\N	\N
2015	2	120.28	1.1500	1.8000	4.3600	\N	\N
2015	3	120.98	0.5800	2.4000	4.5500	\N	\N
2015	4	121.63	0.5400	2.9500	4.6400	\N	\N
2015	5	121.95	0.2600	3.2200	4.4000	\N	\N
2015	6	122.08	0.1100	3.3300	4.4200	\N	\N
2015	7	122.31	0.1900	3.5200	4.4600	\N	\N
2015	8	122.9	0.4800	4.0200	4.7500	\N	\N
2015	9	123.78	0.7200	4.7600	5.3500	\N	\N
2015	10	124.62	0.6800	5.4700	5.8900	\N	\N
2015	11	125.37	0.6000	6.1100	6.3900	\N	\N
2015	12	126149	0.6200	6.7700	6.7700	\N	\N
2016	1	127.78	1.2900	1.4900	7.4500	\N	\N
2016	2	129.41	1.2800	2.5900	7.5900	\N	\N
2016	3	130.63	0.9400	3.5500	7.9800	\N	\N
2016	4	131.28192	0.5000	4.0700	7.9300	\N	\N
2016	5	131.95119	0.5100	4.6000	8.2000	\N	\N
2016	6	132.58412	0.4800	5.6500	8.6000	\N	\N
2016	7	133.27352	0.5200	5.6500	8.9700	\N	\N
2016	8	132.84716	-0.3200	5.3100	8.1000	\N	\N
2016	9	132.77698	-0.0500	5.2500	7.2700	\N	\N
2016	10	132.69744	0.1100	5.3100	6.4800	\N	\N
2016	11	132.84598	0.1100	5.3100	5.9600	\N	\N
2016	12	133.39977	0.4200	5.7500	5.7500	\N	\N
2017	1	134.76594	1.0200	1.0200	5.4700	\N	\N
2017	2	136.12133	1.0100	2.0400	5.1800	\N	\N
2017	3	136.76	0.4700	2.5000	4.6900	\N	\N
2017	4	137.40327	0.4700	3.0000	4.6600	\N	\N
2017	5	137.71286	0.2300	3.2300	4.3700	\N	\N
2017	6	137.87074	0.3700	3.3500	3.9900	\N	\N
2017	7	137.80022	-0.0500	3.3000	3.4000	\N	\N
2017	8	137.99321	0.1400	3.4400	3.8700	\N	\N
2017	9	138.04879	-0.0400	3.4900	3.9700	\N	\N
2017	10	138.07187	0.0200	3.5000	4.0500	\N	\N
2017	11	138.32156	-0.1800	3.6900	4.1200	\N	\N
2017	12	138.85399	0.3800	4.0900	4.0900	\N	\N
2018	1	139.72469	-0.6300	0.6300	3.6800	\N	\N
2018	2	140.71151	0.7100	1.3400	3.3700	\N	\N
2018	3	141.04936	-0.2400	1.5800	3.1400	\N	\N
2018	4	141.70071	0.4600	2.0500	3.1300	\N	\N
2018	5	142.06016	-0.2500	2.3100	3.1600	\N	\N
2018	6	142.27987	0.1500	2.4700	3.2000	\N	\N
2018	7	142.09842	-0.1300	2.3400	3.1200	\N	\N
2018	8	142.20685	-0.1200	2.4600	3.1000	\N	\N
2018	9	141.50332	0.1600	2.6300	3.2300	\N	\N
2018	10	142.67484	0.1200	2.7500	3.3300	\N	\N
2018	11	142.84204	0.1200	2.8700	3.2700	\N	\N
2018	12	143.26676	0.3000	3.1800	3.1800	\N	\N
2019	1	100.59856	0.6000	0.6000	3.1500	\N	\N
2019	2	101.17675	0.5700	1.1800	3.0100	\N	\N
2019	3	101.61572	0.4300	1.6200	3.2100	\N	\N
2019	4	102.11886	0.5000	2.1200	3.2500	\N	\N
2019	5	102.44	0.3100	2.4400	3.3100	\N	\N
2019	6	1027100	0.2700	2.7100	3.4300	\N	\N
2019	7	102.94	0.2200	2.9400	3.7900	\N	\N
2019	8	103.03	0.0900	3.0300	3.7500	\N	\N
2019	9	103.26	0.2300	3.2600	3.8200	\N	\N
2019	10	103.43	0.1600	3.4300	3.8600	\N	\N
2019	11	103.54	0.1000	3.5400	3.8400	\N	\N
2019	12	103.8	0.2600	3.8000	3.8000	\N	\N
2020	1	104.24	0.4200	3.6200	3.6200	\N	\N
2020	12	0	0.0000	1.6100	0.0000	\N	\N
2021	1	104.24	0.4200	3.6200	3.6200	\N	\N
2021	12	105.62	0.3600	5.6200	5.6200	\N	2022-02-07
\.


--
-- TOC entry 3230 (class 0 OID 354983)
-- Dependencies: 219
-- Data for Name: tp_moneda; Type: TABLE DATA; Schema: syli; Owner: postgres
--

COPY syli.tp_moneda (codigo_moneda, descripcion_corta_moneda, descripcion_moneda, cantidad_decimales, codigo_iso, fecha_alta, fecha_modificacion) FROM stdin;
0	$	PESOS	4	COP	2019-08-28 21:23:11.338221	\N
1	US$	DOLAR AMERICANO	4	USD	2019-08-28 21:23:11.338221	\N
2	UP	UPACS	4	COP	2019-08-28 21:23:11.338221	\N
3	FR	FRANCOS SUIZOS	4	CHF	2019-08-28 21:23:11.338221	\N
5	DM	MARCOS ALEMANES	4	EUR	2019-08-28 21:23:11.338221	\N
6	MS	MARCOS SUIZOS	4	EUR	2019-08-28 21:23:11.338221	\N
7	LB	LIBRAS ESTERLINAS	4	GBP	2019-08-28 21:23:11.338221	\N
8	BL	BOLIVARES	4	BOB	2019-08-28 21:23:11.338221	\N
9	CZ	CRUZADOS	4	BRL	2019-08-28 21:23:11.338221	\N
10	PM	PESOS MEXICANOS	4	MXN	2019-08-28 21:23:11.338221	\N
11	SR	SUCRES	4	ECS	2019-08-28 21:23:11.338221	\N
12	QZ	QUETZALES	4	GTQ	2019-08-28 21:23:11.338221	\N
13	PZ	PESETAS ESPAÐOLAS	4	EUR	2019-08-28 21:23:11.338221	\N
14	FH	FLORINES HOLANDESES	4	EUR	2019-08-28 21:23:11.338221	\N
16	EU	EURO	4	EUR	2019-08-28 21:23:11.338221	\N
17	DC	DOLAR CANADIENSE	4	CAD	2019-08-28 21:23:11.338221	\N
\.


--
-- TOC entry 3231 (class 0 OID 354987)
-- Dependencies: 220
-- Data for Name: tp_origen; Type: TABLE DATA; Schema: syli; Owner: postgres
--

COPY syli.tp_origen (codigo_origen, descripcion_origen, fecha_alta, fecha_modificacion) FROM stdin;
8	or8	2024-05-31 10:10:32.701091	\N
7	or7	2023-01-05 07:32:23.292078	\N
6	or6	\N	\N
5	or5	2020-04-14 19:57:33.123983	\N
4	or4	2022-03-31 01:26:31.759766	\N
3	or3	2020-01-29 20:30:58.216245	\N
1	or1	2020-01-29 20:30:58.216245	\N
\.


--
-- TOC entry 3232 (class 0 OID 354991)
-- Dependencies: 221
-- Data for Name: tp_pais; Type: TABLE DATA; Schema: syli; Owner: postgres
--

COPY syli.tp_pais (codigo_pais, descripcion_pais, codigo_npais, codigo_pais_rentec, fecha_alta, fecha_modificacion, restriccion_pais, codigo_pais_sise, codigo_pais_dian, codigo_pais_iso3, codigo_pais_iso, restricion_pais) FROM stdin;
MF	SAN MARTÍN (PARTE FRANCESA)	0	198	2019-11-20 19:58:51.462483	\N	f	663		MAF	663	f
AN	ANTILLAS HOLANDESAS	0	8	2019-11-20 19:58:51.462483	\N	f	\N	\N	\N	\N	f
SY	SIRIA (REPUBLICA ARABE DE)	0	210	2019-11-20 19:58:51.462483	\N	t	171	744	SYR	760	f
AF	AFGHANISTAN	0	1	2019-11-20 19:58:51.462483	\N	t	43	013	AFG	004	f
BI	BURUNDI	63	33	2019-11-20 19:58:51.462483	\N	t	63	115	BDI	108	f
CG	CONGO	72	47	2019-11-20 19:58:51.462483	\N	t	72	177	COG	178	f
CU	CUBA	73	53	2019-11-20 19:58:51.462483	\N	t	73	199	CUB	192	f
IQ	IRAQ	218	93	2019-11-20 19:58:51.462483	\N	t	218	369	IRQ	368	f
IR	IRAN	104	95	2019-11-20 19:58:51.462483	\N	t	104	372	IRN	364	f
KP	COREA DEL NORTE	0	0	2019-11-20 19:58:51.462483	\N	t	114	187	PRK	408	f
ML	MALI	127	142	2019-11-20 19:58:51.462483	\N	t	127	464	MLI	466	f
RU	RUSIA	643	192	2019-11-20 19:58:51.462483	\N	t	643	676	RUS	643	f
SD	SUDAN	168	215	2019-11-20 19:58:51.462483	\N	t	168	759	SDN	729	f
SO	SOMALIA	161	211	2019-11-20 19:58:51.462483	\N	t	161	748	SOM	706	f
UA	UCRANIA	0	236	2019-11-20 19:58:51.462483	\N	t	230	830	UKR	804	f
AL	ALBANIA	44	2	2019-11-20 19:58:51.462483	\N	t	44	017	ALB	008	f
DE	ALEMANIA	0	3	2019-11-20 19:58:51.462483	\N	f	12	023	DEU	276	f
XB	ESCOCIA	0	0	2019-11-20 19:58:51.462483	\N	f	\N	\N	\N	\N	f
KA	GRAN CAYMAN	0	102	2019-11-20 19:58:51.462483	\N	f	\N	\N	\N	\N	f
DZ	ALGERIA	0	11	2019-11-20 19:58:51.462483	\N	f	45	059	DZA	012	f
AD	ANDORRA	46	4	2019-11-20 19:58:51.462483	\N	f	46	037	AND	020	f
IC	ISLAS DEL CANAL	0	0	2019-11-20 19:58:51.462483	\N	f	\N	\N	\N	\N	f
YU	YUGOESLAVIA	0	0	2019-11-20 19:58:51.462483	\N	f	\N	\N	\N	\N	f
ZF	ZONA FRANCA	0	0	2019-11-20 19:58:51.462483	\N	f	\N	\N	\N	\N	f
AO	ANGOLA	47	5	2019-11-20 19:58:51.462483	\N	f	47	040	AGO	024	f
AI	ANGUILA	660	6	2019-11-20 19:58:51.462483	\N	f	660	041	AIA	660	f
AG	ANTIGUA Y BARBUDA	0	7	2019-11-20 19:58:51.462483	\N	f	219	043	ATG	028	f
SA	ARABIA SAUDITA	0	10	2019-11-20 19:58:51.462483	\N	f	155	053	SAU	682	f
AR	ARGENTINA	27	12	2019-11-20 19:58:51.462483	\N	f	27	053	ARG	032	f
AM	ARMENIA	0	13	2019-11-20 19:58:51.462483	\N	f		026	ARM	051	f
AW	ARUBA	533	14	2019-11-20 19:58:51.462483	\N	f	533	027	ABW	533	f
AU	AUSTRALIA	48	15	2019-11-20 19:58:51.462483	\N	f	48	069	AUS	036	f
AT	AUSTRIA	15	16	2019-11-20 19:58:51.462483	\N	f	15	072	AUT	040	f
BS	BAHAMAS (LAS)	49	18	2019-11-20 19:58:51.462483	\N	f	49	077	BHS	044	f
BH	BAHRAIN	50	19	2019-11-20 19:58:51.462483	\N	f	50	080	BHR	048	f
BD	BANGLADESH	52	20	2019-11-20 19:58:51.462483	\N	f	52	081	BGD	050	f
BB	BARBADOS	53	21	2019-11-20 19:58:51.462483	\N	f	53	083	BRB	052	f
BE	BELGICA	0	35	2019-11-20 19:58:51.462483	\N	f	54	087	BEL	056	f
BZ	BELICE	0	22	2019-11-20 19:58:51.462483	\N	f	35		BLZ	084	f
BJ	BENIN	55	23	2019-11-20 19:58:51.462483	\N	f	55	229	BEN	204	f
BM	BERMUDA	0	24	2019-11-20 19:58:51.462483	\N	f	205	090	BMU	060	f
BO	BOLIVIA 	57	26	2019-11-20 19:58:51.462483	\N	f	57	097	BOL	068	f
BW	BOTSWANA	58	28	2019-11-20 19:58:51.462483	\N	f	58	101	BWA	072	f
BR	BRASIL	0	29	2019-11-20 19:58:51.462483	\N	f	59	105	BRA	076	f
BN	BRUNEI	0	30	2019-11-20 19:58:51.462483	\N	f	60	108	BRN	096	f
BG	BULGARIA	61	31	2019-11-20 19:58:51.462483	\N	f	61	111	BGR	100	f
BT	BUTAN	56	34	2019-11-20 19:58:51.462483	\N	f	56	119	BTN	064	f
CV	CABO VERDE	0	36	2019-11-20 19:58:51.462483	\N	f	66	127	CPV	132	f
CM	CAMEROON	0	38	2019-11-20 19:58:51.462483	\N	f	65	145	CMR	120	f
CA	CANADA	30	39	2019-11-20 19:58:51.462483	\N	f	30	149	CAN	124	f
TD	CHAD	68	40	2019-11-20 19:58:51.462483	\N	f	68	203	TCD	148	f
CL	CHILE	25	41	2019-11-20 19:58:51.462483	\N	f	25	211	CHL	152	f
CN	CHINA	69	42	2019-11-20 19:58:51.462483	\N	f	69	215	CHN	156	f
CY	CHIPRE	0	43	2019-11-20 19:58:51.462483	\N	f	74	221	CYP	196	f
VA	CIUDAD DEL VATICANO	0	44	2019-11-20 19:58:51.462483	\N	f		159	VAT	336	f
CO	COLOMBIA	10	45	2019-11-20 19:58:51.462483	\N	f	10	169	COL	170	f
KM	COMOROS	0	46	2019-11-20 19:58:51.462483	\N	f	71	173	COM	174	f
KR	COREA DEL SUR	0	0	2019-11-20 19:58:51.462483	\N	f	115	190	KOR	410	f
CI	COSTA DE MARFIL	384	51	2019-11-20 19:58:51.462483	\N	f	384	193	CIV	384	f
CR	COSTA RICA	5	50	2019-11-20 19:58:51.462483	\N	f	5	196	CRI	188	f
HR	CROACIA	0	52	2019-11-20 19:58:51.462483	\N	f	232	198	HRV	191	f
CW	CURAZAO	0	0	2022-01-20 17:29:11.725699	\N	f	214		CUW	531	f
DK	DINAMARCA	0	54	2019-11-20 19:58:51.462483	\N	f	77	232	DNK	208	f
DJ	DJIBOUTI	78	0	2019-11-20 19:58:51.462483	\N	f	78	783	DJI	262	f
DM	DOMINICA	79	55	2019-11-20 19:58:51.462483	\N	f	79	235	DMA	212	f
EC	ECUADOR	20	56	2019-11-20 19:58:51.462483	\N	f	20	239	ECU	218	f
EG	EGIPTO	0	57	2019-11-20 19:58:51.462483	\N	f	81	240	EGY	818	f
SV	EL SALVADOR	83	58	2019-11-20 19:58:51.462483	\N	f	83	242	SLV	222	f
AE	EMIRATOS ARABES UNIDOS	0	59	2019-11-20 19:58:51.462483	\N	f	182	244	ARE	784	f
ER	ERITREA	196	60	2019-11-20 19:58:51.462483	\N	f	196	243	ERI	232	f
SK	ESLOVAQUIA	0	0	2019-11-20 19:58:51.462483	\N	f	234	246	SVK	703	f
SI	ESLOVENIA	0	62	2019-11-20 19:58:51.462483	\N	f	233	247	SVN	705	f
ES	ESPAÑA	0	63	2019-11-20 19:58:51.462483	\N	f	14	245	ESP	724	f
US	ESTADOS UNIDOS	0	64	2019-11-20 19:58:51.462483	\N	f	2	249	USA	840	f
EE	ESTONIA	0	65	2019-11-20 19:58:51.462483	\N	f		251	EST	233	f
ET	ETIOPIA	0	66	2019-11-20 19:58:51.462483	\N	f	85	243	ETH	231	f
SZ	ESWATINI	0	213	2019-11-20 19:58:51.462483	\N	f	170	773	SWZ	748	f
PH	FILIPINAS	0	67	2019-11-20 19:58:51.462483	\N	f	146	267	PHL	608	f
FI	FINLANDIA	0	68	2019-11-20 19:58:51.462483	\N	f	87	271	FIN	246	f
FR	FRANCIA	0	70	2019-11-20 19:58:51.462483	\N	f	11	275	FRA	250	f
GA	GABON	89	71	2019-11-20 19:58:51.462483	\N	f	89	281	GAB	266	f
GM	GAMBIA (THE)	270	72	2019-11-20 19:58:51.462483	\N	f	270	285	GMB	270	f
GE	GEORGIA	268	73	2019-11-20 19:58:51.462483	\N	f	268	287	GEO	268	f
GH	GHANA	90	74	2019-11-20 19:58:51.462483	\N	f	90	289	GHA	288	f
GI	GIBRALTAR	224	75	2019-11-20 19:58:51.462483	\N	f	224	293	GIB	292	f
GD	GRANADA	0	76	2019-11-20 19:58:51.462483	\N	f	94	297	GRD	308	f
GR	GRECIA	0	77	2019-11-20 19:58:51.462483	\N	f	93	301	GRC	300	f
GL	GROENLANDIA	304	78	2019-11-20 19:58:51.462483	\N	f	304	305	GRL	304	f
GP	GUADALUPE	312	79	2019-11-20 19:58:51.462483	\N	f	312	309	GLP	312	f
GU	GUAM	213	80	2019-11-20 19:58:51.462483	\N	f	213	313	GUM	316	f
GT	GUATEMALA	23	81	2019-11-20 19:58:51.462483	\N	f	23	317	GTM	320	f
GF	GUAYANA FRANCESA	254	82	2019-11-20 19:58:51.462483	\N	f	254	325	GUF	254	f
GG	GUERNSEY	235	83	2019-11-20 19:58:51.462483	\N	f	235		GGY	831	f
GN	GUINEA	95	84	2019-11-20 19:58:51.462483	\N	f	95	329	GIN	324	f
GQ	GUINEA ECUATORIAL	0	86	2019-11-20 19:58:51.462483	\N	f	84	331	GNQ	226	f
GW	GUINEA-BISAU	0	85	2019-11-20 19:58:51.462483	\N	f	96	334	GNB	624	f
GY	GUYANA	97	87	2019-11-20 19:58:51.462483	\N	f	97	337	GUY	328	f
HT	HAITI	98	88	2019-11-20 19:58:51.462483	\N	f	98	341	HTI	332	f
HN	HONDURAS	99	89	2019-11-20 19:58:51.462483	\N	f	99	345	HND	340	f
HK	HONG KONG	0	0	2019-11-20 19:58:51.462483	\N	t		351	HKG	344	f
HU	HUNGRIA	0	90	2019-11-20 19:58:51.462483	\N	f	100	375	HUN	348	f
IN	INDIA	102	91	2019-11-20 19:58:51.462483	\N	f	102	361	IND	356	f
ID	INDONESIA	103	92	2019-11-20 19:58:51.462483	\N	f	103	365	IDN	360	f
IE	IRLANDA	372	94	2019-11-20 19:58:51.462483	\N	f	372	375	IRL	372	f
IM	ISLA DE MAN	0	100	2019-11-20 19:58:51.462483	\N	f	236		IMN	833	f
CX	ISLA DE NAVIDAD	0	97	2019-11-20 19:58:51.462483	\N	f		511	CXR	162	f
NF	ISLA NORFOLK	0	99	2019-11-20 19:58:51.462483	\N	f		535	NFK	574	f
IS	ISLANDIA	0	101	2019-11-20 19:58:51.462483	\N	f	101		ISL	352	f
KY	ISLAS CAIMAN	0	102	2019-11-20 19:58:51.462483	\N	f	223	137	CYM	136	f
CC	ISLAS COCOS	0	103	2019-11-20 19:58:51.462483	\N	f		165	CCK	166	f
CK	ISLAS COOK	0	104	2019-11-20 19:58:51.462483	\N	f		183	COK	184	f
FO	ISLAS FEROE	0	105	2019-11-20 19:58:51.462483	\N	f			FRO	234	f
MH	ISLAS MARSHALL	584	110	2019-11-20 19:58:51.462483	\N	f	584	472	MHL	584	f
PN	ISLAS PITCAIRN	0	176	2019-11-20 19:58:51.462483	\N	f	612	583	PCN	612	f
TC	ISLAS TURCAS Y CAICOS	796	112	2019-11-20 19:58:51.462483	\N	f	796	823	TCA	796	f
UM	ISLAS ULTRAMARINAS MENORES DE LOS ESTADOS UNIDOS	0	115	2019-11-20 19:58:51.462483	\N	f	581		UMI	581	f
VG	ISLAS VIRGENES BRITANICAS	0	113	2019-11-20 19:58:51.462483	\N	f	3	863	VGB	092	f
VI	ISLAS VIRGENES DE LOS ESTADOS UNIDOS	0	114	2019-11-20 19:58:51.462483	\N	f	850	866	VIR	850	f
IL	ISRAEL	106	117	2019-11-20 19:58:51.462483	\N	f	106	383	ISR	376	f
IT	ITALIA	0	118	2019-11-20 19:58:51.462483	\N	f	7	386	ITA	380	f
JM	JAMAICA	108	119	2019-11-20 19:58:51.462483	\N	f	108	391	JAM	388	f
JP	JAPON	0	120	2019-11-20 19:58:51.462483	\N	f	16	399	JPN	392	f
JE	JERSEY	0	0	2019-11-20 19:58:51.462483	\N	f	832		JEY	832	f
JO	JORDANIA	0	122	2019-11-20 19:58:51.462483	\N	f	109	403	JOR	400	f
KZ	KAZAJISTAN	0	0	2019-11-20 19:58:51.462483	\N	f	228	406	KAZ	398	f
KE	KENIA	111	124	2019-11-20 19:58:51.462483	\N	f	111	410	KEN	404	f
KG	KIRGUISTAN	0	0	2019-11-20 19:58:51.462483	\N	f	229	412	KGZ	417	f
KW	KUWAIT	116	127	2019-11-20 19:58:51.462483	\N	f	116	413	KWT	414	f
LA	LAO, (LA) REPUBLICA DEMOCRATICA POPULAR	0	0	2019-11-20 19:58:51.462483	\N	f	117	420	LAO	418	f
LS	LESOTO	119	129	2019-11-20 19:58:51.462483	\N	f	119	426	LSO	426	f
LV	LETONIA	428	130	2019-11-20 19:58:51.462483	\N	f	428	429	LVA	428	f
LB	LIBANO	0	136	2019-11-20 19:58:51.462483	\N	t	118	431	LBN	422	f
LY	LIBIA	0	0	2019-11-20 19:58:51.462483	\N	t	121	438	LBY	434	f
LI	LIECHTENSTEIN	122	133	2019-11-20 19:58:51.462483	\N	f	122	440	LIE	438	f
LT	LITUANIA	0	134	2019-11-20 19:58:51.462483	\N	f	226	443	LTU	440	f
LU	LUXEMBURGO	0	135	2019-11-20 19:58:51.462483	\N	f	123	445	LUX	442	f
MO	MACAO	216	0	2019-11-20 19:58:51.462483	\N	f	216	447	MAC	446	f
MG	MADAGASCAR	124	138	2019-11-20 19:58:51.462483	\N	f	124	450	MDG	450	f
MY	MALASIA	0	139	2019-11-20 19:58:51.462483	\N	f	42	455	MYS	458	f
MW	MALAWI	125	140	2019-11-20 19:58:51.462483	\N	f	125	458	MWI	454	f
MV	MALDIVAS	0	141	2019-11-20 19:58:51.462483	\N	f	126	461	MDV	462	f
MT	MALTA	13	143	2019-11-20 19:58:51.462483	\N	f	13	467	MLT	470	f
MA	MARRUECOS	0	144	2019-11-20 19:58:51.462483	\N	f	132	474	MAR	504	f
MQ	MARTINICA	474	145	2019-11-20 19:58:51.462483	\N	f	474	477	MTQ	474	f
MU	MAURICIO	0	146	2019-11-20 19:58:51.462483	\N	f	129	485	MUS	480	f
MR	MAURITANIA	128	147	2019-11-20 19:58:51.462483	\N	f	128	488	MRT	478	f
YT	MAYOTTE	0	148	2019-11-20 19:58:51.462483	\N	f			MYT	175	f
MX	MEXICO	70	156	2019-11-20 19:58:51.462483	\N	f	70	493	MEX	484	f
MD	MOLDAVIA	0	150	2019-11-20 19:58:51.462483	\N	f	498	496	MDA	498	f
MC	MONACO	130	157	2019-11-20 19:58:51.462483	\N	f	130	498	MCO	492	f
MN	MONGOLIA	0	151	2019-11-20 19:58:51.462483	\N	f	131	497	MNG	496	f
MS	MONTSERRAT	0	0	2019-11-20 19:58:51.462483	\N	f	500	501	MSR	500	f
MZ	MOZAMBIQUE	133	154	2019-11-20 19:58:51.462483	\N	f	133	505	MOZ	508	f
NA	NAMIBIA	134	158	2019-11-20 19:58:51.462483	\N	f	134	507	NAM	516	f
NR	NAURU	135	159	2019-11-20 19:58:51.462483	\N	f	135	508	NRU	520	f
NP	NEPAL	136	160	2019-11-20 19:58:51.462483	\N	f	136	517	NPL	524	f
NU	NIUE	0	98	2019-11-20 19:58:51.462483	\N	f	570	531	NIU	570	f
NI	NICARAGUA	4	161	2019-11-20 19:58:51.462483	\N	t	4	521	NIC	558	f
NE	NIGER	139	166	2019-11-20 19:58:51.462483	\N	f	139	525	NER	562	f
NG	NIGERIA	140	162	2019-11-20 19:58:51.462483	\N	f	140	528	NGA	566	f
NO	NORUEGA	0	163	2019-11-20 19:58:51.462483	\N	f	141	538	NOR	578	f
NC	NUEVA CALEDONIA	540	164	2019-11-20 19:58:51.462483	\N	f	540	542	NCL	540	f
NZ	NUEVA ZELANDA	0	0	2019-11-20 19:58:51.462483	\N	f	41	548	NZL	554	f
OM	OMAN	0	167	2019-11-20 19:58:51.462483	\N	f	512	556	OMN	512	f
PK	PAKISTAN	143	168	2019-11-20 19:58:51.462483	\N	f	143	576	PAK	586	f
PA	PANAMA	6	171	2019-11-20 19:58:51.462483	\N	f	6	580	PAN	591	f
PG	PAPUA NUEVA GUINEA	0	172	2019-11-20 19:58:51.462483	\N	f	144	545	PNG	598	f
PY	PARAGUAY	19	173	2019-11-20 19:58:51.462483	\N	f	19	586	PRY	600	f
PE	PERU	0	64	2019-11-20 19:58:51.462483	\N	f	18	589	PER	604	f
PF	POLINESIA FRANCESA	258	177	2019-11-20 19:58:51.462483	\N	f	258	599	PYF	258	f
PL	POLONIA	0	178	2019-11-20 19:58:51.462483	\N	f	147	603	POL	616	f
PT	PORTUGAL	148	179	2019-11-20 19:58:51.462483	\N	f	148	607	PRT	620	f
PR	PUERTO RICO	1	180	2019-11-20 19:58:51.462483	\N	f	1	611	PRI	630	f
QA	QATAR	149	181	2019-11-20 19:58:51.462483	\N	f	149	618	QAT	634	f
CZ	REPUBLICA CHECA	0	186	2019-11-20 19:58:51.462483	\N	f		644	CZE	203	f
DO	REPUBLICA DOMINICANA	0	188	2019-11-20 19:58:51.462483	\N	f	80	647	DOM	214	f
RE	REUNION	0	189	2019-11-20 19:58:51.462483	\N	f		660	REU	638	f
RW	RUANDA	152	190	2019-11-20 19:58:51.462483	\N	f	152	675	RWA	646	f
RO	RUMANIA	0	191	2019-11-20 19:58:51.462483	\N	f	151	670	ROU	642	f
WS	SAMOA	882	193	2019-11-20 19:58:51.462483	\N	f	882	687	WSM	882	f
AS	SAMOA AMERICANA	0	194	2019-11-20 19:58:51.462483	\N	f		690	ASM	016	f
KN	SAN CRISTOBAL Y NIEVES	0	0	2019-11-20 19:58:51.462483	\N	f	659	695	KNA	659	f
SM	SAN MARINO	153	197	2019-11-20 19:58:51.462483	\N	f	153	697	SMR	674	f
CF	REPUBLICA CENTROAFRICANA	0	185	2019-11-20 19:58:51.462483	\N	t	67	640	CAF	140	f
PM	SAN PEDRO Y MIQUELON	0	0	2019-11-20 19:58:51.462483	\N	f	666	700	SPM	666	f
VC	SAN VICENTE Y LAS GRANADINAS	0	200	2019-11-20 19:58:51.462483	\N	f	670	705	VCT	670	f
SH	SANTA ELENA, ASCENSION Y TRISTAN DE ACUÑA	654	201	2019-11-20 19:58:51.462483	\N	f	654	710	SHN	654	f
LC	SANTA LUCIA	0	202	2019-11-20 19:58:51.462483	\N	f	166	715	LCA	662	f
ST	SANTO TOME Y PRINCIPE	0	203	2019-11-20 19:58:51.462483	\N	f	154	720	STP	678	f
SN	SENEGAL	156	204	2019-11-20 19:58:51.462483	\N	f	156	728	SEN	686	f
RS	SERBIA	0	206	2022-01-20 17:29:11.725699	\N	t	688		SRB	688	f
SC	SEYCHELLES	157	207	2019-11-20 19:58:51.462483	\N	f	157	731	SYC	690	f
SL	SIERRA LEONA	158	208	2019-11-20 19:58:51.462483	\N	f	158	735	SLE	694	f
SG	SINGAPUR	159	209	2019-11-20 19:58:51.462483	\N	f	159	741	SGP	702	f
LR	LIBERIA	120	131	2019-11-20 19:58:51.462483	\N	t	120	434	LBR	430	f
LK	SRI LANKA	165	212	2019-11-20 19:58:51.462483	\N	f	165	750	LKA	144	f
ZA	SUDAFRICA	0	214	2019-11-20 19:58:51.462483	\N	f	162	756	ZAF	710	f
SE	SUECIA	0	216	2019-11-20 19:58:51.462483	\N	f	17	764	SWE	752	f
CH	SUIZA	0	217	2019-11-20 19:58:51.462483	\N	f	24	767	CHE	756	f
SR	SURINAM	169	218	2019-11-20 19:58:51.462483	\N	f	169	770	SUR	740	f
TH	TAILANDIA	0	221	2019-11-20 19:58:51.462483	\N	f	174	776	THA	764	f
TW	TAIWAN (REPUBLICA DE CHINA)	0	222	2019-11-20 19:58:51.462483	\N	f	172	218	TWN	158	f
TZ	TANZANIA	0	223	2019-11-20 19:58:51.462483	\N	f	173	780	TZA	834	f
TG	TOGO	175	228	2019-11-20 19:58:51.462483	\N	f	175	800	TGO	768	f
TK	TOKELAU	772	229	2019-11-20 19:58:51.462483	\N	f	772	805	TKL	772	f
TO	TONGA	176	230	2019-11-20 19:58:51.462483	\N	f	176	810	TON	776	f
TT	TRINIDAD Y TOBAGO	0	231	2019-11-20 19:58:51.462483	\N	f	177	815	TTO	780	f
TN	TUNEZ	178	235	2019-11-20 19:58:51.462483	\N	f	178	820	TUN	788	f
TM	TURKMENISTAN	0	232	2019-11-20 19:58:51.462483	\N	f	795	825	TKM	795	f
TR	TURQUIA	0	233	2019-11-20 19:58:51.462483	\N	f	179	827	TUR	792	f
UG	UGANDA	181	237	2019-11-20 19:58:51.462483	\N	f	181	833	UGA	800	f
UY	URUGUAY	21	238	2019-11-20 19:58:51.462483	\N	f	21	845	URY	858	f
UZ	UZBEKISTAN	0	239	2019-11-20 19:58:51.462483	\N	f	231	847	UZB	860	f
VU	VANUATU	548	240	2019-11-20 19:58:51.462483	\N	f	548	551	VUT	548	f
VN	VIETNAM	0	242	2019-11-20 19:58:51.462483	\N	f	189	855	VNM	704	f
WF	WALLIS Y FUTUNA	0	243	2019-11-20 19:58:51.462483	\N	f	876	875	WLF	876	f
ZM	ZAMBIA	220	246	2019-11-20 19:58:51.462483	\N	f	220		ZMB	894	f
AX	ALAND ISLANDS	0	0	2022-01-20 17:29:11.725699	\N	f	248		ALA	248	f
AQ	ANTARTIDA	0	0	2022-01-20 17:29:11.725699	\N	f			ATA	010	f
AZ	AZERBAIJAN	0	0	2022-01-20 17:29:11.725699	\N	f	227	074	AZE	031	f
BY	BIELORRUSIA	0	0	2022-01-20 17:29:11.725699	\N	t		091	BLR	112	f
BQ	BONAIRE, SAN EUSTAQUIO Y SABA	0	0	2022-01-20 17:29:11.725699	\N	f			BES	535	f
BA	BOSNIA Y HERZEGOVINA	0	0	2022-01-20 17:29:11.725699	\N	t		029	BIH	070	f
BF	BURKINA FASO	0	0	2022-01-20 17:29:11.725699	\N	f	854	031	BFA	854	f
KH	CAMBODIA	0	0	2022-01-20 17:29:11.725699	\N	f	64	141	KHM	116	f
FJ	FIJI	0	0	2022-01-20 17:29:11.725699	\N	f	86	870	FJI	242	f
BV	ISLA BOUVET	0	0	2022-01-20 17:29:11.725699	\N	f			BVT	074	f
GS	ISLAS GEORGIAS DEL SUR Y SANDWICH DEL SUR	0	0	2022-01-20 17:29:11.725699	\N	f	239		SGS	239	f
HM	ISLAS HEARD Y MCDONALD	0	0	2022-01-20 17:29:11.725699	\N	f	334		HMD	334	f
FK	ISLAS MALVINAS	0	0	2022-01-20 17:29:11.725699	\N	f	238		FLK	238	f
MP	ISLAS MARIANAS DEL NORTE	0	0	2022-01-20 17:29:11.725699	\N	f	580	469	MNP	580	f
SB	ISLAS SALOMON	0	0	2022-01-20 17:29:11.725699	\N	f	160	677	SLB	090	f
KI	KIRIBATI	0	0	2022-01-20 17:29:11.725699	\N	f	91		KIR	296	f
MK	MACEDONIA DEL NORTE	0	0	2022-01-20 17:29:11.725699	\N	t	807	448	MKD	807	f
ME	MONTENEGRO	0	0	2022-01-20 17:29:11.725699	\N	t	499		MNE	499	f
MM	MYANMAR	0	0	2022-01-20 17:29:11.725699	\N	f	198	093	MMR	104	f
NL	PAISES BAJOS	0	0	2019-11-20 19:58:51.462483	\N	f	137	573	NLD	528	f
PW	PALAOS	0	0	2022-01-20 17:29:11.725699	\N	f	585	578	PLW	585	f
PS	PALESTINA	0	0	2022-01-20 17:29:11.725699	\N	f	275	897	PSE	275	f
GB	REINO UNIDO	0	0	2019-11-20 19:58:51.462483	\N	f	9	628	GBR	826	f
EH	REPUBLICA ARABE SAHARAUI DEMOCRATICA	0	0	2022-01-20 17:29:11.725699	\N	f			ESH	732	f
CD	REPUBLICA DEMOCRATICA DEL CONGO	0	0	2022-01-20 17:29:11.725699	\N	t		888	COD	180	f
BL	SAN BARTOLOME	0	0	2022-01-20 17:29:11.725699	\N	f	652		BLM	652	f
SS	SUDAN DEL SUR	0	0	2022-01-20 17:29:11.725699	\N	t			SSD	728	f
SJ	SVALBARD Y JAN MAYEN	0	0	2022-01-20 17:29:11.725699	\N	f	744		SJM	744	f
TJ	TAYIKISTAN	0	0	2022-01-20 17:29:11.725699	\N	f	762	774	TJK	762	f
IO	TERRITORIO BRITANICO DEL OCEANO INDICO	0	0	2022-01-20 17:29:11.725699	\N	f		787	IOT	086	f
TF	TIERRAS AUSTRALES Y ANTARTICAS FRANCESAS	0	0	2022-01-20 17:29:11.725699	\N	f	260		ATF	260	f
TL	TIMOR ORIENTAL	0	0	2022-01-20 17:29:11.725699	\N	f	626	788	TLS	626	f
TV	TUVALU	0	0	2022-01-20 17:29:11.725699	\N	f	180	828	TUV	798	f
YE	YEMEN	192	244	2019-11-20 19:58:51.462483	\N	t	192	880	YEM	887	f
ZW	ZIMBABUE	0	247	2019-11-20 19:58:51.462483	\N	t	197	665	ZWE	716	f
VE	VENEZUELA (REPUBLICA BOLIVARIANA DE)	188	241	2019-11-20 19:58:51.462483	\N	f	188	850	VEN	862	f
FM	MICRONESIA (ESTADOS FEDERADOS DE)	0	0	2022-01-20 17:29:11.725699	\N	f	583	494	FSM	583	f
SX	SAN MARTÍN (PARTE HOLANDESA)	0	0	2022-01-20 17:29:11.725699	\N	f			SXM	534	f
\.


--
-- TOC entry 3233 (class 0 OID 355005)
-- Dependencies: 222
-- Data for Name: tp_telefono; Type: TABLE DATA; Schema: syli; Owner: postgres
--

COPY syli.tp_telefono (codigo_tipo_telefono, descripcion_tipo_telefono, abreviatura_tipo_telefono, fecha_alta, fecha_modificacion) FROM stdin;
1	CELULAR	CEL	2019-08-28 21:26:03.255033	\N
2	FIJO	FIJ	2019-08-28 21:26:03.255033	\N
3	OFICINA	OFC	2019-08-28 21:26:03.255033	\N
4	RESIDENCIA	RES	2019-08-28 21:26:03.255033	\N
5	FAX	FAX	2019-08-28 21:26:03.255033	\N
6	CELULAR 2	CEL2	2019-08-28 21:26:03.255033	\N
7	FIJO 2	FIJ2	2019-08-28 21:26:03.255033	\N
8	OFICINA 2	OFC2	2019-08-28 21:26:03.255033	\N
9	RESIDENCIA 2	RES2	2019-08-28 21:26:03.255033	\N
10	FAX 2	FX2	2019-08-28 21:26:03.255033	\N
11	OTROS	OTS	2019-08-28 21:26:03.255033	\N
12	FAX EMPRESA	FAXE	2019-08-28 21:26:03.255033	\N
13	PBX/CONMUTADOR	PBX	2019-08-28 21:26:03.255033	\N
14	EMAIL	EMA	2019-08-28 21:26:03.255033	\N
15	BEEPER	BEE	2019-08-28 21:26:03.255033	\N
16	LABORAL	LAB	2019-08-28 21:26:03.255033	\N
\.


--
-- TOC entry 3234 (class 0 OID 355009)
-- Dependencies: 223
-- Data for Name: tp_transaccion; Type: TABLE DATA; Schema: syli; Owner: postgres
--

COPY syli.tp_transaccion (codigo_aplicativo, codigo_transaccion, codigo_modulo, codigo_submodulo, descripcion_transaccion, fecha_alta, fecha_modificacion) FROM stdin;
1	1	1	1	Cotización Póliza Nueva	2023-02-05 22:42:16.819734	2023-11-09 17:19:08.186328
1	2	1	1	Emisión Póliza Nueva	2023-02-05 22:42:16.819734	2023-11-09 17:19:08.186328
1	3	1	1	Ingreso a la plataforma	2023-02-05 22:42:16.819734	2023-11-09 17:19:08.186328
1	4	1	1	Ingreso en el cotizador	2023-02-05 22:42:16.819734	2023-11-09 17:19:08.186328
1	5	1	1	Ingreso a crear nueva cotización	2023-02-05 22:42:16.819734	2023-11-09 17:19:08.186328
1	6	1	1	Ingreso a continuar una cotización	2023-02-05 22:42:16.819734	2023-11-09 17:19:08.186328
1	7	1	1	Ingreso al módulo de reportes	2023-02-05 22:42:16.819734	2023-11-09 17:19:08.186328
1	8	1	1	Ingreso a la parametrización de tomador	2023-02-05 22:42:16.819734	2023-11-09 17:19:08.186328
1	9	1	1	Ingreso a la parametrización de planes	2023-02-05 22:42:16.819734	2023-11-09 17:19:08.186328
1	10	1	1	Ingreso a la parametrización de campaña	2023-02-05 22:42:16.819734	2023-11-09 17:19:08.186328
1	11	1	1	Ingreso a reportes de email	2023-02-05 22:42:16.819734	2023-11-09 17:19:08.186328
1	12	1	1	Ingreso a la parametrización de errores	2023-02-05 22:42:16.819734	2023-11-09 17:19:08.186328
\.


--
-- TOC entry 3235 (class 0 OID 355016)
-- Dependencies: 224
-- Data for Name: tp_zonas; Type: TABLE DATA; Schema: syli; Owner: postgres
--

COPY syli.tp_zonas (codigo_tipo_zona, codigo_zona, descripcion_zona, fecha_alta, fecha_modificacion) FROM stdin;
1	1	ZONA BOGOTA	2020-01-29 20:30:57.295061	\N
1	2	RESTO PAIS	2020-01-29 20:30:57.295061	\N
2	1	ZONA 1	2020-01-29 20:30:57.295061	\N
2	2	ZONA 2	2020-01-29 20:30:57.295061	\N
2	3	ZONA 3	2020-01-29 20:30:57.295061	\N
3	1	ZONE 1	2020-12-23 20:41:40.822111	\N
3	2	ZONE 2	2020-12-23 20:41:40.822111	\N
3	3	ZONE 3	2020-12-23 20:41:40.822111	\N
3	4	ZONE 4	2020-12-23 20:41:40.822111	\N
3	5	ZONE 5	2020-12-23 20:41:40.822111	\N
3	6	ZONE 6	2020-12-23 20:41:40.822111	\N
3	7	ZONE 7	2020-12-23 20:41:40.822111	\N
3	8	ZONE 8	2020-12-23 20:41:40.822111	\N
3	9	ZONE 9	2020-12-23 20:41:40.822111	\N
3	10	ZONE 10	2020-12-23 20:41:40.822111	\N
3	11	ZONE 11	2020-12-23 20:41:40.822111	\N
3	12	ZONE 12	2020-12-23 20:41:40.822111	\N
3	13	ZONE 13	2020-12-23 20:41:40.822111	\N
3	14	ZONE 15 - Bogotá	2020-12-23 20:41:40.822111	\N
3	15	ZONE 14 - Cali	2020-12-23 20:41:40.822111	\N
3	16	ZONE 16 - Manizales	2022-03-30 20:27:19.020594	\N
3	17	ZONE 17 - Villavicencio	2022-03-30 20:27:19.020594	\N
\.


--
-- TOC entry 3236 (class 0 OID 355020)
-- Dependencies: 225
-- Data for Name: usuario_app; Type: TABLE DATA; Schema: syli; Owner: postgres
--

COPY syli.usuario_app (codigo_aplicativo, codigo_usuario, codigo_perfil, tipo_documento, numero_documento, activo, usuario, clave, fecha_alta, fecha_modificacion, codigo_front) FROM stdin;
1	1026	1	1	1032477633	t	NICOLAS RIVERA GOMEZ		2023-04-04 18:40:51.719889	2023-07-25 08:41:26.896426	1
1	1027	1	1	1010003199	t	ANGIE FORERO		2023-04-04 18:56:06.440601	2023-07-25 08:41:26.896426	1
1	1028	1	1	1128266194	t	CARLOS TABORDA		2023-04-04 18:56:07.286776	2023-07-25 08:41:26.896426	1
\.


--
-- TOC entry 3024 (class 2606 OID 355029)
-- Name: aplicacion pk_aplicacion; Type: CONSTRAINT; Schema: syli; Owner: postgres
--

ALTER TABLE ONLY syli.aplicacion
    ADD CONSTRAINT pk_aplicacion PRIMARY KEY (codigo_aplicativo);


--
-- TOC entry 3026 (class 2606 OID 355035)
-- Name: modulo_app pk_modulo_app; Type: CONSTRAINT; Schema: syli; Owner: postgres
--

ALTER TABLE ONLY syli.modulo_app
    ADD CONSTRAINT pk_modulo_app PRIMARY KEY (codigo_aplicativo, codigo_modulo);


--
-- TOC entry 3028 (class 2606 OID 355037)
-- Name: perfil_app pk_perfil_app; Type: CONSTRAINT; Schema: syli; Owner: postgres
--

ALTER TABLE ONLY syli.perfil_app
    ADD CONSTRAINT pk_perfil_app PRIMARY KEY (codigo_aplicativo, codigo_perfil);


--
-- TOC entry 3022 (class 2606 OID 355043)
-- Name: persona pk_persona; Type: CONSTRAINT; Schema: syli; Owner: postgres
--

ALTER TABLE ONLY syli.persona
    ADD CONSTRAINT pk_persona PRIMARY KEY (tipo_documento, numero_documento);


--
-- TOC entry 3030 (class 2606 OID 355045)
-- Name: persona_direccion pk_persona_direccion; Type: CONSTRAINT; Schema: syli; Owner: postgres
--

ALTER TABLE ONLY syli.persona_direccion
    ADD CONSTRAINT pk_persona_direccion PRIMARY KEY (tipo_documento, numero_documento, codigo_tipo_direccion);


--
-- TOC entry 3032 (class 2606 OID 355049)
-- Name: persona_telefono pk_persona_telefono; Type: CONSTRAINT; Schema: syli; Owner: postgres
--

ALTER TABLE ONLY syli.persona_telefono
    ADD CONSTRAINT pk_persona_telefono PRIMARY KEY (tipo_documento, numero_documento, codigo_tipo_telefono);


--
-- TOC entry 3034 (class 2606 OID 355057)
-- Name: tp_actividad_economica pk_tp_actividad_economica; Type: CONSTRAINT; Schema: syli; Owner: postgres
--

ALTER TABLE ONLY syli.tp_actividad_economica
    ADD CONSTRAINT pk_tp_actividad_economica PRIMARY KEY (codigo_ciiu);


--
-- TOC entry 3036 (class 2606 OID 355059)
-- Name: tp_actividad_economica_h pk_tp_actividad_economica_h; Type: CONSTRAINT; Schema: syli; Owner: postgres
--

ALTER TABLE ONLY syli.tp_actividad_economica_h
    ADD CONSTRAINT pk_tp_actividad_economica_h PRIMARY KEY (codigo_ciiud, codigo_ciiud_anterior);


--
-- TOC entry 3038 (class 2606 OID 355061)
-- Name: tp_calle pk_tp_calle; Type: CONSTRAINT; Schema: syli; Owner: postgres
--

ALTER TABLE ONLY syli.tp_calle
    ADD CONSTRAINT pk_tp_calle PRIMARY KEY (codigo_tipo_calle);


--
-- TOC entry 3040 (class 2606 OID 355063)
-- Name: tp_dir_barrio pk_tp_dir_barrio; Type: CONSTRAINT; Schema: syli; Owner: postgres
--

ALTER TABLE ONLY syli.tp_dir_barrio
    ADD CONSTRAINT pk_tp_dir_barrio PRIMARY KEY (codigo_barrio);


--
-- TOC entry 3042 (class 2606 OID 355065)
-- Name: tp_dir_cuadrante pk_tp_dir_cuadrante; Type: CONSTRAINT; Schema: syli; Owner: postgres
--

ALTER TABLE ONLY syli.tp_dir_cuadrante
    ADD CONSTRAINT pk_tp_dir_cuadrante PRIMARY KEY (codigo_cuadrante);


--
-- TOC entry 3044 (class 2606 OID 355067)
-- Name: tp_dir_manzana pk_tp_dir_manzana; Type: CONSTRAINT; Schema: syli; Owner: postgres
--

ALTER TABLE ONLY syli.tp_dir_manzana
    ADD CONSTRAINT pk_tp_dir_manzana PRIMARY KEY (codigo_manzana);


--
-- TOC entry 3046 (class 2606 OID 355069)
-- Name: tp_dir_predio pk_tp_dir_predio; Type: CONSTRAINT; Schema: syli; Owner: postgres
--

ALTER TABLE ONLY syli.tp_dir_predio
    ADD CONSTRAINT pk_tp_dir_predio PRIMARY KEY (codigo_predio);


--
-- TOC entry 3048 (class 2606 OID 355071)
-- Name: tp_direccion pk_tp_direccion; Type: CONSTRAINT; Schema: syli; Owner: postgres
--

ALTER TABLE ONLY syli.tp_direccion
    ADD CONSTRAINT pk_tp_direccion PRIMARY KEY (codigo_tipo_direccion);


--
-- TOC entry 3050 (class 2606 OID 355073)
-- Name: tp_estado_civil pk_tp_estado_civil; Type: CONSTRAINT; Schema: syli; Owner: postgres
--

ALTER TABLE ONLY syli.tp_estado_civil
    ADD CONSTRAINT pk_tp_estado_civil PRIMARY KEY (codigo_estado_civil);


--
-- TOC entry 3052 (class 2606 OID 355075)
-- Name: tp_ipc pk_tp_ipc; Type: CONSTRAINT; Schema: syli; Owner: postgres
--

ALTER TABLE ONLY syli.tp_ipc
    ADD CONSTRAINT pk_tp_ipc PRIMARY KEY (anio_ipc, mes_ipc);


--
-- TOC entry 3054 (class 2606 OID 355077)
-- Name: tp_moneda pk_tp_moneda; Type: CONSTRAINT; Schema: syli; Owner: postgres
--

ALTER TABLE ONLY syli.tp_moneda
    ADD CONSTRAINT pk_tp_moneda PRIMARY KEY (codigo_moneda);


--
-- TOC entry 3056 (class 2606 OID 355079)
-- Name: tp_origen pk_tp_origen; Type: CONSTRAINT; Schema: syli; Owner: postgres
--

ALTER TABLE ONLY syli.tp_origen
    ADD CONSTRAINT pk_tp_origen PRIMARY KEY (codigo_origen);


--
-- TOC entry 3058 (class 2606 OID 355081)
-- Name: tp_pais pk_tp_pais; Type: CONSTRAINT; Schema: syli; Owner: postgres
--

ALTER TABLE ONLY syli.tp_pais
    ADD CONSTRAINT pk_tp_pais PRIMARY KEY (codigo_pais);


--
-- TOC entry 3060 (class 2606 OID 355085)
-- Name: tp_telefono pk_tp_telefono; Type: CONSTRAINT; Schema: syli; Owner: postgres
--

ALTER TABLE ONLY syli.tp_telefono
    ADD CONSTRAINT pk_tp_telefono PRIMARY KEY (codigo_tipo_telefono);


--
-- TOC entry 3062 (class 2606 OID 355087)
-- Name: tp_transaccion pk_tp_transaccion; Type: CONSTRAINT; Schema: syli; Owner: postgres
--

ALTER TABLE ONLY syli.tp_transaccion
    ADD CONSTRAINT pk_tp_transaccion PRIMARY KEY (codigo_aplicativo, codigo_transaccion);


--
-- TOC entry 3064 (class 2606 OID 355091)
-- Name: tp_zonas pk_tp_zonas; Type: CONSTRAINT; Schema: syli; Owner: postgres
--

ALTER TABLE ONLY syli.tp_zonas
    ADD CONSTRAINT pk_tp_zonas PRIMARY KEY (codigo_tipo_zona, codigo_zona);


--
-- TOC entry 3066 (class 2606 OID 355093)
-- Name: usuario_app pk_usuario_app; Type: CONSTRAINT; Schema: syli; Owner: postgres
--

ALTER TABLE ONLY syli.usuario_app
    ADD CONSTRAINT pk_usuario_app PRIMARY KEY (codigo_aplicativo, codigo_usuario);


--
-- TOC entry 3068 (class 2606 OID 355095)
-- Name: usuario_app unique_usuario_front; Type: CONSTRAINT; Schema: syli; Owner: postgres
--

ALTER TABLE ONLY syli.usuario_app
    ADD CONSTRAINT unique_usuario_front UNIQUE (tipo_documento, numero_documento, codigo_front);


--
-- TOC entry 3070 (class 2606 OID 355097)
-- Name: usuario_app uq_app_usuario; Type: CONSTRAINT; Schema: syli; Owner: postgres
--

ALTER TABLE ONLY syli.usuario_app
    ADD CONSTRAINT uq_app_usuario UNIQUE (codigo_aplicativo, numero_documento);


--
-- TOC entry 3074 (class 2606 OID 355113)
-- Name: modulo_app fk_modulo_app_app; Type: FK CONSTRAINT; Schema: syli; Owner: postgres
--

ALTER TABLE ONLY syli.modulo_app
    ADD CONSTRAINT fk_modulo_app_app FOREIGN KEY (codigo_aplicativo) REFERENCES syli.aplicacion(codigo_aplicativo);


--
-- TOC entry 3075 (class 2606 OID 355118)
-- Name: perfil_app fk_perfil_app_app; Type: FK CONSTRAINT; Schema: syli; Owner: postgres
--

ALTER TABLE ONLY syli.perfil_app
    ADD CONSTRAINT fk_perfil_app_app FOREIGN KEY (codigo_aplicativo) REFERENCES syli.aplicacion(codigo_aplicativo);


--
-- TOC entry 3071 (class 2606 OID 355143)
-- Name: persona fk_persona_actecon; Type: FK CONSTRAINT; Schema: syli; Owner: postgres
--

ALTER TABLE ONLY syli.persona
    ADD CONSTRAINT fk_persona_actecon FOREIGN KEY (codigo_ciiu) REFERENCES syli.tp_actividad_economica(codigo_ciiu);


--
-- TOC entry 3076 (class 2606 OID 355153)
-- Name: persona_direccion fk_persona_dir; Type: FK CONSTRAINT; Schema: syli; Owner: postgres
--

ALTER TABLE ONLY syli.persona_direccion
    ADD CONSTRAINT fk_persona_dir FOREIGN KEY (tipo_documento, numero_documento) REFERENCES syli.persona(tipo_documento, numero_documento);


--
-- TOC entry 3072 (class 2606 OID 355163)
-- Name: persona fk_persona_estcivil; Type: FK CONSTRAINT; Schema: syli; Owner: postgres
--

ALTER TABLE ONLY syli.persona
    ADD CONSTRAINT fk_persona_estcivil FOREIGN KEY (codigo_estado_civil) REFERENCES syli.tp_estado_civil(codigo_estado_civil);


--
-- TOC entry 3079 (class 2606 OID 355173)
-- Name: persona_telefono fk_persona_paistel; Type: FK CONSTRAINT; Schema: syli; Owner: postgres
--

ALTER TABLE ONLY syli.persona_telefono
    ADD CONSTRAINT fk_persona_paistel FOREIGN KEY (codigo_pais) REFERENCES syli.tp_pais(codigo_pais);


--
-- TOC entry 3077 (class 2606 OID 355183)
-- Name: persona_direccion fk_persona_tdir; Type: FK CONSTRAINT; Schema: syli; Owner: postgres
--

ALTER TABLE ONLY syli.persona_direccion
    ADD CONSTRAINT fk_persona_tdir FOREIGN KEY (codigo_tipo_direccion) REFERENCES syli.tp_direccion(codigo_tipo_direccion);


--
-- TOC entry 3080 (class 2606 OID 355193)
-- Name: persona_telefono fk_persona_tel; Type: FK CONSTRAINT; Schema: syli; Owner: postgres
--

ALTER TABLE ONLY syli.persona_telefono
    ADD CONSTRAINT fk_persona_tel FOREIGN KEY (tipo_documento, numero_documento) REFERENCES syli.persona(tipo_documento, numero_documento);


--
-- TOC entry 3081 (class 2606 OID 355203)
-- Name: persona_telefono fk_persona_telorig; Type: FK CONSTRAINT; Schema: syli; Owner: postgres
--

ALTER TABLE ONLY syli.persona_telefono
    ADD CONSTRAINT fk_persona_telorig FOREIGN KEY (origen) REFERENCES syli.tp_origen(codigo_origen);


--
-- TOC entry 3082 (class 2606 OID 355213)
-- Name: persona_telefono fk_persona_teltipo; Type: FK CONSTRAINT; Schema: syli; Owner: postgres
--

ALTER TABLE ONLY syli.persona_telefono
    ADD CONSTRAINT fk_persona_teltipo FOREIGN KEY (codigo_tipo_telefono) REFERENCES syli.tp_telefono(codigo_tipo_telefono);


--
-- TOC entry 3078 (class 2606 OID 355223)
-- Name: persona_direccion fk_persona_torig; Type: FK CONSTRAINT; Schema: syli; Owner: postgres
--

ALTER TABLE ONLY syli.persona_direccion
    ADD CONSTRAINT fk_persona_torig FOREIGN KEY (origen) REFERENCES syli.tp_origen(codigo_origen);


--
-- TOC entry 3073 (class 2606 OID 355233)
-- Name: persona fk_personap_torig; Type: FK CONSTRAINT; Schema: syli; Owner: postgres
--

ALTER TABLE ONLY syli.persona
    ADD CONSTRAINT fk_personap_torig FOREIGN KEY (origen) REFERENCES syli.tp_origen(codigo_origen);


--
-- TOC entry 3083 (class 2606 OID 355243)
-- Name: tp_transaccion fk_tp_transaccion_app; Type: FK CONSTRAINT; Schema: syli; Owner: postgres
--

ALTER TABLE ONLY syli.tp_transaccion
    ADD CONSTRAINT fk_tp_transaccion_app FOREIGN KEY (codigo_aplicativo) REFERENCES syli.aplicacion(codigo_aplicativo);


--
-- TOC entry 3084 (class 2606 OID 355248)
-- Name: tp_transaccion fk_tp_transaccion_modulo; Type: FK CONSTRAINT; Schema: syli; Owner: postgres
--

ALTER TABLE ONLY syli.tp_transaccion
    ADD CONSTRAINT fk_tp_transaccion_modulo FOREIGN KEY (codigo_aplicativo, codigo_modulo) REFERENCES syli.modulo_app(codigo_aplicativo, codigo_modulo);


--
-- TOC entry 3085 (class 2606 OID 355253)
-- Name: usuario_app fk_usuario_app_app; Type: FK CONSTRAINT; Schema: syli; Owner: postgres
--

ALTER TABLE ONLY syli.usuario_app
    ADD CONSTRAINT fk_usuario_app_app FOREIGN KEY (codigo_aplicativo) REFERENCES syli.aplicacion(codigo_aplicativo);


--
-- TOC entry 3086 (class 2606 OID 355258)
-- Name: usuario_app fk_usuario_app_perfil; Type: FK CONSTRAINT; Schema: syli; Owner: postgres
--

ALTER TABLE ONLY syli.usuario_app
    ADD CONSTRAINT fk_usuario_app_perfil FOREIGN KEY (codigo_aplicativo, codigo_perfil) REFERENCES syli.perfil_app(codigo_aplicativo, codigo_perfil);


--
-- TOC entry 3087 (class 2606 OID 355263)
-- Name: usuario_app fk_usuario_app_persona; Type: FK CONSTRAINT; Schema: syli; Owner: postgres
--

ALTER TABLE ONLY syli.usuario_app
    ADD CONSTRAINT fk_usuario_app_persona FOREIGN KEY (tipo_documento, numero_documento) REFERENCES syli.persona(tipo_documento, numero_documento);


-- Completed on 2024-07-08 16:06:54 -05

--
-- PostgreSQL database dump complete
--

