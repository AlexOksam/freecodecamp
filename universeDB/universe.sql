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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type_of_galaxy character varying(100),
    hubble_classification character varying(10),
    info text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    diameter_in_km integer,
    planet_id integer,
    solar_system_id integer,
    year_discovered integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    distance_from_sun_m_km integer,
    distance_from_sun_astronomical_units numeric(5,2),
    info text,
    living_creature boolean NOT NULL,
    human_discovered boolean NOT NULL,
    star_id integer,
    solar_system_id integer,
    diameter_in_km integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: solar_system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.solar_system (
    solar_system_id integer NOT NULL,
    name character varying(100) NOT NULL,
    info text
);


ALTER TABLE public.solar_system OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer,
    discovered_date date NOT NULL,
    distance_light_years numeric(10,2) NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'spiral galaxy', 'Sbc', 'our galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'spiral galaxy', 'SA(s)b', 'our nearest neighbor');
INSERT INTO public.galaxy VALUES (4, 'Sculptor Galaxy', 'spiral galaxy', 'SAB(s)c', 'also as Silver Coin, Silver Dollar Galaxy, NGC 253, Caldwell 65');
INSERT INTO public.galaxy VALUES (5, 'Cigar Galaxy', 'starburst galaxy', 'IO', 'also as Messier 82, NGC 3034, M82');
INSERT INTO public.galaxy VALUES (6, 'Triangulum Galaxy', 'spiral galaxy', 'SA(s)cd', 'also as Messier 33, NGC 598');
INSERT INTO public.galaxy VALUES (7, 'Bode`s Galaxy', 'spiral galaxy', 'SA(s)ab', 'also as Messier 81, NGC 3031');
INSERT INTO public.galaxy VALUES (3, 'Virgo A', 'elliptical galaxy', 'E0', 'also as Messier 87, NGC 4486, M87');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3476, 3, 1, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 23, 4, 1, 1877);
INSERT INTO public.moon VALUES (3, 'Deimos', 13, 4, 1, 1877);
INSERT INTO public.moon VALUES (4, 'Io', 3630, 5, 3, 1610);
INSERT INTO public.moon VALUES (5, 'Europa', 3138, 5, 3, 1610);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5262, 5, 3, 1610);
INSERT INTO public.moon VALUES (7, 'Callisto', 4800, 5, 3, 1610);
INSERT INTO public.moon VALUES (8, 'Mimas', 396, 6, 3, 1789);
INSERT INTO public.moon VALUES (9, 'Enceladus', 504, 6, 3, 1789);
INSERT INTO public.moon VALUES (10, 'Tethys', 1062, 6, 3, 1684);
INSERT INTO public.moon VALUES (11, 'Dione', 1122, 6, 3, 1684);
INSERT INTO public.moon VALUES (12, 'Rhea', 1527, 6, 3, 1672);
INSERT INTO public.moon VALUES (13, 'Titan', 5150, 6, 3, 1655);
INSERT INTO public.moon VALUES (14, 'Hyperion', 270, 6, 3, 1848);
INSERT INTO public.moon VALUES (15, 'Iapetus', 1469, 6, 3, 1671);
INSERT INTO public.moon VALUES (16, 'Miranda', 471, 7, 3, 1948);
INSERT INTO public.moon VALUES (17, 'Ariel', 1157, 7, 3, 1851);
INSERT INTO public.moon VALUES (18, 'Umbriel', 1169, 7, 3, 1851);
INSERT INTO public.moon VALUES (19, 'Titania', 1576, 7, 3, 1787);
INSERT INTO public.moon VALUES (20, 'Oberon', 1522, 7, 3, 1787);
INSERT INTO public.moon VALUES (21, 'Charon', 1212, 9, 4, 1978);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Venus', 108, 0.72, 'second planet from sun', false, false, 11, 1, 12104);
INSERT INTO public.planet VALUES (1, 'Mercury', 58, 0.39, 'first planet from sun', false, false, 11, 1, 4879);
INSERT INTO public.planet VALUES (3, 'Earth', 150, 1.00, 'third planet from sun', true, true, 11, 1, 12756);
INSERT INTO public.planet VALUES (4, 'Mars', 228, 1.52, 'the 4 planet from sun', false, false, 11, 1, 6792);
INSERT INTO public.planet VALUES (5, 'Jupiter', 779, 5.20, 'the 5 planet from sun', false, false, 11, 3, 142984);
INSERT INTO public.planet VALUES (6, 'Saturn', 1433, 9.54, 'the 6 planet from sun', false, false, 11, 3, 120536);
INSERT INTO public.planet VALUES (7, 'Uranus', 2872, 19.20, 'the 7 planet from sun', false, false, 11, 3, 51118);
INSERT INTO public.planet VALUES (8, 'Neptune', 4495, 30.06, 'the 8 planet from sun', false, false, 11, 3, 49528);
INSERT INTO public.planet VALUES (10, 'Haumea', 6452, 43.00, '136108, 2003 EL61', false, false, 11, 4, 1632);
INSERT INTO public.planet VALUES (11, 'Makemake', 6847, 45.80, '136472, 2005 FY9', false, false, 11, 4, 1430);
INSERT INTO public.planet VALUES (12, 'Eris', 10125, 68.00, '136199, 2003 UB313', false, false, 11, 4, 2326);
INSERT INTO public.planet VALUES (9, 'Pluto', 5328, 39.00, '134340', false, false, 11, 4, 2376);


--
-- Data for Name: solar_system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.solar_system VALUES (1, 'inner planets', NULL);
INSERT INTO public.solar_system VALUES (2, 'Asteroid belt', NULL);
INSERT INTO public.solar_system VALUES (3, 'outer planets', NULL);
INSERT INTO public.solar_system VALUES (5, 'Oort cloud', NULL);
INSERT INTO public.solar_system VALUES (4, 'Kuiper belt', NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 1, '1862-01-31', 8.60);
INSERT INTO public.star VALUES (2, 'Canopus', 1, '0001-01-01', 310.00);
INSERT INTO public.star VALUES (3, 'Arcturus', 1, '0001-01-01', 37.00);
INSERT INTO public.star VALUES (4, 'Vega', 1, '1850-07-17', 25.00);
INSERT INTO public.star VALUES (5, 'Capella', 1, '1899-01-01', 43.00);
INSERT INTO public.star VALUES (6, 'Rigel', 1, '1781-10-01', 860.00);
INSERT INTO public.star VALUES (7, 'Barnard`s Star', 1, '1916-01-01', 6.00);
INSERT INTO public.star VALUES (8, 'Achernar', 1, '2003-01-01', 139.00);
INSERT INTO public.star VALUES (9, 'Betelgeuse', 1, '1836-01-01', 700.00);
INSERT INTO public.star VALUES (10, 'Proxima Centauri, Alpha Centauri C', 1, '1915-01-01', 4.24);
INSERT INTO public.star VALUES (11, 'The Sun', 1, '0001-01-01', 0.00);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: solar_system solar_system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_pkey PRIMARY KEY (solar_system_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: planet uniqu_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT uniqu_planet_name UNIQUE (name);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: solar_system unique_solar_system_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT unique_solar_system_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon fk_moon_solar_system; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_solar_system FOREIGN KEY (solar_system_id) REFERENCES public.solar_system(solar_system_id);


--
-- Name: planet fk_planet_solarss; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_solarss FOREIGN KEY (solar_system_id) REFERENCES public.solar_system(solar_system_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galax; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galax FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

