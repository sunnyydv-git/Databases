--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-03-10 17:57:27

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 221 (class 1259 OID 16484)
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    studentid integer NOT NULL,
    name character varying(50),
    age integer,
    courseid integer
);


ALTER TABLE public.students OWNER TO postgres;

--
-- TOC entry 4901 (class 0 OID 16484)
-- Dependencies: 221
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students (studentid, name, age, courseid) FROM stdin;
1	Alice	22	101
2	Bob	24	102
3	Charlie	23	\N
4	David	25	104
\.


--
-- TOC entry 4755 (class 2606 OID 16488)
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (studentid);


-- Completed on 2025-03-10 17:57:28

--
-- PostgreSQL database dump complete
--

