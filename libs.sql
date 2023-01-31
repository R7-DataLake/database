--
-- PostgreSQL database dump
--

-- Dumped from database version 15.0
-- Dumped by pg_dump version 15.0

-- Started on 2023-01-31 09:11:31

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
-- TOC entry 9 (class 2615 OID 32818)
-- Name: libs; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA libs;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 241 (class 1259 OID 73996)
-- Name: clinic_mappings; Type: TABLE; Schema: libs; Owner: -
--

CREATE TABLE libs.clinic_mappings (
    code character varying(10) NOT NULL,
    hospcode character varying(10) NOT NULL,
    f43 character varying(10),
    nhso character varying(10)
);


--
-- TOC entry 240 (class 1259 OID 73986)
-- Name: clinics; Type: TABLE; Schema: libs; Owner: -
--

CREATE TABLE libs.clinics (
    hospcode character varying(10) NOT NULL,
    code character varying(10) NOT NULL,
    name character varying(200),
    user_id uuid,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


--
-- TOC entry 238 (class 1259 OID 73960)
-- Name: drug_mappings; Type: TABLE; Schema: libs; Owner: -
--

CREATE TABLE libs.drug_mappings (
    code character varying(10) NOT NULL,
    f43 character varying(50),
    tmt character varying(50),
    nhso character varying(50),
    hospcode character varying(10) NOT NULL
);


--
-- TOC entry 243 (class 1259 OID 74008)
-- Name: drug_usage_mappings; Type: TABLE; Schema: libs; Owner: -
--

CREATE TABLE libs.drug_usage_mappings (
    code character varying(10) NOT NULL,
    hospcode character varying(10) NOT NULL,
    f43 character varying(10),
    nhso character varying(10)
);


--
-- TOC entry 242 (class 1259 OID 74001)
-- Name: drug_usages; Type: TABLE; Schema: libs; Owner: -
--

CREATE TABLE libs.drug_usages (
    hospcode character varying(10) NOT NULL,
    code character varying(10) NOT NULL,
    usage_1 character varying(255),
    user_id uuid,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    usage_2 character varying(255),
    usage_3 character varying(255)
);


--
-- TOC entry 236 (class 1259 OID 73944)
-- Name: drugs; Type: TABLE; Schema: libs; Owner: -
--

CREATE TABLE libs.drugs (
    code character varying NOT NULL,
    name character varying,
    hospcode character varying(10) NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    user_id uuid
);


--
-- TOC entry 239 (class 1259 OID 73981)
-- Name: insurance_mappings; Type: TABLE; Schema: libs; Owner: -
--

CREATE TABLE libs.insurance_mappings (
    code character varying(10) NOT NULL,
    hospcode character varying(10) NOT NULL,
    f43 character varying(10),
    nhso character varying(10)
);


--
-- TOC entry 237 (class 1259 OID 73953)
-- Name: insurances; Type: TABLE; Schema: libs; Owner: -
--

CREATE TABLE libs.insurances (
    hospcode character varying(10) NOT NULL,
    code character varying(6) NOT NULL,
    name character varying(255),
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    user_id uuid
);


--
-- TOC entry 245 (class 1259 OID 74028)
-- Name: lab_groups; Type: TABLE; Schema: libs; Owner: -
--

CREATE TABLE libs.lab_groups (
    hospcode character varying(10) NOT NULL,
    code character varying(10) NOT NULL,
    name character varying(200),
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    user_id uuid
);


--
-- TOC entry 244 (class 1259 OID 74021)
-- Name: lab_items; Type: TABLE; Schema: libs; Owner: -
--

CREATE TABLE libs.lab_items (
    hospcode character varying(10) NOT NULL,
    code character varying(10) NOT NULL,
    name character varying(200),
    user_id uuid,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    lab_group_id character varying(50)
);


--
-- TOC entry 249 (class 1259 OID 74054)
-- Name: nation_mappings; Type: TABLE; Schema: libs; Owner: -
--

CREATE TABLE libs.nation_mappings (
    code character varying(10) NOT NULL,
    hospcode character varying(10) NOT NULL,
    f43 character varying(10),
    nhso character varying(10)
);


--
-- TOC entry 248 (class 1259 OID 74047)
-- Name: nations; Type: TABLE; Schema: libs; Owner: -
--

CREATE TABLE libs.nations (
    hospcode character varying(10) NOT NULL,
    code character varying(10) NOT NULL,
    name character varying(200),
    user_id uuid,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


--
-- TOC entry 247 (class 1259 OID 74042)
-- Name: occupation_mappings; Type: TABLE; Schema: libs; Owner: -
--

CREATE TABLE libs.occupation_mappings (
    code character varying(10) NOT NULL,
    hospcode character varying(10) NOT NULL,
    f43 character varying(10),
    nhso character varying(10)
);


--
-- TOC entry 246 (class 1259 OID 74035)
-- Name: occupations; Type: TABLE; Schema: libs; Owner: -
--

CREATE TABLE libs.occupations (
    hospcode character varying(10) NOT NULL,
    code character varying(10) NOT NULL,
    name character varying(200),
    user_id uuid,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


--
-- TOC entry 250 (class 1259 OID 74059)
-- Name: providers; Type: TABLE; Schema: libs; Owner: -
--

CREATE TABLE libs.providers (
    hospcode character varying(10) NOT NULL,
    code character varying(50) NOT NULL,
    fname character varying(100),
    lname character varying(100),
    sex character(1),
    birth date,
    provider_type character varying(15),
    start_date date,
    end_date date,
    cid character varying(13),
    register_no character varying(50),
    council character varying(2),
    prename character varying(50)
);


--
-- TOC entry 3522 (class 0 OID 73996)
-- Dependencies: 241
-- Data for Name: clinic_mappings; Type: TABLE DATA; Schema: libs; Owner: -
--



--
-- TOC entry 3521 (class 0 OID 73986)
-- Dependencies: 240
-- Data for Name: clinics; Type: TABLE DATA; Schema: libs; Owner: -
--



--
-- TOC entry 3519 (class 0 OID 73960)
-- Dependencies: 238
-- Data for Name: drug_mappings; Type: TABLE DATA; Schema: libs; Owner: -
--



--
-- TOC entry 3524 (class 0 OID 74008)
-- Dependencies: 243
-- Data for Name: drug_usage_mappings; Type: TABLE DATA; Schema: libs; Owner: -
--



--
-- TOC entry 3523 (class 0 OID 74001)
-- Dependencies: 242
-- Data for Name: drug_usages; Type: TABLE DATA; Schema: libs; Owner: -
--



--
-- TOC entry 3517 (class 0 OID 73944)
-- Dependencies: 236
-- Data for Name: drugs; Type: TABLE DATA; Schema: libs; Owner: -
--



--
-- TOC entry 3520 (class 0 OID 73981)
-- Dependencies: 239
-- Data for Name: insurance_mappings; Type: TABLE DATA; Schema: libs; Owner: -
--



--
-- TOC entry 3518 (class 0 OID 73953)
-- Dependencies: 237
-- Data for Name: insurances; Type: TABLE DATA; Schema: libs; Owner: -
--



--
-- TOC entry 3526 (class 0 OID 74028)
-- Dependencies: 245
-- Data for Name: lab_groups; Type: TABLE DATA; Schema: libs; Owner: -
--



--
-- TOC entry 3525 (class 0 OID 74021)
-- Dependencies: 244
-- Data for Name: lab_items; Type: TABLE DATA; Schema: libs; Owner: -
--



--
-- TOC entry 3530 (class 0 OID 74054)
-- Dependencies: 249
-- Data for Name: nation_mappings; Type: TABLE DATA; Schema: libs; Owner: -
--



--
-- TOC entry 3529 (class 0 OID 74047)
-- Dependencies: 248
-- Data for Name: nations; Type: TABLE DATA; Schema: libs; Owner: -
--



--
-- TOC entry 3528 (class 0 OID 74042)
-- Dependencies: 247
-- Data for Name: occupation_mappings; Type: TABLE DATA; Schema: libs; Owner: -
--



--
-- TOC entry 3527 (class 0 OID 74035)
-- Dependencies: 246
-- Data for Name: occupations; Type: TABLE DATA; Schema: libs; Owner: -
--



--
-- TOC entry 3531 (class 0 OID 74059)
-- Dependencies: 250
-- Data for Name: providers; Type: TABLE DATA; Schema: libs; Owner: -
--



--
-- TOC entry 3356 (class 2606 OID 74000)
-- Name: clinic_mappings clinic_mappings_pk; Type: CONSTRAINT; Schema: libs; Owner: -
--

ALTER TABLE ONLY libs.clinic_mappings
    ADD CONSTRAINT clinic_mappings_pk PRIMARY KEY (code, hospcode);


--
-- TOC entry 3354 (class 2606 OID 73992)
-- Name: clinics clinics_pk; Type: CONSTRAINT; Schema: libs; Owner: -
--

ALTER TABLE ONLY libs.clinics
    ADD CONSTRAINT clinics_pk PRIMARY KEY (hospcode, code);


--
-- TOC entry 3350 (class 2606 OID 73964)
-- Name: drug_mappings drug_mappings_pk; Type: CONSTRAINT; Schema: libs; Owner: -
--

ALTER TABLE ONLY libs.drug_mappings
    ADD CONSTRAINT drug_mappings_pk PRIMARY KEY (code, hospcode);


--
-- TOC entry 3360 (class 2606 OID 74012)
-- Name: drug_usage_mappings drug_usage_mappings_pk; Type: CONSTRAINT; Schema: libs; Owner: -
--

ALTER TABLE ONLY libs.drug_usage_mappings
    ADD CONSTRAINT drug_usage_mappings_pk PRIMARY KEY (code, hospcode);


--
-- TOC entry 3358 (class 2606 OID 74007)
-- Name: drug_usages drug_usages_pk; Type: CONSTRAINT; Schema: libs; Owner: -
--

ALTER TABLE ONLY libs.drug_usages
    ADD CONSTRAINT drug_usages_pk PRIMARY KEY (hospcode, code);


--
-- TOC entry 3346 (class 2606 OID 73966)
-- Name: drugs drugs_pk; Type: CONSTRAINT; Schema: libs; Owner: -
--

ALTER TABLE ONLY libs.drugs
    ADD CONSTRAINT drugs_pk PRIMARY KEY (code, hospcode);


--
-- TOC entry 3352 (class 2606 OID 73985)
-- Name: insurance_mappings insurance_mappings_pk; Type: CONSTRAINT; Schema: libs; Owner: -
--

ALTER TABLE ONLY libs.insurance_mappings
    ADD CONSTRAINT insurance_mappings_pk PRIMARY KEY (code, hospcode);


--
-- TOC entry 3348 (class 2606 OID 73976)
-- Name: insurances insurances_pk; Type: CONSTRAINT; Schema: libs; Owner: -
--

ALTER TABLE ONLY libs.insurances
    ADD CONSTRAINT insurances_pk PRIMARY KEY (hospcode, code);


--
-- TOC entry 3364 (class 2606 OID 74034)
-- Name: lab_groups lab_groups_pk; Type: CONSTRAINT; Schema: libs; Owner: -
--

ALTER TABLE ONLY libs.lab_groups
    ADD CONSTRAINT lab_groups_pk PRIMARY KEY (hospcode, code);


--
-- TOC entry 3362 (class 2606 OID 74027)
-- Name: lab_items lab_items_pk_1; Type: CONSTRAINT; Schema: libs; Owner: -
--

ALTER TABLE ONLY libs.lab_items
    ADD CONSTRAINT lab_items_pk_1 PRIMARY KEY (hospcode, code);


--
-- TOC entry 3372 (class 2606 OID 74058)
-- Name: nation_mappings nation_mappings_pk_1; Type: CONSTRAINT; Schema: libs; Owner: -
--

ALTER TABLE ONLY libs.nation_mappings
    ADD CONSTRAINT nation_mappings_pk_1 PRIMARY KEY (code, hospcode);


--
-- TOC entry 3370 (class 2606 OID 74053)
-- Name: nations nations_pk_3; Type: CONSTRAINT; Schema: libs; Owner: -
--

ALTER TABLE ONLY libs.nations
    ADD CONSTRAINT nations_pk_3 PRIMARY KEY (hospcode, code);


--
-- TOC entry 3368 (class 2606 OID 74046)
-- Name: occupation_mappings occupation_mappings_pk_1; Type: CONSTRAINT; Schema: libs; Owner: -
--

ALTER TABLE ONLY libs.occupation_mappings
    ADD CONSTRAINT occupation_mappings_pk_1 PRIMARY KEY (code, hospcode);


--
-- TOC entry 3366 (class 2606 OID 74041)
-- Name: occupations occupations_pk_2; Type: CONSTRAINT; Schema: libs; Owner: -
--

ALTER TABLE ONLY libs.occupations
    ADD CONSTRAINT occupations_pk_2 PRIMARY KEY (hospcode, code);


--
-- TOC entry 3374 (class 2606 OID 74063)
-- Name: providers providers_pk; Type: CONSTRAINT; Schema: libs; Owner: -
--

ALTER TABLE ONLY libs.providers
    ADD CONSTRAINT providers_pk PRIMARY KEY (hospcode, code);


-- Completed on 2023-01-31 09:11:31

--
-- PostgreSQL database dump complete
--

