--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(100) NOT NULL,
    diameter numeric,
    composition text,
    distance_from_star numeric,
    planet_id integer,
    moon_id integer,
    is_habitable boolean
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    numbers_of_stars_in_billion integer,
    diameter_in_ly integer,
    age numeric,
    discription text,
    has_life boolean,
    has_black_hole boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    diameter numeric,
    distance_from_planet numeric,
    has_atmosphere boolean,
    is_habitable boolean,
    atmosphere text,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    mass numeric,
    radius numeric,
    distance_from_star numeric,
    has_moons boolean,
    is_habitable boolean,
    atmosphere text,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    intensity integer,
    distance integer,
    temperature numeric,
    discription text,
    visible boolean,
    habitable boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 940, 'Rocky and icy', 2.7, 1, NULL, false);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 525, 'Rocky', 2.36, 2, NULL, false);
INSERT INTO public.asteroid VALUES (3, 'Eros', 33.9, 'Metallic', 1.46, 3, NULL, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 200, 100000, 13.8, 'The Milky Way is the galaxy that contains the Solar System. It is a barred spiral galaxy.', true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1000, 220000, 10, 'Andromeda is the closest spiral galaxy to the Milky Way and is on a collision course with it.', false, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 40, 60000, 13, 'Triangulum is a member of the Local Group and is the third-largest galaxy in the group.', false, false);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool Galaxy', 150, 100000, 11.5, 'The Whirlpool Galaxy is a spiral galaxy known for its well-defined spiral structure.', false, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 800, 50000, 12, 'The Sombrero Galaxy is known for its bright nucleus and large central bulge, resembling a sombrero hat.', true, false);
INSERT INTO public.galaxy VALUES (6, 'Black Eye Galaxy', 50, 45000, 9.5, 'The Black Eye Galaxy is notable for its dark band of dust and is classified as a spiral galaxy.', false, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Io', 3643, 421700, true, false, 'Thin sulfur dioxide atmosphere', 2);
INSERT INTO public.moon VALUES (2, 'Europa', 3121, 670900, true, false, 'Thin oxygen atmosphere', 2);
INSERT INTO public.moon VALUES (3, 'Ganymede', 5268, 1070400, true, false, 'Oxygen atmosphere', 2);
INSERT INTO public.moon VALUES (4, 'Callisto', 4821, 1882700, true, false, 'Oxygen atmosphere', 2);
INSERT INTO public.moon VALUES (5, 'Titan', 5150, 1221830, true, false, 'Thick nitrogen-methane atmosphere', 3);
INSERT INTO public.moon VALUES (6, 'Rhea', 1528, 527108, true, false, 'Oxygen and carbon dioxide atmosphere', 3);
INSERT INTO public.moon VALUES (7, 'Enceladus', 504, 238000, true, false, 'Water vapor atmosphere', 3);
INSERT INTO public.moon VALUES (8, 'Mimas', 396, 185000, false, false, 'No atmosphere', 3);
INSERT INTO public.moon VALUES (9, 'Triton', 2706, 356000, true, false, 'Nitrogen atmosphere', 4);
INSERT INTO public.moon VALUES (10, 'Charon', 1212, 19500, false, false, 'No atmosphere', 5);
INSERT INTO public.moon VALUES (11, 'Phobos', 22.4, 9377, false, false, 'No atmosphere', 6);
INSERT INTO public.moon VALUES (12, 'Deimos', 12.4, 23460, false, false, 'No atmosphere', 6);
INSERT INTO public.moon VALUES (13, 'Miranda', 471, 129000, true, false, 'Hydrogen atmosphere', 7);
INSERT INTO public.moon VALUES (14, 'Titania', 1578, 436300, true, false, 'Hydrogen atmosphere', 7);
INSERT INTO public.moon VALUES (15, 'Oberon', 1523, 583520, true, false, 'Hydrogen atmosphere', 7);
INSERT INTO public.moon VALUES (16, 'Ariel', 1157, 191000, true, false, 'Oxygen atmosphere', 7);
INSERT INTO public.moon VALUES (17, 'Umbriel', 1179, 266000, true, false, 'Oxygen atmosphere', 7);
INSERT INTO public.moon VALUES (18, 'Gaspra', 19, 20000, true, false, 'Carbon dioxide atmosphere', 8);
INSERT INTO public.moon VALUES (19, 'Ida', 15, 126000, true, false, 'Carbon dioxide atmosphere', 8);
INSERT INTO public.moon VALUES (20, 'Tethys', 1062, 294000, true, false, 'Oxygen atmosphere', 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0.055, 2439, 0.39, false, false, 'Thin helium atmosphere', 3);
INSERT INTO public.planet VALUES (2, 'Saturn', 95.2, 58232, 9.58, true, false, 'Hydrogen-helium atmosphere', 1);
INSERT INTO public.planet VALUES (3, 'Uranus', 14.5, 25362, 19.19, true, false, 'Hydrogen-helium atmosphere', 1);
INSERT INTO public.planet VALUES (4, 'Titan', 0.022, 2575, 1.2, false, false, 'Thick nitrogen-methane atmosphere', 1);
INSERT INTO public.planet VALUES (5, 'Ceres', 0.0002, 473, 2.7, false, false, 'No atmosphere', 3);
INSERT INTO public.planet VALUES (6, 'Kepler-452b', 1.63, 6000, 1.04, false, true, 'Oxygen-carbon dioxide atmosphere', 4);
INSERT INTO public.planet VALUES (7, 'GJ 667Cc', 4.5, 7500, 0.13, false, true, 'Oxygen-carbon dioxide atmosphere', 5);
INSERT INTO public.planet VALUES (8, 'Gliese 581g', 3.1, 6000, 0.13, false, true, 'Carbon dioxide atmosphere', 5);
INSERT INTO public.planet VALUES (9, 'HD 209458 b', 0.69, 1370, 0.047, true, false, 'Thin hydrogen atmosphere', 6);
INSERT INTO public.planet VALUES (10, 'Trappist-1e', 0.92, 6000, 0.04, true, true, 'Oxygen-carbon dioxide atmosphere', 4);
INSERT INTO public.planet VALUES (11, 'LHS 1140 b', 6.58, 6500, 0.04, true, true, 'Oxygen-carbon dioxide atmosphere', 6);
INSERT INTO public.planet VALUES (12, 'Alpha Centauri Bb', 1.1, 6000, 1.2, false, false, 'Carbon dioxide atmosphere', 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 25, 8, 9940, 'Sirius is the brightest star in the night sky and is a binary star system.', true, true, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 5000, 642, 3500, 'Betelgeuse is a red supergiant star located in the constellation of Orion. It is nearing the end of its life cycle.', true, false, 1);
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 100, 4, 5790, 'Alpha Centauri A is part of the Alpha Centauri star system and is the closest star system to the Sun.', true, true, 1);
INSERT INTO public.star VALUES (4, 'Andromeda I', 800, 2500000, 12000, 'A star in the Andromeda galaxy, much larger and hotter than the Sun.', false, false, 2);
INSERT INTO public.star VALUES (5, 'Arcturus', 140, 37, 4286, 'Arcturus is a red giant star in the constellation of Boötes, one of the brightest stars visible from Earth.', true, false, 3);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 0, 4, 3042, 'Proxima Centauri is the closest known star to the Sun, part of the Alpha Centauri star system.', true, true, 1);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_asteroid_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_asteroid_id_key UNIQUE (asteroid_id);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_moon_id_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key1 UNIQUE (moon_id);


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
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: asteroid asteroid_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: asteroid asteroid_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

