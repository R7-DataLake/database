--
-- PostgreSQL database dump
--

-- Dumped from database version 15.0
-- Dumped by pg_dump version 15.0

-- Started on 2023-01-29 07:24:01

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
-- TOC entry 9 (class 2615 OID 41079)
-- Name: r7_users; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA r7_users;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 221 (class 1259 OID 41108)
-- Name: admin; Type: TABLE; Schema: r7_users; Owner: -
--

CREATE TABLE r7_users.admin (
    id uuid DEFAULT gen_random_uuid(),
    username character varying(10) NOT NULL,
    password character varying(128),
    enabled boolean DEFAULT false
);


--
-- TOC entry 220 (class 1259 OID 41100)
-- Name: hospitals; Type: TABLE; Schema: r7_users; Owner: -
--

CREATE TABLE r7_users.hospitals (
    hospcode character varying NOT NULL,
    hospname character varying,
    zone_code character(4),
    enabled boolean DEFAULT true,
    is_deleted boolean DEFAULT false
);


--
-- TOC entry 224 (class 1259 OID 65655)
-- Name: tokens; Type: TABLE; Schema: r7_users; Owner: -
--

CREATE TABLE r7_users.tokens (
    user_id uuid NOT NULL,
    refresh_token character varying NOT NULL,
    expires_at timestamp without time zone,
    created_at timestamp with time zone DEFAULT now(),
    ingress_zone character varying,
    hospcode character varying
);


--
-- TOC entry 219 (class 1259 OID 41088)
-- Name: users; Type: TABLE; Schema: r7_users; Owner: -
--

CREATE TABLE r7_users.users (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    first_name character varying,
    last_name character varying,
    hospcode character varying,
    username character varying NOT NULL,
    password character varying,
    enabled boolean DEFAULT false,
    is_deleted boolean DEFAULT false,
    email character varying(50),
    last_login timestamp without time zone
);


--
-- TOC entry 222 (class 1259 OID 49279)
-- Name: zones; Type: TABLE; Schema: r7_users; Owner: -
--

CREATE TABLE r7_users.zones (
    code character(4) NOT NULL,
    name character varying,
    ingress_zone character varying(20),
    enabled boolean DEFAULT true
);


--
-- TOC entry 3446 (class 0 OID 41108)
-- Dependencies: 221
-- Data for Name: admin; Type: TABLE DATA; Schema: r7_users; Owner: -
--

INSERT INTO r7_users.admin VALUES ('37749a01-8c93-44ee-9051-8ece2401427c', 'admin', '$2b$10$ZrOnvGQZBJHQbyxOPXFbU.EUQalVuVD/W4ww5R8qs1oI/4uZed5zC', true);


--
-- TOC entry 3445 (class 0 OID 41100)
-- Dependencies: 220
-- Data for Name: hospitals; Type: TABLE DATA; Schema: r7_users; Owner: -
--

INSERT INTO r7_users.hospitals VALUES ('10707', 'รพท.มหาสารคาม', '4400', true, false);
INSERT INTO r7_users.hospitals VALUES ('11111', 'xxxxxxxxxxxxx', '4000', true, false);
INSERT INTO r7_users.hospitals VALUES ('11053', ' รพช.กันทรวิชัย', '4400', true, false);


--
-- TOC entry 3448 (class 0 OID 65655)
-- Dependencies: 224
-- Data for Name: tokens; Type: TABLE DATA; Schema: r7_users; Owner: -
--

