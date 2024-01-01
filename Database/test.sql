--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2023-05-19 15:56:03

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

DROP DATABASE webdb;
--
-- TOC entry 3382 (class 1262 OID 16398)
-- Name: webdb; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE webdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE webdb OWNER TO postgres;

\connect webdb

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
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3383 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 214 (class 1259 OID 16399)
-- Name: author; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.author (
    id integer NOT NULL,
    first_name character varying(300),
    last_name character varying(300),
    description character varying(300)
);


ALTER TABLE public.author OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16404)
-- Name: author_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.author ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 216 (class 1259 OID 16405)
-- Name: book; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book (
    id integer NOT NULL,
    title character varying(50),
    publication_date date,
    copies_owned integer,
    description character varying(300),
    category character varying(255),
    image character varying(500)
);


ALTER TABLE public.book OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16410)
-- Name: book_author; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book_author (
    book_id integer NOT NULL,
    author_id integer NOT NULL
);


ALTER TABLE public.book_author OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16413)
-- Name: book_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.book ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 219 (class 1259 OID 16414)
-- Name: fee_payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fee_payment (
    loan_id integer NOT NULL,
    payment_date date,
    payment_amount integer
);


ALTER TABLE public.fee_payment OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16417)
-- Name: fine_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.fee_payment ALTER COLUMN loan_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.fine_payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 221 (class 1259 OID 16418)
-- Name: loan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.loan (
    id integer NOT NULL,
    book_id integer NOT NULL,
    loan_date date NOT NULL,
    returned_date date,
    member_username character varying(255) NOT NULL,
    due_date date,
    fee integer DEFAULT 0,
    extent_times integer DEFAULT 0
);


ALTER TABLE public.loan OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16423)
-- Name: loan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.loan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.loan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 223 (class 1259 OID 16424)
-- Name: member; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.member (
    first_name character varying(300),
    last_name character varying(300),
    joined_date date,
    username character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    email character varying(255)
);


ALTER TABLE public.member OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16429)
-- Name: reservation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservation (
    id integer NOT NULL,
    book_id integer,
    reservation_date date,
    status character varying(255),
    member_username character varying(255) NOT NULL
);


