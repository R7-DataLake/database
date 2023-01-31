--
-- PostgreSQL database dump
--

-- Dumped from database version 15.0
-- Dumped by pg_dump version 15.0

-- Started on 2023-01-28 23:41:45

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
-- TOC entry 8 (class 2615 OID 32877)
-- Name: r7_rawdata; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA r7_rawdata;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 234 (class 1259 OID 73908)
-- Name: appoint; Type: TABLE; Schema: r7_rawdata; Owner: -
--

CREATE TABLE r7_rawdata.appoint (
    hospcode character(5) NOT NULL,
    hn character varying(50) NOT NULL,
    an character varying(15),
    seq character varying(15),
    appoint_date date NOT NULL,
    appoint_time time without time zone,
    clinic character varying(100) NOT NULL,
    remark character varying(255),
    d_update timestamp without time zone
);


--
-- TOC entry 225 (class 1259 OID 73847)
-- Name: chronic; Type: TABLE; Schema: r7_rawdata; Owner: -
--

CREATE TABLE r7_rawdata.chronic (
    hospcode character varying(5) NOT NULL,
    hn character varying(50) NOT NULL,
    date_diag date,
    chronic character varying(6) NOT NULL,
    hosp_dx character varying(5),
    hosp_rx character varying(5),
    date_disch date,
    d_update timestamp without time zone
);


--
-- TOC entry 232 (class 1259 OID 73896)
-- Name: drug; Type: TABLE; Schema: r7_rawdata; Owner: -
--

CREATE TABLE r7_rawdata.drug (
    hospcode character(5) NOT NULL,
    hn character varying(50) NOT NULL,
    an character varying(15) NOT NULL,
    seq character varying(15) NOT NULL,
    did character varying(30) NOT NULL,
    amount numeric(6,0),
    drugprice numeric(7,2),
    drugcost numeric(7,2),
    unit character varying(50),
    unit_pack character varying(20),
    sigcode character varying(50),
    provider character varying(15),
    d_update timestamp without time zone
);


--
-- TOC entry 235 (class 1259 OID 73915)
-- Name: drugallergy; Type: TABLE; Schema: r7_rawdata; Owner: -
--

CREATE TABLE r7_rawdata.drugallergy (
    hospcode character(5) NOT NULL,
    hn character varying(50) NOT NULL,
    daterecord timestamp without time zone,
    dname character varying(255) NOT NULL,
    typedx character(1),
    alevel character(1),
    symptom character(2),
    informant character(1),
    informhosp character(5),
    provider character varying(6),
    d_update timestamp without time zone
);


--
-- TOC entry 229 (class 1259 OID 73876)
-- Name: ipd; Type: TABLE; Schema: r7_rawdata; Owner: -
--

CREATE TABLE r7_rawdata.ipd (
    hospcode character(5) NOT NULL,
    hn character varying(50) NOT NULL,
    an character varying(15) NOT NULL,
    dateadm date,
    timeadm time without time zone,
    datedsc date,
    timedsc time without time zone,
    dischs character(1),
    discht character(1),
    dept character varying(6),
    warddsc character varying(6),
    adm_w numeric(5,2) DEFAULT 0,
    d_update timestamp without time zone
);


--
-- TOC entry 230 (class 1259 OID 73884)
-- Name: ipdx; Type: TABLE; Schema: r7_rawdata; Owner: -
--

CREATE TABLE r7_rawdata.ipdx (
    hospcode character(5) NOT NULL,
    hn character varying(50) NOT NULL,
    an character varying(15) NOT NULL,
    diag character varying(7) NOT NULL,
    dxtype character(1),
    provider character varying(6),
    d_update timestamp without time zone
);


--
-- TOC entry 231 (class 1259 OID 73890)
-- Name: ipop; Type: TABLE; Schema: r7_rawdata; Owner: -
--

CREATE TABLE r7_rawdata.ipop (
    hospcode character(5) NOT NULL,
    hn character varying(50) NOT NULL,
    an character varying(15) NOT NULL,
    oper character varying(7) NOT NULL,
    optype character(1),
    provider character varying(6),
    datein date,
    timein time without time zone,
    dateout date,
    timeout time without time zone,
    d_update timestamp without time zone
);


--
-- TOC entry 233 (class 1259 OID 73903)
-- Name: lab; Type: TABLE; Schema: r7_rawdata; Owner: -
--

CREATE TABLE r7_rawdata.lab (
    hospcode character varying(5) NOT NULL,
    hn character varying(50) NOT NULL,
    seq character varying(15) NOT NULL,
    an character varying(15),
    labtest character varying(30) NOT NULL,
    labresult character varying(100),
    d_update timestamp without time zone
);