INSERT INTO r7_users.tokens VALUES ('c2c58946-2345-4fbd-8f3f-2875deb93c7f', '3tgbLhBlvwd899fMLq7DRf3HMhZaq0r83flAMbzzGJyE9liCSdKA21cisqrlCFCZ', '2023-02-24 20:01:52.263869', '2023-01-25 20:01:52.263869+07', NULL, NULL);
INSERT INTO r7_users.tokens VALUES ('c2c58946-2345-4fbd-8f3f-2875deb93c7f', '9kYtvzQ1n9dRBkAW8RbCbuSoJiTvb9mbpyf8v2oEhGh9AsLjgjyetgDpchaOAWjR', '2023-02-24 20:02:34.55461', '2023-01-25 20:02:34.55461+07', NULL, NULL);
INSERT INTO r7_users.tokens VALUES ('c2c58946-2345-4fbd-8f3f-2875deb93c7f', 'epYo8mAhEvcNrdulJsX0mFQippUEZVh96Qdz5h3un4CdmsU5s1AUGvd3KHdbhxcM', '2023-02-24 20:03:53.775554', '2023-01-25 20:03:53.775554+07', NULL, NULL);
INSERT INTO r7_users.tokens VALUES ('c2c58946-2345-4fbd-8f3f-2875deb93c7f', 'ur1anjnQZTuRI4L3Ao3u0VoLLo2LHksrQY7PWRGiFrIqGg8bgXGcBeBhiDxn8ROD', '2023-02-24 20:12:19.997672', '2023-01-25 20:12:19.997672+07', 'MAHASARAKHAM', '11053');
INSERT INTO r7_users.tokens VALUES ('c2c58946-2345-4fbd-8f3f-2875deb93c7f', 'ojukv3igcJN5F77dFpRWsBoaE9vidUjLMINzxG2D8MplFmP40aFpgnui4Qi2sVe2', '2023-02-27 17:16:08.336627', '2023-01-28 17:16:08.336627+07', 'MAHASARAKHAM', '11053');
INSERT INTO r7_users.tokens VALUES ('c2c58946-2345-4fbd-8f3f-2875deb93c7f', 'wuBd9ZssYTu8fcwJ4JzOd3corXMM7Rj4Vtv3ZM6wtBEEHRQ66cxOPdIhkh8aGZQh', '2023-02-27 17:26:30.484463', '2023-01-28 17:26:30.484463+07', 'MAHASARAKHAM', '11053');
INSERT INTO r7_users.tokens VALUES ('c2c58946-2345-4fbd-8f3f-2875deb93c7f', 'kImc5o8LtIvw5DsbCNhUJ00rKPioN7jCHsN7Bkdqt8hj2T07279hc0230i8jr1gz', '2023-02-27 17:31:56.416906', '2023-01-28 17:31:56.416906+07', 'MAHASARAKHAM', '11053');
INSERT INTO r7_users.tokens VALUES ('c2c58946-2345-4fbd-8f3f-2875deb93c7f', '4DjXplK58ndshqJimUJS0u9AhJFv4hAvm5eDyBHnMLEwLSPPAX5KS61v4NpQpMmD', '2023-02-27 17:48:00.736508', '2023-01-28 17:48:00.736508+07', 'MAHASARAKHAM', '11053');
INSERT INTO r7_users.tokens VALUES ('c2c58946-2345-4fbd-8f3f-2875deb93c7f', 'jJL1gvTJn4efRqzsGrPm1WSEIIVuAgilPA51RCK6F9xYkhyAfY0RxnKPFmOmgPGA', '2023-02-27 18:08:14.751007', '2023-01-28 18:08:14.751007+07', 'MAHASARAKHAM', '11053');
INSERT INTO r7_users.tokens VALUES ('c2c58946-2345-4fbd-8f3f-2875deb93c7f', 'jonuKxidE46RfqvMn60iLhUPCdfW1XWnGsv1mlkqH2Z3giQ0CZGSu7AMOpjPeVSO', '2023-02-27 18:21:04.553007', '2023-01-28 18:21:04.553007+07', 'MAHASARAKHAM', '11053');


--
-- TOC entry 3444 (class 0 OID 41088)
-- Dependencies: 219
-- Data for Name: users; Type: TABLE DATA; Schema: r7_users; Owner: -
--

