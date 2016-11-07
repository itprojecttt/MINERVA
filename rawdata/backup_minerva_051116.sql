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
-- Name: MINERVA_personalsocialchecklist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "MINERVA_personalsocialchecklist" (
    id integer NOT NULL,
    "timestamp" date NOT NULL,
    uid_ps_milestone_id integer NOT NULL,
    uid_user_id integer NOT NULL
);


ALTER TABLE "MINERVA_personalsocialchecklist" OWNER TO postgres;

--
-- Name: MINERVA_personalsocialchecklist_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "MINERVA_personalsocialchecklist_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "MINERVA_personalsocialchecklist_id_seq" OWNER TO postgres;

--
-- Name: MINERVA_personalsocialchecklist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "MINERVA_personalsocialchecklist_id_seq" OWNED BY "MINERVA_personalsocialchecklist".id;


--
-- Name: MINERVA_personalsocialmilestone; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "MINERVA_personalsocialmilestone" (
    id integer NOT NULL,
    ps_milestone character varying(50) NOT NULL,
    start numeric(5,2) NOT NULL,
    seven_five numeric(5,2) NOT NULL,
    finish numeric(5,2) NOT NULL
);


ALTER TABLE "MINERVA_personalsocialmilestone" OWNER TO postgres;

--
-- Name: MINERVA_personalsocialmilestone_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "MINERVA_personalsocialmilestone_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "MINERVA_personalsocialmilestone_id_seq" OWNER TO postgres;

--
-- Name: MINERVA_personalsocialmilestone_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "MINERVA_personalsocialmilestone_id_seq" OWNED BY "MINERVA_personalsocialmilestone".id;


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

