--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: MINERVA_childdata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "MINERVA_childdata" (
    id integer NOT NULL,
    fullname character varying(50) NOT NULL,
    nickname character varying(15) NOT NULL,
    gender character varying(1) NOT NULL,
    uid_user_id integer NOT NULL,
    birthday date NOT NULL
);


ALTER TABLE "MINERVA_childdata" OWNER TO postgres;

--
-- Name: MINERVA_childdata_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "MINERVA_childdata_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "MINERVA_childdata_id_seq" OWNER TO postgres;

--
-- Name: MINERVA_childdata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "MINERVA_childdata_id_seq" OWNED BY "MINERVA_childdata".id;


--
-- Name: MINERVA_finemotorchecklist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "MINERVA_finemotorchecklist" (
    id integer NOT NULL,
    "timestamp" date NOT NULL,
    uid_user_id integer NOT NULL,
    uid_fm_milestone_id integer NOT NULL
);


ALTER TABLE "MINERVA_finemotorchecklist" OWNER TO postgres;

--
-- Name: MINERVA_finemotormilestone; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "MINERVA_finemotormilestone" (
    id integer NOT NULL,
    fm_milestone character varying(50) NOT NULL,
    start numeric(5,2) NOT NULL,
    seven_five numeric(5,2) NOT NULL,
    finish numeric(5,2) NOT NULL
);


ALTER TABLE "MINERVA_finemotormilestone" OWNER TO postgres;

--
-- Name: MINERVA_finemotormilestone_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "MINERVA_finemotormilestone_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "MINERVA_finemotormilestone_id_seq" OWNER TO postgres;

--
-- Name: MINERVA_finemotormilestone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "MINERVA_finemotormilestone_id_seq" OWNED BY "MINERVA_finemotormilestone".id;


--
-- Name: MINERVA_grossmotorchecklist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "MINERVA_grossmotorchecklist" (
    id integer NOT NULL,
    "timestamp" date NOT NULL,
    uid_gm_milestone_id integer NOT NULL,
    uid_user_id integer NOT NULL
);


ALTER TABLE "MINERVA_grossmotorchecklist" OWNER TO postgres;

--
-- Name: MINERVA_grossmotorchecklist_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "MINERVA_grossmotorchecklist_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "MINERVA_grossmotorchecklist_id_seq" OWNER TO postgres;

--
-- Name: MINERVA_grossmotorchecklist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "MINERVA_grossmotorchecklist_id_seq" OWNED BY "MINERVA_grossmotorchecklist".id;


--
-- Name: MINERVA_grossmotormilestone; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "MINERVA_grossmotormilestone" (
    id integer NOT NULL,
    gm_milestone character varying(50) NOT NULL,
    start numeric(5,2) NOT NULL,
    seven_five numeric(5,2) NOT NULL,
    finish numeric(5,2) NOT NULL
);


ALTER TABLE "MINERVA_grossmotormilestone" OWNER TO postgres;

--
-- Name: MINERVA_grossmotormilestone_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "MINERVA_grossmotormilestone_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "MINERVA_grossmotormilestone_id_seq" OWNER TO postgres;

--
-- Name: MINERVA_grossmotormilestone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "MINERVA_grossmotormilestone_id_seq" OWNED BY "MINERVA_grossmotormilestone".id;


--
-- Name: MINERVA_headdata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "MINERVA_headdata" (
    id integer NOT NULL,
    head_size numeric(5,2) NOT NULL,
    date_head date NOT NULL,
    uid_child_id integer NOT NULL
);


ALTER TABLE "MINERVA_headdata" OWNER TO postgres;

--
-- Name: MINERVA_headdata_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "MINERVA_headdata_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "MINERVA_headdata_id_seq" OWNER TO postgres;

--
-- Name: MINERVA_headdata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "MINERVA_headdata_id_seq" OWNED BY "MINERVA_headdata".id;


