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
    name character varying NOT NULL,
    description text,
    age_in_millions_of_year character varying,
    distance_from_earth character varying
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    is_spherical boolean,
    diameter integer,
    planet_types character varying,
    planet_id integer NOT NULL,
    size integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: more_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.more_info (
    more_info_id integer NOT NULL,
    name character varying,
    more text NOT NULL,
    special character varying
);


ALTER TABLE public.more_info OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    is_spherical boolean,
    has_life boolean,
    age_in_millions_of_year numeric,
    galaxy_types character varying,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    is_spherical boolean,
    galaxy_types character varying,
    distance_from_earth character varying,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'has an distance 220,000 year of light', '10B years', '2.5M years of light');
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'has an distance 100,000 year of light', '13.6B year', '100,000 year of light');
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 'shape similar to a conical hat', NULL, '29M year of light');
INSERT INTO public.galaxy VALUES (4, 'Triangukum', 'has an distance 60,000year of light', '10B-15B years', '3M year of light');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral galaxy with a diameter of about 100,000 year of light', '400-600M year', '31M year of light');
INSERT INTO public.galaxy VALUES (6, 'Cigar', 'Pyramid-shaped galaxy with a diameter of about 37,000 year of light', '100M year', '12M year of light');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Phobos', false, NULL, 'Mars', 3, NULL);
INSERT INTO public.moon VALUES (1, 'Moon', true, NULL, 'Earth', 2, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', false, NULL, 'Mars', 3, NULL);
INSERT INTO public.moon VALUES (4, 'Io', true, NULL, 'Jupiter', 5, NULL);
INSERT INTO public.moon VALUES (5, 'Europa', true, NULL, 'Jupiter', 5, NULL);
INSERT INTO public.moon VALUES (6, 'Ganymede', true, NULL, 'Jupiter', 5, NULL);
INSERT INTO public.moon VALUES (7, 'Callisto', true, NULL, 'Jupiter', 5, NULL);
INSERT INTO public.moon VALUES (8, 'Mimas', true, NULL, 'Satune', 6, NULL);
INSERT INTO public.moon VALUES (9, 'Enceleadus', true, NULL, 'Satune', 6, NULL);
INSERT INTO public.moon VALUES (10, 'Tethys', true, NULL, 'Satune', 6, NULL);
INSERT INTO public.moon VALUES (11, 'Dione', true, NULL, 'Satune', 6, NULL);
INSERT INTO public.moon VALUES (12, 'Rhea', true, NULL, 'Satune', 6, NULL);
INSERT INTO public.moon VALUES (13, 'Titan', true, NULL, 'Satune', 6, NULL);
INSERT INTO public.moon VALUES (14, 'Iapetus', false, NULL, 'Satune', 6, NULL);
INSERT INTO public.moon VALUES (15, 'Miranda', false, NULL, 'Uranus', 7, NULL);
INSERT INTO public.moon VALUES (16, 'Ariel', false, NULL, 'Uranus', 7, NULL);
INSERT INTO public.moon VALUES (17, 'Umbriel', false, NULL, 'Uranus', 7, NULL);
INSERT INTO public.moon VALUES (18, 'Titania', true, NULL, 'Uranus', 7, NULL);
INSERT INTO public.moon VALUES (19, 'Aoede', NULL, NULL, 'Jupiter', 5, NULL);
INSERT INTO public.moon VALUES (20, 'Atlas', NULL, NULL, 'Jupiter', 5, NULL);


--
-- Data for Name: more_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.more_info VALUES (1, 'Earth', 'Earth is the only planet with life in the sum system', NULL);
INSERT INTO public.more_info VALUES (2, 'Jupiter', 'Jupiter is a big planet in the sun system. Jupiter has diameter 11 times larger than Earth', NULL);
INSERT INTO public.more_info VALUES (3, 'Mercury', 'Mercury is the smallest planet in the sun system', NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (9, 'Trappist-1e', true, NULL, NULL, 'milky way', 4);
INSERT INTO public.planet VALUES (10, 'trappist-1f', true, NULL, NULL, 'milky way', 4);
INSERT INTO public.planet VALUES (11, 'trappist-1g', true, NULL, NULL, 'milky way', 4);
INSERT INTO public.planet VALUES (12, 'HD 209458b', true, false, NULL, 'Milky Way', 2);
INSERT INTO public.planet VALUES (13, 'HD 209458c', true, false, NULL, 'Milky Way', 2);
INSERT INTO public.planet VALUES (14, 'Gliese 581d', true, NULL, NULL, 'Milky Way', 3);
INSERT INTO public.planet VALUES (1, 'Mercury', true, false, NULL, 'Milky Way', 7);
INSERT INTO public.planet VALUES (3, 'Earth', true, true, NULL, 'Milky Way', 7);
INSERT INTO public.planet VALUES (4, 'Mars', true, false, NULL, 'Milky Way', 7);
INSERT INTO public.planet VALUES (2, 'Venus', true, false, NULL, 'Milky Way', 7);
INSERT INTO public.planet VALUES (5, 'Jupiter', true, true, NULL, 'Milky Way', 7);
INSERT INTO public.planet VALUES (6, 'Saturn', true, false, NULL, 'Milky Way', 7);
INSERT INTO public.planet VALUES (7, 'Uranus', true, NULL, NULL, 'Milky Way', 7);
INSERT INTO public.planet VALUES (8, 'Neptune', true, NULL, NULL, 'Milky Way', 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Kepler-186', true, 'Milky Way', NULL, 2);
INSERT INTO public.star VALUES (2, 'HD 209458', true, 'Milky Way', NULL, 2);
INSERT INTO public.star VALUES (3, 'Gliese 581', true, 'Milky Way', NULL, 2);
INSERT INTO public.star VALUES (4, 'Trappist-1', true, 'Milky Way', NULL, 2);
INSERT INTO public.star VALUES (5, 'WASP-12', true, 'Milky Way', NULL, 2);
INSERT INTO public.star VALUES (6, 'Kepler-452', true, 'Milky Way', NULL, 2);
INSERT INTO public.star VALUES (7, 'Sun', true, 'Milky Way', '8 minute of light', 2);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: more_info more_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_pkey PRIMARY KEY (more_info_id);


--
-- Name: more_info more_info_special_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_special_key UNIQUE (special);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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