ALTER TABLE ONLY "MINERVA_personalsocialchecklist" ALTER COLUMN id SET DEFAULT nextval('"MINERVA_personalsocialchecklist_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "MINERVA_personalsocialmilestone" ALTER COLUMN id SET DEFAULT nextval('"MINERVA_personalsocialmilestone_id_seq"'::regclass);


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
1	Raihan Saputra	Rai	M	3	1996-10-10
2	Kitto Adinatha	Kitto	M	6	2015-06-13
3	Favian Jr.	Fav	M	7	2015-06-09
\.


--
-- Name: MINERVA_childdata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"MINERVA_childdata_id_seq"', 3, true);


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
1	2016-10-25	1	3
2	2016-10-25	2	3
3	2016-10-30	1	6
4	2016-10-30	2	6
5	2016-11-01	3	7
6	2016-11-01	4	7
7	2016-11-01	1	3
8	2016-11-01	2	3
\.


--
-- Name: MINERVA_grossmotorchecklist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"MINERVA_grossmotorchecklist_id_seq"', 8, true);


--
-- Data for Name: MINERVA_grossmotormilestone; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "MINERVA_grossmotormilestone" (id, gm_milestone, start, seven_five, finish) FROM stdin;
1	Equal Movements	0.00	0.00	0.00
2	Lift Head	0.00	0.00	0.00
3	Head Up 45	0.00	2.00	3.00
4	Head Up 90	1.50	3.00	4.00
6	Bear Weight On Legs	2.00	3.50	4.50
5	Sit-Head Steady	2.00	3.00	4.00
8	Roll Over	2.50	4.50	6.50
9	Pull To Sit,  No Head Lag	3.00	4.00	6.00
7	Chest Up-Arm	3.00	4.00	5.00
10	Sit No Support	5.50	6.50	7.00
11	Stand Holding On	6.50	8.00	8.50
13	Get To Sitting	7.50	9.00	10.00
12	Pull to Stand	8.00	9.00	10.00
15	Stand Alone	10.00	12.00	13.50
14	Stand 2 Sec	9.50	10.50	11.50
17	Walk Well	11.00	13.50	15.00
16	Stoop And Recover	11.00	13.00	15.00
18	Walk Backwards	12.50	15.00	17.00
20	Walk Up Steps	14.00	19.00	21.50
19	Runs	14.00	18.00	20.00
21	Kick Ball Forward	16.00	21.00	23.50
23	Throw Ball Overhand	17.00	24.00	36.00
22	Jump Up	21.00	27.00	30.00
24	Broad Jump	27.00	36.00	40.00
25	Balance Each Foot 1 Second	30.00	33.00	42.00
\.


--
-- Name: MINERVA_grossmotormilestone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"MINERVA_grossmotormilestone_id_seq"', 1, false);


--
-- Data for Name: MINERVA_headdata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "MINERVA_headdata" (id, head_size, date_head, uid_child_id) FROM stdin;
1	10.00	2016-10-25	1
2	12.00	2016-10-30	2
3	12.00	2016-11-01	3
\.


--
-- Name: MINERVA_headdata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"MINERVA_headdata_id_seq"', 3, true);


--
-- Data for Name: MINERVA_personalsocialchecklist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "MINERVA_personalsocialchecklist" (id, "timestamp", uid_ps_milestone_id, uid_user_id) FROM stdin;
1	2016-10-24	24	1
2	2016-10-24	25	1
3	2016-10-24	24	1
4	2016-10-24	25	1
5	2016-10-25	1	3
6	2016-10-25	2	3
7	2016-10-30	1	6
8	2016-10-30	2	6
9	2016-11-01	3	7
10	2016-11-01	4	7
\.


--
-- Name: MINERVA_personalsocialchecklist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"MINERVA_personalsocialchecklist_id_seq"', 10, true);


--
-- Data for Name: MINERVA_personalsocialmilestone; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "MINERVA_personalsocialmilestone" (id, ps_milestone, start, seven_five, finish) FROM stdin;
1	Regard Face	0.00	0.00	1.00
2	Smile Responsively	0.50	1.50	2.00
3	Smile Spontaneously	0.00	1.50	2.00
4	Regard Own Hand	1.00	3.00	4.50
5	Work For Toy	4.00	5.50	6.00
6	Feed Self	5.00	6.00	6.50
7	Play Pat-A-Cake	7.00	10.50	11.50
8	Indicate Wants	8.00	11.00	14.00
9	Wave Bye-Bye	6.50	9.50	14.00
10	Play Ball With Examiner	9.50	12.00	16.00
11	Imitate Activities	10.00	12.50	16.00
12	Drink From Cup	9.00	15.50	17.50
13	Help In House	12.50	16.00	18.00
14	Use Spoon/Fork	13.00	18.00	20.00
15	Remove Garment	13.50	20.50	24.00
16	Feed Doll	14.50	19.50	24.00
17	Put Clothing	21.00	25.00	30.00
18	Brush Teeth With Help 	16.00	25.00	32.00
19	Wash & Dry Hands	19.00	25.00	36.50
20	Name Friend	25.00	35.00	36.50
21	Put On T-Shirt	27.00	36.00	41.00
22	Dress, No Help	36.00	48.00	54.00
23	Play Board/Card Games	33.00	3.00	60.00
24	Brush Teeth, No Help	31.00	51.00	60.00
25	Prepare Cereal	36.00	51.00	62.00
\.


--
-- Name: MINERVA_personalsocialmilestone_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"MINERVA_personalsocialmilestone_id_seq"', 1, false);


--
-- Data for Name: MINERVA_teethdata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "MINERVA_teethdata" (id, teeth, date_teeth, uid_child_id) FROM stdin;
1	10	2016-10-25	1
2	12	2016-10-30	2
3	12	2016-11-01	3
\.


--
-- Name: MINERVA_teethdata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"MINERVA_teethdata_id_seq"', 3, true);


--
-- Name: MINERVA_userchecklist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"MINERVA_userchecklist_id_seq"', 1, false);


--
-- Data for Name: MINERVA_weightandheightdata; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "MINERVA_weightandheightdata" (id, weight, height, date_w_and_h, uid_child_id) FROM stdin;
1	12.00	12.00	2016-10-25	1
2	12.00	12.00	2016-10-30	2
3	12.00	12.00	2016-11-01	3
\.


--
-- Name: MINERVA_weightandheightdata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"MINERVA_weightandheightdata_id_seq"', 3, true);


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
49	Can add personal social milestone	17	add_personalsocialmilestone
50	Can change personal social milestone	17	change_personalsocialmilestone
51	Can delete personal social milestone	17	delete_personalsocialmilestone
52	Can add personal social checklist	18	add_personalsocialchecklist
53	Can change personal social checklist	18	change_personalsocialchecklist
54	Can delete personal social checklist	18	delete_personalsocialchecklist
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_permission_id_seq', 54, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$30000$Mc3nEtSe7wcP$oyHxSQH/PpBrX7G3GP74q74Ih+Mk1v6lklwk/MxqsPo=	2016-11-04 17:48:54.629829+07	t	admin			admin@email.com	t	t	2016-10-19 12:59:57.187876+07
3	pbkdf2_sha256$30000$D6yiJzJwKIYh$5YaS8cgTip/PF+HOdwL22j4UI9Af0I+5+7htU7tNoaY=	2016-11-04 22:22:37.884811+07	f	satrio	Satrio	Baskoro	satrio@email.com	f	t	2016-10-25 13:07:32.170058+07
6	pbkdf2_sha256$30000$r3fxDrIjT3TA$nlOvqO2sECcjFXoWAGRX8IV0Tk7H+EEyd6r4xzf/Ie0=	2016-10-30 17:21:48.302883+07	f	kitto	Kristofer	Anandita	kitto@gmail.com	f	t	2016-10-30 17:21:47.971789+07
7	pbkdf2_sha256$30000$3Qz1BIv3MygY$4CM7qijdCTzsoyxyZ5Q6PDnWZ2hzn5fG9LYs1IO79Gg=	2016-11-01 13:10:19.876036+07	f	favian	Favian	Amrullah	favian@gmail.com	f	t	2016-11-01 13:10:19.591256+07
2	pbkdf2_sha256$30000$sZGoEDUrCbjL$+Lv8XTKIlXBncWOGUUzfMHzjd/fGk+nPzqrmAWWuako=	2016-11-01 13:27:55.644544+07	f	aji	Agazsi	Bahasoean	aji@rab.com	f	t	2016-10-25 12:56:10.13147+07
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

SELECT pg_catalog.setval('auth_user_id_seq', 7, true);


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
1	2016-10-19 14:56:05.007838+07	6	Bear Weight On Legs	2	[{"changed": {"fields": ["gm_milestone"]}}]	16	1
2	2016-10-20 00:51:08.350517+07	5	Sit-Head Steady	2	[{"changed": {"fields": ["gm_milestone"]}}]	16	1
3	2016-10-20 00:51:16.708197+07	8	Roll Over	2	[{"changed": {"fields": ["gm_milestone"]}}]	16	1
4	2016-10-20 02:17:06.362686+07	9	Pull To Sit,  No Head Lag	2	[{"changed": {"fields": ["gm_milestone"]}}]	16	1
5	2016-10-20 02:26:32.125947+07	7	Chest Up-Arm	2	[{"changed": {"fields": ["gm_milestone"]}}]	16	1
6	2016-10-20 02:26:44.962676+07	10	Sit No Support	2	[{"changed": {"fields": ["gm_milestone"]}}]	16	1
7	2016-10-20 02:26:58.462831+07	11	Stand Holding On	2	[{"changed": {"fields": ["gm_milestone"]}}]	16	1
8	2016-10-20 02:27:11.730744+07	13	Get To Sitting	2	[{"changed": {"fields": ["gm_milestone"]}}]	16	1
9	2016-10-20 02:27:22.043148+07	12	Pull to Stand	2	[{"changed": {"fields": ["gm_milestone"]}}]	16	1
10	2016-10-20 02:27:36.058734+07	15	Stand Alone	2	[{"changed": {"fields": ["gm_milestone"]}}]	16	1
11	2016-10-20 02:27:46.206729+07	14	Stand 2 Sec	2	[{"changed": {"fields": ["gm_milestone"]}}]	16	1
12	2016-10-20 02:28:01.259071+07	17	Walk Well	2	[{"changed": {"fields": ["gm_milestone"]}}]	16	1
13	2016-10-20 02:31:00.643748+07	16	Stoop And Recover	2	[{"changed": {"fields": ["gm_milestone"]}}]	16	1
14	2016-10-20 02:31:10.278191+07	18	Walk Backwards	2	[{"changed": {"fields": ["gm_milestone"]}}]	16	1
15	2016-10-20 02:31:20.390295+07	20	Walk Up Steps	2	[{"changed": {"fields": ["gm_milestone"]}}]	16	1
16	2016-10-20 02:31:26.838891+07	19	Runs	2	[{"changed": {"fields": ["gm_milestone"]}}]	16	1
17	2016-10-20 02:31:37.489062+07	21	Kick Ball Forward	2	[{"changed": {"fields": ["gm_milestone"]}}]	16	1
18	2016-10-20 02:36:18.067434+07	23	Throw Ball Overhand	2	[{"changed": {"fields": ["gm_milestone"]}}]	16	1
19	2016-10-20 02:36:26.528679+07	22	Jump Up	2	[{"changed": {"fields": ["gm_milestone"]}}]	16	1
20	2016-10-20 02:36:45.056082+07	24	Broad Jump	2	[{"changed": {"fields": ["gm_milestone"]}}]	16	1
21	2016-10-20 02:40:57.710096+07	25	Balance Each Foot 1 Second	2	[{"changed": {"fields": ["gm_milestone"]}}]	16	1
22	2016-10-30 16:56:33.322526+07	4	kittoadinatha	3		12	1
23	2016-10-30 17:20:53.888393+07	5	kitto	3		12	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 23, true);


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
17	MINERVA	personalsocialmilestone
18	MINERVA	personalsocialchecklist
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_content_type_id_seq', 18, true);


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
25	MINERVA	0011_auto_20161021_1757	2016-10-21 17:57:21.221617+07
26	MINERVA	0012_auto_20161025_0950	2016-10-27 10:11:11.399167+07
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_migrations_id_seq', 26, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
aty9i9ktmu85wm5kk2iwi6zhbzxcb4ny	MmRlZTk2MjJkMWRkODkyNGExMTllNWI4ZjI3ZDhmZWZlZWU2YTY4MjqABJWXAAAAAAAAAH2UKIwSX2F1dGhfdXNlcl9iYWNrZW5klIwpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmSUjA9fYXV0aF91c2VyX2hhc2iUjChiM2FmYzc0ZGVlYTI5Njk5MjA2ZDE5MWMzOTQ1MDU5NTY2ZjNiMzcxlIwNX2F1dGhfdXNlcl9pZJSMATGUdS4=	2016-10-30 14:20:50.785431+07
n5198p1k9d1i0q0bpjbsn556qvh5pukx	MmRlZTk2MjJkMWRkODkyNGExMTllNWI4ZjI3ZDhmZWZlZWU2YTY4MjqABJWXAAAAAAAAAH2UKIwSX2F1dGhfdXNlcl9iYWNrZW5klIwpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmSUjA9fYXV0aF91c2VyX2hhc2iUjChiM2FmYzc0ZGVlYTI5Njk5MjA2ZDE5MWMzOTQ1MDU5NTY2ZjNiMzcxlIwNX2F1dGhfdXNlcl9pZJSMATGUdS4=	2016-10-30 16:57:20.010337+07
qx9eo9jnmwpx3d7ub8hyohksgo5tj31x	ZGNmZTY2MWI3MGUxZmRkOTUyZDBhODM4ZmY0ZjM5Mzc5ODJlZWJmZjqABJWXAAAAAAAAAH2UKIwPX2F1dGhfdXNlcl9oYXNolIwoYjNhZmM3NGRlZWEyOTY5OTIwNmQxOTFjMzk0NTA1OTU2NmYzYjM3MZSMEl9hdXRoX3VzZXJfYmFja2VuZJSMKWRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5klIwNX2F1dGhfdXNlcl9pZJSMATGUdS4=	2016-10-30 17:17:00.471423+07
v3wv2mva6wd6ixd7g908v5hha1nml8j6	NGMzNjdlZDhiYmUwNTYxMDg5MjY5ZTI2ODIxZWZmMjFmYjdjMDNmMzqABJWXAAAAAAAAAH2UKIwPX2F1dGhfdXNlcl9oYXNolIwoYzY0MTBhM2U4ZjYwNzEwMWVkODIwY2UyYTQ0YmI1ZTk0YTYxOTBkYpSMEl9hdXRoX3VzZXJfYmFja2VuZJSMKWRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5klIwNX2F1dGhfdXNlcl9pZJSMATWUdS4=	2016-10-30 17:18:02.949483+07
k907mtz1f1bo46cqzm28f0ovyex8lobw	ZjI3ZDcxZmQ4NGM0YjQ2NmYxYTFhMTY0MzJiMDcyYjZhYjM1M2MyZDqABJWXAAAAAAAAAH2UKIwPX2F1dGhfdXNlcl9oYXNolIwoYjNhZmM3NGRlZWEyOTY5OTIwNmQxOTFjMzk0NTA1OTU2NmYzYjM3MZSMDV9hdXRoX3VzZXJfaWSUjAExlIwSX2F1dGhfdXNlcl9iYWNrZW5klIwpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmSUdS4=	2016-10-30 17:21:40.411281+07
9rq1wv82bun75vkdkuv5666x8zka03cc	ZjI3ZDcxZmQ4NGM0YjQ2NmYxYTFhMTY0MzJiMDcyYjZhYjM1M2MyZDqABJWXAAAAAAAAAH2UKIwPX2F1dGhfdXNlcl9oYXNolIwoYjNhZmM3NGRlZWEyOTY5OTIwNmQxOTFjMzk0NTA1OTU2NmYzYjM3MZSMDV9hdXRoX3VzZXJfaWSUjAExlIwSX2F1dGhfdXNlcl9iYWNrZW5klIwpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmSUdS4=	2016-10-30 17:23:50.372149+07
tnx90400i4ot1o0jnoxunyc7iraq9iwg	ZjI3ZDcxZmQ4NGM0YjQ2NmYxYTFhMTY0MzJiMDcyYjZhYjM1M2MyZDqABJWXAAAAAAAAAH2UKIwPX2F1dGhfdXNlcl9oYXNolIwoYjNhZmM3NGRlZWEyOTY5OTIwNmQxOTFjMzk0NTA1OTU2NmYzYjM3MZSMDV9hdXRoX3VzZXJfaWSUjAExlIwSX2F1dGhfdXNlcl9iYWNrZW5klIwpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmSUdS4=	2016-10-30 17:25:05.527956+07
37nqlb8qaoznnpso2slxa53pxy5aajmg	ZGNmZTY2MWI3MGUxZmRkOTUyZDBhODM4ZmY0ZjM5Mzc5ODJlZWJmZjqABJWXAAAAAAAAAH2UKIwPX2F1dGhfdXNlcl9oYXNolIwoYjNhZmM3NGRlZWEyOTY5OTIwNmQxOTFjMzk0NTA1OTU2NmYzYjM3MZSMEl9hdXRoX3VzZXJfYmFja2VuZJSMKWRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5klIwNX2F1dGhfdXNlcl9pZJSMATGUdS4=	2016-10-30 17:28:43.98489+07
ue9p5n2tncpyxjgllwchz24ir43yc04a	ZGNmZTY2MWI3MGUxZmRkOTUyZDBhODM4ZmY0ZjM5Mzc5ODJlZWJmZjqABJWXAAAAAAAAAH2UKIwPX2F1dGhfdXNlcl9oYXNolIwoYjNhZmM3NGRlZWEyOTY5OTIwNmQxOTFjMzk0NTA1OTU2NmYzYjM3MZSMEl9hdXRoX3VzZXJfYmFja2VuZJSMKWRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5klIwNX2F1dGhfdXNlcl9pZJSMATGUdS4=	2016-10-30 17:30:00.89996+07
zb3qglj9w0p5wlznb39rq1pz1s3yjpqk	ZGNmZTY2MWI3MGUxZmRkOTUyZDBhODM4ZmY0ZjM5Mzc5ODJlZWJmZjqABJWXAAAAAAAAAH2UKIwPX2F1dGhfdXNlcl9oYXNolIwoYjNhZmM3NGRlZWEyOTY5OTIwNmQxOTFjMzk0NTA1OTU2NmYzYjM3MZSMEl9hdXRoX3VzZXJfYmFja2VuZJSMKWRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5klIwNX2F1dGhfdXNlcl9pZJSMATGUdS4=	2016-10-30 17:31:11.070252+07
2xec51a842n1eqgbvztnxznpu9suk17h	ZGNmZTY2MWI3MGUxZmRkOTUyZDBhODM4ZmY0ZjM5Mzc5ODJlZWJmZjqABJWXAAAAAAAAAH2UKIwPX2F1dGhfdXNlcl9oYXNolIwoYjNhZmM3NGRlZWEyOTY5OTIwNmQxOTFjMzk0NTA1OTU2NmYzYjM3MZSMEl9hdXRoX3VzZXJfYmFja2VuZJSMKWRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5klIwNX2F1dGhfdXNlcl9pZJSMATGUdS4=	2016-10-30 17:37:13.409962+07
cnjre48btb4t81bxxk3gdsu4vvkqfhg4	ZjZjNzI2ZGVhZWFlOTJkYjMyZmVhZTgyZTkxYTZhYjNjODgyM2YxNjqABJWXAAAAAAAAAH2UKIwNX2F1dGhfdXNlcl9pZJSMATGUjA9fYXV0aF91c2VyX2hhc2iUjChiM2FmYzc0ZGVlYTI5Njk5MjA2ZDE5MWMzOTQ1MDU5NTY2ZjNiMzcxlIwSX2F1dGhfdXNlcl9iYWNrZW5klIwpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmSUdS4=	2016-10-30 17:41:24.796215+07
qo6ciormi3vxq812ix44czw19nxuczjo	MmRlZTk2MjJkMWRkODkyNGExMTllNWI4ZjI3ZDhmZWZlZWU2YTY4MjqABJWXAAAAAAAAAH2UKIwSX2F1dGhfdXNlcl9iYWNrZW5klIwpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmSUjA9fYXV0aF91c2VyX2hhc2iUjChiM2FmYzc0ZGVlYTI5Njk5MjA2ZDE5MWMzOTQ1MDU5NTY2ZjNiMzcxlIwNX2F1dGhfdXNlcl9pZJSMATGUdS4=	2016-10-30 17:49:00.312413+07
u90v8grw7r930ujm9po020qsj95xbo7h	ZjI3ZDcxZmQ4NGM0YjQ2NmYxYTFhMTY0MzJiMDcyYjZhYjM1M2MyZDqABJWXAAAAAAAAAH2UKIwPX2F1dGhfdXNlcl9oYXNolIwoYjNhZmM3NGRlZWEyOTY5OTIwNmQxOTFjMzk0NTA1OTU2NmYzYjM3MZSMDV9hdXRoX3VzZXJfaWSUjAExlIwSX2F1dGhfdXNlcl9iYWNrZW5klIwpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmSUdS4=	2016-11-01 13:16:35.034913+07
q5xjlj8onvf2qoxy1n915oqxexvfxjab	ZGNmZTY2MWI3MGUxZmRkOTUyZDBhODM4ZmY0ZjM5Mzc5ODJlZWJmZjqABJWXAAAAAAAAAH2UKIwPX2F1dGhfdXNlcl9oYXNolIwoYjNhZmM3NGRlZWEyOTY5OTIwNmQxOTFjMzk0NTA1OTU2NmYzYjM3MZSMEl9hdXRoX3VzZXJfYmFja2VuZJSMKWRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5klIwNX2F1dGhfdXNlcl9pZJSMATGUdS4=	2016-11-01 13:25:57.331824+07
tf3uky6ywgji1zl87zpq9ybwsea89zb0	ZjI1NjhmODIzZDQ2OGMwMzg1MDViNmY2NDNiMDFiNzk5OTU5NWEyZjqABJWXAAAAAAAAAH2UKIwNX2F1dGhfdXNlcl9pZJSMATOUjA9fYXV0aF91c2VyX2hhc2iUjCgzZTQ4YTU0YjljZTM0NGQ4OGYwZTZjMWIzZjFiYTJhMmM4ZWZjZTMxlIwSX2F1dGhfdXNlcl9iYWNrZW5klIwpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmSUdS4=	2016-11-01 14:24:24.183598+07
at85odd17yceces6i2hmueaeoqi8pf43	NDE0OTFiOTc4NTFjZjA1NWQ3YmJkMGU4MmIyODk0ZGEyN2UzNWM2YTqABJWXAAAAAAAAAH2UKIwSX2F1dGhfdXNlcl9iYWNrZW5klIwpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmSUjA1fYXV0aF91c2VyX2lklIwBM5SMD19hdXRoX3VzZXJfaGFzaJSMKDNlNDhhNTRiOWNlMzQ0ZDg4ZjBlNmMxYjNmMWJhMmEyYzhlZmNlMzGUdS4=	2016-11-01 14:34:33.649885+07
tq3yjueme8ryhfskr4kbu0uq5qjislh5	ZGE3ZjU0MGI1ODEzMGQxZjlmYTUzYjEwYzA1MGI3YjViYzQxYjdkNDqABJWXAAAAAAAAAH2UKIwNX2F1dGhfdXNlcl9pZJSMATOUjBJfYXV0aF91c2VyX2JhY2tlbmSUjClkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZJSMD19hdXRoX3VzZXJfaGFzaJSMKDNlNDhhNTRiOWNlMzQ0ZDg4ZjBlNmMxYjNmMWJhMmEyYzhlZmNlMzGUdS4=	2016-11-01 14:47:09.057976+07
aoao03r2s4jhf7013jzv163b9v2922h3	MjhiMzdiYjY1MDZiZGQ1ZTRkZTM2NzEzODU3ZTYyYjhiMWFjMmNlNDqABJWXAAAAAAAAAH2UKIwPX2F1dGhfdXNlcl9oYXNolIwoM2U0OGE1NGI5Y2UzNDRkODhmMGU2YzFiM2YxYmEyYTJjOGVmY2UzMZSMEl9hdXRoX3VzZXJfYmFja2VuZJSMKWRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5klIwNX2F1dGhfdXNlcl9pZJSMATOUdS4=	2016-11-01 14:57:07.265726+07
i6brv3fleykep8ysl7bdxbrp4radhfc3	ZGE3ZjU0MGI1ODEzMGQxZjlmYTUzYjEwYzA1MGI3YjViYzQxYjdkNDqABJWXAAAAAAAAAH2UKIwNX2F1dGhfdXNlcl9pZJSMATOUjBJfYXV0aF91c2VyX2JhY2tlbmSUjClkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZJSMD19hdXRoX3VzZXJfaGFzaJSMKDNlNDhhNTRiOWNlMzQ0ZDg4ZjBlNmMxYjNmMWJhMmEyYzhlZmNlMzGUdS4=	2016-11-01 15:02:28.200676+07
bjc38d01p1khr4hqooodgzuznakaifn0	NDE0OTFiOTc4NTFjZjA1NWQ3YmJkMGU4MmIyODk0ZGEyN2UzNWM2YTqABJWXAAAAAAAAAH2UKIwSX2F1dGhfdXNlcl9iYWNrZW5klIwpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmSUjA1fYXV0aF91c2VyX2lklIwBM5SMD19hdXRoX3VzZXJfaGFzaJSMKDNlNDhhNTRiOWNlMzQ0ZDg4ZjBlNmMxYjNmMWJhMmEyYzhlZmNlMzGUdS4=	2016-11-01 15:09:44.358767+07
ex3v9ajbhzusdlyxgd6kq7fc33gs3d0w	ZGE3ZjU0MGI1ODEzMGQxZjlmYTUzYjEwYzA1MGI3YjViYzQxYjdkNDqABJWXAAAAAAAAAH2UKIwNX2F1dGhfdXNlcl9pZJSMATOUjBJfYXV0aF91c2VyX2JhY2tlbmSUjClkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZJSMD19hdXRoX3VzZXJfaGFzaJSMKDNlNDhhNTRiOWNlMzQ0ZDg4ZjBlNmMxYjNmMWJhMmEyYzhlZmNlMzGUdS4=	2016-11-01 15:15:11.457108+07
l7y4tq27tbyemcqcvaf9an8q7rzmre2x	ZGE3ZjU0MGI1ODEzMGQxZjlmYTUzYjEwYzA1MGI3YjViYzQxYjdkNDqABJWXAAAAAAAAAH2UKIwNX2F1dGhfdXNlcl9pZJSMATOUjBJfYXV0aF91c2VyX2JhY2tlbmSUjClkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZJSMD19hdXRoX3VzZXJfaGFzaJSMKDNlNDhhNTRiOWNlMzQ0ZDg4ZjBlNmMxYjNmMWJhMmEyYzhlZmNlMzGUdS4=	2016-11-01 15:31:20.74703+07
unec2nv01nydy6fpkgeiw5ei5et0r4er	ZjI3ZDcxZmQ4NGM0YjQ2NmYxYTFhMTY0MzJiMDcyYjZhYjM1M2MyZDqABJWXAAAAAAAAAH2UKIwPX2F1dGhfdXNlcl9oYXNolIwoYjNhZmM3NGRlZWEyOTY5OTIwNmQxOTFjMzk0NTA1OTU2NmYzYjM3MZSMDV9hdXRoX3VzZXJfaWSUjAExlIwSX2F1dGhfdXNlcl9iYWNrZW5klIwpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmSUdS4=	2016-11-03 10:25:11.373235+07
g8kncazycx8eyosumfq88fufchipel4f	MTZjZTgxMTAyYjIxMzg2MmM1MzczOTRkMzIzMDkzMjYwOTI4NjkyZjqABJWXAAAAAAAAAH2UKIwSX2F1dGhfdXNlcl9iYWNrZW5klIwpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmSUjA1fYXV0aF91c2VyX2lklIwBMZSMD19hdXRoX3VzZXJfaGFzaJSMKGIzYWZjNzRkZWVhMjk2OTkyMDZkMTkxYzM5NDUwNTk1NjZmM2IzNzGUdS4=	2016-11-04 17:53:54.633736+07
dudzskpgocki150t6jwl3jqsvtmz382s	N2JjNmU1MGY0YjNiODFmMjg2ZDcxMDIzZWFiYmFiODJhNDk3NmY5OTqABJWXAAAAAAAAAH2UKIwPX2F1dGhfdXNlcl9oYXNolIwoM2U0OGE1NGI5Y2UzNDRkODhmMGU2YzFiM2YxYmEyYTJjOGVmY2UzMZSMDV9hdXRoX3VzZXJfaWSUjAEzlIwSX2F1dGhfdXNlcl9iYWNrZW5klIwpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmSUdS4=	2016-11-04 22:15:25.084918+07
rjq1pg6ckk9mpjyjw9n7w2srsp1wtz1j	N2JjNmU1MGY0YjNiODFmMjg2ZDcxMDIzZWFiYmFiODJhNDk3NmY5OTqABJWXAAAAAAAAAH2UKIwPX2F1dGhfdXNlcl9oYXNolIwoM2U0OGE1NGI5Y2UzNDRkODhmMGU2YzFiM2YxYmEyYTJjOGVmY2UzMZSMDV9hdXRoX3VzZXJfaWSUjAEzlIwSX2F1dGhfdXNlcl9iYWNrZW5klIwpZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmSUdS4=	2016-11-04 22:27:37.886656+07
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
-- Name: MINERVA_personalsocialchecklist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "MINERVA_personalsocialchecklist"
    ADD CONSTRAINT "MINERVA_personalsocialchecklist_pkey" PRIMARY KEY (id);


