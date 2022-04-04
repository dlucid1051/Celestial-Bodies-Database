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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(60) NOT NULL,
    note character varying(60)
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    light_years_from_earth numeric,
    radius_light_years numeric,
    discovery_date date,
    discovered_by character varying(60),
    galaxy_type_id integer,
    trivia text,
    constellation_id integer
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    galaxy_type character varying(60) NOT NULL,
    name character varying(60)
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    radius_xearth numeric,
    mass_xearth numeric,
    is_spherical boolean,
    discovery_date date,
    discovered_by character varying(60),
    planet_id integer,
    miles_from_parent numeric
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
    name character varying(60) NOT NULL,
    num_moons integer DEFAULT '-2'::integer,
    radius_xearth numeric,
    mass_xearth numeric,
    is_spherical boolean,
    discovery_date date,
    discovered_by character varying(60),
    trivia text,
    star_id integer,
    miles_from_sun_xmil numeric
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
    name character varying(60) NOT NULL,
    radius_xsun numeric,
    mass_xsun numeric,
    discovery_date date,
    discovered_by character varying(60),
    star_type_id integer,
    trivia text,
    galaxy_id integer,
    star_type_name character varying(60),
    constellation_id integer,
    light_years_from_earth numeric
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
-- Name: star_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_type (
    star_type_id integer NOT NULL,
    type character varying(60) NOT NULL,
    name character varying(60)
);


ALTER TABLE public.star_type OWNER TO freecodecamp;

--
-- Name: star_type_star_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_type_star_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_type_star_type_id_seq OWNER TO freecodecamp;

--
-- Name: star_type_star_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_type_star_type_id_seq OWNED BY public.star_type.star_type_id;


