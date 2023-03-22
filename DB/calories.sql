--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-03-22 23:45:57

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
-- TOC entry 221 (class 1259 OID 16455)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    categoryid integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16454)
-- Name: categories_categoryid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_categoryid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_categoryid_seq OWNER TO postgres;

--
-- TOC entry 3419 (class 0 OID 0)
-- Dependencies: 220
-- Name: categories_categoryid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_categoryid_seq OWNED BY public.categories.categoryid;


--
-- TOC entry 219 (class 1259 OID 16441)
-- Name: components; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.components (
    componentid integer NOT NULL,
    name character varying(255) NOT NULL,
    ccal real NOT NULL,
    fat real NOT NULL,
    proteins real NOT NULL,
    carbohydrates real NOT NULL
);


ALTER TABLE public.components OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16440)
-- Name: components_componentid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.components_componentid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.components_componentid_seq OWNER TO postgres;

--
-- TOC entry 3420 (class 0 OID 0)
-- Dependencies: 218
-- Name: components_componentid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.components_componentid_seq OWNED BY public.components.componentid;


--
-- TOC entry 217 (class 1259 OID 16434)
-- Name: dishes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dishes (
    dishid integer NOT NULL,
    name character varying(255) NOT NULL,
    componentid integer NOT NULL,
    ccal real NOT NULL,
    fat real NOT NULL,
    proteins real NOT NULL,
    carbohydrates real NOT NULL
);


ALTER TABLE public.dishes OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16503)
-- Name: dishes_components; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dishes_components (
    id integer NOT NULL,
    dishid integer NOT NULL,
    componentid integer NOT NULL
);


ALTER TABLE public.dishes_components OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16502)
-- Name: dishes_components_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dishes_components_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dishes_components_id_seq OWNER TO postgres;

--
-- TOC entry 3421 (class 0 OID 0)
-- Dependencies: 230
-- Name: dishes_components_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dishes_components_id_seq OWNED BY public.dishes_components.id;


--
-- TOC entry 216 (class 1259 OID 16433)
-- Name: dishes_dishid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dishes_dishid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dishes_dishid_seq OWNER TO postgres;

--
-- TOC entry 3422 (class 0 OID 0)
-- Dependencies: 216
-- Name: dishes_dishid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dishes_dishid_seq OWNED BY public.dishes.dishid;


--
-- TOC entry 233 (class 1259 OID 16520)
-- Name: method_sign; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.method_sign (
    methodid integer NOT NULL,
    userid integer NOT NULL,
    vkontaktemethod character varying(255) NOT NULL,
    twittermethod character varying(255) NOT NULL,
    telegram character varying(255) NOT NULL,
    email character varying(255) NOT NULL
);


ALTER TABLE public.method_sign OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16519)
-- Name: method_sign_methodid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.method_sign_methodid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.method_sign_methodid_seq OWNER TO postgres;

--
-- TOC entry 3423 (class 0 OID 0)
-- Dependencies: 232
-- Name: method_sign_methodid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.method_sign_methodid_seq OWNED BY public.method_sign.methodid;


--
-- TOC entry 227 (class 1259 OID 16483)
-- Name: neural_network_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.neural_network_data (
    dataid integer NOT NULL,
    nameproduct character varying(255) NOT NULL,
    ccal real NOT NULL,
    fat real NOT NULL,
    proteins real NOT NULL,
    carbohydrates real NOT NULL
);


ALTER TABLE public.neural_network_data OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16482)
-- Name: neural_network_data_dataid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.neural_network_data_dataid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.neural_network_data_dataid_seq OWNER TO postgres;

--
-- TOC entry 3424 (class 0 OID 0)
-- Dependencies: 226
-- Name: neural_network_data_dataid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.neural_network_data_dataid_seq OWNED BY public.neural_network_data.dataid;


--
-- TOC entry 223 (class 1259 OID 16462)
-- Name: requests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.requests (
    requestid integer NOT NULL,
    userid integer NOT NULL,
    request character varying(255) NOT NULL
);


ALTER TABLE public.requests OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16461)
-- Name: requests_requestid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.requests_requestid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.requests_requestid_seq OWNER TO postgres;

--
-- TOC entry 3425 (class 0 OID 0)
-- Dependencies: 222
-- Name: requests_requestid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.requests_requestid_seq OWNED BY public.requests.requestid;