--
-- Name: MINERVA_personalsocialmilestone_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "MINERVA_personalsocialmilestone"
    ADD CONSTRAINT "MINERVA_personalsocialmilestone_pkey" PRIMARY KEY (id);


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
-- Name: MINERVA_personalsocialchecklist_be15043f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "MINERVA_personalsocialchecklist_be15043f" ON "MINERVA_personalsocialchecklist" USING btree (uid_ps_milestone_id);


--
-- Name: MINERVA_personalsocialchecklist_fa632982; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "MINERVA_personalsocialchecklist_fa632982" ON "MINERVA_personalsocialchecklist" USING btree (uid_user_id);


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
-- Name: D35a844b8b2441b699c31497d6820e91; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "MINERVA_personalsocialchecklist"
    ADD CONSTRAINT "D35a844b8b2441b699c31497d6820e91" FOREIGN KEY (uid_ps_milestone_id) REFERENCES "MINERVA_personalsocialmilestone"(id) DEFERRABLE INITIALLY DEFERRED;


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
-- Name: MINERVA_personalsocialchec_uid_user_id_a3e611a4_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "MINERVA_personalsocialchecklist"
    ADD CONSTRAINT "MINERVA_personalsocialchec_uid_user_id_a3e611a4_fk_auth_user_id" FOREIGN KEY (uid_user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


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
REVOKE ALL ON SCHEMA public FROM "Kitto";
GRANT ALL ON SCHEMA public TO "Kitto";
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

