--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    guesses integer NOT NULL
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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 9, 148);
INSERT INTO public.games VALUES (2, 10, 902);
INSERT INTO public.games VALUES (3, 9, 140);
INSERT INTO public.games VALUES (4, 9, 798);
INSERT INTO public.games VALUES (5, 9, 425);
INSERT INTO public.games VALUES (6, 11, 775);
INSERT INTO public.games VALUES (7, 12, 394);
INSERT INTO public.games VALUES (8, 11, 45);
INSERT INTO public.games VALUES (9, 11, 672);
INSERT INTO public.games VALUES (10, 11, 508);
INSERT INTO public.games VALUES (11, 13, 258);
INSERT INTO public.games VALUES (12, 14, 270);
INSERT INTO public.games VALUES (13, 13, 720);
INSERT INTO public.games VALUES (14, 13, 312);
INSERT INTO public.games VALUES (15, 13, 58);
INSERT INTO public.games VALUES (16, 15, 238);
INSERT INTO public.games VALUES (17, 16, 466);
INSERT INTO public.games VALUES (18, 15, 573);
INSERT INTO public.games VALUES (19, 15, 198);
INSERT INTO public.games VALUES (20, 15, 529);
INSERT INTO public.games VALUES (21, 19, 146);
INSERT INTO public.games VALUES (22, 20, 435);
INSERT INTO public.games VALUES (23, 19, 859);
INSERT INTO public.games VALUES (24, 19, 95);
INSERT INTO public.games VALUES (25, 19, 804);
INSERT INTO public.games VALUES (26, 21, 962);
INSERT INTO public.games VALUES (27, 22, 465);
INSERT INTO public.games VALUES (28, 21, 567);
INSERT INTO public.games VALUES (29, 21, 555);
INSERT INTO public.games VALUES (30, 21, 476);
INSERT INTO public.games VALUES (31, 23, 379);
INSERT INTO public.games VALUES (32, 24, 382);
INSERT INTO public.games VALUES (33, 23, 363);
INSERT INTO public.games VALUES (34, 23, 932);
INSERT INTO public.games VALUES (35, 23, 519);
INSERT INTO public.games VALUES (36, 25, 694);
INSERT INTO public.games VALUES (37, 26, 795);
INSERT INTO public.games VALUES (38, 25, 925);
INSERT INTO public.games VALUES (39, 25, 438);
INSERT INTO public.games VALUES (40, 25, 215);
INSERT INTO public.games VALUES (41, 27, 571);
INSERT INTO public.games VALUES (42, 28, 93);
INSERT INTO public.games VALUES (43, 27, 688);
INSERT INTO public.games VALUES (44, 27, 609);
INSERT INTO public.games VALUES (45, 27, 486);
INSERT INTO public.games VALUES (46, 29, 50);
INSERT INTO public.games VALUES (47, 30, 433);
INSERT INTO public.games VALUES (48, 29, 676);
INSERT INTO public.games VALUES (49, 29, 506);
INSERT INTO public.games VALUES (50, 29, 123);
INSERT INTO public.games VALUES (51, 31, 445);
INSERT INTO public.games VALUES (52, 32, 314);
INSERT INTO public.games VALUES (53, 31, 957);
INSERT INTO public.games VALUES (54, 31, 300);
INSERT INTO public.games VALUES (55, 31, 579);
INSERT INTO public.games VALUES (61, 35, 71);
INSERT INTO public.games VALUES (62, 36, 279);
INSERT INTO public.games VALUES (63, 35, 659);
INSERT INTO public.games VALUES (64, 35, 446);
INSERT INTO public.games VALUES (65, 35, 616);
INSERT INTO public.games VALUES (66, 45, 656);
INSERT INTO public.games VALUES (67, 46, 525);
INSERT INTO public.games VALUES (68, 45, 597);
INSERT INTO public.games VALUES (69, 45, 388);
INSERT INTO public.games VALUES (70, 45, 312);
INSERT INTO public.games VALUES (71, 44, 8);
INSERT INTO public.games VALUES (72, 47, 140);
INSERT INTO public.games VALUES (73, 48, 358);
INSERT INTO public.games VALUES (74, 47, 220);
INSERT INTO public.games VALUES (75, 47, 869);
INSERT INTO public.games VALUES (76, 47, 862);
INSERT INTO public.games VALUES (77, 44, 10);
INSERT INTO public.games VALUES (78, 49, 618);
INSERT INTO public.games VALUES (79, 50, 210);
INSERT INTO public.games VALUES (80, 49, 295);
INSERT INTO public.games VALUES (81, 49, 863);
INSERT INTO public.games VALUES (82, 49, 488);
INSERT INTO public.games VALUES (83, 51, 843);
INSERT INTO public.games VALUES (84, 52, 866);
INSERT INTO public.games VALUES (85, 51, 981);
INSERT INTO public.games VALUES (86, 51, 789);
INSERT INTO public.games VALUES (87, 51, 339);
INSERT INTO public.games VALUES (88, 44, 13);
INSERT INTO public.games VALUES (89, 53, 425);
INSERT INTO public.games VALUES (90, 54, 451);
INSERT INTO public.games VALUES (91, 53, 557);
INSERT INTO public.games VALUES (92, 53, 583);
INSERT INTO public.games VALUES (93, 53, 79);
INSERT INTO public.games VALUES (94, 55, 113);
INSERT INTO public.games VALUES (95, 56, 259);
INSERT INTO public.games VALUES (96, 55, 948);
INSERT INTO public.games VALUES (97, 55, 842);
INSERT INTO public.games VALUES (98, 55, 769);
INSERT INTO public.games VALUES (99, 57, 254);
INSERT INTO public.games VALUES (100, 59, 551);
INSERT INTO public.games VALUES (101, 61, 117);
INSERT INTO public.games VALUES (102, 61, 532);
INSERT INTO public.games VALUES (103, 62, 118);
INSERT INTO public.games VALUES (104, 63, 936);
INSERT INTO public.games VALUES (105, 63, 276);
INSERT INTO public.games VALUES (106, 64, 43);
INSERT INTO public.games VALUES (107, 64, 475);
INSERT INTO public.games VALUES (108, 63, 482);
INSERT INTO public.games VALUES (109, 63, 123);
INSERT INTO public.games VALUES (110, 63, 283);
INSERT INTO public.games VALUES (111, 65, 202);
INSERT INTO public.games VALUES (112, 65, 77);
INSERT INTO public.games VALUES (113, 66, 219);
INSERT INTO public.games VALUES (114, 66, 222);
INSERT INTO public.games VALUES (115, 65, 612);
INSERT INTO public.games VALUES (116, 65, 566);
INSERT INTO public.games VALUES (117, 65, 78);
INSERT INTO public.games VALUES (118, 67, 524);
INSERT INTO public.games VALUES (119, 67, 959);
INSERT INTO public.games VALUES (120, 68, 784);
INSERT INTO public.games VALUES (121, 68, 554);
INSERT INTO public.games VALUES (122, 67, 188);
INSERT INTO public.games VALUES (123, 67, 538);
INSERT INTO public.games VALUES (124, 67, 702);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'user_1784533630241');
INSERT INTO public.users VALUES (2, 'user_1784533630240');
INSERT INTO public.users VALUES (3, 'user_1784534097245');
INSERT INTO public.users VALUES (4, 'user_1784534097244');
INSERT INTO public.users VALUES (5, 'user_1784534233129');
INSERT INTO public.users VALUES (6, 'user_1784534233128');
INSERT INTO public.users VALUES (7, 'user_1784534646263');
INSERT INTO public.users VALUES (8, 'user_1784534646262');
INSERT INTO public.users VALUES (9, 'user_1784534831511');
INSERT INTO public.users VALUES (10, 'user_1784534831510');
INSERT INTO public.users VALUES (11, 'user_1784534931959');
INSERT INTO public.users VALUES (12, 'user_1784534931958');
INSERT INTO public.users VALUES (13, 'user_1784535014095');
INSERT INTO public.users VALUES (14, 'user_1784535014094');
INSERT INTO public.users VALUES (15, 'user_1784535459429');
INSERT INTO public.users VALUES (16, 'user_1784535459428');
INSERT INTO public.users VALUES (17, 'user_1784535665299');
INSERT INTO public.users VALUES (18, 'user_1784535665298');
INSERT INTO public.users VALUES (19, 'user_1784535692247');
INSERT INTO public.users VALUES (20, 'user_1784535692246');
INSERT INTO public.users VALUES (21, 'user_1784535732083');
INSERT INTO public.users VALUES (22, 'user_1784535732082');
INSERT INTO public.users VALUES (23, 'user_1784535765657');
INSERT INTO public.users VALUES (24, 'user_1784535765656');
INSERT INTO public.users VALUES (25, 'user_1784535783705');
INSERT INTO public.users VALUES (26, 'user_1784535783704');
INSERT INTO public.users VALUES (27, 'user_1784535887490');
INSERT INTO public.users VALUES (28, 'user_1784535887489');
INSERT INTO public.users VALUES (29, 'user_1784535952255');
INSERT INTO public.users VALUES (30, 'user_1784535952254');
INSERT INTO public.users VALUES (31, 'user_1784536013998');
INSERT INTO public.users VALUES (32, 'user_1784536013997');
INSERT INTO public.users VALUES (33, 'user_1784536407676');
INSERT INTO public.users VALUES (34, 'user_1784536407675');
INSERT INTO public.users VALUES (35, 'user_1784536682429');
INSERT INTO public.users VALUES (36, 'user_1784536682428');
INSERT INTO public.users VALUES (37, 'user_1784536745450');
INSERT INTO public.users VALUES (39, 'user_1784536745449');
INSERT INTO public.users VALUES (44, 'yuu');
INSERT INTO public.users VALUES (45, 'user_1784537303263');
INSERT INTO public.users VALUES (46, 'user_1784537303262');
INSERT INTO public.users VALUES (47, 'user_1784537826935');
INSERT INTO public.users VALUES (48, 'user_1784537826934');
INSERT INTO public.users VALUES (49, 'user_1784537963317');
INSERT INTO public.users VALUES (50, 'user_1784537963316');
INSERT INTO public.users VALUES (51, 'user_1784538721210');
INSERT INTO public.users VALUES (52, 'user_1784538721209');
INSERT INTO public.users VALUES (53, 'user_1784538800314');
INSERT INTO public.users VALUES (54, 'user_1784538800313');
INSERT INTO public.users VALUES (55, 'user_1784539697264');
INSERT INTO public.users VALUES (56, 'user_1784539697263');
INSERT INTO public.users VALUES (57, 'user_1784539879141');
INSERT INTO public.users VALUES (58, 'user_1784539879140');
INSERT INTO public.users VALUES (59, 'user_1784539941734');
INSERT INTO public.users VALUES (60, 'user_1784539941733');
INSERT INTO public.users VALUES (61, 'user_1784540050819');
INSERT INTO public.users VALUES (62, 'user_1784540050818');
INSERT INTO public.users VALUES (63, 'user_1784540256095');
INSERT INTO public.users VALUES (64, 'user_1784540256094');
INSERT INTO public.users VALUES (65, 'user_1784540539169');
INSERT INTO public.users VALUES (66, 'user_1784540539168');
INSERT INTO public.users VALUES (67, 'user_1784540570649');
INSERT INTO public.users VALUES (68, 'user_1784540570648');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 124, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 68, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