--
-- TOC entry 226 (class 1259 OID 73854)
-- Name: opd; Type: TABLE; Schema: r7_rawdata; Owner: -
--

CREATE TABLE r7_rawdata.opd (
    hospcode character(5) NOT NULL,
    hn character varying(50) NOT NULL,
    clinic character varying(10),
    date_serv date,
    time_serv time without time zone,
    seq character varying(15) NOT NULL,
    chiefcomp character varying,
    btemp numeric(3,1),
    sbp numeric(3,0),
    dbp numeric(3,0),
    pr numeric(3,0),
    rr numeric(3,0),
    typein character(1),
    typeout character(1),
    ins_type character varying(10),
    ins_number character varying(15),
    ins_hospmain character(5),
    ins_hospsub character(5),
    diag_text character varying(255),
    d_update timestamp without time zone
);


--
-- TOC entry 227 (class 1259 OID 73866)
-- Name: opdx; Type: TABLE; Schema: r7_rawdata; Owner: -
--

CREATE TABLE r7_rawdata.opdx (
    hospcode character(5) NOT NULL,
    hn character varying(50) NOT NULL,
    seq character varying(15) NOT NULL,
    datedx date,
    diag character varying(7) NOT NULL,
    dxtype character(1),
    provider character varying(6),
    d_update timestamp without time zone
);


--
-- TOC entry 228 (class 1259 OID 73871)
-- Name: opop; Type: TABLE; Schema: r7_rawdata; Owner: -
--

CREATE TABLE r7_rawdata.opop (
    hospcode character(5) NOT NULL,
    hn character varying(50) NOT NULL,
    seq character varying(15) NOT NULL,
    dateop date,
    oper character varying(7) NOT NULL,
    provider character varying(6),
    servprice numeric(7,2) DEFAULT 0,
    d_update timestamp without time zone
);


--
-- TOC entry 223 (class 1259 OID 57463)
-- Name: person; Type: TABLE; Schema: r7_rawdata; Owner: -
--

CREATE TABLE r7_rawdata.person (
    hospcode character varying(5) NOT NULL,
    hn character varying(50) NOT NULL,
    cid character varying(13),
    title character varying(30),
    fname character varying(100),
    lname character varying(100),
    birth date,
    sex character(1),
    marriage character(1),
    occupation character varying(10),
    nation character varying(10),
    idtype character(1),
    changwat character(2),
    amphur character(2),
    tambol character(2),
    moo character varying(3),
    typearea character(1),
    d_update timestamp without time zone
);


--
-- TOC entry 3475 (class 0 OID 73908)
-- Dependencies: 234
-- Data for Name: appoint; Type: TABLE DATA; Schema: r7_rawdata; Owner: -
--



--
-- TOC entry 3466 (class 0 OID 73847)
-- Dependencies: 225
-- Data for Name: chronic; Type: TABLE DATA; Schema: r7_rawdata; Owner: -
--



--
-- TOC entry 3473 (class 0 OID 73896)
-- Dependencies: 232
-- Data for Name: drug; Type: TABLE DATA; Schema: r7_rawdata; Owner: -
--



--
-- TOC entry 3476 (class 0 OID 73915)
-- Dependencies: 235
-- Data for Name: drugallergy; Type: TABLE DATA; Schema: r7_rawdata; Owner: -
--



--
-- TOC entry 3470 (class 0 OID 73876)
-- Dependencies: 229
-- Data for Name: ipd; Type: TABLE DATA; Schema: r7_rawdata; Owner: -
--



--
-- TOC entry 3471 (class 0 OID 73884)
-- Dependencies: 230
-- Data for Name: ipdx; Type: TABLE DATA; Schema: r7_rawdata; Owner: -
--



--
-- TOC entry 3472 (class 0 OID 73890)
-- Dependencies: 231
-- Data for Name: ipop; Type: TABLE DATA; Schema: r7_rawdata; Owner: -
--



--
-- TOC entry 3474 (class 0 OID 73903)
-- Dependencies: 233
-- Data for Name: lab; Type: TABLE DATA; Schema: r7_rawdata; Owner: -
--



--
-- TOC entry 3467 (class 0 OID 73854)
-- Dependencies: 226
-- Data for Name: opd; Type: TABLE DATA; Schema: r7_rawdata; Owner: -
--



--
-- TOC entry 3468 (class 0 OID 73866)
-- Dependencies: 227
-- Data for Name: opdx; Type: TABLE DATA; Schema: r7_rawdata; Owner: -
--