--
-- Name: MINERVA_teethdata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "MINERVA_teethdata" (
    id integer NOT NULL,
    teeth integer NOT NULL,
    date_teeth date NOT NULL,
    uid_child_id integer NOT NULL
);


ALTER TABLE "MINERVA_teethdata" OWNER TO postgres;

--
-- Name: MINERVA_teethdata_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "MINERVA_teethdata_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "MINERVA_teethdata_id_seq" OWNER TO postgres;

--
-- Name: MINERVA_teethdata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "MINERVA_teethdata_id_seq" OWNED BY "MINERVA_teethdata".id;


--
-- Name: MINERVA_userchecklist_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "MINERVA_userchecklist_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "MINERVA_userchecklist_id_seq" OWNER TO postgres;

--
-- Name: MINERVA_userchecklist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "MINERVA_userchecklist_id_seq" OWNED BY "MINERVA_finemotorchecklist".id;


--
-- Name: MINERVA_weightandheightdata; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "MINERVA_weightandheightdata" (
    id integer NOT NULL,
    weight numeric(5,2) NOT NULL,
    height numeric(5,2) NOT NULL,
    date_w_and_h date NOT NULL,
    uid_child_id integer NOT NULL
);


ALTER TABLE "MINERVA_weightandheightdata" OWNER TO postgres;

--
-- Name: MINERVA_weightandheightdata_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "MINERVA_weightandheightdata_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "MINERVA_weightandheightdata_id_seq" OWNER TO postgres;

--
-- Name: MINERVA_weightandheightdata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "MINERVA_weightandheightdata_id_seq" OWNED BY "MINERVA_weightandheightdata".id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO postgres;

--
-- Name: polls_choice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE polls_choice (
    id integer NOT NULL,
    choice_text character varying(200) NOT NULL,
    votes integer NOT NULL,
    question_id integer NOT NULL
);


ALTER TABLE polls_choice OWNER TO postgres;

--
-- Name: polls_choice_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE polls_choice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE polls_choice_id_seq OWNER TO postgres;

--
-- Name: polls_choice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE polls_choice_id_seq OWNED BY polls_choice.id;


--
-- Name: polls_question; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE polls_question (
    id integer NOT NULL,
    question_text character varying(200) NOT NULL,
    pub_date timestamp with time zone NOT NULL
);


ALTER TABLE polls_question OWNER TO postgres;

--
-- Name: polls_question_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE polls_question_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE polls_question_id_seq OWNER TO postgres;