--
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


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
-- Name: star_type star_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type ALTER COLUMN star_type_id SET DEFAULT nextval('public.star_type_star_type_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Andromeda', NULL);
INSERT INTO public.constellation VALUES (2, 'Antlia', NULL);
INSERT INTO public.constellation VALUES (3, 'Apus', NULL);
INSERT INTO public.constellation VALUES (4, 'Aquarius', NULL);
INSERT INTO public.constellation VALUES (5, 'Aquila', NULL);
INSERT INTO public.constellation VALUES (6, 'Ara', NULL);
INSERT INTO public.constellation VALUES (7, 'Aries', NULL);
INSERT INTO public.constellation VALUES (8, 'Auriga', NULL);
INSERT INTO public.constellation VALUES (9, 'Bootes', NULL);
INSERT INTO public.constellation VALUES (10, 'Caelum', NULL);
INSERT INTO public.constellation VALUES (11, 'Camelopardalis', NULL);
INSERT INTO public.constellation VALUES (12, 'Cancer', NULL);
INSERT INTO public.constellation VALUES (13, 'Canes Venatici', NULL);
INSERT INTO public.constellation VALUES (14, 'Canis Major', NULL);
INSERT INTO public.constellation VALUES (15, 'Canis Minor', NULL);
INSERT INTO public.constellation VALUES (16, 'Capricornus', NULL);
INSERT INTO public.constellation VALUES (17, 'Carina', NULL);
INSERT INTO public.constellation VALUES (18, 'Cassiopeia', NULL);
INSERT INTO public.constellation VALUES (19, 'Centaurus', NULL);
INSERT INTO public.constellation VALUES (20, 'Cepheus', NULL);
INSERT INTO public.constellation VALUES (21, 'Cetus', NULL);
INSERT INTO public.constellation VALUES (22, 'Chamaeleon', NULL);
INSERT INTO public.constellation VALUES (23, 'Circinus', NULL);
INSERT INTO public.constellation VALUES (24, 'Columba', NULL);
INSERT INTO public.constellation VALUES (25, 'Coma Berenices', NULL);
INSERT INTO public.constellation VALUES (26, 'Corona Australis', NULL);
INSERT INTO public.constellation VALUES (27, 'Corona Borealis', NULL);
INSERT INTO public.constellation VALUES (28, 'Corvus', NULL);
INSERT INTO public.constellation VALUES (29, 'Crater', NULL);
INSERT INTO public.constellation VALUES (30, 'Crux', NULL);
INSERT INTO public.constellation VALUES (31, 'Cygnus', NULL);
INSERT INTO public.constellation VALUES (32, 'Delphinus', NULL);
INSERT INTO public.constellation VALUES (33, 'Dorado', NULL);
INSERT INTO public.constellation VALUES (34, 'Draco', NULL);
INSERT INTO public.constellation VALUES (35, 'Equuleus', NULL);
INSERT INTO public.constellation VALUES (36, 'Eridanus', NULL);
INSERT INTO public.constellation VALUES (37, 'Fornax', NULL);
INSERT INTO public.constellation VALUES (38, 'Gemini', NULL);
INSERT INTO public.constellation VALUES (39, 'Grus', NULL);
INSERT INTO public.constellation VALUES (40, 'Hercules', NULL);
INSERT INTO public.constellation VALUES (41, 'Horologium', NULL);
INSERT INTO public.constellation VALUES (42, 'Hydra', NULL);
INSERT INTO public.constellation VALUES (43, 'Hydrus', NULL);
INSERT INTO public.constellation VALUES (44, 'Indus', NULL);
INSERT INTO public.constellation VALUES (45, 'Lacerta', NULL);
INSERT INTO public.constellation VALUES (46, 'Leo', NULL);
INSERT INTO public.constellation VALUES (47, 'Leo Minor', NULL);
INSERT INTO public.constellation VALUES (48, 'Lepus', NULL);
INSERT INTO public.constellation VALUES (49, 'Libra', NULL);
INSERT INTO public.constellation VALUES (50, 'Lupus', NULL);
INSERT INTO public.constellation VALUES (51, 'Lynx', NULL);
INSERT INTO public.constellation VALUES (52, 'Lyra', NULL);
INSERT INTO public.constellation VALUES (53, 'Mensa', NULL);
INSERT INTO public.constellation VALUES (54, 'Microscopium', NULL);
INSERT INTO public.constellation VALUES (55, 'Monoceros', NULL);
INSERT INTO public.constellation VALUES (56, 'Musca', NULL);
INSERT INTO public.constellation VALUES (57, 'Norma', NULL);
INSERT INTO public.constellation VALUES (58, 'Octans', NULL);
INSERT INTO public.constellation VALUES (59, 'Ophiuchus', NULL);
INSERT INTO public.constellation VALUES (60, 'Orion', NULL);
INSERT INTO public.constellation VALUES (61, 'Pavo', NULL);
INSERT INTO public.constellation VALUES (62, 'Pegasus', NULL);
INSERT INTO public.constellation VALUES (63, 'Perseus', NULL);
INSERT INTO public.constellation VALUES (64, 'Phoenix', NULL);
INSERT INTO public.constellation VALUES (65, 'Pictor', NULL);
INSERT INTO public.constellation VALUES (66, 'Pisces', NULL);
INSERT INTO public.constellation VALUES (67, 'Piscis Austrinus', NULL);
INSERT INTO public.constellation VALUES (68, 'Puppis', NULL);
INSERT INTO public.constellation VALUES (69, 'Pyxis', NULL);
INSERT INTO public.constellation VALUES (70, 'Reticulum', NULL);
INSERT INTO public.constellation VALUES (71, 'Saggita', NULL);
INSERT INTO public.constellation VALUES (72, 'Saggitarius', NULL);
INSERT INTO public.constellation VALUES (73, 'Scorpius', NULL);
INSERT INTO public.constellation VALUES (74, 'Sculptor', NULL);
INSERT INTO public.constellation VALUES (75, 'Scutum', NULL);
INSERT INTO public.constellation VALUES (76, 'Serpens', NULL);
INSERT INTO public.constellation VALUES (77, 'Sextans', NULL);
INSERT INTO public.constellation VALUES (78, 'Taurus', NULL);
INSERT INTO public.constellation VALUES (79, 'Telescopium', NULL);
INSERT INTO public.constellation VALUES (80, 'Triangulum', NULL);
INSERT INTO public.constellation VALUES (81, 'Triangulum Australe', NULL);
INSERT INTO public.constellation VALUES (82, 'Tucana', NULL);
INSERT INTO public.constellation VALUES (83, 'Ursa Major', NULL);
INSERT INTO public.constellation VALUES (84, 'Ursa Minor', NULL);
INSERT INTO public.constellation VALUES (85, 'Vela', NULL);
INSERT INTO public.constellation VALUES (86, 'Virgo', NULL);
INSERT INTO public.constellation VALUES (87, 'Volans', NULL);
INSERT INTO public.constellation VALUES (88, 'Vulpecula', NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milkey Way', 25800, 100000, '1610-01-01', 'Galileo Galilei', 1, 'We can''t take a picture of the Milkey Way. There''s a black hole at the center of the Milkey Way', 72);
INSERT INTO public.galaxy VALUES (2, 'Sombraro Galaxy', 29350000, 49000, '1781-05-11', 'Pierre Mechain', 2, 'The Sombraro Galaxy is also known as Messier Object 104, M104, and NGC 4594. The Galaxy is about 30% the size of Milkey Way.', 86);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 160000, 14000, '1503-01-01', 'Amerigo Vespucci', 3, 'The Large Magellanic Cloud (LMC) galaxy is also known as Nubecula Major. It is a dwarf satelite of the Milkey Way.', 33);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool Galaxy', 31000000, 76000, '1773-10-13', 'Charles Messier', 2, 'The Whirlpool Galaxy which is also known as Messier 51a and NGC 5194 has a companion galaxy known as Messier 51b (NGC 5195). Radio Astronomy determined that both galaxies are interacting.', 13);
INSERT INTO public.galaxy VALUES (5, 'Black Eye Galaxy', 17000000, 76000, '1779-03-01', 'Edward Pigott', 2, 'The galaxy is inclined 60 degrees to our line of sight here in the Milkey Way. Because of our perspective a dark band of obstructing dust in front of the bright nucleus gives the galaxy it''s ominous look.', 25);
INSERT INTO public.galaxy VALUES (6, 'Andromeda Galaxy', 2500000, 220000, '0964-01-01', 'Abd al-Rahman al-Sufi', 1, 'The Andromeda Galaxy is the largest galaxy in our own Milkey Way group of galaxies. There are about 1 trillian stars in it.', 1);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Barred Spiral Galaxy', NULL);
INSERT INTO public.galaxy_type VALUES (2, 'Spiral Galaxy', NULL);
INSERT INTO public.galaxy_type VALUES (3, 'Irregular Galaxy', NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (4, 'Titan', 0.404, 0.0225, true, '1655-01-01', 'Christiaan Huygens', 3, 759000);
INSERT INTO public.moon VALUES (3, 'Ganymede', 0.413, 0.025, true, '1610-01-01', 'Galileo Galilei', 2, 664870);
INSERT INTO public.moon VALUES (2, 'Europa', 0.245, 0.008, true, '1610-01-01', 'Galileo Galilei', 2, 670900);
INSERT INTO public.moon VALUES (1, 'Moon', 0.2727, 0.0123, true, '0001-01-01', 'everything', 1, 238900);
INSERT INTO public.moon VALUES (5, 'IO', 0.286, 0.015, true, '1610-01-01', 'Galileo Galilei', 2, 261970);
INSERT INTO public.moon VALUES (6, 'Castillo', 0.378, 0.018, true, '1610-01-01', 'Galileo Galilei', 2, 170000);
INSERT INTO public.moon VALUES (7, 'Enceladus', 0.395, 1.8, true, '1789-08-25', 'William Herschel', 3, 148000);
INSERT INTO public.moon VALUES (8, 'Triton', 0.2122, 0.00359, true, '1846-10-10', 'William Lassall', 4, 220500);
INSERT INTO public.moon VALUES (9, 'Lapetus', 0.113, 0.00033, true, '1671-12-25', 'G. D. Cassini', 3, 790100000);
INSERT INTO public.moon VALUES (10, 'Mimas', -1, -1, true, '1789-09-17', 'William Herschel', 3, 790100000);
INSERT INTO public.moon VALUES (11, 'Phobos', 1.76941, 1.78477, false, '1877-08-18', 'Asaph Hall', 6, 3700);
INSERT INTO public.moon VALUES (12, 'Hyperion', 0.472, 9.35257, false, '1848-09-16', 'William Bond', 3, 933000);
INSERT INTO public.moon VALUES (13, 'Umbriel', 0.092, 2.1252, false, '1851-10-24', 'William Lassell', 7, 436300);
INSERT INTO public.moon VALUES (14, 'Oberon', 0.1194, 5.0703, true, '1887-01-11', 'William Herschell', 7, 362010);
INSERT INTO public.moon VALUES (15, 'Epimetheus', 1.1289, 9.3708, false, '1966-12-18', 'Richard Walker', 3, 151422);
INSERT INTO public.moon VALUES (16, 'Titania', 0.1235, 5.6894, true, '1787-01-11', 'William Herschel', 7, 270812);
INSERT INTO public.moon VALUES (17, 'Dione', 9.3942, 1.834, true, '1684-03-21', 'Giovanni Cassini', 3, 790100000);
INSERT INTO public.moon VALUES (18, 'Tethys', 0.03, 1.834, true, '1684-03-21', 'Giovanni Cassini', 3, 790100000);
INSERT INTO public.moon VALUES (19, 'Puck', 0.03, 0.0126, false, '1985-12-30', 'Stephen P. Synnott', 7, 53437.9);
INSERT INTO public.moon VALUES (20, 'Himalia', -1, -1, false, '1904-12-03', 'Charles D. Perrine', 2, 7100000);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 1, 1, true, '0001-01-01', 'Everything', 'Only known celestial body known to harbor life. Third from the sun.', 6, 92.903);
INSERT INTO public.planet VALUES (2, 'Jupiter', 80, 10.973, 317.8, true, '1610-01-01', 'Galileo Galilei', 'Jupiter is the fastest spinning planet in the solar system', 6, 462.69);
INSERT INTO public.planet VALUES (3, 'Saturn', 83, 9.449, 95.159, true, '1610-01-01', 'Galileo Galilei', 'Saturn can float in water because it''s mostly water.', 6, 918.84);
INSERT INTO public.planet VALUES (4, 'Neptune', 14, 3.883, 17.147, true, '1613-01-01', 'Galileo Galilei', 'Neptune is the most distant planet from our sun.', 6, 2780.3);
INSERT INTO public.planet VALUES (5, 'Mercury', 0, 0.3829, 0.055, true, '1631-01-01', 'Thomas Harriott', 'Mercury is the smallest planet in our solar system and it''s shrinking.', 6, 32.118);
INSERT INTO public.planet VALUES (6, 'Mars', 2, 0.533, 0.107, true, '1610-01-01', 'Galileo Galilei', 'Mars, ''The Red Planet'', is named after the Roman god of war.', 6, 133.22);
INSERT INTO public.planet VALUES (7, 'Uranus', 27, 4.007, 14.536, true, '1781-03-13', 'William Herschel', 'Uranus orbits the sun on it''s side.', 6, 1831.7);
INSERT INTO public.planet VALUES (8, 'Venus', 0, 0.9499, 0.815, true, '1610-01-01', 'Galileo Galilei', 'On Venus the sun rises in the west and sets in the east opposite the other planets in our solar system.', 6, 67.399);
INSERT INTO public.planet VALUES (9, 'Janssen (55 Candri e)', -1, 1.875, 7.99, true, '2004-08-30', 'Kepler NASA', 'Janssen (55 Candri e) is one of the first ''Super Earths'' found by NASA''s Kepler project.', 9, 1.435);
INSERT INTO public.planet VALUES (10, 'Bellerophon (51 Pegasi b)', -1, -1, -1, true, '1955-12-01', 'Michael Mayor', 'First ''Hot Jupiter''. It''s discovery was part of the 2019 Nobel Prize in physics award.', 10, 4.898);
INSERT INTO public.planet VALUES (11, 'Osiris (HD 209458 b)', -1, 15.12, 220, true, '1999-01-09', 'Michael Mayor', 'First exoplanet found to have an atmosphere.', 11, 4.4);
INSERT INTO public.planet VALUES (12, 'Kepler 186f', -1, 1.11, -1, true, '2014-01-14', 'Elisa Quintana', 'First earth sized planet found in the ''habitable zone'' of its star.', 12, -1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 1.711, 2.063, '1844-01-01', 'Friedrich Wilhelm', 3, 'Sirius is actually 2 stars Sirius A and Sirius B. The Greeks called it the Dog Star because of it''s proximity to the Canis Major constellation. Today we refer to Sirius as the Morning Star.', 1, 'White Dwarf', 14, 8.6);
INSERT INTO public.star VALUES (2, 'Betegleuse', 764, 16.5, '1836-01-01', 'John Herschel', 7, 'Betegleuse is a huge red star in the Orion constellation. It fluctuates in size from 700 to 1,000 times the size of our sun.', 1, 'Red Supergiant', 60, 642.5);
INSERT INTO public.star VALUES (3, 'Vega', 2.362, 2.135, '1850-07-16', 'William Bond', 3, 'Vega was the first star (not including the sun) to be photographed. Vega is the first star to have a car named after it.', 1, 'Blue/White', 52, 25.04);
INSERT INTO public.star VALUES (4, 'Antares', 680, 11, '1819-04-13', 'Johann Tobias Burg', 7, 'Antares is actually a binary system. Antares A is a Red Supergiant and Antares is B is Blue-Green and much smaller. ', 1, 'Red Supergiant', 73, 550);
INSERT INTO public.star VALUES (5, 'Rigel', 78.9, 21, '1781-10-01', 'William Herschel', 2, 'Rigel is the brightest star in Orion. It is a system of 4 stars the brightest being Beta Orionis A', 1, 'Blue Supergiant', 60, 860);
INSERT INTO public.star VALUES (6, 'Sun', 1, 1, '0001-01-01', 'Everything', 5, 'The earth ratates around the sun. As such it is the closest star to the earth. The sun is 93 million miles from the earth.', 1, 'Yellow Dwarf', 66, 1.58);
INSERT INTO public.star VALUES (9, '55 Cancri', 0.943, 0.905, '0001-01-01', 'unknown', 6, 'Binary system. Cancari A is also known as Capernicus. It''s companion is a red dwarf.', 1, 'Orange/Red', 12, 41.05);
INSERT INTO public.star VALUES (10, 'Helvetios (51 Pegasi)', 1.237, 1.11, '1995-01-01', 'Michael Mayor', 5, '51 Pegasi was the first main-sequence star to be discovered. It is thought to be like our own sun.', 1, 'Yellow/White Main-Sequence', 62, 50.45);
INSERT INTO public.star VALUES (11, 'HD 209458', 1.203, 1.148, '1999-09-09', 'Michael Mayor', 5, 'Sun like star.', 1, 'Yellow/White Main-Sequence', 62, 159);
INSERT INTO public.star VALUES (12, 'Kepler 186', 0.523, 0.544, '2014-04-14', 'Elisa Quintana', 7, 'Parent star of Kepler 186f (see planet Kepler 186f)', 1, 'Red Dwarf', 31, 582);


--
-- Data for Name: star_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_type VALUES (1, 'O (Blue)', NULL);
INSERT INTO public.star_type VALUES (2, 'B (Blue)', NULL);
INSERT INTO public.star_type VALUES (3, 'A (Blue)', NULL);
INSERT INTO public.star_type VALUES (4, 'F (Blue/White)', NULL);
INSERT INTO public.star_type VALUES (5, 'G (White/Yellow)', NULL);
INSERT INTO public.star_type VALUES (6, 'K (Orange/Red)', NULL);
INSERT INTO public.star_type VALUES (7, 'M (RED)', NULL);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 88, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 3, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: star_type_star_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_type_star_type_id_seq', 7, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_type galaxy_type_galaxy_type_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_galaxy_type_key UNIQUE (galaxy_type);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


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
-- Name: star_type star_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT star_type_pkey PRIMARY KEY (star_type_id);


--
-- Name: star_type star_type_type_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_type
    ADD CONSTRAINT star_type_type_key UNIQUE (type);


--
-- Name: galaxy galaxy_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


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
-- Name: star star_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