--
-- TOC entry 3469 (class 0 OID 73871)
-- Dependencies: 228
-- Data for Name: opop; Type: TABLE DATA; Schema: r7_rawdata; Owner: -
--



--
-- TOC entry 3465 (class 0 OID 57463)
-- Dependencies: 223
-- Data for Name: person; Type: TABLE DATA; Schema: r7_rawdata; Owner: -
--



--
-- TOC entry 3316 (class 2606 OID 73912)
-- Name: appoint appoint_pk; Type: CONSTRAINT; Schema: r7_rawdata; Owner: -
--

ALTER TABLE ONLY r7_rawdata.appoint
    ADD CONSTRAINT appoint_pk PRIMARY KEY (hospcode, hn, appoint_date, clinic);


--
-- TOC entry 3294 (class 2606 OID 73851)
-- Name: chronic chronic_pk; Type: CONSTRAINT; Schema: r7_rawdata; Owner: -
--

ALTER TABLE ONLY r7_rawdata.chronic
    ADD CONSTRAINT chronic_pk PRIMARY KEY (hospcode, hn, chronic);


--
-- TOC entry 3311 (class 2606 OID 73902)
-- Name: drug drug_pk; Type: CONSTRAINT; Schema: r7_rawdata; Owner: -
--

ALTER TABLE ONLY r7_rawdata.drug
    ADD CONSTRAINT drug_pk PRIMARY KEY (hospcode, hn, seq, did);


--
-- TOC entry 3321 (class 2606 OID 73919)
-- Name: drugallergy drugallergy_pk; Type: CONSTRAINT; Schema: r7_rawdata; Owner: -
--

ALTER TABLE ONLY r7_rawdata.drugallergy
    ADD CONSTRAINT drugallergy_pk PRIMARY KEY (hospcode, hn, dname);


--
-- TOC entry 3303 (class 2606 OID 73881)
-- Name: ipd ipd_pk; Type: CONSTRAINT; Schema: r7_rawdata; Owner: -
--

ALTER TABLE ONLY r7_rawdata.ipd
    ADD CONSTRAINT ipd_pk PRIMARY KEY (hospcode, hn, an);


--
-- TOC entry 3306 (class 2606 OID 73888)
-- Name: ipdx ipdx_pk; Type: CONSTRAINT; Schema: r7_rawdata; Owner: -
--

ALTER TABLE ONLY r7_rawdata.ipdx
    ADD CONSTRAINT ipdx_pk PRIMARY KEY (hospcode, hn, an, diag);


--
-- TOC entry 3309 (class 2606 OID 73894)
-- Name: ipop ipop_pk; Type: CONSTRAINT; Schema: r7_rawdata; Owner: -
--

ALTER TABLE ONLY r7_rawdata.ipop
    ADD CONSTRAINT ipop_pk PRIMARY KEY (hospcode, hn, an, oper);


--
-- TOC entry 3313 (class 2606 OID 73907)
-- Name: lab lab_pk; Type: CONSTRAINT; Schema: r7_rawdata; Owner: -
--

ALTER TABLE ONLY r7_rawdata.lab
    ADD CONSTRAINT lab_pk PRIMARY KEY (hospcode, hn, seq, labtest);


--
-- TOC entry 3296 (class 2606 OID 73865)
-- Name: opd opd_pk; Type: CONSTRAINT; Schema: r7_rawdata; Owner: -
--

ALTER TABLE ONLY r7_rawdata.opd
    ADD CONSTRAINT opd_pk PRIMARY KEY (hospcode, hn, seq);


--
-- TOC entry 3298 (class 2606 OID 73870)
-- Name: opdx opdx_pk; Type: CONSTRAINT; Schema: r7_rawdata; Owner: -
--

ALTER TABLE ONLY r7_rawdata.opdx
    ADD CONSTRAINT opdx_pk PRIMARY KEY (hospcode, hn, seq, diag);


--
-- TOC entry 3300 (class 2606 OID 73875)
-- Name: opop opop_pk; Type: CONSTRAINT; Schema: r7_rawdata; Owner: -
--

ALTER TABLE ONLY r7_rawdata.opop
    ADD CONSTRAINT opop_pk PRIMARY KEY (hospcode, hn, seq, oper);


--
-- TOC entry 3288 (class 2606 OID 57467)
-- Name: person person_pk; Type: CONSTRAINT; Schema: r7_rawdata; Owner: -
--

ALTER TABLE ONLY r7_rawdata.person
    ADD CONSTRAINT person_pk PRIMARY KEY (hospcode, hn);


--
-- TOC entry 3314 (class 1259 OID 73913)
-- Name: appoint_an_idx; Type: INDEX; Schema: r7_rawdata; Owner: -
--