--
-- Name: polls_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE polls_question_id_seq OWNED BY polls_question.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "MINERVA_childdata" ALTER COLUMN id SET DEFAULT nextval('"MINERVA_childdata_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "MINERVA_finemotorchecklist" ALTER COLUMN id SET DEFAULT nextval('"MINERVA_userchecklist_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "MINERVA_finemotormilestone" ALTER COLUMN id SET DEFAULT nextval('"MINERVA_finemotormilestone_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "MINERVA_grossmotorchecklist" ALTER COLUMN id SET DEFAULT nextval('"MINERVA_grossmotorchecklist_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "MINERVA_grossmotormilestone" ALTER COLUMN id SET DEFAULT nextval('"MINERVA_grossmotormilestone_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "MINERVA_headdata" ALTER COLUMN id SET DEFAULT nextval('"MINERVA_headdata_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "MINERVA_teethdata" ALTER COLUMN id SET DEFAULT nextval('"MINERVA_teethdata_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "MINERVA_weightandheightdata" ALTER COLUMN id SET DEFAULT nextval('"MINERVA_weightandheightdata_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY polls_choice ALTER COLUMN id SET DEFAULT nextval('polls_choice_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY polls_question ALTER COLUMN id SET DEFAULT nextval('polls_question_id_seq'::regclass);


--
-- Data for Name: MINERVA_childdata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "MINERVA_childdata" (id, fullname, nickname, gender, uid_user_id, birthday) FROM stdin;
\.


--
-- Name: MINERVA_childdata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"MINERVA_childdata_id_seq"', 1, false);


--
-- Data for Name: MINERVA_finemotorchecklist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "MINERVA_finemotorchecklist" (id, "timestamp", uid_user_id, uid_fm_milestone_id) FROM stdin;
\.


--
-- Data for Name: MINERVA_finemotormilestone; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "MINERVA_finemotormilestone" (id, fm_milestone, start, seven_five, finish) FROM stdin;
\.


--
-- Name: MINERVA_finemotormilestone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"MINERVA_finemotormilestone_id_seq"', 1, false);


--
-- Data for Name: MINERVA_grossmotorchecklist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "MINERVA_grossmotorchecklist" (id, "timestamp", uid_gm_milestone_id, uid_user_id) FROM stdin;
\.


--
-- Name: MINERVA_grossmotorchecklist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"MINERVA_grossmotorchecklist_id_seq"', 1, false);


--
-- Data for Name: MINERVA_grossmotormilestone; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "MINERVA_grossmotormilestone" (id, gm_milestone, start, seven_five, finish) FROM stdin;
1	Equal Movements	0.00	0.00	0.00
2	Lift Head	0.00	0.00	0.00
3	Head Up 45	0.00	2.00	3.00
4	Head Up 90	1.50	3.00	4.00
5	sit-head steady	2.00	3.00	4.00
6	bear weight on legs	2.00	3.50	4.50
7	chest up-arm	3.00	4.00	5.00
8	roll over	2.50	4.50	6.50
9	pull to sit,  no head lagi	3.00	4.00	6.00
10	sit no support	5.50	6.50	7.00
11	stand holding on	6.50	8.00	8.50
12	pull to stand	8.00	9.00	10.00
13	get to sitting	7.50	9.00	10.00
14	stand 2 sec	9.50	10.50	11.50
15	stand alone	10.00	12.00	13.50
16	stoop and recover	11.00	13.00	15.00
17	walk well	11.00	13.50	15.00
18	walk backwards	12.50	15.00	17.00
19	runs	14.00	18.00	20.00
20	walk up steps	14.00	19.00	21.50
21	kick ball forward	16.00	21.00	23.50
22	jump up	21.00	27.00	30.00
23	throw ball overhand	17.00	24.00	36.00
24	broad jump	27.00	36.00	40.00
25	balance each foot  1 second	30.00	33.00	42.00
\.


--
-- Name: MINERVA_grossmotormilestone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"MINERVA_grossmotormilestone_id_seq"', 1, false);


--
-- Data for Name: MINERVA_headdata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "MINERVA_headdata" (id, head_size, date_head, uid_child_id) FROM stdin;
\.


--
-- Name: MINERVA_headdata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"MINERVA_headdata_id_seq"', 1, false);


--
-- Data for Name: MINERVA_teethdata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "MINERVA_teethdata" (id, teeth, date_teeth, uid_child_id) FROM stdin;
\.


--
-- Name: MINERVA_teethdata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"MINERVA_teethdata_id_seq"', 1, false);


--
-- Name: MINERVA_userchecklist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"MINERVA_userchecklist_id_seq"', 1, false);


--
-- Data for Name: MINERVA_weightandheightdata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "MINERVA_weightandheightdata" (id, weight, height, date_w_and_h, uid_child_id) FROM stdin;
\.


--
-- Name: MINERVA_weightandheightdata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"MINERVA_weightandheightdata_id_seq"', 1, false);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add fine motor checklist	1	add_finemotorchecklist
2	Can change fine motor checklist	1	change_finemotorchecklist
3	Can delete fine motor checklist	1	delete_finemotorchecklist
4	Can add fine motor milestone	2	add_finemotormilestone
5	Can change fine motor milestone	2	change_finemotormilestone
6	Can delete fine motor milestone	2	delete_finemotormilestone
7	Can add weight and height data	3	add_weightandheightdata
8	Can change weight and height data	3	change_weightandheightdata
9	Can delete weight and height data	3	delete_weightandheightdata
10	Can add head data	4	add_headdata
11	Can change head data	4	change_headdata
12	Can delete head data	4	delete_headdata
13	Can add child data	5	add_childdata
14	Can change child data	5	change_childdata
15	Can delete child data	5	delete_childdata
16	Can add teeth data	6	add_teethdata
17	Can change teeth data	6	change_teethdata
18	Can delete teeth data	6	delete_teethdata
19	Can add question	7	add_question
20	Can change question	7	change_question
21	Can delete question	7	delete_question
22	Can add choice	8	add_choice
23	Can change choice	8	change_choice
24	Can delete choice	8	delete_choice
25	Can add log entry	9	add_logentry
26	Can change log entry	9	change_logentry
27	Can delete log entry	9	delete_logentry
28	Can add permission	10	add_permission
29	Can change permission	10	change_permission
30	Can delete permission	10	delete_permission
31	Can add group	11	add_group
32	Can change group	11	change_group
33	Can delete group	11	delete_group
34	Can add user	12	add_user
35	Can change user	12	change_user
36	Can delete user	12	delete_user
37	Can add content type	13	add_contenttype
38	Can change content type	13	change_contenttype
39	Can delete content type	13	delete_contenttype
40	Can add session	14	add_session
41	Can change session	14	change_session
42	Can delete session	14	delete_session
43	Can add gross motor checklist	15	add_grossmotorchecklist
44	Can change gross motor checklist	15	change_grossmotorchecklist
45	Can delete gross motor checklist	15	delete_grossmotorchecklist
46	Can add gross motor milestone	16	add_grossmotormilestone
47	Can change gross motor milestone	16	change_grossmotormilestone
48	Can delete gross motor milestone	16	delete_grossmotormilestone
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_permission_id_seq', 48, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$30000$Mc3nEtSe7wcP$oyHxSQH/PpBrX7G3GP74q74Ih+Mk1v6lklwk/MxqsPo=	2016-10-19 14:14:49.985017+07	t	admin			admin@email.com	t	t	2016-10-19 12:59:57.187876+07
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	MINERVA	finemotorchecklist
2	MINERVA	finemotormilestone
3	MINERVA	weightandheightdata
4	MINERVA	headdata
5	MINERVA	childdata
6	MINERVA	teethdata
7	polls	question
8	polls	choice
9	admin	logentry
10	auth	permission
11	auth	group
12	auth	user
13	contenttypes	contenttype
14	sessions	session
15	MINERVA	grossmotorchecklist
16	MINERVA	grossmotormilestone
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_content_type_id_seq', 16, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2016-10-19 12:59:08.088007+07
2	auth	0001_initial	2016-10-19 12:59:08.147313+07
3	MINERVA	0001_initial	2016-10-19 12:59:08.18505+07
4	MINERVA	0002_physicalinput	2016-10-19 12:59:08.207865+07
5	MINERVA	0003_auto_20161018_1118	2016-10-19 12:59:08.341681+07
6	MINERVA	0004_childdata_birthday	2016-10-19 12:59:08.359556+07
7	MINERVA	0005_auto_20161018_1225	2016-10-19 12:59:08.376616+07
8	MINERVA	0006_auto_20161018_1226	2016-10-19 12:59:08.394414+07
9	MINERVA	0007_auto_20161018_1257	2016-10-19 12:59:08.409622+07
10	MINERVA	0008_auto_20161019_1253	2016-10-19 12:59:08.489937+07
11	MINERVA	0009_auto_20161019_1258	2016-10-19 12:59:08.506121+07
12	admin	0001_initial	2016-10-19 12:59:08.534047+07
13	admin	0002_logentry_remove_auto_add	2016-10-19 12:59:08.555293+07
14	contenttypes	0002_remove_content_type_name	2016-10-19 12:59:08.605281+07
15	auth	0002_alter_permission_name_max_length	2016-10-19 12:59:08.623265+07
16	auth	0003_alter_user_email_max_length	2016-10-19 12:59:08.642394+07
17	auth	0004_alter_user_username_opts	2016-10-19 12:59:08.661919+07
18	auth	0005_alter_user_last_login_null	2016-10-19 12:59:08.679514+07
19	auth	0006_require_contenttypes_0002	2016-10-19 12:59:08.681499+07
20	auth	0007_alter_validators_add_error_messages	2016-10-19 12:59:08.699619+07
21	auth	0008_alter_user_username_max_length	2016-10-19 12:59:08.720397+07
22	polls	0001_initial	2016-10-19 12:59:08.737689+07
23	sessions	0001_initial	2016-10-19 12:59:08.749819+07
24	MINERVA	0010_auto_20161019_1311	2016-10-19 13:12:03.103181+07
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_migrations_id_seq', 24, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
hfpsjz0vor1y6ynmqgy9zugcvruppmn1	OWI0NzhhMDI4MzYzZWE2ZjcwODMzYWRiMzcxOTc4OGFlMGYyMGQ3Yzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJiM2FmYzc0ZGVlYTI5Njk5MjA2ZDE5MWMzOTQ1MDU5NTY2ZjNiMzcxIn0=	2016-11-02 14:14:49.988194+07
\.


--
-- Data for Name: polls_choice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY polls_choice (id, choice_text, votes, question_id) FROM stdin;
\.


--
-- Name: polls_choice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('polls_choice_id_seq', 1, false);


--
-- Data for Name: polls_question; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY polls_question (id, question_text, pub_date) FROM stdin;
\.


--
-- Name: polls_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('polls_question_id_seq', 1, false);


--
-- Name: MINERVA_childdata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "MINERVA_childdata"
    ADD CONSTRAINT "MINERVA_childdata_pkey" PRIMARY KEY (id);


--
-- Name: MINERVA_finemotormilestone_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "MINERVA_finemotormilestone"
    ADD CONSTRAINT "MINERVA_finemotormilestone_pkey" PRIMARY KEY (id);


--
-- Name: MINERVA_grossmotorchecklist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "MINERVA_grossmotorchecklist"
    ADD CONSTRAINT "MINERVA_grossmotorchecklist_pkey" PRIMARY KEY (id);


--
-- Name: MINERVA_grossmotormilestone_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "MINERVA_grossmotormilestone"
    ADD CONSTRAINT "MINERVA_grossmotormilestone_pkey" PRIMARY KEY (id);


--
-- Name: MINERVA_headdata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "MINERVA_headdata"
    ADD CONSTRAINT "MINERVA_headdata_pkey" PRIMARY KEY (id);


--
-- Name: MINERVA_teethdata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "MINERVA_teethdata"
    ADD CONSTRAINT "MINERVA_teethdata_pkey" PRIMARY KEY (id);


--
-- Name: MINERVA_userchecklist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "MINERVA_finemotorchecklist"
    ADD CONSTRAINT "MINERVA_userchecklist_pkey" PRIMARY KEY (id);


--
-- Name: MINERVA_weightandheightdata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "MINERVA_weightandheightdata"
    ADD CONSTRAINT "MINERVA_weightandheightdata_pkey" PRIMARY KEY (id);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: polls_choice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY polls_choice
    ADD CONSTRAINT polls_choice_pkey PRIMARY KEY (id);


--
-- Name: polls_question_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY polls_question
    ADD CONSTRAINT polls_question_pkey PRIMARY KEY (id);


--
-- Name: MINERVA_childdata_fa632982; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "MINERVA_childdata_fa632982" ON "MINERVA_childdata" USING btree (uid_user_id);


--
-- Name: MINERVA_finemotorchecklist_fd972e3c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "MINERVA_finemotorchecklist_fd972e3c" ON "MINERVA_finemotorchecklist" USING btree (uid_fm_milestone_id);


--
-- Name: MINERVA_grossmotorchecklist_69cdc254; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "MINERVA_grossmotorchecklist_69cdc254" ON "MINERVA_grossmotorchecklist" USING btree (uid_gm_milestone_id);


--
-- Name: MINERVA_grossmotorchecklist_fa632982; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "MINERVA_grossmotorchecklist_fa632982" ON "MINERVA_grossmotorchecklist" USING btree (uid_user_id);


--
-- Name: MINERVA_headdata_54184627; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "MINERVA_headdata_54184627" ON "MINERVA_headdata" USING btree (uid_child_id);


--
-- Name: MINERVA_teethdata_54184627; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "MINERVA_teethdata_54184627" ON "MINERVA_teethdata" USING btree (uid_child_id);


--
-- Name: MINERVA_userchecklist_fa632982; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "MINERVA_userchecklist_fa632982" ON "MINERVA_finemotorchecklist" USING btree (uid_user_id);


--
-- Name: MINERVA_weightandheightdata_54184627; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "MINERVA_weightandheightdata_54184627" ON "MINERVA_weightandheightdata" USING btree (uid_child_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: polls_choice_7aa0f6ee; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX polls_choice_7aa0f6ee ON polls_choice USING btree (question_id);


--
-- Name: MINERVA_childdata_uid_user_id_0c55757f_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "MINERVA_childdata"
    ADD CONSTRAINT "MINERVA_childdata_uid_user_id_0c55757f_fk_auth_user_id" FOREIGN KEY (uid_user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: MINERVA_grossmotorchecklis_uid_user_id_b3b1ca84_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "MINERVA_grossmotorchecklist"
    ADD CONSTRAINT "MINERVA_grossmotorchecklis_uid_user_id_b3b1ca84_fk_auth_user_id" FOREIGN KEY (uid_user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: MINERVA_headdata_uid_child_id_50565b80_fk_MINERVA_childdata_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "MINERVA_headdata"
    ADD CONSTRAINT "MINERVA_headdata_uid_child_id_50565b80_fk_MINERVA_childdata_id" FOREIGN KEY (uid_child_id) REFERENCES "MINERVA_childdata"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: MINERVA_teethdata_uid_child_id_4413555f_fk_MINERVA_childdata_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "MINERVA_teethdata"
    ADD CONSTRAINT "MINERVA_teethdata_uid_child_id_4413555f_fk_MINERVA_childdata_id" FOREIGN KEY (uid_child_id) REFERENCES "MINERVA_childdata"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: MINERVA_userchecklist_uid_user_id_b7ade052_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "MINERVA_finemotorchecklist"
    ADD CONSTRAINT "MINERVA_userchecklist_uid_user_id_b7ade052_fk_auth_user_id" FOREIGN KEY (uid_user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: MINERVA_weightand_uid_child_id_d5985f38_fk_MINERVA_childdata_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "MINERVA_weightandheightdata"
    ADD CONSTRAINT "MINERVA_weightand_uid_child_id_d5985f38_fk_MINERVA_childdata_id" FOREIGN KEY (uid_child_id) REFERENCES "MINERVA_childdata"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: M_uid_fm_milestone_id_bd2ad681_fk_MINERVA_finemotormilestone_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "MINERVA_finemotorchecklist"
    ADD CONSTRAINT "M_uid_fm_milestone_id_bd2ad681_fk_MINERVA_finemotormilestone_id" FOREIGN KEY (uid_fm_milestone_id) REFERENCES "MINERVA_finemotormilestone"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_content_type_id_c4bce8eb_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: polls_choice_question_id_c5b4b260_fk_polls_question_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY polls_choice
    ADD CONSTRAINT polls_choice_question_id_c5b4b260_fk_polls_question_id FOREIGN KEY (question_id) REFERENCES polls_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: uid_gm_milestone_id_f79bed9d_fk_MINERVA_grossmotormilestone_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "MINERVA_grossmotorchecklist"
    ADD CONSTRAINT "uid_gm_milestone_id_f79bed9d_fk_MINERVA_grossmotormilestone_id" FOREIGN KEY (uid_gm_milestone_id) REFERENCES "MINERVA_grossmotormilestone"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: Kitto
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM "postgres";
GRANT ALL ON SCHEMA public TO "postgres";
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

