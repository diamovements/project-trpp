--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', 'public', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: login_system; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA login_system;


ALTER SCHEMA login_system OWNER TO postgres;

--
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: apartment_request; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.apartment_request (
    id integer NOT NULL,
    email character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    title character varying(255)
);


ALTER TABLE public.apartment_request OWNER TO postgres;

--
-- Name: apartment_request_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.apartment_request_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.apartment_request_id_seq OWNER TO postgres;

--
-- Name: apartment_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.apartment_request_id_seq OWNED BY public.apartment_request.id;


--
-- Name: apartments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.apartments (
    apartment_id integer NOT NULL,
    area real,
    building_id integer,
    floor integer,
    number integer,
    price real,
    rooms integer,
    CONSTRAINT apartments_number_check CHECK ((number <= 500)),
    CONSTRAINT apartments_price_check CHECK ((price >= (1000000)::double precision)),
    CONSTRAINT apartments_rooms_check CHECK ((rooms <= 7))
);


ALTER TABLE public.apartments OWNER TO postgres;

--
-- Name: apartments_apartment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.apartments_apartment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.apartments_apartment_id_seq OWNER TO postgres;

--
-- Name: apartments_apartment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.apartments_apartment_id_seq OWNED BY public.apartments.apartment_id;


--
-- Name: buildings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.buildings (
    building_id integer NOT NULL,
    title character varying(255) NOT NULL,
    location character varying(255) NOT NULL,
    image character varying(255),
    distance integer NOT NULL
);


ALTER TABLE public.buildings OWNER TO postgres;

--
-- Name: buildings_building_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.buildings ALTER COLUMN building_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.buildings_building_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clients (
    person_id integer NOT NULL,
    email character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    password character varying(255) NOT NULL
);


ALTER TABLE public.clients OWNER TO postgres;

--
-- Name: clients_person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clients_person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clients_person_id_seq OWNER TO postgres;

--
-- Name: clients_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clients_person_id_seq OWNED BY public.clients.person_id;


--
-- Name: clients_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clients_roles (
    client_id integer NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.clients_roles OWNER TO postgres;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: apartment_request id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.apartment_request ALTER COLUMN id SET DEFAULT nextval('public.apartment_request_id_seq'::regclass);


--
-- Name: apartments apartment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.apartments ALTER COLUMN apartment_id SET DEFAULT nextval('public.apartments_apartment_id_seq'::regclass);


--
-- Name: clients person_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients ALTER COLUMN person_id SET DEFAULT nextval('public.clients_person_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Data for Name: apartment_request; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.apartment_request (id, email, first_name, last_name, title) FROM stdin;
\.


--
-- Data for Name: apartments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.apartments (apartment_id, area, building_id, floor, number, price, rooms) FROM stdin;
8	75.5	1	3	15	2.5e+07	2
9	100	1	5	20	1.5e+07	3
10	120	1	7	25	2e+07	4
11	60	2	2	5	8e+06	1
12	85	2	4	10	1.2e+07	2
13	110	2	6	15	1.8e+07	3
14	70	3	3	8	9.5e+06	2
15	95	3	5	12	1.35e+07	3
16	115	3	7	18	1.85e+07	4
\.


--
-- Data for Name: buildings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.buildings (building_id, title, location, image, distance) FROM stdin;
1	Kutuzov	Belorusskaya	/images/kutuzov.jpg	10
2	Samolyot	Ramenki	/images/samolyot.jpg	15
3	Island	Terekhovo	/images/building3.jpg	15
\.


--
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clients (person_id, email, name, password) FROM stdin;
\.


--
-- Data for Name: clients_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clients_roles (client_id, role_id) FROM stdin;
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, name) FROM stdin;
\.


--
-- Name: apartment_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.apartment_request_id_seq', 1, false);


--
-- Name: apartments_apartment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.apartments_apartment_id_seq', 16, true);


--
-- Name: buildings_building_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.buildings_building_id_seq', 3, true);


--
-- Name: clients_person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clients_person_id_seq', 1, false);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 1, false);


--
-- Name: apartment_request apartment_request_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.apartment_request
    ADD CONSTRAINT apartment_request_pkey PRIMARY KEY (id);


--
-- Name: apartments apartments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.apartments
    ADD CONSTRAINT apartments_pkey PRIMARY KEY (apartment_id);


--
-- Name: buildings buildings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.buildings
    ADD CONSTRAINT buildings_pkey PRIMARY KEY (building_id);


--
-- Name: clients clients_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_email_key UNIQUE (email);


--
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (person_id);


--
-- Name: roles roles_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key UNIQUE (name);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: clients_roles fkdfc8skx88ssraasvuujbk3kex; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients_roles
    ADD CONSTRAINT fkdfc8skx88ssraasvuujbk3kex FOREIGN KEY (client_id) REFERENCES public.clients(person_id);


--
-- Name: clients_roles fko54trdcx32s4eolcxktnjpc3a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients_roles
    ADD CONSTRAINT fko54trdcx32s4eolcxktnjpc3a FOREIGN KEY (role_id) REFERENCES public.roles(id);


--
-- PostgreSQL database dump complete
--