INSERT INTO r7_users.users VALUES ('c2c58946-2345-4fbd-8f3f-2875deb93c7f', 'Satit', 'Rianpit', '11053', '11053', '$2b$10$zVRoCws5lm2xbL8kHl4HtOBFUPKQg3xfD0BP.Mt3ilC7rdLJl5Dji', true, false, NULL, '2023-01-18 04:05:06');
INSERT INTO r7_users.users VALUES ('901d56f9-c64e-466e-a67f-910089339c61', 'xxxxx', 'xxxxxx', '11111', 'xxxxxxxxxxx', '$2b$10$bSUMf5dzObpptEfGnfjNlOCoOwkoeh2.XGBfGuMgBrPIMGGVpBHJG', false, false, NULL, '2023-01-11 04:05:06');
INSERT INTO r7_users.users VALUES ('fef71b90-94e8-40c3-8f91-97a46361989e', 'xxxxxxxx', 'xxxxx', '11053', 'xxxxxx', '$2b$10$ySiUldLkg0y1jB2QYgFNxOprLAEDuaP8oHT03cbl1y4OK3PI2yfXm', false, false, 'test@test.com', NULL);
INSERT INTO r7_users.users VALUES ('a5626ec2-b630-4da5-b6aa-8ccba2b892c7', 'กกกก', 'กกกกก', '10707', 'rtretertret', '$2b$10$NOLTCf5lKGD.49iN.ztDCOvS5H6GGFOl1hWAUBcQ8BIEj1TrGK2/m', false, false, 'rianpit@gmail.com', NULL);
INSERT INTO r7_users.users VALUES ('6d084780-b006-4273-82ac-8f7aa47319d5', 'fsdfdsf', 'sfdsfdsfs', '11111', '22222', '$2b$10$eQjkxkpA7VizvgqCnCqrIOZOSrAes31ugl6V6KGivTbUoogLy457a', true, false, 'test@testssss.com', NULL);
INSERT INTO r7_users.users VALUES ('96ca0da3-8977-4794-ac42-935fb8879b4c', 'xxxxxxxx', 'xxxxx', '10707', '1111111', '$2b$10$027Z98RqAA5xRPM0Cx2nzOsDl3dq1UOpADAOXODlrcHAi8U8ct6K.', true, true, 'test@test.com', '1999-01-08 04:05:06');
INSERT INTO r7_users.users VALUES ('1fe87a3b-5594-4faa-9570-801015116f92', '33333', '33333', '11053', '333333', '$2b$10$mv/9xRkSLIyEqPN9pgWvAuk.yMTSEtfZushfdKc5oX32ZaWUe9OD6', true, false, '3333@ddd.com', NULL);


--
-- TOC entry 3447 (class 0 OID 49279)
-- Dependencies: 222
-- Data for Name: zones; Type: TABLE DATA; Schema: r7_users; Owner: -
--

INSERT INTO r7_users.zones VALUES ('4000', 'ขอนแก่น', 'KHONKAEN', true);
INSERT INTO r7_users.zones VALUES ('4400', 'มหาสารคาม', 'MAHASARAKHAM', true);
INSERT INTO r7_users.zones VALUES ('4500', 'ร้อยเอ็ด', 'ROIET', true);
INSERT INTO r7_users.zones VALUES ('4600', 'กาฬสินธุ์', 'KALASIN', true);


--
-- TOC entry 3293 (class 2606 OID 41114)
-- Name: admin admin_pk; Type: CONSTRAINT; Schema: r7_users; Owner: -
--

ALTER TABLE ONLY r7_users.admin
    ADD CONSTRAINT admin_pk PRIMARY KEY (username);


--
-- TOC entry 3287 (class 2606 OID 41106)
-- Name: hospitals hospitals_pk; Type: CONSTRAINT; Schema: r7_users; Owner: -
--

ALTER TABLE ONLY r7_users.hospitals
    ADD CONSTRAINT hospitals_pk PRIMARY KEY (hospcode);


