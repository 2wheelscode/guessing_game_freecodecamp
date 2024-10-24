--
-- PostgreSQL database dump
--

-- Dumped from database version 12.20 (Ubuntu 12.20-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.20 (Ubuntu 12.20-0ubuntu0.20.04.1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: game_data; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.game_data (
    game_data_id integer NOT NULL,
    best_game integer,
    games_played integer,
    username_id integer NOT NULL
);


ALTER TABLE public.game_data OWNER TO freecodecamp;

--
-- Name: game_data_game_data_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.game_data_game_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_data_game_data_id_seq OWNER TO freecodecamp;

--
-- Name: game_data_game_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.game_data_game_data_id_seq OWNED BY public.game_data.game_data_id;


--
-- Name: game_data_username_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.game_data_username_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_data_username_id_seq OWNER TO freecodecamp;

--
-- Name: game_data_username_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.game_data_username_id_seq OWNED BY public.game_data.username_id;


--
-- Name: user_data; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.user_data (
    username character varying(22),
    username_id integer NOT NULL
);


ALTER TABLE public.user_data OWNER TO freecodecamp;

--
-- Name: username_username_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.username_username_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.username_username_id_seq OWNER TO freecodecamp;

--
-- Name: username_username_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.username_username_id_seq OWNED BY public.user_data.username_id;


--
-- Name: game_data game_data_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_data ALTER COLUMN game_data_id SET DEFAULT nextval('public.game_data_game_data_id_seq'::regclass);


--
-- Name: game_data username_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_data ALTER COLUMN username_id SET DEFAULT nextval('public.game_data_username_id_seq'::regclass);


--
-- Name: user_data username_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_data ALTER COLUMN username_id SET DEFAULT nextval('public.username_username_id_seq'::regclass);


--
-- Data for Name: game_data; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.game_data VALUES (3, 5, 2, 3);
INSERT INTO public.game_data VALUES (2, 1, 5, 2);
INSERT INTO public.game_data VALUES (1, 3, 2, 1);
INSERT INTO public.game_data VALUES (5, 1, 2, 5);
INSERT INTO public.game_data VALUES (4, 2, 5, 4);
INSERT INTO public.game_data VALUES (6, 9, 1, 6);
INSERT INTO public.game_data VALUES (7, 5, 4, 7);
INSERT INTO public.game_data VALUES (9, 6, 2, 9);
INSERT INTO public.game_data VALUES (8, 5, 5, 8);
INSERT INTO public.game_data VALUES (11, 2, 2, 11);
INSERT INTO public.game_data VALUES (10, 3, 5, 10);


--
-- Data for Name: user_data; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.user_data VALUES ('Saito', 1);
INSERT INTO public.user_data VALUES ('user_1729679775607', 2);
INSERT INTO public.user_data VALUES ('user_1729679775606', 3);
INSERT INTO public.user_data VALUES ('user_1729679947697', 4);
INSERT INTO public.user_data VALUES ('user_1729679947696', 5);
INSERT INTO public.user_data VALUES ('1', 6);
INSERT INTO public.user_data VALUES ('Amir', 7);
INSERT INTO public.user_data VALUES ('user_1729682936817', 8);
INSERT INTO public.user_data VALUES ('user_1729682936816', 9);
INSERT INTO public.user_data VALUES ('user_1729683115778', 10);
INSERT INTO public.user_data VALUES ('user_1729683115777', 11);


--
-- Name: game_data_game_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.game_data_game_data_id_seq', 11, true);


--
-- Name: game_data_username_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.game_data_username_id_seq', 1, false);


--
-- Name: username_username_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.username_username_id_seq', 11, true);


--
-- Name: game_data game_data_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_data
    ADD CONSTRAINT game_data_pkey PRIMARY KEY (game_data_id);


--
-- Name: user_data username_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_data
    ADD CONSTRAINT username_pkey PRIMARY KEY (username_id);


--
-- Name: game_data game_data_username_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_data
    ADD CONSTRAINT game_data_username_id_fkey FOREIGN KEY (username_id) REFERENCES public.user_data(username_id);


--
-- PostgreSQL database dump complete
--

