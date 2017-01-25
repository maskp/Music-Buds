--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.4



--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
-

--
-- Name: muzician; Type: TABLE; Schema: public; Owner: student_15
--

CREATE TABLE muzician (
    musician_id serial primary key,
    musician_name character varying(100),
    musician_image character varying(500),
    userid integer
);


-- ALTER TABLE muzician OWNER TO student_15;

-- --
-- -- Name: muzician_id_seq; Type: SEQUENCE; Schema: public; Owner: student_15
-- --

-- CREATE SEQUENCE muzician_id_seq
--     START WITH 1
--     INCREMENT BY 1
--     NO MINVALUE
--     NO MAXVALUE
--     CACHE 1;


-- ALTER TABLE muzician_id_seq OWNER TO student_15;

-- --
-- -- Name: muzician_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student_15
-- --

-- ALTER SEQUENCE muzician_id_seq OWNED BY muzician.musician_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: student_15
--

CREATE TABLE users (
    id serial primary key,
    name character varying(100),
    email character varying(200),
    password character varying(20),
    username character varying(200),
    question character varying(400),
    answers character varying(400)
);


-- ALTER TABLE users OWNER TO student_15;

-- --
-- -- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: student_15
-- --

-- CREATE SEQUENCE users_id_seq
--     START WITH 1
--     INCREMENT BY 1
--     NO MINVALUE
--     NO MAXVALUE
--     CACHE 1;


-- ALTER TABLE users_id_seq OWNER TO student_15;

-- --
-- -- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: student_15
-- --

-- ALTER SEQUENCE users_id_seq OWNED BY users.id;


-- --
-- -- Name: musician_id; Type: DEFAULT; Schema: public; Owner: student_15
-- --

-- ALTER TABLE ONLY muzician ALTER COLUMN musician_id SET DEFAULT nextval('muzician_id_seq'::regclass);


-- --
-- -- Name: id; Type: DEFAULT; Schema: public; Owner: student_15
-- --

-- ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


-- --
-- -- Data for Name: muzician; Type: TABLE DATA; Schema: public; Owner: student_15
-- --

-- COPY muzician (musician_id, musician_name, musician_image, userid) FROM stdin;
-- 2	Broke For Free	https://freemusicarchive.org/file/images/artists/Broke_For_Free_-_2013011621055318.jpg	1
-- 3	Broke For Free	https://freemusicarchive.org/file/images/artists/Broke_For_Free_-_2013011621055318.jpg	1
-- 6	Broke For Free	https://freemusicarchive.org/file/images/artists/Broke_For_Free_-_2013011621055318.jpg	2
-- 7	Broke For Free	https://freemusicarchive.org/file/images/artists/Broke_For_Free_-_2013011621055318.jpg	3
-- 8	Broke For Free	https://freemusicarchive.org/file/images/artists/Broke_For_Free_-_2013011621055318.jpg	4
-- 9	Broke For Free	https://freemusicarchive.org/file/images/artists/Broke_For_Free_-_2013011621055318.jpg	5
-- 10	Broke For Free	https://freemusicarchive.org/file/images/artists/Broke_For_Free_-_2013011621055318.jpg	6
-- 11	Broke For Free	https://freemusicarchive.org/file/images/artists/Broke_For_Free_-_2013011621055318.jpg	7
-- 21	Blue Dot Sessions	https://freemusicarchive.org/file/images/artists/Blue_Dot_Sessions_-_20151002162927459.jpg	1
-- \.


-- --
-- -- Name: muzician_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student_15
-- --

-- SELECT pg_catalog.setval('muzician_id_seq', 24, true);


-- --
-- -- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: student_15
-- --

-- COPY users (id, name, email, password, username, question, answers) FROM stdin;
-- 2	brunt force	force@reck.com	jackal	Brunt	what i like	\N
-- 3	b	b@a.com	jl	b	tell me something?	\N
-- 4	h	a@a.com	komal	h	y	\N
-- 5	asd	asdasd@gmail.c	asdasd	asd	asdf	\N
-- 6	goat	bakr@hmail.com	get	bakr	asdasd	\N
-- 7	a	akela@fmail.com	b	a	hi	\N
-- 8	bryan	bryan@bryan.com	a	bryan	it	\N
-- 1	lisa love	disdain@loe.com	queenhorse	lisa	tell me something?	\N
-- 9	a	asdj@kmail.com	asd	sf	sdf	\N
-- 12	pascal	pascal@gmail.com	pascal	pascal	pascal	\N
-- 10	c	c@c.com	asd	C	c	\N
-- 11	c	c@c.com	asd	C	c	\N
-- \.


-- --
-- -- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: student_15
-- --

-- SELECT pg_catalog.setval('users_id_seq', 12, true);


-- --
-- -- Name: muzician_pkey; Type: CONSTRAINT; Schema: public; Owner: student_15
-- --

-- ALTER TABLE ONLY muzician
--     ADD CONSTRAINT muzician_pkey PRIMARY KEY (musician_id);


-- --
-- -- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: student_15
-- --

-- ALTER TABLE ONLY users
--     ADD CONSTRAINT users_pkey PRIMARY KEY (id);


-- --
-- -- Name: muzician_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: student_15
-- --

-- ALTER TABLE ONLY muzician
--     ADD CONSTRAINT muzician_userid_fkey FOREIGN KEY (userid) REFERENCES users(id);


-- --
-- -- Name: public; Type: ACL; Schema: -; Owner: student_15
-- --

-- REVOKE ALL ON SCHEMA public FROM PUBLIC;
-- REVOKE ALL ON SCHEMA public FROM student_15;
-- GRANT ALL ON SCHEMA public TO student_15;
-- GRANT ALL ON SCHEMA public TO PUBLIC;


-- --
-- -- PostgreSQL database dump complete
-- --