CREATE INDEX appoint_an_idx ON r7_rawdata.appoint USING btree (an);


--
-- TOC entry 3317 (class 1259 OID 73914)
-- Name: appoint_seq_idx; Type: INDEX; Schema: r7_rawdata; Owner: -
--

CREATE INDEX appoint_seq_idx ON r7_rawdata.appoint USING btree (seq);


--
-- TOC entry 3291 (class 1259 OID 73852)
-- Name: chronic_hosp_dx_idx; Type: INDEX; Schema: r7_rawdata; Owner: -
--

CREATE INDEX chronic_hosp_dx_idx ON r7_rawdata.chronic USING btree (hosp_dx);


--
-- TOC entry 3292 (class 1259 OID 73853)
-- Name: chronic_hosp_rx_idx; Type: INDEX; Schema: r7_rawdata; Owner: -
--

CREATE INDEX chronic_hosp_rx_idx ON r7_rawdata.chronic USING btree (hosp_rx);


--
-- TOC entry 3318 (class 1259 OID 73920)
-- Name: drugallergy_informant_idx; Type: INDEX; Schema: r7_rawdata; Owner: -
--

CREATE INDEX drugallergy_informant_idx ON r7_rawdata.drugallergy USING btree (informant);


--
-- TOC entry 3319 (class 1259 OID 73922)
-- Name: drugallergy_informhosp_idx; Type: INDEX; Schema: r7_rawdata; Owner: -
--

CREATE INDEX drugallergy_informhosp_idx ON r7_rawdata.drugallergy USING btree (informhosp);


--
-- TOC entry 3322 (class 1259 OID 73921)
-- Name: drugallergy_symptom_idx; Type: INDEX; Schema: r7_rawdata; Owner: -
--

CREATE INDEX drugallergy_symptom_idx ON r7_rawdata.drugallergy USING btree (symptom);


--
-- TOC entry 3301 (class 1259 OID 73882)
-- Name: ipd_dateadm_idx; Type: INDEX; Schema: r7_rawdata; Owner: -
--

CREATE INDEX ipd_dateadm_idx ON r7_rawdata.ipd USING btree (dateadm);


--
-- TOC entry 3304 (class 1259 OID 73889)
-- Name: ipdx_dxtype_idx; Type: INDEX; Schema: r7_rawdata; Owner: -
--

CREATE INDEX ipdx_dxtype_idx ON r7_rawdata.ipdx USING btree (dxtype);


--
-- TOC entry 3307 (class 1259 OID 73895)
-- Name: ipop_optype_idx; Type: INDEX; Schema: r7_rawdata; Owner: -
--

CREATE INDEX ipop_optype_idx ON r7_rawdata.ipop USING btree (optype);


--
-- TOC entry 3282 (class 1259 OID 57472)
-- Name: person_amphur_idx; Type: INDEX; Schema: r7_rawdata; Owner: -
--

CREATE INDEX person_amphur_idx ON r7_rawdata.person USING btree (amphur);


--
-- TOC entry 3283 (class 1259 OID 57471)
-- Name: person_changwat_idx; Type: INDEX; Schema: r7_rawdata; Owner: -
--

CREATE INDEX person_changwat_idx ON r7_rawdata.person USING btree (changwat);


--
-- TOC entry 3284 (class 1259 OID 57468)
-- Name: person_cid_idx; Type: INDEX; Schema: r7_rawdata; Owner: -
--

CREATE INDEX person_cid_idx ON r7_rawdata.person USING btree (cid);


--
-- TOC entry 3285 (class 1259 OID 57470)
-- Name: person_nation_idx; Type: INDEX; Schema: r7_rawdata; Owner: -
--

CREATE INDEX person_nation_idx ON r7_rawdata.person USING btree (nation);


--
-- TOC entry 3286 (class 1259 OID 57469)
-- Name: person_occupation_idx; Type: INDEX; Schema: r7_rawdata; Owner: -
--

CREATE INDEX person_occupation_idx ON r7_rawdata.person USING btree (occupation);


--
-- TOC entry 3289 (class 1259 OID 57473)
-- Name: person_tambol_idx; Type: INDEX; Schema: r7_rawdata; Owner: -
--

CREATE INDEX person_tambol_idx ON r7_rawdata.person USING btree (tambol);


--
-- TOC entry 3290 (class 1259 OID 57474)
-- Name: person_typearea_idx; Type: INDEX; Schema: r7_rawdata; Owner: -
--

CREATE INDEX person_typearea_idx ON r7_rawdata.person USING btree (typearea);


-- Completed on 2023-01-28 23:41:45

--
-- PostgreSQL database dump complete
--

