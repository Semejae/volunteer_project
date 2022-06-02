--
-- PostgreSQL database dump
--

-- Dumped from database version 12.11
-- Dumped by pg_dump version 12.11

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: project; Type: TABLE; Schema: public; Owner: aglad
--

CREATE TABLE public.project (
    name character varying,
    id integer NOT NULL
);


ALTER TABLE public.project OWNER TO aglad;

--
-- Name: project_id_seq; Type: SEQUENCE; Schema: public; Owner: aglad
--

CREATE SEQUENCE public.project_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project_id_seq OWNER TO aglad;

--
-- Name: project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: aglad
--

ALTER SEQUENCE public.project_id_seq OWNED BY public.project.id;


--
-- Name: project id; Type: DEFAULT; Schema: public; Owner: aglad
--

ALTER TABLE ONLY public.project ALTER COLUMN id SET DEFAULT nextval('public.project_id_seq'::regclass);


--
-- Data for Name: project; Type: TABLE DATA; Schema: public; Owner: aglad
--

COPY public.project (name, id) FROM stdin;
\.


--
-- Name: project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: aglad
--

SELECT pg_catalog.setval('public.project_id_seq', 1, false);


--
-- Name: project project_pkey; Type: CONSTRAINT; Schema: public; Owner: aglad
--

ALTER TABLE ONLY public.project
    ADD CONSTRAINT project_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

