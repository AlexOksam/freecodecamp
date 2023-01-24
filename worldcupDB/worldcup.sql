--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    round character varying(50) NOT NULL,
    year integer NOT NULL,
    winner_goals integer NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: games_opponent_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_opponent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_opponent_id_seq OWNER TO freecodecamp;

--
-- Name: games_opponent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_opponent_id_seq OWNED BY public.games.opponent_id;


--
-- Name: games_winner_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_winner_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_winner_id_seq OWNER TO freecodecamp;

--
-- Name: games_winner_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_winner_id_seq OWNED BY public.games.winner_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: games winner_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN winner_id SET DEFAULT nextval('public.games_winner_id_seq'::regclass);


--
-- Name: games opponent_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN opponent_id SET DEFAULT nextval('public.games_opponent_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 'Final', 2018, 4, 70, 71, 2);
INSERT INTO public.games VALUES (2, 'Third Place', 2018, 2, 72, 73, 0);
INSERT INTO public.games VALUES (3, 'Semi-Final', 2018, 2, 71, 73, 1);
INSERT INTO public.games VALUES (4, 'Semi-Final', 2018, 1, 70, 72, 0);
INSERT INTO public.games VALUES (5, 'Quarter-Final', 2018, 3, 71, 74, 2);
INSERT INTO public.games VALUES (6, 'Quarter-Final', 2018, 2, 73, 75, 0);
INSERT INTO public.games VALUES (7, 'Quarter-Final', 2018, 2, 72, 76, 1);
INSERT INTO public.games VALUES (8, 'Quarter-Final', 2018, 2, 70, 77, 0);
INSERT INTO public.games VALUES (9, 'Eighth-Final', 2018, 2, 73, 78, 1);
INSERT INTO public.games VALUES (10, 'Eighth-Final', 2018, 1, 75, 79, 0);
INSERT INTO public.games VALUES (11, 'Eighth-Final', 2018, 3, 72, 80, 2);
INSERT INTO public.games VALUES (12, 'Eighth-Final', 2018, 2, 76, 81, 0);
INSERT INTO public.games VALUES (13, 'Eighth-Final', 2018, 2, 71, 82, 1);
INSERT INTO public.games VALUES (14, 'Eighth-Final', 2018, 2, 74, 83, 1);
INSERT INTO public.games VALUES (15, 'Eighth-Final', 2018, 2, 77, 84, 1);
INSERT INTO public.games VALUES (16, 'Eighth-Final', 2018, 4, 70, 85, 3);
INSERT INTO public.games VALUES (17, 'Final', 2014, 1, 86, 85, 0);
INSERT INTO public.games VALUES (18, 'Third Place', 2014, 3, 87, 76, 0);
INSERT INTO public.games VALUES (19, 'Semi-Final', 2014, 1, 85, 87, 0);
INSERT INTO public.games VALUES (20, 'Semi-Final', 2014, 7, 86, 76, 1);
INSERT INTO public.games VALUES (21, 'Quarter-Final', 2014, 1, 87, 88, 0);
INSERT INTO public.games VALUES (22, 'Quarter-Final', 2014, 1, 85, 72, 0);
INSERT INTO public.games VALUES (23, 'Quarter-Final', 2014, 2, 76, 78, 1);
INSERT INTO public.games VALUES (24, 'Quarter-Final', 2014, 1, 86, 70, 0);
INSERT INTO public.games VALUES (25, 'Eighth-Final', 2014, 2, 76, 89, 1);
INSERT INTO public.games VALUES (26, 'Eighth-Final', 2014, 2, 78, 77, 0);
INSERT INTO public.games VALUES (27, 'Eighth-Final', 2014, 2, 70, 90, 0);
INSERT INTO public.games VALUES (28, 'Eighth-Final', 2014, 2, 86, 91, 1);
INSERT INTO public.games VALUES (29, 'Eighth-Final', 2014, 2, 87, 81, 1);
INSERT INTO public.games VALUES (30, 'Eighth-Final', 2014, 2, 88, 92, 1);
INSERT INTO public.games VALUES (31, 'Eighth-Final', 2014, 1, 85, 79, 0);
INSERT INTO public.games VALUES (32, 'Eighth-Final', 2014, 2, 72, 93, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (70, 'France');
INSERT INTO public.teams VALUES (71, 'Croatia');
INSERT INTO public.teams VALUES (72, 'Belgium');
INSERT INTO public.teams VALUES (73, 'England');
INSERT INTO public.teams VALUES (74, 'Russia');
INSERT INTO public.teams VALUES (75, 'Sweden');
INSERT INTO public.teams VALUES (76, 'Brazil');
INSERT INTO public.teams VALUES (77, 'Uruguay');
INSERT INTO public.teams VALUES (78, 'Colombia');
INSERT INTO public.teams VALUES (79, 'Switzerland');
INSERT INTO public.teams VALUES (80, 'Japan');
INSERT INTO public.teams VALUES (81, 'Mexico');
INSERT INTO public.teams VALUES (82, 'Denmark');
INSERT INTO public.teams VALUES (83, 'Spain');
INSERT INTO public.teams VALUES (84, 'Portugal');
INSERT INTO public.teams VALUES (85, 'Argentina');
INSERT INTO public.teams VALUES (86, 'Germany');
INSERT INTO public.teams VALUES (87, 'Netherlands');
INSERT INTO public.teams VALUES (88, 'Costa Rica');
INSERT INTO public.teams VALUES (89, 'Chile');
INSERT INTO public.teams VALUES (90, 'Nigeria');
INSERT INTO public.teams VALUES (91, 'Algeria');
INSERT INTO public.teams VALUES (92, 'Greece');
INSERT INTO public.teams VALUES (93, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 32, true);


--
-- Name: games_opponent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_opponent_id_seq', 1, false);


--
-- Name: games_winner_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_winner_id_seq', 1, false);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 93, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games opponent_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT opponent_id_fk FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games winner_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT winner_id_fk FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