--
-- TOC entry 229 (class 1259 OID 16491)
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews (
    reviewid integer NOT NULL,
    userid integer NOT NULL,
    description character varying(255) NOT NULL
);


ALTER TABLE public.reviews OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16490)
-- Name: reviews_reviewid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_reviewid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_reviewid_seq OWNER TO postgres;

--
-- TOC entry 3426 (class 0 OID 0)
-- Dependencies: 228
-- Name: reviews_reviewid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_reviewid_seq OWNED BY public.reviews.reviewid;


--
-- TOC entry 225 (class 1259 OID 16469)
-- Name: units; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.units (
    unitid integer NOT NULL,
    unitname character varying(255) NOT NULL
);


ALTER TABLE public.units OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16468)
-- Name: units_unitid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.units_unitid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.units_unitid_seq OWNER TO postgres;

--
-- TOC entry 3427 (class 0 OID 0)
-- Dependencies: 224
-- Name: units_unitid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.units_unitid_seq OWNED BY public.units.unitid;


--
-- TOC entry 215 (class 1259 OID 16425)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    userid integer NOT NULL,
    nickname character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    status integer NOT NULL,
    password character varying(255) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16424)
-- Name: users_userid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_userid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_userid_seq OWNER TO postgres;

--
-- TOC entry 3428 (class 0 OID 0)
-- Dependencies: 214
-- Name: users_userid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_userid_seq OWNED BY public.users.userid;


--
-- TOC entry 3221 (class 2604 OID 16458)
-- Name: categories categoryid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN categoryid SET DEFAULT nextval('public.categories_categoryid_seq'::regclass);


--
-- TOC entry 3220 (class 2604 OID 16444)
-- Name: components componentid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components ALTER COLUMN componentid SET DEFAULT nextval('public.components_componentid_seq'::regclass);


--
-- TOC entry 3219 (class 2604 OID 16437)
-- Name: dishes dishid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dishes ALTER COLUMN dishid SET DEFAULT nextval('public.dishes_dishid_seq'::regclass);


--
-- TOC entry 3226 (class 2604 OID 16506)
-- Name: dishes_components id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dishes_components ALTER COLUMN id SET DEFAULT nextval('public.dishes_components_id_seq'::regclass);


--
-- TOC entry 3227 (class 2604 OID 16523)
-- Name: method_sign methodid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.method_sign ALTER COLUMN methodid SET DEFAULT nextval('public.method_sign_methodid_seq'::regclass);


--
-- TOC entry 3224 (class 2604 OID 16486)
-- Name: neural_network_data dataid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.neural_network_data ALTER COLUMN dataid SET DEFAULT nextval('public.neural_network_data_dataid_seq'::regclass);


--
-- TOC entry 3222 (class 2604 OID 16465)
-- Name: requests requestid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests ALTER COLUMN requestid SET DEFAULT nextval('public.requests_requestid_seq'::regclass);


--
-- TOC entry 3225 (class 2604 OID 16494)
-- Name: reviews reviewid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews ALTER COLUMN reviewid SET DEFAULT nextval('public.reviews_reviewid_seq'::regclass);


--
-- TOC entry 3223 (class 2604 OID 16472)
-- Name: units unitid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.units ALTER COLUMN unitid SET DEFAULT nextval('public.units_unitid_seq'::regclass);


--
-- TOC entry 3218 (class 2604 OID 16428)
-- Name: users userid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN userid SET DEFAULT nextval('public.users_userid_seq'::regclass);


--
-- TOC entry 3401 (class 0 OID 16455)
-- Dependencies: 221
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3399 (class 0 OID 16441)
-- Dependencies: 219
-- Data for Name: components; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3397 (class 0 OID 16434)
-- Dependencies: 217
-- Data for Name: dishes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3411 (class 0 OID 16503)
-- Dependencies: 231
-- Data for Name: dishes_components; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3413 (class 0 OID 16520)
-- Dependencies: 233
-- Data for Name: method_sign; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3407 (class 0 OID 16483)
-- Dependencies: 227
-- Data for Name: neural_network_data; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3403 (class 0 OID 16462)
-- Dependencies: 223
-- Data for Name: requests; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3409 (class 0 OID 16491)
-- Dependencies: 229
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3405 (class 0 OID 16469)
-- Dependencies: 225
-- Data for Name: units; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3395 (class 0 OID 16425)
-- Dependencies: 215
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (userid, nickname, email, status, password) VALUES (1, 'Mikita', 'mikita@gmail.com', 2, '54321');
INSERT INTO public.users (userid, nickname, email, status, password) VALUES (2, 'Timmy', 'timmy@gmail.com', 1, '12345');


