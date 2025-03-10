--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-03-10 15:14:33

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
-- TOC entry 220 (class 1259 OID 16437)
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    departmentid integer NOT NULL,
    departmentname character varying(50) NOT NULL
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16436)
-- Name: departments_departmentid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.departments_departmentid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.departments_departmentid_seq OWNER TO postgres;

--
-- TOC entry 4917 (class 0 OID 0)
-- Dependencies: 219
-- Name: departments_departmentid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.departments_departmentid_seq OWNED BY public.departments.departmentid;


--
-- TOC entry 218 (class 1259 OID 16427)
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    empid integer NOT NULL,
    name character varying(50) NOT NULL,
    department character varying(50),
    salary numeric(10,2) DEFAULT 30000,
    hiredate date DEFAULT CURRENT_DATE,
    departmentid integer,
    email character varying(100) NOT NULL,
    contactnumber character varying(15),
    CONSTRAINT employees_salary_check CHECK ((salary > (0)::numeric))
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16426)
-- Name: employees_empid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employees_empid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.employees_empid_seq OWNER TO postgres;

--
-- TOC entry 4918 (class 0 OID 0)
-- Dependencies: 217
-- Name: employees_empid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employees_empid_seq OWNED BY public.employees.empid;


--
-- TOC entry 4750 (class 2604 OID 16440)
-- Name: departments departmentid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments ALTER COLUMN departmentid SET DEFAULT nextval('public.departments_departmentid_seq'::regclass);


--
-- TOC entry 4747 (class 2604 OID 16430)
-- Name: employees empid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees ALTER COLUMN empid SET DEFAULT nextval('public.employees_empid_seq'::regclass);


--
-- TOC entry 4911 (class 0 OID 16437)
-- Dependencies: 220
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departments (departmentid, departmentname) FROM stdin;
1	IT
2	HR
3	Finance
\.


--
-- TOC entry 4909 (class 0 OID 16427)
-- Dependencies: 218
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employees (empid, name, department, salary, hiredate, departmentid, email, contactnumber) FROM stdin;
10	John Doe	\N	70000.00	2023-05-10	1	johndoe@email.com	9876543210
11	Jane Smith	\N	55000.00	2022-08-15	2	janesmith@email.com	8765432109
12	Robert Brown	\N	62000.00	2021-11-20	3	robertbrown@email.com	7654321098
13	Emily Davis	\N	48000.00	2023-01-25	1	emilydavis@email.com	6543210987
14	Michael Wilson	\N	75000.00	2020-06-30	3	michaelwilson@email.com	5432109876
15	Sophia Miller	\N	51000.00	2022-12-05	2	sophiamiller@email.com	4321098765
\.


--
-- TOC entry 4919 (class 0 OID 0)
-- Dependencies: 219
-- Name: departments_departmentid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departments_departmentid_seq', 3, true);


--
-- TOC entry 4920 (class 0 OID 0)
-- Dependencies: 217
-- Name: employees_empid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employees_empid_seq', 15, true);


--
-- TOC entry 4759 (class 2606 OID 16444)
-- Name: departments departments_departmentname_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_departmentname_key UNIQUE (departmentname);


--
-- TOC entry 4761 (class 2606 OID 16442)
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (departmentid);


--
-- TOC entry 4753 (class 2606 OID 16451)
-- Name: employees employees_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_email_key UNIQUE (email);


--
-- TOC entry 4755 (class 2606 OID 16435)
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (empid);


--
-- TOC entry 4757 (class 2606 OID 16457)
-- Name: employees unique_employee_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT unique_employee_name UNIQUE (name);


--
-- TOC entry 4762 (class 2606 OID 16445)
-- Name: employees fk_department; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT fk_department FOREIGN KEY (departmentid) REFERENCES public.departments(departmentid);


-- Completed on 2025-03-10 15:14:33

--
-- PostgreSQL database dump complete
--