ALTER TABLE public.reservation OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16434)
-- Name: reservation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.reservation ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.reservation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3365 (class 0 OID 16399)
-- Dependencies: 214
-- Data for Name: author; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (1, 'Laurene', 'Linstead', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (2, 'Hobart', 'Vakhrushev', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (3, 'Alphonso', 'Di Carli', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (4, 'Reamonn', 'Badgers', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (5, 'Maxine', 'Ninnoli', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (6, 'Lorene', 'Heine', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (7, 'Wendye', 'Benard', 'The author''s writing style is characterized by its humor and wit.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (8, 'Junia', 'Hain', 'The author''s writing style is characterized by its humor and wit.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (9, 'Dareen', 'Standen', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (10, 'Winni', 'Faulds', 'This author has won numerous awards for their contributions to literature.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (11, 'Scott', 'Aspital', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (12, 'Karlik', 'Enrich', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (13, 'Corena', 'Bispham', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (14, 'Loretta', 'Buckam', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (15, 'Monah', 'McQuilty', 'The author''s writing style is characterized by its humor and wit.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (16, 'Buckie', 'Pentecost', 'The author''s writing style is characterized by its humor and wit.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (17, 'Rogers', 'McMakin', 'This author has won numerous awards for their contributions to literature.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (18, 'Fernanda', 'Cicchillo', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (19, 'Michaella', 'Paulitschke', 'The author''s writing style is characterized by its humor and wit.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (20, 'Candice', 'Checketts', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (21, 'Matt', 'Tureville', 'This author has won numerous awards for their contributions to literature.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (22, 'Archibaldo', 'Pilsbury', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (23, 'Kippar', 'Allsup', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (24, 'Cindelyn', 'O''Leagham', 'The author''s writing style is characterized by its humor and wit.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (25, 'Cosmo', 'Minter', 'This author has won numerous awards for their contributions to literature.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (26, 'Pepito', 'Wetherby', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (27, 'Welsh', 'Thurlborn', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (28, 'Pincus', 'Elington', 'This author has won numerous awards for their contributions to literature.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (29, 'Marilee', 'Riggott', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (30, 'Darrell', 'Rigge', 'This author has won numerous awards for their contributions to literature.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (31, 'Jacky', 'Whall', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (32, 'Lucas', 'Pyecroft', 'This author has won numerous awards for their contributions to literature.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (33, 'Easter', 'Clackers', 'The author''s writing style is characterized by its humor and wit.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (34, 'Maressa', 'Barbara', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (35, 'Susannah', 'Childs', 'The author''s writing style is characterized by its humor and wit.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (36, 'Lorin', 'Van de Velde', 'The author''s writing style is characterized by its humor and wit.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (37, 'Shaw', 'Wilhelmy', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (38, 'Kayle', 'Guilder', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (39, 'Harriet', 'Andrivel', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (40, 'Jewelle', 'Keeton', 'This author has won numerous awards for their contributions to literature.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (41, 'Kore', 'Cumpsty', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (42, 'Olivia', 'Assiter', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (43, 'Lind', 'Lujan', 'This author has won numerous awards for their contributions to literature.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (44, 'Berti', 'Binnion', 'This author has won numerous awards for their contributions to literature.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (45, 'Flo', 'Danielovitch', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (46, 'Leeanne', 'Tasch', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (47, 'Mattie', 'Seiler', 'The author''s writing style is characterized by its humor and wit.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (48, 'Karmen', 'Leate', 'This author has won numerous awards for their contributions to literature.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (49, 'Ode', 'Bletso', 'The author''s writing style is characterized by its humor and wit.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (50, 'Tymon', 'Fanti', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (51, 'Heriberto', 'Deadman', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (52, 'Davina', 'Spanton', 'This author has won numerous awards for their contributions to literature.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (53, 'Jessy', 'Cosgrave', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (54, 'Silvano', 'Duchart', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (55, 'Colette', 'Scoterbosh', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (56, 'Lauraine', 'Landon', 'This author has won numerous awards for their contributions to literature.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (57, 'Ivie', 'Yurshev', 'This author has won numerous awards for their contributions to literature.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (58, 'Ki', 'Rack', 'This author has won numerous awards for their contributions to literature.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (59, 'Tiffi', 'Smewing', 'This author has won numerous awards for their contributions to literature.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (60, 'Victoria', 'Congram', 'The author''s writing style is characterized by its humor and wit.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (61, 'Carlin', 'Chinnick', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (62, 'Shoshana', 'Gramer', 'This author has won numerous awards for their contributions to literature.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (63, 'Annabela', 'Ogdahl', 'The author''s writing style is characterized by its humor and wit.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (64, 'Cordie', 'Hazeldean', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (65, 'Roderich', 'Budik', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (66, 'Archibald', 'Morriarty', 'This author has won numerous awards for their contributions to literature.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (67, 'Chev', 'Meachan', 'The author''s writing style is characterized by its humor and wit.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (68, 'Nanni', 'Ditts', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (69, 'Rosie', 'Smogur', 'The author''s writing style is characterized by its humor and wit.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (70, 'Theadora', 'Lasseter', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (71, 'Marylinda', 'Sukbhans', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (72, 'Ingelbert', 'Bickley', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (73, 'Ruperto', 'Raynham', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (74, 'Mavra', 'Littler', 'The author''s writing style is characterized by its humor and wit.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (75, 'Evelyn', 'Hembry', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (76, 'Audy', 'Youde', 'The author''s writing style is characterized by its humor and wit.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (77, 'Burl', 'Moreby', 'This author has won numerous awards for their contributions to literature.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (78, 'Bobbi', 'Stones', 'This author has won numerous awards for their contributions to literature.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (79, 'Rosalinda', 'Battison', 'This author has won numerous awards for their contributions to literature.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (80, 'Hewett', 'Farherty', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (81, 'Nichole', 'Marages', 'The author''s writing style is characterized by its humor and wit.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (82, 'Thibaud', 'Sleightholm', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (83, 'Elana', 'Wolfenden', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (84, 'Caryl', 'Georgiades', 'The author''s writing style is characterized by its humor and wit.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (85, 'Virgie', 'Haburne', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (86, 'Trumann', 'Bigley', 'The author''s writing style is characterized by its humor and wit.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (87, 'Chickie', 'Josephson', 'The author''s writing style is characterized by its humor and wit.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (88, 'Addie', 'Russe', 'This author has won numerous awards for their contributions to literature.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (89, 'Ardine', 'Cranch', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (90, 'Burnard', 'Masic', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (91, 'Burgess', 'Throughton', 'The author''s writing style is characterized by its humor and wit.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (92, 'Tuck', 'Leman', 'This author has won numerous awards for their contributions to literature.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (93, 'Stephani', 'Sant', 'This author has won numerous awards for their contributions to literature.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (94, 'Svend', 'Hollyard', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (95, 'Mahala', 'Wooton', 'The author''s writing style is characterized by its humor and wit.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (96, 'Allegra', 'Blackaby', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (97, 'Suellen', 'Devany', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (98, 'Faye', 'Benneyworth', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (99, 'Channa', 'Dooler', 'The author''s writing style is characterized by its humor and wit.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (100, 'Antoine', 'Semour', 'This author has won numerous awards for their contributions to literature.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (101, 'Kévina', 'Rapkins', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (102, 'Mårten', 'Paramore', 'The author''s writing style is characterized by its humor and wit.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (103, 'Audréanne', 'Sollas', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (104, 'Ráo', 'Lagadu', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (105, 'Aurélie', 'Stollmeyer', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (106, 'Laurène', 'Costell', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (107, 'Illustrée', 'Priel', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (108, 'Mén', 'Ranyelld', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (109, 'Sélène', 'Pree', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (110, 'Faîtes', 'Lipmann', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (111, 'Naéva', 'Juszczyk', 'The author''s writing style is characterized by its humor and wit.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (112, 'Maéna', 'Sargant', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (113, 'Gaétane', 'Hintze', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (114, 'Miléna', 'Stanlick', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (115, 'Personnalisée', 'McGilroy', 'The author''s writing style is characterized by its humor and wit.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (116, 'Eléa', 'Throssell', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (117, 'Laurène', 'Rubee', 'The author''s writing style is characterized by its humor and wit.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (118, 'Eliès', 'Bus', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (119, 'Naëlle', 'Boulden', 'The author''s writing style is characterized by its humor and wit.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (120, 'Jú', 'Bamber', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (121, 'Thérèsa', 'Heister', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (122, 'Mårten', 'Deelay', 'This author has won numerous awards for their contributions to literature.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (123, 'Desirée', 'Shankle', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (124, 'Thérèsa', 'Wimpress', 'The author''s writing style is characterized by its humor and wit.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (125, 'Gérald', 'Kliement', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (126, 'Vénus', 'Bugg', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (127, 'Marie-françoise', 'Giggs', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (128, 'André', 'Bellinger', 'The author''s writing style is characterized by its humor and wit.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (129, 'Anaïs', 'Adamini', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (130, 'Uò', 'Wagen', 'This author has won numerous awards for their contributions to literature.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (131, 'Åslög', 'Elliott', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (132, 'Camélia', 'Linggard', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (133, 'Maëlla', 'Grenshiels', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (134, 'Ophélie', 'D''Antuoni', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (135, 'Gérald', 'Ladson', 'This author has won numerous awards for their contributions to literature.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (136, 'Rébecca', 'Tytherton', 'This author has won numerous awards for their contributions to literature.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (137, 'Zhì', 'Concklin', 'The author''s writing style is characterized by its humor and wit.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (138, 'Lóng', 'Meller', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (139, 'Maïwenn', 'Burgot', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (140, 'Pål', 'Guerri', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (141, 'Mélissandre', 'McNeely', 'This author has won numerous awards for their contributions to literature.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (142, 'Geneviève', 'Baulk', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (143, 'Cléopatre', 'Liddon', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (144, 'Cécilia', 'Domerque', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (145, 'Valérie', 'Prosser', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (146, 'Stéphanie', 'Braker', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (147, 'Méthode', 'Hewlings', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (148, 'Pénélope', 'Rucklesse', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (149, 'Laïla', 'Bolmann', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (150, 'Lorène', 'Esley', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (151, 'Desirée', 'Longmire', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (152, 'Yóu', 'Farrar', 'This author has won numerous awards for their contributions to literature.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (153, 'Anaëlle', 'Shurey', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (154, 'Gaëlle', 'Lowthian', 'This author has won numerous awards for their contributions to literature.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (155, 'Réjane', 'Jeffray', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (156, 'Stévina', 'Edgson', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (157, 'Laurélie', 'Colter', 'The author''s writing style is characterized by its humor and wit.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (158, 'Gisèle', 'Mitcham', 'The author''s writing style is characterized by its humor and wit.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (159, 'Laïla', 'Auchinleck', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (160, 'Alizée', 'Bareham', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (161, 'Sòng', 'Lawty', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (162, 'Marie-hélène', 'Cheake', 'This author has won numerous awards for their contributions to literature.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (163, 'Marie-hélène', 'Congdon', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (164, 'Cinéma', 'Frickey', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (165, 'Géraldine', 'Igglesden', 'The author''s writing style is characterized by its humor and wit.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (166, 'Pélagie', 'Corrett', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (167, 'Noémie', 'Othick', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (168, 'Anaëlle', 'McKearnen', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (169, 'Réjane', 'Siss', 'This author has won numerous awards for their contributions to literature.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (170, 'Börje', 'Offa', 'This author has won numerous awards for their contributions to literature.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (171, 'Amélie', 'Mithan', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (172, 'Célestine', 'Bolin', 'The author''s writing style is characterized by its humor and wit.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (173, 'Léane', 'Trillow', 'The author''s writing style is characterized by its humor and wit.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (174, 'Mégane', 'Gerrill', 'The author''s writing style is characterized by its humor and wit.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (175, 'Torbjörn', 'Flecknoe', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (176, 'Wá', 'Muddle', 'The author''s writing style is characterized by its humor and wit.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (177, 'Aimée', 'Pottberry', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (178, 'Cléa', 'Czapla', 'The author''s writing style is characterized by its humor and wit.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (179, 'Annotée', 'Hawkswood', 'This author has won numerous awards for their contributions to literature.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (180, 'Méryl', 'Junes', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (181, 'Séréna', 'Binley', 'The author''s writing style is characterized by its humor and wit.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (182, 'Anaé', 'Brabon', 'This author has won numerous awards for their contributions to literature.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (183, 'Esbjörn', 'Hissie', 'This author has won numerous awards for their contributions to literature.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (184, 'Noémie', 'Keele', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (185, 'Marlène', 'Beckhurst', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (186, 'Valérie', 'Gibbonson', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (187, 'Cléa', 'Gauvain', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (188, 'Marie-hélène', 'Varvara', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (189, 'Mélinda', 'Vreede', 'This author has won numerous awards for their contributions to literature.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (190, 'Réservés', 'Scotchford', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (191, 'Lorène', 'Dedenham', 'The author''s writing style is characterized by its humor and wit.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (192, 'Jú', 'Mulqueen', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (193, 'Maëlle', 'Hylden', 'The author''s writing style is characterized by its humor and wit.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (194, 'Joséphine', 'Thames', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (195, 'Rébecca', 'Skate', 'The author is a prolific writer with a unique voice.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (196, 'Intéressant', 'Blincow', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (197, 'Miléna', 'Janczak', 'This author''s work is known for its vivid imagery and emotional depth.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (198, 'Mårten', 'Armsby', 'This author has won numerous awards for their contributions to literature.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (199, 'Nélie', 'Bediss', 'This author has won numerous awards for their contributions to literature.');
INSERT INTO public.author (id, first_name, last_name, description) OVERRIDING SYSTEM VALUE VALUES (200, 'Hélène', 'Duesbury', 'The author''s writing style is characterized by its humor and wit.');


--
-- TOC entry 3367 (class 0 OID 16405)
-- Dependencies: 216
-- Data for Name: book; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (1, 'The Great Gatsby', '2001-02-27', 6, 'A poignant coming-of-age story', 'History', 'http://dummyimage.com/440x469.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (2, 'One Hundred Years of Solitude', '1999-02-11', 1, 'A chilling horror novel', 'Poetry', 'http://dummyimage.com/221x181.png/dddddd/000000');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (3, '1984', '2014-08-03', 9, 'A fascinating biography', 'Drama', 'http://dummyimage.com/188x130.png/ff4444/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (4, 'The Grapes of Wrath', '2012-10-11', 9, 'A moving memoir', 'Mystery', 'http://dummyimage.com/112x353.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (5, 'The Picture of Dorian Gray', '1962-02-24', 9, 'A chilling horror novel', 'Romance', 'http://dummyimage.com/344x219.png/ff4444/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (6, 'The Hobbit', '1983-12-30', 9, 'A thought-provoking science fiction tale', 'Biography', 'http://dummyimage.com/408x259.png/cc0000/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (7, 'The Kite Runner', '1979-08-30', 7, 'A moving memoir', 'History', 'http://dummyimage.com/492x402.png/dddddd/000000');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (8, 'The Da Vinci Code', '1985-04-12', 10, 'A poignant coming-of-age story', 'Thriller', 'http://dummyimage.com/357x355.png/cc0000/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (9, 'The Da Vinci Code', '1970-07-14', 3, 'A gripping mystery novel', 'Science Fiction', 'http://dummyimage.com/351x477.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (10, 'Fahrenheit 451', '1979-01-03', 8, 'A gripping mystery novel', 'Non-fiction', 'http://dummyimage.com/145x141.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (11, 'The Idiot', '1993-11-25', 5, 'A fascinating biography', 'Mystery', 'http://dummyimage.com/367x292.png/dddddd/000000');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (12, 'The Girl on the Train', '2018-02-02', 5, 'A chilling horror novel', 'Comedy', 'http://dummyimage.com/262x204.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (13, 'The Grapes of Wrath', '2017-08-16', 10, 'A thrilling adventure novel', 'Science Fiction', 'http://dummyimage.com/292x380.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (14, 'Beloved', '2013-08-08', 9, 'A thought-provoking science fiction tale', 'Fiction', 'http://dummyimage.com/439x475.png/dddddd/000000');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (15, 'The Old Man and the Sea', '2008-06-04', 4, 'A fascinating biography', 'Drama', 'http://dummyimage.com/247x314.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (16, 'The Great Gatsby', '2005-04-07', 4, 'A thought-provoking science fiction tale', 'Horror', 'http://dummyimage.com/274x259.png/ff4444/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (17, 'The Girl on the Train', '1977-08-12', 9, 'A gripping mystery novel', 'Fantasy', 'http://dummyimage.com/482x372.png/ff4444/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (18, 'The Help', '2000-10-25', 10, 'A moving memoir', 'Poetry', 'http://dummyimage.com/458x295.png/dddddd/000000');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (19, 'The Kite Runner', '2014-07-25', 2, 'A poignant coming-of-age story', 'Science Fiction', 'http://dummyimage.com/400x471.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (20, 'The Old Man and the Sea', '1963-12-19', 7, 'A heartwarming romance story', 'Fiction', 'http://dummyimage.com/387x496.png/dddddd/000000');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (21, 'The Testaments', '1972-12-23', 1, 'A poignant coming-of-age story', 'Biography', 'http://dummyimage.com/148x358.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (22, 'The Kite Runner', '1969-04-18', 8, 'A hilarious comedy novel', 'History', 'http://dummyimage.com/449x133.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (23, 'To Kill a Mockingbird', '1978-04-13', 9, 'A captivating historical fiction novel', 'Romance', 'http://dummyimage.com/213x143.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (24, 'The Silent Patient', '2022-05-24', 4, 'A chilling horror novel', 'Non-fiction', 'http://dummyimage.com/434x266.png/dddddd/000000');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (25, 'The Catcher in the Rye', '1994-06-13', 1, 'A chilling horror novel', 'Drama', 'http://dummyimage.com/280x329.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (26, 'Fahrenheit 451', '1989-07-20', 10, 'A gripping mystery novel', 'Mystery', 'http://dummyimage.com/392x212.png/ff4444/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (27, 'To Kill a Mockingbird', '1983-05-21', 3, 'A thought-provoking science fiction tale', 'Science Fiction', 'http://dummyimage.com/281x407.png/cc0000/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (28, 'Beloved', '2001-03-01', 2, 'A chilling horror novel', 'Fantasy', 'http://dummyimage.com/257x242.png/cc0000/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (29, 'The Name of the Rose', '1963-09-06', 7, 'A hilarious comedy novel', 'Mystery', 'http://dummyimage.com/414x210.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (30, 'The Plague', '1989-09-02', 7, 'A thrilling adventure novel', 'Fantasy', 'http://dummyimage.com/274x386.png/dddddd/000000');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (31, 'The Metamorphosis', '1969-09-16', 6, 'A moving memoir', 'Biography', 'http://dummyimage.com/451x182.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (32, 'The Help', '2002-01-19', 1, 'A gripping mystery novel', 'Comedy', 'http://dummyimage.com/345x359.png/ff4444/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (33, 'Beloved', '2020-09-18', 1, 'A thought-provoking science fiction tale', 'History', 'http://dummyimage.com/436x169.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (34, 'The Color Purple', '1994-09-15', 10, 'A moving memoir', 'Science Fiction', 'http://dummyimage.com/452x168.png/dddddd/000000');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (35, 'The Adventures of Huckleberry Finn', '2014-12-27', 6, 'A fascinating biography', 'Mystery', 'http://dummyimage.com/278x127.png/ff4444/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (36, 'The Old Man and the Sea', '1999-11-24', 4, 'A heartwarming romance story', 'Mystery', 'http://dummyimage.com/127x389.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (37, 'The Great Gatsby', '1968-06-01', 5, 'A poignant coming-of-age story', 'Fiction', 'http://dummyimage.com/292x456.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (38, 'The Plague', '2020-10-08', 3, 'A hilarious comedy novel', 'Horror', 'http://dummyimage.com/455x313.png/cc0000/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (39, 'The Sound and the Fury', '1974-12-12', 9, 'A captivating historical fiction novel', 'Science Fiction', 'http://dummyimage.com/284x443.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (40, 'The Old Man and the Sea', '1990-11-24', 10, 'A thought-provoking science fiction tale', 'Autobiography', 'http://dummyimage.com/207x428.png/cc0000/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (41, 'The Trial', '1987-08-25', 6, 'A gripping mystery novel', 'Biography', 'http://dummyimage.com/301x210.png/ff4444/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (42, 'Fahrenheit 451', '2016-03-03', 1, 'A hilarious comedy novel', 'Science Fiction', 'http://dummyimage.com/319x273.png/cc0000/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (43, 'The Girl on the Train', '1996-06-08', 5, 'A hilarious comedy novel', 'Non-fiction', 'http://dummyimage.com/494x298.png/ff4444/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (44, 'The Idiot', '1981-11-25', 7, 'A poignant coming-of-age story', 'Poetry', 'http://dummyimage.com/293x128.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (45, 'The Testaments', '1989-09-13', 7, 'A gripping mystery novel', 'Fantasy', 'http://dummyimage.com/413x316.png/cc0000/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (46, 'The Da Vinci Code', '1989-03-09', 9, 'A fascinating biography', 'Biography', 'http://dummyimage.com/278x342.png/cc0000/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (47, 'Harry Potter and the Philosopher''s Stone', '1997-05-02', 9, 'A moving memoir', 'Horror', 'http://dummyimage.com/228x289.png/ff4444/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (48, 'The Sound and the Fury', '1994-09-18', 8, 'A gripping mystery novel', 'Science Fiction', 'http://dummyimage.com/454x379.png/cc0000/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (49, 'Beloved', '2007-06-22', 2, 'A fascinating biography', 'Poetry', 'http://dummyimage.com/478x298.png/ff4444/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (50, 'The Lovely Bones', '2011-12-10', 8, 'A captivating historical fiction novel', 'Horror', 'http://dummyimage.com/307x256.png/cc0000/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (51, 'The Sun Also Rises', '2008-08-29', 5, 'A fascinating biography', 'Romance', 'http://dummyimage.com/352x297.png/dddddd/000000');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (52, 'The Metamorphosis', '1974-12-28', 4, 'A thrilling adventure novel', 'Autobiography', 'http://dummyimage.com/219x388.png/cc0000/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (53, 'The Sound and the Fury', '1986-02-09', 1, 'A chilling horror novel', 'Non-fiction', 'http://dummyimage.com/312x446.png/dddddd/000000');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (54, 'War and Peace', '2021-10-06', 9, 'A thought-provoking science fiction tale', 'Thriller', 'http://dummyimage.com/485x295.png/cc0000/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (55, 'The Sun Also Rises', '1984-11-11', 6, 'A poignant coming-of-age story', 'Drama', 'http://dummyimage.com/100x138.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (56, 'The Alchemist', '1985-09-25', 8, 'A gripping mystery novel', 'Comedy', 'http://dummyimage.com/362x161.png/cc0000/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (57, 'The Grapes of Wrath', '1974-10-01', 10, 'A fascinating biography', 'Comedy', 'http://dummyimage.com/335x334.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (58, 'The Color Purple', '2013-07-27', 3, 'A poignant coming-of-age story', 'Poetry', 'http://dummyimage.com/346x430.png/dddddd/000000');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (59, 'The Trial', '1968-04-18', 6, 'A poignant coming-of-age story', 'Fantasy', 'http://dummyimage.com/134x444.png/dddddd/000000');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (60, 'The Girl on the Train', '1965-11-07', 1, 'A thought-provoking science fiction tale', 'Thriller', 'http://dummyimage.com/378x366.png/cc0000/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (61, 'The Great Gatsby', '1973-03-31', 9, 'A thrilling adventure novel', 'Romance', 'http://dummyimage.com/480x445.png/dddddd/000000');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (62, 'The Color Purple', '2021-05-26', 5, 'A chilling horror novel', 'Fiction', 'http://dummyimage.com/457x214.png/ff4444/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (63, 'Of Mice and Men', '1981-04-02', 1, 'A heartwarming romance story', 'Horror', 'http://dummyimage.com/480x415.png/ff4444/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (64, 'Anna Karenina', '1967-05-30', 2, 'A captivating historical fiction novel', 'Mystery', 'http://dummyimage.com/128x189.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (65, 'The Sound and the Fury', '2006-05-01', 1, 'A captivating historical fiction novel', 'Autobiography', 'http://dummyimage.com/308x208.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (66, 'The Help', '1961-04-15', 2, 'A gripping mystery novel', 'Biography', 'http://dummyimage.com/261x401.png/cc0000/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (67, 'The Help', '1961-05-13', 10, 'A poignant coming-of-age story', 'Mystery', 'http://dummyimage.com/381x334.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (68, 'Gone Girl', '1998-07-25', 10, 'A hilarious comedy novel', 'Poetry', 'http://dummyimage.com/326x460.png/cc0000/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (69, 'The Girl on the Train', '1965-11-24', 4, 'A poignant coming-of-age story', 'Horror', 'http://dummyimage.com/495x433.png/cc0000/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (70, 'The Silent Patient', '1967-04-07', 1, 'A thought-provoking science fiction tale', 'Non-fiction', 'http://dummyimage.com/192x490.png/ff4444/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (71, 'The Girl with the Dragon Tattoo', '2009-05-01', 1, 'A gripping mystery novel', 'Romance', 'http://dummyimage.com/236x420.png/ff4444/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (72, 'The Plague', '1972-12-30', 2, 'A gripping mystery novel', 'Mystery', 'http://dummyimage.com/241x326.png/cc0000/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (73, 'The Silent Patient', '2018-03-24', 5, 'A thrilling adventure novel', 'Mystery', 'http://dummyimage.com/257x225.png/cc0000/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (74, 'The Stranger', '1983-06-12', 4, 'A hilarious comedy novel', 'Poetry', 'http://dummyimage.com/483x372.png/dddddd/000000');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (75, 'The Picture of Dorian Gray', '1982-06-19', 7, 'A fascinating biography', 'Horror', 'http://dummyimage.com/449x471.png/dddddd/000000');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (76, 'The Hitchhiker''s Guide to the Galaxy', '1985-02-20', 9, 'A fascinating biography', 'Drama', 'http://dummyimage.com/403x237.png/ff4444/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (77, 'War and Peace', '2014-04-27', 4, 'A poignant coming-of-age story', 'Fiction', 'http://dummyimage.com/333x272.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (78, 'Crime and Punishment', '1977-05-25', 8, 'A poignant coming-of-age story', 'Biography', 'http://dummyimage.com/301x253.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (79, 'Animal Farm', '1995-08-06', 10, 'A thought-provoking science fiction tale', 'Mystery', 'http://dummyimage.com/431x494.png/cc0000/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (80, 'Gone Girl', '1972-04-29', 5, 'A thought-provoking science fiction tale', 'Fantasy', 'http://dummyimage.com/269x283.png/dddddd/000000');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (81, 'The Sound and the Fury', '1965-02-20', 10, 'A captivating historical fiction novel', 'Fiction', 'http://dummyimage.com/343x349.png/ff4444/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (82, 'The Metamorphosis', '2010-03-09', 9, 'A fascinating biography', 'History', 'http://dummyimage.com/222x208.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (83, '1984', '1976-07-30', 8, 'A hilarious comedy novel', 'Fiction', 'http://dummyimage.com/407x377.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (84, 'The Help', '2019-06-03', 8, 'A thrilling adventure novel', 'History', 'http://dummyimage.com/343x329.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (85, 'The Stranger', '1997-12-28', 6, 'A poignant coming-of-age story', 'Science Fiction', 'http://dummyimage.com/400x399.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (86, 'The Girl on the Train', '1975-10-15', 6, 'A poignant coming-of-age story', 'Thriller', 'http://dummyimage.com/248x116.png/dddddd/000000');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (87, 'The Hobbit', '1983-12-24', 4, 'A hilarious comedy novel', 'Non-fiction', 'http://dummyimage.com/123x441.png/ff4444/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (88, 'The Hunger Games', '2008-04-20', 9, 'A chilling horror novel', 'Biography', 'http://dummyimage.com/396x205.png/cc0000/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (89, 'Harry Potter and the Philosopher''s Stone', '2020-12-20', 4, 'A thrilling adventure novel', 'Drama', 'http://dummyimage.com/492x395.png/cc0000/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (90, 'The Picture of Dorian Gray', '2003-08-28', 10, 'A hilarious comedy novel', 'History', 'http://dummyimage.com/422x428.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (91, 'The Picture of Dorian Gray', '2020-12-23', 4, 'A poignant coming-of-age story', 'Non-fiction', 'http://dummyimage.com/335x495.png/cc0000/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (92, 'The Hitchhiker''s Guide to the Galaxy', '1965-08-05', 10, 'A thought-provoking science fiction tale', 'History', 'http://dummyimage.com/403x168.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (93, 'The Idiot', '1973-01-21', 5, 'A thrilling adventure novel', 'Drama', 'http://dummyimage.com/474x292.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (94, 'The Lovely Bones', '1966-09-20', 10, 'A fascinating biography', 'Thriller', 'http://dummyimage.com/458x463.png/cc0000/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (95, 'Fahrenheit 451', '2001-08-10', 1, 'A thrilling adventure novel', 'History', 'http://dummyimage.com/264x175.png/ff4444/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (96, 'The Hobbit', '1977-05-07', 10, 'A thrilling adventure novel', 'Comedy', 'http://dummyimage.com/368x444.png/cc0000/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (97, 'Pride and Prejudice', '2016-09-27', 6, 'A moving memoir', 'History', 'http://dummyimage.com/199x219.png/dddddd/000000');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (98, 'Crime and Punishment', '1977-03-23', 1, 'A fascinating biography', 'Comedy', 'http://dummyimage.com/348x193.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (99, 'The Hitchhiker''s Guide to the Galaxy', '1967-02-11', 1, 'A heartwarming romance story', 'History', 'http://dummyimage.com/404x110.png/cc0000/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (100, 'The Idiot', '1992-07-21', 10, 'A thrilling adventure novel', 'Fantasy', 'http://dummyimage.com/109x238.png/dddddd/000000');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (101, 'The Alchemist', '2005-12-17', 4, 'A chilling horror novel', 'Biography', 'http://dummyimage.com/326x201.png/ff4444/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (102, 'The Girl with the Dragon Tattoo', '2007-02-28', 1, 'A heartwarming romance story', 'Mystery', 'http://dummyimage.com/232x163.png/dddddd/000000');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (103, 'Fahrenheit 451', '2006-10-22', 2, 'A chilling horror novel', 'History', 'http://dummyimage.com/191x313.png/ff4444/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (104, 'The Sun Also Rises', '2005-02-28', 3, 'A thrilling adventure novel', 'History', 'http://dummyimage.com/343x123.png/dddddd/000000');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (105, 'The Da Vinci Code', '2014-04-26', 3, 'A moving memoir', 'Biography', 'http://dummyimage.com/365x329.png/ff4444/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (106, 'The Color Purple', '2009-05-28', 3, 'A heartwarming romance story', 'Comedy', 'http://dummyimage.com/121x421.png/ff4444/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (107, 'The Brothers Karamazov', '2022-12-21', 2, 'A chilling horror novel', 'Non-fiction', 'http://dummyimage.com/465x184.png/cc0000/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (108, 'The Time Traveler''s Wife', '2014-11-04', 1, 'A fascinating biography', 'Poetry', 'http://dummyimage.com/356x229.png/ff4444/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (109, 'The Testaments', '2016-11-24', 4, 'A moving memoir', 'Horror', 'http://dummyimage.com/295x326.png/cc0000/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (110, 'The Hobbit', '2010-10-30', 2, 'A thought-provoking science fiction tale', 'Science Fiction', 'http://dummyimage.com/250x386.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (111, 'The Help', '2019-06-23', 3, 'A thrilling adventure novel', 'Mystery', 'http://dummyimage.com/247x425.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (112, 'The Great Gatsby', '2013-03-11', 2, 'A poignant coming-of-age story', 'Biography', 'http://dummyimage.com/300x183.png/ff4444/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (113, 'The Shadow of the Wind', '2004-07-12', 4, 'A thrilling adventure novel', 'Autobiography', 'http://dummyimage.com/218x459.png/cc0000/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (114, 'The Shadow of the Wind', '2001-05-21', 2, 'A heartwarming romance story', 'Non-fiction', 'http://dummyimage.com/369x479.png/ff4444/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (115, 'The Stranger', '2021-09-09', 1, 'A chilling horror novel', 'Mystery', 'http://dummyimage.com/327x281.png/ff4444/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (116, 'To Kill a Mockingbird', '2016-07-15', 1, 'A thrilling adventure novel', 'Autobiography', 'http://dummyimage.com/269x499.png/dddddd/000000');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (117, 'The Trial', '2020-09-15', 4, 'A gripping mystery novel', 'Fiction', 'http://dummyimage.com/497x203.png/cc0000/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (118, 'Beloved', '2012-05-23', 2, 'A thrilling adventure novel', 'Drama', 'http://dummyimage.com/125x339.png/ff4444/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (119, 'The Hunger Games', '2015-09-29', 2, 'A captivating historical fiction novel', 'Comedy', 'http://dummyimage.com/409x381.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (120, 'The Metamorphosis', '2004-06-10', 3, 'A fascinating biography', 'Horror', 'http://dummyimage.com/428x454.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (121, 'The Help', '2014-07-29', 1, 'A gripping mystery novel', 'Science Fiction', 'http://dummyimage.com/331x498.png/cc0000/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (122, 'Gone Girl', '2002-06-12', 2, 'A heartwarming romance story', 'Mystery', 'http://dummyimage.com/354x187.png/dddddd/000000');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (123, 'The Hobbit', '2000-04-30', 4, 'A thrilling adventure novel', 'Science Fiction', 'http://dummyimage.com/496x350.png/ff4444/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (124, 'Animal Farm', '2004-11-15', 5, 'A poignant coming-of-age story', 'Drama', 'http://dummyimage.com/483x331.png/cc0000/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (125, 'The Metamorphosis', '2010-10-12', 4, 'A hilarious comedy novel', 'Non-fiction', 'http://dummyimage.com/500x337.png/cc0000/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (126, 'The Silent Patient', '2007-11-05', 3, 'A fascinating biography', 'History', 'http://dummyimage.com/489x192.png/cc0000/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (127, 'The Great Gatsby', '2009-06-21', 5, 'A moving memoir', 'Horror', 'http://dummyimage.com/203x218.png/cc0000/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (128, 'One Hundred Years of Solitude', '2002-06-10', 4, 'A hilarious comedy novel', 'Science Fiction', 'http://dummyimage.com/189x217.png/dddddd/000000');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (129, 'The Picture of Dorian Gray', '2001-09-11', 2, 'A fascinating biography', 'Mystery', 'http://dummyimage.com/376x348.png/ff4444/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (130, 'The Hobbit', '2000-05-28', 5, 'A chilling horror novel', 'Comedy', 'http://dummyimage.com/343x435.png/ff4444/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (131, 'The Old Man and the Sea', '2002-03-13', 4, 'A poignant coming-of-age story', 'Mystery', 'http://dummyimage.com/429x370.png/cc0000/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (132, 'Harry Potter and the Philosopher''s Stone', '2008-05-23', 5, 'A captivating historical fiction novel', 'History', 'http://dummyimage.com/169x471.png/cc0000/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (133, 'The Metamorphosis', '2006-11-02', 5, 'A chilling horror novel', 'Non-fiction', 'http://dummyimage.com/150x354.png/cc0000/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (134, 'One Hundred Years of Solitude', '2004-01-18', 4, 'A poignant coming-of-age story', 'Science Fiction', 'http://dummyimage.com/444x137.png/ff4444/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (135, 'The Brothers Karamazov', '2008-08-11', 4, 'A moving memoir', 'Autobiography', 'http://dummyimage.com/214x470.png/dddddd/000000');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (136, 'The Color Purple', '2009-04-27', 4, 'A heartwarming romance story', 'Science Fiction', 'http://dummyimage.com/389x313.png/ff4444/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (137, 'The Nightingale', '2016-08-01', 1, 'A poignant coming-of-age story', 'Science Fiction', 'http://dummyimage.com/144x167.png/dddddd/000000');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (138, 'The Silent Patient', '2008-03-17', 2, 'A moving memoir', 'History', 'http://dummyimage.com/465x444.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (139, 'Pride and Prejudice', '2011-05-31', 2, 'A chilling horror novel', 'Mystery', 'http://dummyimage.com/236x195.png/cc0000/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (140, 'Harry Potter and the Philosopher''s Stone', '2017-08-20', 3, 'A gripping mystery novel', 'Comedy', 'http://dummyimage.com/128x227.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (141, 'The Help', '2022-12-24', 1, 'A hilarious comedy novel', 'Horror', 'http://dummyimage.com/153x276.png/cc0000/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (142, 'The Adventures of Tom Sawyer', '2000-05-14', 2, 'A thought-provoking science fiction tale', 'Science Fiction', 'http://dummyimage.com/378x497.png/ff4444/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (143, 'Pride and Prejudice', '2002-04-08', 5, 'A heartwarming romance story', 'Fantasy', 'http://dummyimage.com/163x474.png/ff4444/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (144, 'The Sound and the Fury', '2022-05-18', 4, 'A poignant coming-of-age story', 'History', 'http://dummyimage.com/136x267.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (145, 'The Metamorphosis', '2008-01-28', 5, 'A poignant coming-of-age story', 'Thriller', 'http://dummyimage.com/234x388.png/ff4444/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (146, 'The Sun Also Rises', '2014-06-07', 1, 'A thrilling adventure novel', 'History', 'http://dummyimage.com/281x253.png/ff4444/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (147, 'Brave New World', '2014-09-14', 5, 'A fascinating biography', 'Autobiography', 'http://dummyimage.com/293x449.png/dddddd/000000');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (148, 'The Fault in Our Stars', '2007-06-10', 4, 'A moving memoir', 'Poetry', 'http://dummyimage.com/383x290.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (149, 'Brave New World', '2008-01-13', 3, 'A chilling horror novel', 'Romance', 'http://dummyimage.com/387x295.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (150, 'One Hundred Years of Solitude', '2019-03-10', 4, 'A chilling horror novel', 'Romance', 'http://dummyimage.com/452x106.png/dddddd/000000');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (151, 'One Hundred Years of Solitude', '2000-04-11', 2, 'A moving memoir', 'Mystery', 'http://dummyimage.com/390x379.png/dddddd/000000');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (152, 'The Great Gatsby', '2013-01-31', 3, 'A thrilling adventure novel', 'Fantasy', 'http://dummyimage.com/150x229.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (153, 'Anna Karenina', '2003-11-29', 4, 'A thought-provoking science fiction tale', 'Horror', 'http://dummyimage.com/441x387.png/dddddd/000000');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (154, 'The Girl on the Train', '2022-04-13', 2, 'A heartwarming romance story', 'Non-fiction', 'http://dummyimage.com/320x490.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (155, 'Harry Potter and the Philosopher''s Stone', '2009-05-20', 3, 'A captivating historical fiction novel', 'Non-fiction', 'http://dummyimage.com/122x387.png/ff4444/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (156, 'The Help', '2016-05-16', 1, 'A thrilling adventure novel', 'Fantasy', 'http://dummyimage.com/430x460.png/cc0000/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (157, 'The Testaments', '2009-11-10', 5, 'A thrilling adventure novel', 'Drama', 'http://dummyimage.com/358x378.png/cc0000/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (158, 'Harry Potter and the Philosopher''s Stone', '2018-06-08', 2, 'A moving memoir', 'Biography', 'http://dummyimage.com/335x251.png/dddddd/000000');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (159, 'The Help', '2014-08-26', 4, 'A captivating historical fiction novel', 'Autobiography', 'http://dummyimage.com/435x331.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (160, 'The Picture of Dorian Gray', '2003-09-06', 5, 'A fascinating biography', 'Fiction', 'http://dummyimage.com/312x396.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (161, 'The Picture of Dorian Gray', '2011-09-25', 4, 'A heartwarming romance story', 'Science Fiction', 'http://dummyimage.com/357x116.png/ff4444/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (162, 'The Stranger', '2000-07-30', 4, 'A captivating historical fiction novel', 'Mystery', 'http://dummyimage.com/448x101.png/ff4444/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (163, 'The Da Vinci Code', '2004-01-14', 4, 'A heartwarming romance story', 'History', 'http://dummyimage.com/393x195.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (164, 'Fahrenheit 451', '2016-02-18', 3, 'A fascinating biography', 'Poetry', 'http://dummyimage.com/153x292.png/ff4444/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (165, 'The Lord of the Rings', '2010-02-13', 2, 'A thought-provoking science fiction tale', 'Comedy', 'http://dummyimage.com/294x186.png/dddddd/000000');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (166, 'Crime and Punishment', '2016-02-17', 3, 'A gripping mystery novel', 'Biography', 'http://dummyimage.com/315x289.png/cc0000/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (167, 'The Sound and the Fury', '2009-05-18', 4, 'A fascinating biography', 'Autobiography', 'http://dummyimage.com/392x316.png/dddddd/000000');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (168, 'Fahrenheit 451', '2004-03-01', 4, 'A gripping mystery novel', 'Fiction', 'http://dummyimage.com/490x280.png/cc0000/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (169, 'The Idiot', '2012-09-20', 3, 'A hilarious comedy novel', 'Autobiography', 'http://dummyimage.com/257x289.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (170, 'The Help', '2000-02-19', 5, 'A captivating historical fiction novel', 'Thriller', 'http://dummyimage.com/385x220.png/ff4444/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (171, 'The Testaments', '2019-04-11', 4, 'A poignant coming-of-age story', 'Science Fiction', 'http://dummyimage.com/324x438.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (172, 'The Adventures of Huckleberry Finn', '2019-11-16', 3, 'A heartwarming romance story', 'Romance', 'http://dummyimage.com/104x304.png/ff4444/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (173, 'The Lovely Bones', '2001-07-10', 2, 'A moving memoir', 'Drama', 'http://dummyimage.com/257x189.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (174, 'The Fault in Our Stars', '2018-10-04', 4, 'A poignant coming-of-age story', 'Poetry', 'http://dummyimage.com/415x421.png/cc0000/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (175, 'To Kill a Mockingbird', '2019-04-07', 2, 'A moving memoir', 'Comedy', 'http://dummyimage.com/415x115.png/dddddd/000000');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (176, 'The Picture of Dorian Gray', '2007-11-21', 1, 'A chilling horror novel', 'Fantasy', 'http://dummyimage.com/248x168.png/ff4444/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (177, 'The Idiot', '2018-12-18', 2, 'A fascinating biography', 'Drama', 'http://dummyimage.com/462x154.png/ff4444/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (178, 'Anna Karenina', '2023-03-28', 3, 'A thrilling adventure novel', 'Drama', 'http://dummyimage.com/142x331.png/cc0000/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (179, 'Pride and Prejudice', '2019-11-13', 4, 'A thrilling adventure novel', 'Romance', 'http://dummyimage.com/126x317.png/ff4444/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (180, 'The Lovely Bones', '2018-07-07', 5, 'A moving memoir', 'Drama', 'http://dummyimage.com/346x387.png/cc0000/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (181, 'The Name of the Rose', '2013-02-25', 4, 'A moving memoir', 'Biography', 'http://dummyimage.com/212x360.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (182, 'The Great Gatsby', '2007-03-28', 5, 'A poignant coming-of-age story', 'Autobiography', 'http://dummyimage.com/460x198.png/dddddd/000000');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (183, 'Harry Potter and the Philosopher''s Stone', '2004-01-16', 4, 'A thrilling adventure novel', 'History', 'http://dummyimage.com/448x260.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (184, '1984', '2001-07-28', 1, 'A poignant coming-of-age story', 'Thriller', 'http://dummyimage.com/310x100.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (185, 'The Idiot', '2019-11-28', 2, 'A poignant coming-of-age story', 'Autobiography', 'http://dummyimage.com/223x380.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (186, 'Animal Farm', '2002-11-29', 5, 'A chilling horror novel', 'Comedy', 'http://dummyimage.com/119x125.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (187, 'War and Peace', '2003-02-13', 4, 'A gripping mystery novel', 'Horror', 'http://dummyimage.com/113x171.png/cc0000/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (188, 'The Alchemist', '2000-04-16', 2, 'A poignant coming-of-age story', 'Science Fiction', 'http://dummyimage.com/200x344.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (189, 'The Catcher in the Rye', '2019-06-21', 1, 'A moving memoir', 'Horror', 'http://dummyimage.com/280x401.png/dddddd/000000');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (190, 'The Girl on the Train', '2006-06-28', 5, 'A gripping mystery novel', 'Fiction', 'http://dummyimage.com/371x175.png/dddddd/000000');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (191, 'The Help', '2002-02-28', 4, 'A chilling horror novel', 'Non-fiction', 'http://dummyimage.com/189x375.png/ff4444/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (192, 'The Silent Patient', '2000-12-10', 1, 'A thrilling adventure novel', 'Science Fiction', 'http://dummyimage.com/328x229.png/dddddd/000000');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (193, 'Gone Girl', '2021-07-08', 3, 'A moving memoir', 'Romance', 'http://dummyimage.com/257x492.png/cc0000/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (194, 'The Adventures of Huckleberry Finn', '2021-07-24', 2, 'A thrilling adventure novel', 'Thriller', 'http://dummyimage.com/212x177.png/dddddd/000000');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (195, 'The Alchemist', '2014-06-19', 1, 'A gripping mystery novel', 'Non-fiction', 'http://dummyimage.com/213x237.png/cc0000/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (196, 'The Name of the Rose', '2008-10-12', 4, 'A hilarious comedy novel', 'Mystery', 'http://dummyimage.com/149x107.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (197, 'The Time Traveler''s Wife', '2018-05-31', 1, 'A thought-provoking science fiction tale', 'Autobiography', 'http://dummyimage.com/487x418.png/ff4444/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (198, 'The Alchemist', '2014-09-02', 3, 'A moving memoir', 'Horror', 'http://dummyimage.com/295x118.png/ff4444/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (199, 'The Grapes of Wrath', '2015-06-09', 2, 'A heartwarming romance story', 'Biography', 'http://dummyimage.com/220x108.png/5fa2dd/ffffff');
INSERT INTO public.book (id, title, publication_date, copies_owned, description, category, image) OVERRIDING SYSTEM VALUE VALUES (200, 'The Time Traveler''s Wife', '2016-09-17', 3, 'A poignant coming-of-age story', 'Thriller', 'http://dummyimage.com/279x337.png/ff4444/ffffff');


--
-- TOC entry 3368 (class 0 OID 16410)
-- Dependencies: 217
-- Data for Name: book_author; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.book_author (book_id, author_id) VALUES (54, 46);
INSERT INTO public.book_author (book_id, author_id) VALUES (102, 187);
INSERT INTO public.book_author (book_id, author_id) VALUES (38, 7);
INSERT INTO public.book_author (book_id, author_id) VALUES (181, 199);
INSERT INTO public.book_author (book_id, author_id) VALUES (140, 21);
INSERT INTO public.book_author (book_id, author_id) VALUES (37, 182);
INSERT INTO public.book_author (book_id, author_id) VALUES (94, 177);
INSERT INTO public.book_author (book_id, author_id) VALUES (78, 112);
INSERT INTO public.book_author (book_id, author_id) VALUES (18, 191);
INSERT INTO public.book_author (book_id, author_id) VALUES (65, 55);
INSERT INTO public.book_author (book_id, author_id) VALUES (47, 104);
INSERT INTO public.book_author (book_id, author_id) VALUES (47, 17);
INSERT INTO public.book_author (book_id, author_id) VALUES (114, 8);
INSERT INTO public.book_author (book_id, author_id) VALUES (34, 59);
INSERT INTO public.book_author (book_id, author_id) VALUES (181, 88);
INSERT INTO public.book_author (book_id, author_id) VALUES (30, 184);
INSERT INTO public.book_author (book_id, author_id) VALUES (122, 13);
INSERT INTO public.book_author (book_id, author_id) VALUES (187, 61);
INSERT INTO public.book_author (book_id, author_id) VALUES (16, 104);
INSERT INTO public.book_author (book_id, author_id) VALUES (32, 14);
INSERT INTO public.book_author (book_id, author_id) VALUES (164, 112);
INSERT INTO public.book_author (book_id, author_id) VALUES (31, 120);
INSERT INTO public.book_author (book_id, author_id) VALUES (200, 152);
INSERT INTO public.book_author (book_id, author_id) VALUES (196, 169);
INSERT INTO public.book_author (book_id, author_id) VALUES (83, 163);
INSERT INTO public.book_author (book_id, author_id) VALUES (171, 121);
INSERT INTO public.book_author (book_id, author_id) VALUES (96, 151);
INSERT INTO public.book_author (book_id, author_id) VALUES (16, 123);
INSERT INTO public.book_author (book_id, author_id) VALUES (199, 85);
INSERT INTO public.book_author (book_id, author_id) VALUES (50, 144);
INSERT INTO public.book_author (book_id, author_id) VALUES (162, 176);
INSERT INTO public.book_author (book_id, author_id) VALUES (112, 93);
INSERT INTO public.book_author (book_id, author_id) VALUES (177, 57);
INSERT INTO public.book_author (book_id, author_id) VALUES (65, 198);
INSERT INTO public.book_author (book_id, author_id) VALUES (28, 30);
INSERT INTO public.book_author (book_id, author_id) VALUES (171, 65);
INSERT INTO public.book_author (book_id, author_id) VALUES (64, 113);
INSERT INTO public.book_author (book_id, author_id) VALUES (26, 99);
INSERT INTO public.book_author (book_id, author_id) VALUES (32, 44);
INSERT INTO public.book_author (book_id, author_id) VALUES (149, 25);
INSERT INTO public.book_author (book_id, author_id) VALUES (111, 122);
INSERT INTO public.book_author (book_id, author_id) VALUES (167, 198);
INSERT INTO public.book_author (book_id, author_id) VALUES (22, 150);
INSERT INTO public.book_author (book_id, author_id) VALUES (180, 187);
INSERT INTO public.book_author (book_id, author_id) VALUES (16, 24);
INSERT INTO public.book_author (book_id, author_id) VALUES (5, 40);
INSERT INTO public.book_author (book_id, author_id) VALUES (71, 148);
INSERT INTO public.book_author (book_id, author_id) VALUES (60, 129);
INSERT INTO public.book_author (book_id, author_id) VALUES (29, 119);
INSERT INTO public.book_author (book_id, author_id) VALUES (76, 167);
INSERT INTO public.book_author (book_id, author_id) VALUES (108, 146);
INSERT INTO public.book_author (book_id, author_id) VALUES (179, 21);
INSERT INTO public.book_author (book_id, author_id) VALUES (8, 86);
INSERT INTO public.book_author (book_id, author_id) VALUES (57, 160);
INSERT INTO public.book_author (book_id, author_id) VALUES (167, 53);
INSERT INTO public.book_author (book_id, author_id) VALUES (58, 97);
INSERT INTO public.book_author (book_id, author_id) VALUES (46, 192);
INSERT INTO public.book_author (book_id, author_id) VALUES (31, 199);
INSERT INTO public.book_author (book_id, author_id) VALUES (71, 75);
INSERT INTO public.book_author (book_id, author_id) VALUES (70, 40);
INSERT INTO public.book_author (book_id, author_id) VALUES (21, 95);
INSERT INTO public.book_author (book_id, author_id) VALUES (25, 11);
INSERT INTO public.book_author (book_id, author_id) VALUES (149, 20);
INSERT INTO public.book_author (book_id, author_id) VALUES (75, 66);
INSERT INTO public.book_author (book_id, author_id) VALUES (106, 55);
INSERT INTO public.book_author (book_id, author_id) VALUES (180, 152);
INSERT INTO public.book_author (book_id, author_id) VALUES (94, 54);
INSERT INTO public.book_author (book_id, author_id) VALUES (145, 113);
INSERT INTO public.book_author (book_id, author_id) VALUES (76, 123);
INSERT INTO public.book_author (book_id, author_id) VALUES (132, 191);
INSERT INTO public.book_author (book_id, author_id) VALUES (17, 139);
INSERT INTO public.book_author (book_id, author_id) VALUES (123, 58);
INSERT INTO public.book_author (book_id, author_id) VALUES (98, 117);
INSERT INTO public.book_author (book_id, author_id) VALUES (92, 92);
INSERT INTO public.book_author (book_id, author_id) VALUES (154, 28);
INSERT INTO public.book_author (book_id, author_id) VALUES (88, 20);
INSERT INTO public.book_author (book_id, author_id) VALUES (68, 30);
INSERT INTO public.book_author (book_id, author_id) VALUES (48, 62);
INSERT INTO public.book_author (book_id, author_id) VALUES (13, 78);
INSERT INTO public.book_author (book_id, author_id) VALUES (19, 164);
INSERT INTO public.book_author (book_id, author_id) VALUES (18, 38);
INSERT INTO public.book_author (book_id, author_id) VALUES (152, 71);
INSERT INTO public.book_author (book_id, author_id) VALUES (69, 28);
INSERT INTO public.book_author (book_id, author_id) VALUES (197, 178);
INSERT INTO public.book_author (book_id, author_id) VALUES (66, 15);
INSERT INTO public.book_author (book_id, author_id) VALUES (150, 46);
INSERT INTO public.book_author (book_id, author_id) VALUES (51, 151);
INSERT INTO public.book_author (book_id, author_id) VALUES (190, 196);
INSERT INTO public.book_author (book_id, author_id) VALUES (186, 128);
INSERT INTO public.book_author (book_id, author_id) VALUES (127, 35);
INSERT INTO public.book_author (book_id, author_id) VALUES (37, 113);
INSERT INTO public.book_author (book_id, author_id) VALUES (174, 180);
INSERT INTO public.book_author (book_id, author_id) VALUES (126, 46);
INSERT INTO public.book_author (book_id, author_id) VALUES (107, 170);
INSERT INTO public.book_author (book_id, author_id) VALUES (181, 100);
INSERT INTO public.book_author (book_id, author_id) VALUES (101, 199);
INSERT INTO public.book_author (book_id, author_id) VALUES (62, 31);
INSERT INTO public.book_author (book_id, author_id) VALUES (127, 188);
INSERT INTO public.book_author (book_id, author_id) VALUES (95, 114);
INSERT INTO public.book_author (book_id, author_id) VALUES (169, 51);
INSERT INTO public.book_author (book_id, author_id) VALUES (80, 58);
INSERT INTO public.book_author (book_id, author_id) VALUES (81, 18);
INSERT INTO public.book_author (book_id, author_id) VALUES (146, 93);
INSERT INTO public.book_author (book_id, author_id) VALUES (14, 2);
INSERT INTO public.book_author (book_id, author_id) VALUES (126, 4);
INSERT INTO public.book_author (book_id, author_id) VALUES (8, 60);
INSERT INTO public.book_author (book_id, author_id) VALUES (38, 14);
INSERT INTO public.book_author (book_id, author_id) VALUES (1, 51);
INSERT INTO public.book_author (book_id, author_id) VALUES (189, 10);
INSERT INTO public.book_author (book_id, author_id) VALUES (43, 12);
INSERT INTO public.book_author (book_id, author_id) VALUES (13, 139);
INSERT INTO public.book_author (book_id, author_id) VALUES (85, 131);
INSERT INTO public.book_author (book_id, author_id) VALUES (91, 104);
INSERT INTO public.book_author (book_id, author_id) VALUES (93, 12);
INSERT INTO public.book_author (book_id, author_id) VALUES (41, 118);
INSERT INTO public.book_author (book_id, author_id) VALUES (29, 53);
INSERT INTO public.book_author (book_id, author_id) VALUES (84, 11);
INSERT INTO public.book_author (book_id, author_id) VALUES (12, 157);
INSERT INTO public.book_author (book_id, author_id) VALUES (19, 25);
INSERT INTO public.book_author (book_id, author_id) VALUES (8, 134);
INSERT INTO public.book_author (book_id, author_id) VALUES (24, 65);
INSERT INTO public.book_author (book_id, author_id) VALUES (51, 186);
INSERT INTO public.book_author (book_id, author_id) VALUES (68, 103);
INSERT INTO public.book_author (book_id, author_id) VALUES (98, 90);
INSERT INTO public.book_author (book_id, author_id) VALUES (97, 74);
INSERT INTO public.book_author (book_id, author_id) VALUES (76, 46);
INSERT INTO public.book_author (book_id, author_id) VALUES (92, 52);
INSERT INTO public.book_author (book_id, author_id) VALUES (5, 93);
INSERT INTO public.book_author (book_id, author_id) VALUES (16, 136);
INSERT INTO public.book_author (book_id, author_id) VALUES (2, 110);
INSERT INTO public.book_author (book_id, author_id) VALUES (37, 180);
INSERT INTO public.book_author (book_id, author_id) VALUES (45, 83);
INSERT INTO public.book_author (book_id, author_id) VALUES (8, 186);
INSERT INTO public.book_author (book_id, author_id) VALUES (90, 33);
INSERT INTO public.book_author (book_id, author_id) VALUES (9, 122);
INSERT INTO public.book_author (book_id, author_id) VALUES (32, 132);
INSERT INTO public.book_author (book_id, author_id) VALUES (51, 193);
INSERT INTO public.book_author (book_id, author_id) VALUES (79, 103);
INSERT INTO public.book_author (book_id, author_id) VALUES (71, 123);
INSERT INTO public.book_author (book_id, author_id) VALUES (11, 161);
INSERT INTO public.book_author (book_id, author_id) VALUES (84, 28);
INSERT INTO public.book_author (book_id, author_id) VALUES (35, 55);
INSERT INTO public.book_author (book_id, author_id) VALUES (66, 32);
INSERT INTO public.book_author (book_id, author_id) VALUES (56, 169);
INSERT INTO public.book_author (book_id, author_id) VALUES (45, 79);
INSERT INTO public.book_author (book_id, author_id) VALUES (66, 110);
INSERT INTO public.book_author (book_id, author_id) VALUES (94, 15);
INSERT INTO public.book_author (book_id, author_id) VALUES (68, 134);
INSERT INTO public.book_author (book_id, author_id) VALUES (51, 80);
INSERT INTO public.book_author (book_id, author_id) VALUES (80, 23);
INSERT INTO public.book_author (book_id, author_id) VALUES (16, 71);
INSERT INTO public.book_author (book_id, author_id) VALUES (2, 113);
INSERT INTO public.book_author (book_id, author_id) VALUES (15, 152);
INSERT INTO public.book_author (book_id, author_id) VALUES (17, 32);
INSERT INTO public.book_author (book_id, author_id) VALUES (99, 40);
INSERT INTO public.book_author (book_id, author_id) VALUES (22, 145);
INSERT INTO public.book_author (book_id, author_id) VALUES (98, 73);
INSERT INTO public.book_author (book_id, author_id) VALUES (66, 7);
INSERT INTO public.book_author (book_id, author_id) VALUES (40, 70);
INSERT INTO public.book_author (book_id, author_id) VALUES (70, 189);
INSERT INTO public.book_author (book_id, author_id) VALUES (29, 113);
INSERT INTO public.book_author (book_id, author_id) VALUES (52, 111);
INSERT INTO public.book_author (book_id, author_id) VALUES (72, 171);
INSERT INTO public.book_author (book_id, author_id) VALUES (9, 50);
INSERT INTO public.book_author (book_id, author_id) VALUES (48, 63);
INSERT INTO public.book_author (book_id, author_id) VALUES (23, 12);
INSERT INTO public.book_author (book_id, author_id) VALUES (3, 103);
INSERT INTO public.book_author (book_id, author_id) VALUES (9, 190);
INSERT INTO public.book_author (book_id, author_id) VALUES (71, 191);
INSERT INTO public.book_author (book_id, author_id) VALUES (32, 12);
INSERT INTO public.book_author (book_id, author_id) VALUES (59, 173);
INSERT INTO public.book_author (book_id, author_id) VALUES (75, 55);
INSERT INTO public.book_author (book_id, author_id) VALUES (6, 197);
INSERT INTO public.book_author (book_id, author_id) VALUES (55, 170);
INSERT INTO public.book_author (book_id, author_id) VALUES (64, 166);
INSERT INTO public.book_author (book_id, author_id) VALUES (78, 47);
INSERT INTO public.book_author (book_id, author_id) VALUES (51, 91);
INSERT INTO public.book_author (book_id, author_id) VALUES (54, 83);
INSERT INTO public.book_author (book_id, author_id) VALUES (14, 114);
INSERT INTO public.book_author (book_id, author_id) VALUES (33, 177);
INSERT INTO public.book_author (book_id, author_id) VALUES (79, 37);
INSERT INTO public.book_author (book_id, author_id) VALUES (21, 127);
INSERT INTO public.book_author (book_id, author_id) VALUES (56, 132);
INSERT INTO public.book_author (book_id, author_id) VALUES (68, 121);
INSERT INTO public.book_author (book_id, author_id) VALUES (52, 44);
INSERT INTO public.book_author (book_id, author_id) VALUES (5, 141);
INSERT INTO public.book_author (book_id, author_id) VALUES (89, 43);
INSERT INTO public.book_author (book_id, author_id) VALUES (100, 120);
INSERT INTO public.book_author (book_id, author_id) VALUES (35, 73);
INSERT INTO public.book_author (book_id, author_id) VALUES (26, 93);
INSERT INTO public.book_author (book_id, author_id) VALUES (92, 133);
INSERT INTO public.book_author (book_id, author_id) VALUES (45, 68);
INSERT INTO public.book_author (book_id, author_id) VALUES (43, 86);
INSERT INTO public.book_author (book_id, author_id) VALUES (1, 189);
INSERT INTO public.book_author (book_id, author_id) VALUES (11, 31);
INSERT INTO public.book_author (book_id, author_id) VALUES (19, 124);
INSERT INTO public.book_author (book_id, author_id) VALUES (7, 177);
INSERT INTO public.book_author (book_id, author_id) VALUES (65, 79);
INSERT INTO public.book_author (book_id, author_id) VALUES (20, 21);
INSERT INTO public.book_author (book_id, author_id) VALUES (82, 88);
INSERT INTO public.book_author (book_id, author_id) VALUES (12, 163);
INSERT INTO public.book_author (book_id, author_id) VALUES (29, 153);
INSERT INTO public.book_author (book_id, author_id) VALUES (59, 112);
INSERT INTO public.book_author (book_id, author_id) VALUES (16, 198);
INSERT INTO public.book_author (book_id, author_id) VALUES (64, 63);
INSERT INTO public.book_author (book_id, author_id) VALUES (94, 160);
INSERT INTO public.book_author (book_id, author_id) VALUES (56, 88);
INSERT INTO public.book_author (book_id, author_id) VALUES (98, 120);
INSERT INTO public.book_author (book_id, author_id) VALUES (33, 103);
INSERT INTO public.book_author (book_id, author_id) VALUES (164, 16);
INSERT INTO public.book_author (book_id, author_id) VALUES (88, 73);
INSERT INTO public.book_author (book_id, author_id) VALUES (99, 1);
INSERT INTO public.book_author (book_id, author_id) VALUES (38, 99);
INSERT INTO public.book_author (book_id, author_id) VALUES (11, 70);
INSERT INTO public.book_author (book_id, author_id) VALUES (88, 78);
INSERT INTO public.book_author (book_id, author_id) VALUES (39, 37);
INSERT INTO public.book_author (book_id, author_id) VALUES (159, 2);
INSERT INTO public.book_author (book_id, author_id) VALUES (194, 15);
INSERT INTO public.book_author (book_id, author_id) VALUES (128, 29);
INSERT INTO public.book_author (book_id, author_id) VALUES (198, 1);
INSERT INTO public.book_author (book_id, author_id) VALUES (20, 91);
INSERT INTO public.book_author (book_id, author_id) VALUES (9, 17);
INSERT INTO public.book_author (book_id, author_id) VALUES (62, 23);
INSERT INTO public.book_author (book_id, author_id) VALUES (156, 52);
INSERT INTO public.book_author (book_id, author_id) VALUES (42, 91);
INSERT INTO public.book_author (book_id, author_id) VALUES (59, 48);
INSERT INTO public.book_author (book_id, author_id) VALUES (2, 28);
INSERT INTO public.book_author (book_id, author_id) VALUES (32, 81);
INSERT INTO public.book_author (book_id, author_id) VALUES (56, 47);
INSERT INTO public.book_author (book_id, author_id) VALUES (165, 61);
INSERT INTO public.book_author (book_id, author_id) VALUES (106, 38);
INSERT INTO public.book_author (book_id, author_id) VALUES (171, 49);
INSERT INTO public.book_author (book_id, author_id) VALUES (169, 43);
INSERT INTO public.book_author (book_id, author_id) VALUES (21, 77);
INSERT INTO public.book_author (book_id, author_id) VALUES (28, 21);
INSERT INTO public.book_author (book_id, author_id) VALUES (37, 68);
INSERT INTO public.book_author (book_id, author_id) VALUES (166, 72);
INSERT INTO public.book_author (book_id, author_id) VALUES (40, 2);
INSERT INTO public.book_author (book_id, author_id) VALUES (63, 84);
INSERT INTO public.book_author (book_id, author_id) VALUES (29, 19);
INSERT INTO public.book_author (book_id, author_id) VALUES (186, 20);
INSERT INTO public.book_author (book_id, author_id) VALUES (157, 32);
INSERT INTO public.book_author (book_id, author_id) VALUES (159, 84);
INSERT INTO public.book_author (book_id, author_id) VALUES (144, 21);
INSERT INTO public.book_author (book_id, author_id) VALUES (24, 38);
INSERT INTO public.book_author (book_id, author_id) VALUES (36, 64);
INSERT INTO public.book_author (book_id, author_id) VALUES (61, 33);
INSERT INTO public.book_author (book_id, author_id) VALUES (117, 36);
INSERT INTO public.book_author (book_id, author_id) VALUES (46, 2);
INSERT INTO public.book_author (book_id, author_id) VALUES (112, 68);
INSERT INTO public.book_author (book_id, author_id) VALUES (136, 40);
INSERT INTO public.book_author (book_id, author_id) VALUES (80, 48);
INSERT INTO public.book_author (book_id, author_id) VALUES (119, 58);
INSERT INTO public.book_author (book_id, author_id) VALUES (191, 62);
INSERT INTO public.book_author (book_id, author_id) VALUES (183, 71);
INSERT INTO public.book_author (book_id, author_id) VALUES (126, 85);
INSERT INTO public.book_author (book_id, author_id) VALUES (176, 79);
INSERT INTO public.book_author (book_id, author_id) VALUES (74, 19);
INSERT INTO public.book_author (book_id, author_id) VALUES (145, 34);
INSERT INTO public.book_author (book_id, author_id) VALUES (133, 84);
INSERT INTO public.book_author (book_id, author_id) VALUES (79, 41);
INSERT INTO public.book_author (book_id, author_id) VALUES (160, 41);
INSERT INTO public.book_author (book_id, author_id) VALUES (58, 17);
INSERT INTO public.book_author (book_id, author_id) VALUES (42, 3);
INSERT INTO public.book_author (book_id, author_id) VALUES (155, 55);
INSERT INTO public.book_author (book_id, author_id) VALUES (60, 84);
INSERT INTO public.book_author (book_id, author_id) VALUES (50, 19);
INSERT INTO public.book_author (book_id, author_id) VALUES (200, 100);
INSERT INTO public.book_author (book_id, author_id) VALUES (171, 46);
INSERT INTO public.book_author (book_id, author_id) VALUES (121, 42);
INSERT INTO public.book_author (book_id, author_id) VALUES (14, 18);
INSERT INTO public.book_author (book_id, author_id) VALUES (167, 49);
INSERT INTO public.book_author (book_id, author_id) VALUES (103, 30);
INSERT INTO public.book_author (book_id, author_id) VALUES (93, 85);
INSERT INTO public.book_author (book_id, author_id) VALUES (166, 62);
INSERT INTO public.book_author (book_id, author_id) VALUES (198, 37);
INSERT INTO public.book_author (book_id, author_id) VALUES (177, 41);
INSERT INTO public.book_author (book_id, author_id) VALUES (76, 45);
INSERT INTO public.book_author (book_id, author_id) VALUES (27, 22);
INSERT INTO public.book_author (book_id, author_id) VALUES (163, 86);
INSERT INTO public.book_author (book_id, author_id) VALUES (96, 32);
INSERT INTO public.book_author (book_id, author_id) VALUES (32, 70);
INSERT INTO public.book_author (book_id, author_id) VALUES (167, 28);
INSERT INTO public.book_author (book_id, author_id) VALUES (120, 87);
INSERT INTO public.book_author (book_id, author_id) VALUES (22, 16);
INSERT INTO public.book_author (book_id, author_id) VALUES (97, 78);
INSERT INTO public.book_author (book_id, author_id) VALUES (169, 78);
INSERT INTO public.book_author (book_id, author_id) VALUES (135, 48);
INSERT INTO public.book_author (book_id, author_id) VALUES (178, 56);
INSERT INTO public.book_author (book_id, author_id) VALUES (117, 70);
INSERT INTO public.book_author (book_id, author_id) VALUES (141, 4);
INSERT INTO public.book_author (book_id, author_id) VALUES (4, 71);
INSERT INTO public.book_author (book_id, author_id) VALUES (8, 8);
INSERT INTO public.book_author (book_id, author_id) VALUES (8, 28);
INSERT INTO public.book_author (book_id, author_id) VALUES (62, 12);
INSERT INTO public.book_author (book_id, author_id) VALUES (155, 46);
INSERT INTO public.book_author (book_id, author_id) VALUES (47, 30);
INSERT INTO public.book_author (book_id, author_id) VALUES (164, 169);
INSERT INTO public.book_author (book_id, author_id) VALUES (123, 152);
INSERT INTO public.book_author (book_id, author_id) VALUES (176, 176);
INSERT INTO public.book_author (book_id, author_id) VALUES (106, 121);
INSERT INTO public.book_author (book_id, author_id) VALUES (110, 194);
INSERT INTO public.book_author (book_id, author_id) VALUES (193, 193);
INSERT INTO public.book_author (book_id, author_id) VALUES (108, 174);
INSERT INTO public.book_author (book_id, author_id) VALUES (122, 148);
INSERT INTO public.book_author (book_id, author_id) VALUES (193, 190);
INSERT INTO public.book_author (book_id, author_id) VALUES (187, 187);
INSERT INTO public.book_author (book_id, author_id) VALUES (198, 131);
INSERT INTO public.book_author (book_id, author_id) VALUES (131, 113);
INSERT INTO public.book_author (book_id, author_id) VALUES (138, 197);
INSERT INTO public.book_author (book_id, author_id) VALUES (144, 129);
INSERT INTO public.book_author (book_id, author_id) VALUES (145, 124);
INSERT INTO public.book_author (book_id, author_id) VALUES (168, 112);
INSERT INTO public.book_author (book_id, author_id) VALUES (156, 126);
INSERT INTO public.book_author (book_id, author_id) VALUES (101, 177);
INSERT INTO public.book_author (book_id, author_id) VALUES (123, 141);
INSERT INTO public.book_author (book_id, author_id) VALUES (162, 129);
INSERT INTO public.book_author (book_id, author_id) VALUES (107, 135);
INSERT INTO public.book_author (book_id, author_id) VALUES (124, 172);
INSERT INTO public.book_author (book_id, author_id) VALUES (150, 162);
INSERT INTO public.book_author (book_id, author_id) VALUES (142, 171);
INSERT INTO public.book_author (book_id, author_id) VALUES (200, 123);
INSERT INTO public.book_author (book_id, author_id) VALUES (148, 130);
INSERT INTO public.book_author (book_id, author_id) VALUES (132, 103);
INSERT INTO public.book_author (book_id, author_id) VALUES (194, 105);
INSERT INTO public.book_author (book_id, author_id) VALUES (107, 197);
INSERT INTO public.book_author (book_id, author_id) VALUES (166, 141);
INSERT INTO public.book_author (book_id, author_id) VALUES (200, 126);
INSERT INTO public.book_author (book_id, author_id) VALUES (142, 165);
INSERT INTO public.book_author (book_id, author_id) VALUES (195, 120);
INSERT INTO public.book_author (book_id, author_id) VALUES (181, 198);
INSERT INTO public.book_author (book_id, author_id) VALUES (103, 165);
INSERT INTO public.book_author (book_id, author_id) VALUES (172, 176);
INSERT INTO public.book_author (book_id, author_id) VALUES (158, 168);
INSERT INTO public.book_author (book_id, author_id) VALUES (177, 124);
INSERT INTO public.book_author (book_id, author_id) VALUES (184, 130);
INSERT INTO public.book_author (book_id, author_id) VALUES (147, 154);
INSERT INTO public.book_author (book_id, author_id) VALUES (171, 195);
INSERT INTO public.book_author (book_id, author_id) VALUES (122, 198);
INSERT INTO public.book_author (book_id, author_id) VALUES (102, 119);
INSERT INTO public.book_author (book_id, author_id) VALUES (189, 128);
INSERT INTO public.book_author (book_id, author_id) VALUES (157, 151);
INSERT INTO public.book_author (book_id, author_id) VALUES (135, 148);
INSERT INTO public.book_author (book_id, author_id) VALUES (143, 186);
INSERT INTO public.book_author (book_id, author_id) VALUES (122, 200);
INSERT INTO public.book_author (book_id, author_id) VALUES (130, 141);
INSERT INTO public.book_author (book_id, author_id) VALUES (105, 122);
INSERT INTO public.book_author (book_id, author_id) VALUES (144, 175);
INSERT INTO public.book_author (book_id, author_id) VALUES (160, 171);
INSERT INTO public.book_author (book_id, author_id) VALUES (110, 189);
INSERT INTO public.book_author (book_id, author_id) VALUES (177, 184);
INSERT INTO public.book_author (book_id, author_id) VALUES (193, 108);
INSERT INTO public.book_author (book_id, author_id) VALUES (172, 148);
INSERT INTO public.book_author (book_id, author_id) VALUES (176, 196);
INSERT INTO public.book_author (book_id, author_id) VALUES (169, 136);
INSERT INTO public.book_author (book_id, author_id) VALUES (159, 107);
INSERT INTO public.book_author (book_id, author_id) VALUES (146, 133);
INSERT INTO public.book_author (book_id, author_id) VALUES (183, 161);
INSERT INTO public.book_author (book_id, author_id) VALUES (153, 172);
INSERT INTO public.book_author (book_id, author_id) VALUES (174, 120);
INSERT INTO public.book_author (book_id, author_id) VALUES (194, 140);
INSERT INTO public.book_author (book_id, author_id) VALUES (125, 167);
INSERT INTO public.book_author (book_id, author_id) VALUES (126, 192);
INSERT INTO public.book_author (book_id, author_id) VALUES (165, 115);
INSERT INTO public.book_author (book_id, author_id) VALUES (169, 171);
INSERT INTO public.book_author (book_id, author_id) VALUES (197, 186);
INSERT INTO public.book_author (book_id, author_id) VALUES (182, 143);
INSERT INTO public.book_author (book_id, author_id) VALUES (170, 114);
INSERT INTO public.book_author (book_id, author_id) VALUES (174, 127);
INSERT INTO public.book_author (book_id, author_id) VALUES (168, 148);
INSERT INTO public.book_author (book_id, author_id) VALUES (157, 199);
INSERT INTO public.book_author (book_id, author_id) VALUES (172, 191);
INSERT INTO public.book_author (book_id, author_id) VALUES (120, 130);
INSERT INTO public.book_author (book_id, author_id) VALUES (118, 192);
INSERT INTO public.book_author (book_id, author_id) VALUES (174, 188);
INSERT INTO public.book_author (book_id, author_id) VALUES (190, 165);
INSERT INTO public.book_author (book_id, author_id) VALUES (103, 159);
INSERT INTO public.book_author (book_id, author_id) VALUES (199, 175);
INSERT INTO public.book_author (book_id, author_id) VALUES (177, 128);
INSERT INTO public.book_author (book_id, author_id) VALUES (162, 156);
INSERT INTO public.book_author (book_id, author_id) VALUES (154, 157);
INSERT INTO public.book_author (book_id, author_id) VALUES (112, 193);
INSERT INTO public.book_author (book_id, author_id) VALUES (137, 105);
INSERT INTO public.book_author (book_id, author_id) VALUES (123, 145);
INSERT INTO public.book_author (book_id, author_id) VALUES (170, 168);
INSERT INTO public.book_author (book_id, author_id) VALUES (180, 167);
INSERT INTO public.book_author (book_id, author_id) VALUES (164, 168);
INSERT INTO public.book_author (book_id, author_id) VALUES (176, 138);
INSERT INTO public.book_author (book_id, author_id) VALUES (188, 174);
INSERT INTO public.book_author (book_id, author_id) VALUES (181, 187);
INSERT INTO public.book_author (book_id, author_id) VALUES (103, 142);
INSERT INTO public.book_author (book_id, author_id) VALUES (116, 184);
INSERT INTO public.book_author (book_id, author_id) VALUES (146, 101);
INSERT INTO public.book_author (book_id, author_id) VALUES (137, 195);
INSERT INTO public.book_author (book_id, author_id) VALUES (164, 110);


--
-- TOC entry 3370 (class 0 OID 16414)
-- Dependencies: 219
-- Data for Name: fee_payment; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3372 (class 0 OID 16418)
-- Dependencies: 221
-- Data for Name: loan; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3374 (class 0 OID 16424)
-- Dependencies: 223
-- Data for Name: member; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3375 (class 0 OID 16429)
-- Dependencies: 224
-- Data for Name: reservation; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3385 (class 0 OID 0)
-- Dependencies: 215
-- Name: author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.author_id_seq', 200, true);


--
-- TOC entry 3386 (class 0 OID 0)
-- Dependencies: 218
-- Name: book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.book_id_seq', 200, true);


--
-- TOC entry 3387 (class 0 OID 0)
-- Dependencies: 220
-- Name: fine_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fine_payment_id_seq', 42, true);


--
-- TOC entry 3388 (class 0 OID 0)
-- Dependencies: 222
-- Name: loan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.loan_id_seq', 1, false);


--
-- TOC entry 3389 (class 0 OID 0)
-- Dependencies: 225
-- Name: reservation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reservation_id_seq', 21, true);


--
-- TOC entry 3208 (class 2606 OID 16436)
-- Name: book_author book_author_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_author
    ADD CONSTRAINT book_author_pkey PRIMARY KEY (book_id, author_id);


--
-- TOC entry 3204 (class 2606 OID 16438)
-- Name: author pk_author; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.author
    ADD CONSTRAINT pk_author PRIMARY KEY (id);


--
-- TOC entry 3206 (class 2606 OID 16440)
-- Name: book pk_book; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT pk_book PRIMARY KEY (id);


--
-- TOC entry 3210 (class 2606 OID 16442)
-- Name: fee_payment pk_fine_payment; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fee_payment
    ADD CONSTRAINT pk_fine_payment PRIMARY KEY (loan_id);


--
-- TOC entry 3212 (class 2606 OID 16444)
-- Name: loan pk_loan; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan
    ADD CONSTRAINT pk_loan PRIMARY KEY (id);


--
-- TOC entry 3214 (class 2606 OID 16446)
-- Name: member pk_member; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member
    ADD CONSTRAINT pk_member PRIMARY KEY (username);


--
-- TOC entry 3216 (class 2606 OID 16448)
-- Name: reservation pk_reservation; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT pk_reservation PRIMARY KEY (id);


--
-- TOC entry 3217 (class 2606 OID 16449)
-- Name: book_author fk_bookauthor_author; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_author
    ADD CONSTRAINT fk_bookauthor_author FOREIGN KEY (author_id) REFERENCES public.author(id);


--
-- TOC entry 3218 (class 2606 OID 16454)
-- Name: book_author fk_bookauthor_book; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book_author
    ADD CONSTRAINT fk_bookauthor_book FOREIGN KEY (book_id) REFERENCES public.book(id) NOT VALID;


--
-- TOC entry 3219 (class 2606 OID 16459)
-- Name: loan fk_loan_book; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan
    ADD CONSTRAINT fk_loan_book FOREIGN KEY (book_id) REFERENCES public.book(id);


--
-- TOC entry 3220 (class 2606 OID 16464)
-- Name: loan fk_loan_member_username; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loan
    ADD CONSTRAINT fk_loan_member_username FOREIGN KEY (member_username) REFERENCES public.member(username) NOT VALID;


--
-- TOC entry 3221 (class 2606 OID 16469)
-- Name: reservation fk_res_book; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT fk_res_book FOREIGN KEY (book_id) REFERENCES public.book(id);


--
-- TOC entry 3222 (class 2606 OID 16474)
-- Name: reservation fk_res_member; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT fk_res_member FOREIGN KEY (member_username) REFERENCES public.member(username) NOT VALID;


--
-- TOC entry 3384 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


-- Completed on 2023-05-19 15:56:03

--
-- PostgreSQL database dump complete
--

