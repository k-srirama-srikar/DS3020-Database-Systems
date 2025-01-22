--
-- PostgreSQL database dump
--

-- Dumped from database version 14.15
-- Dumped by pg_dump version 14.15

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
-- Name: actor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.actor (
    actorid integer NOT NULL,
    movieid integer,
    name character varying(100) NOT NULL,
    age integer NOT NULL
);


ALTER TABLE public.actor OWNER TO postgres;

--
-- Name: movie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie (
    movieid integer NOT NULL,
    name character varying(100) NOT NULL,
    genre character varying(50) NOT NULL,
    releaseyear integer NOT NULL,
    rating integer DEFAULT 5
);


ALTER TABLE public.movie OWNER TO postgres;

--
-- Data for Name: actor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.actor (actorid, movieid, name, age) FROM stdin;
3	1	Tom Hanks	64
4	3	Marlon Brando	80
5	4	Leonardo DiCaprio	46
6	5	Morgan Freeman	87
8	3	Al Pacino	84
9	4	Joseph Gordon-Levitt	43
10	5	Tim Robbins	66
11	3	Diane Keaton	79
13	5	Bob Gunton	77
14	1	Robin Wright	58
2	2	Keanu Reeves	60
7	2	Carrie-Anne Moss	59
12	2	Laurence Fishburne	64
\.


--
-- Data for Name: movie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movie (movieid, name, genre, releaseyear, rating) FROM stdin;
4	Inception	Sci-Fi	2010	5
5	The Shawshank Redemption	Drama	1994	5
1	Forrest Grump	Drama	1994	4
3	The Godfather	Crime	1972	4
2	The Matrix	Sci-Fi	1999	3
\.


--
-- Name: actor actor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actor
    ADD CONSTRAINT actor_pkey PRIMARY KEY (actorid);


--
-- Name: movie movie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie
    ADD CONSTRAINT movie_pkey PRIMARY KEY (movieid);


--
-- Name: actor actor_movieid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actor
    ADD CONSTRAINT actor_movieid_fkey FOREIGN KEY (movieid) REFERENCES public.movie(movieid);


--
-- PostgreSQL database dump complete
--