--
-- TOC entry 3429 (class 0 OID 0)
-- Dependencies: 220
-- Name: categories_categoryid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_categoryid_seq', 1, false);


--
-- TOC entry 3430 (class 0 OID 0)
-- Dependencies: 218
-- Name: components_componentid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.components_componentid_seq', 1, false);


--
-- TOC entry 3431 (class 0 OID 0)
-- Dependencies: 230
-- Name: dishes_components_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dishes_components_id_seq', 1, false);


--
-- TOC entry 3432 (class 0 OID 0)
-- Dependencies: 216
-- Name: dishes_dishid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dishes_dishid_seq', 1, false);


--
-- TOC entry 3433 (class 0 OID 0)
-- Dependencies: 232
-- Name: method_sign_methodid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.method_sign_methodid_seq', 1, false);


--
-- TOC entry 3434 (class 0 OID 0)
-- Dependencies: 226
-- Name: neural_network_data_dataid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.neural_network_data_dataid_seq', 1, false);


--
-- TOC entry 3435 (class 0 OID 0)
-- Dependencies: 222
-- Name: requests_requestid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.requests_requestid_seq', 1, false);


--
-- TOC entry 3436 (class 0 OID 0)
-- Dependencies: 228
-- Name: reviews_reviewid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_reviewid_seq', 1, false);


--
-- TOC entry 3437 (class 0 OID 0)
-- Dependencies: 224
-- Name: units_unitid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.units_unitid_seq', 1, false);


--
-- TOC entry 3438 (class 0 OID 0)
-- Dependencies: 214
-- Name: users_userid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_userid_seq', 2, true);


--
-- TOC entry 3235 (class 2606 OID 16460)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (categoryid);


--
-- TOC entry 3233 (class 2606 OID 16446)
-- Name: components components_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.components
    ADD CONSTRAINT components_pkey PRIMARY KEY (componentid);


--
-- TOC entry 3245 (class 2606 OID 16508)
-- Name: dishes_components dishes_components_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dishes_components
    ADD CONSTRAINT dishes_components_pkey PRIMARY KEY (id);


--
-- TOC entry 3231 (class 2606 OID 16439)
-- Name: dishes dishes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dishes
    ADD CONSTRAINT dishes_pkey PRIMARY KEY (dishid);


--
-- TOC entry 3247 (class 2606 OID 16527)
-- Name: method_sign method_sign_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.method_sign
    ADD CONSTRAINT method_sign_pkey PRIMARY KEY (methodid);


--
-- TOC entry 3241 (class 2606 OID 16488)
-- Name: neural_network_data neural_network_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.neural_network_data
    ADD CONSTRAINT neural_network_data_pkey PRIMARY KEY (dataid);


--
-- TOC entry 3237 (class 2606 OID 16467)
-- Name: requests requests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT requests_pkey PRIMARY KEY (requestid);


--
-- TOC entry 3243 (class 2606 OID 16496)
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (reviewid);


--
-- TOC entry 3239 (class 2606 OID 16474)
-- Name: units units_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.units
    ADD CONSTRAINT units_pkey PRIMARY KEY (unitid);


--
-- TOC entry 3229 (class 2606 OID 16432)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);


--
-- TOC entry 3249 (class 2606 OID 16514)
-- Name: dishes_components dishes_components_componentid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dishes_components
    ADD CONSTRAINT dishes_components_componentid_fkey FOREIGN KEY (componentid) REFERENCES public.components(componentid) ON DELETE CASCADE;


--
-- TOC entry 3250 (class 2606 OID 16509)
-- Name: dishes_components dishes_components_dishid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dishes_components
    ADD CONSTRAINT dishes_components_dishid_fkey FOREIGN KEY (dishid) REFERENCES public.dishes(dishid) ON DELETE CASCADE;


--
-- TOC entry 3251 (class 2606 OID 16528)
-- Name: method_sign method_sign_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.method_sign
    ADD CONSTRAINT method_sign_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(userid);


--
-- TOC entry 3248 (class 2606 OID 16497)
-- Name: reviews reviews_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(userid) ON DELETE CASCADE;


-- Completed on 2023-03-22 23:45:58

--
-- PostgreSQL database dump complete
--