--
-- TOC entry 3299 (class 2606 OID 65662)
-- Name: tokens tokens_pk; Type: CONSTRAINT; Schema: r7_users; Owner: -
--

ALTER TABLE ONLY r7_users.tokens
    ADD CONSTRAINT tokens_pk PRIMARY KEY (user_id, refresh_token);


--
-- TOC entry 3284 (class 2606 OID 41095)
-- Name: users users_pk; Type: CONSTRAINT; Schema: r7_users; Owner: -
--

ALTER TABLE ONLY r7_users.users
    ADD CONSTRAINT users_pk PRIMARY KEY (username);


--
-- TOC entry 3296 (class 2606 OID 49339)
-- Name: zones zones_pk; Type: CONSTRAINT; Schema: r7_users; Owner: -
--

ALTER TABLE ONLY r7_users.zones
    ADD CONSTRAINT zones_pk PRIMARY KEY (code);


--
-- TOC entry 3289 (class 1259 OID 41117)
-- Name: admin_enabled_idx; Type: INDEX; Schema: r7_users; Owner: -
--

CREATE INDEX admin_enabled_idx ON r7_users.admin USING btree (enabled);


--
-- TOC entry 3290 (class 1259 OID 41115)
-- Name: admin_id_idx; Type: INDEX; Schema: r7_users; Owner: -
--

CREATE UNIQUE INDEX admin_id_idx ON r7_users.admin USING btree (id);


--
-- TOC entry 3291 (class 1259 OID 41116)
-- Name: admin_password_idx; Type: INDEX; Schema: r7_users; Owner: -
--

CREATE INDEX admin_password_idx ON r7_users.admin USING btree (password);


--
-- TOC entry 3285 (class 1259 OID 41132)
-- Name: hospitals_enabled_idx; Type: INDEX; Schema: r7_users; Owner: -
--

CREATE INDEX hospitals_enabled_idx ON r7_users.hospitals USING btree (enabled);


--
-- TOC entry 3288 (class 1259 OID 49305)
-- Name: hospitals_province_code_idx; Type: INDEX; Schema: r7_users; Owner: -
--

CREATE INDEX hospitals_province_code_idx ON r7_users.hospitals USING btree (zone_code);


--
-- TOC entry 3297 (class 1259 OID 65663)
-- Name: tokens_expires_at_idx; Type: INDEX; Schema: r7_users; Owner: -
--

CREATE INDEX tokens_expires_at_idx ON r7_users.tokens USING btree (expires_at);


--
-- TOC entry 3282 (class 1259 OID 41129)
-- Name: users_hospcode_idx; Type: INDEX; Schema: r7_users; Owner: -
--

CREATE INDEX users_hospcode_idx ON r7_users.users USING btree (hospcode);


--
-- TOC entry 3294 (class 1259 OID 49286)
-- Name: zones_ingress_topic_idx; Type: INDEX; Schema: r7_users; Owner: -
--

CREATE UNIQUE INDEX zones_ingress_topic_idx ON r7_users.zones USING btree (ingress_zone);


--
-- TOC entry 3301 (class 2606 OID 49340)
-- Name: hospitals hospitals_fk; Type: FK CONSTRAINT; Schema: r7_users; Owner: -
--

ALTER TABLE ONLY r7_users.hospitals
    ADD CONSTRAINT hospitals_fk FOREIGN KEY (zone_code) REFERENCES r7_users.zones(code);


--
-- TOC entry 3300 (class 2606 OID 41123)
-- Name: users users_fk; Type: FK CONSTRAINT; Schema: r7_users; Owner: -
--

ALTER TABLE ONLY r7_users.users
    ADD CONSTRAINT users_fk FOREIGN KEY (hospcode) REFERENCES r7_users.hospitals(hospcode);


-- Completed on 2023-01-29 07:24:01

--
-- PostgreSQL database dump complete
--

