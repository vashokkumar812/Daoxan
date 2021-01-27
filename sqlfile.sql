--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1

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
-- Name: accounts_guestemail; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_guestemail (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    active boolean NOT NULL,
    update timestamp with time zone NOT NULL,
    "timestamp" timestamp with time zone NOT NULL
);


ALTER TABLE public.accounts_guestemail OWNER TO postgres;

--
-- Name: accounts_guestemail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_guestemail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_guestemail_id_seq OWNER TO postgres;

--
-- Name: accounts_guestemail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_guestemail_id_seq OWNED BY public.accounts_guestemail.id;


--
-- Name: accounts_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    email character varying(255) NOT NULL,
    full_name character varying(255),
    active boolean NOT NULL,
    staff boolean NOT NULL,
    admin boolean NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    is_active boolean NOT NULL
);


ALTER TABLE public.accounts_user OWNER TO postgres;

--
-- Name: accounts_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_user_id_seq OWNER TO postgres;

--
-- Name: accounts_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_user_id_seq OWNED BY public.accounts_user.id;


--
-- Name: addresses_address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.addresses_address (
    id integer NOT NULL,
    address_type character varying(120) NOT NULL,
    address_line_1 character varying(120) NOT NULL,
    address_line_2 character varying(120),
    city character varying(120) NOT NULL,
    country character varying(120) NOT NULL,
    state character varying(120) NOT NULL,
    postal_code character varying(120) NOT NULL,
    billing_profile_id integer NOT NULL
);


ALTER TABLE public.addresses_address OWNER TO postgres;

--
-- Name: addresses_address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.addresses_address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.addresses_address_id_seq OWNER TO postgres;

--
-- Name: addresses_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.addresses_address_id_seq OWNED BY public.addresses_address.id;


--
-- Name: analytics_objectviewed; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.analytics_objectviewed (
    id integer NOT NULL,
    ip_address character varying(220),
    object_id integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    content_type_id integer NOT NULL,
    user_id integer,
    CONSTRAINT analytics_objectviewed_object_id_check CHECK ((object_id >= 0))
);


ALTER TABLE public.analytics_objectviewed OWNER TO postgres;

--
-- Name: analytics_objectviewed_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.analytics_objectviewed_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.analytics_objectviewed_id_seq OWNER TO postgres;

--
-- Name: analytics_objectviewed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.analytics_objectviewed_id_seq OWNED BY public.analytics_objectviewed.id;


--
-- Name: analytics_usersession; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.analytics_usersession (
    id integer NOT NULL,
    ip_address character varying(220),
    session_key character varying(100),
    "timestamp" timestamp with time zone NOT NULL,
    active boolean NOT NULL,
    ended boolean NOT NULL,
    user_id integer
);


ALTER TABLE public.analytics_usersession OWNER TO postgres;

--
-- Name: analytics_usersession_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.analytics_usersession_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.analytics_usersession_id_seq OWNER TO postgres;

--
-- Name: analytics_usersession_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.analytics_usersession_id_seq OWNED BY public.analytics_usersession.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: billing_billingprofile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.billing_billingprofile (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    active boolean NOT NULL,
    update timestamp with time zone NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    user_id integer
);


ALTER TABLE public.billing_billingprofile OWNER TO postgres;

--
-- Name: billing_billingprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.billing_billingprofile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.billing_billingprofile_id_seq OWNER TO postgres;

--
-- Name: billing_billingprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.billing_billingprofile_id_seq OWNED BY public.billing_billingprofile.id;


--
-- Name: carts_cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carts_cart (
    id integer NOT NULL,
    subtotal numeric(10,2) NOT NULL,
    total numeric(10,2) NOT NULL,
    updated timestamp with time zone NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    user_id integer
);


ALTER TABLE public.carts_cart OWNER TO postgres;

--
-- Name: carts_cart_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carts_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carts_cart_id_seq OWNER TO postgres;

--
-- Name: carts_cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carts_cart_id_seq OWNED BY public.carts_cart.id;


--
-- Name: carts_cartitem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carts_cartitem (
    id integer NOT NULL,
    quantity integer NOT NULL,
    cart_id integer,
    product_id integer,
    price double precision NOT NULL,
    CONSTRAINT carts_cartitem_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE public.carts_cartitem OWNER TO postgres;

--
-- Name: carts_cartitem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carts_cartitem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carts_cartitem_id_seq OWNER TO postgres;

--
-- Name: carts_cartitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carts_cartitem_id_seq OWNED BY public.carts_cartitem.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: orders_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders_order (
    id integer NOT NULL,
    order_id character varying(120) NOT NULL,
    status character varying(120) NOT NULL,
    shipping_total numeric(10,2) NOT NULL,
    total numeric(10,2) NOT NULL,
    active boolean NOT NULL,
    billing_address_id integer,
    billing_profile_id integer,
    cart_id integer NOT NULL,
    shipping_address_id integer
);


ALTER TABLE public.orders_order OWNER TO postgres;

--
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_order_id_seq OWNER TO postgres;

--
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders_order.id;


--
-- Name: products_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_category (
    id integer NOT NULL,
    name character varying(25) NOT NULL,
    file character varying(100),
    myfile character varying(100)
);


ALTER TABLE public.products_category OWNER TO postgres;

--
-- Name: products_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_category_id_seq OWNER TO postgres;

--
-- Name: products_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_category_id_seq OWNED BY public.products_category.id;


--
-- Name: products_product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_product (
    id integer NOT NULL,
    title character varying(1200) NOT NULL,
    slug character varying(50) NOT NULL,
    description character varying(1000),
    price integer NOT NULL,
    image character varying(100),
    featured boolean NOT NULL,
    active boolean NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    category_id_id integer,
    product_id character varying(5000),
    product_type integer NOT NULL,
    packaging_size character varying(500) NOT NULL,
    variety character varying(300) NOT NULL,
    variant_of_id integer,
    quantity character varying(1000) NOT NULL
);


ALTER TABLE public.products_product OWNER TO postgres;

--
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_product_id_seq OWNER TO postgres;

--
-- Name: products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products_product.id;


--
-- Name: tags_tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tags_tag (
    id integer NOT NULL,
    title character varying(120) NOT NULL,
    slug character varying(50) NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    active boolean NOT NULL
);


ALTER TABLE public.tags_tag OWNER TO postgres;

--
-- Name: tags_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tags_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tags_tag_id_seq OWNER TO postgres;

--
-- Name: tags_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tags_tag_id_seq OWNED BY public.tags_tag.id;


--
-- Name: tags_tag_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tags_tag_products (
    id integer NOT NULL,
    tag_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.tags_tag_products OWNER TO postgres;

--
-- Name: tags_tag_products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tags_tag_products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tags_tag_products_id_seq OWNER TO postgres;

--
-- Name: tags_tag_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tags_tag_products_id_seq OWNED BY public.tags_tag_products.id;


--
-- Name: accounts_guestemail id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_guestemail ALTER COLUMN id SET DEFAULT nextval('public.accounts_guestemail_id_seq'::regclass);


--
-- Name: accounts_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user ALTER COLUMN id SET DEFAULT nextval('public.accounts_user_id_seq'::regclass);


--
-- Name: addresses_address id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses_address ALTER COLUMN id SET DEFAULT nextval('public.addresses_address_id_seq'::regclass);


--
-- Name: analytics_objectviewed id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.analytics_objectviewed ALTER COLUMN id SET DEFAULT nextval('public.analytics_objectviewed_id_seq'::regclass);


--
-- Name: analytics_usersession id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.analytics_usersession ALTER COLUMN id SET DEFAULT nextval('public.analytics_usersession_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: billing_billingprofile id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing_billingprofile ALTER COLUMN id SET DEFAULT nextval('public.billing_billingprofile_id_seq'::regclass);


--
-- Name: carts_cart id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts_cart ALTER COLUMN id SET DEFAULT nextval('public.carts_cart_id_seq'::regclass);


--
-- Name: carts_cartitem id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts_cartitem ALTER COLUMN id SET DEFAULT nextval('public.carts_cartitem_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: orders_order id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_order ALTER COLUMN id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);


--
-- Name: products_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_category ALTER COLUMN id SET DEFAULT nextval('public.products_category_id_seq'::regclass);


--
-- Name: products_product id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_product ALTER COLUMN id SET DEFAULT nextval('public.products_product_id_seq'::regclass);


--
-- Name: tags_tag id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags_tag ALTER COLUMN id SET DEFAULT nextval('public.tags_tag_id_seq'::regclass);


--
-- Name: tags_tag_products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags_tag_products ALTER COLUMN id SET DEFAULT nextval('public.tags_tag_products_id_seq'::regclass);


--
-- Data for Name: accounts_guestemail; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_guestemail (id, email, active, update, "timestamp") FROM stdin;
\.


--
-- Data for Name: accounts_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_user (id, password, last_login, email, full_name, active, staff, admin, "timestamp", is_active) FROM stdin;
1	pbkdf2_sha256$216000$xaCXjAY83KVT$gM8iy8bXawq8845abAi0w+sJQX4yOA0077gs7i6yMIU=	2021-01-26 14:19:52.535912+05:30	admin@gmail.com	daoxan	t	t	t	2021-01-11 14:05:12.921745+05:30	t
\.


--
-- Data for Name: addresses_address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.addresses_address (id, address_type, address_line_1, address_line_2, city, country, state, postal_code, billing_profile_id) FROM stdin;
1	shipping	qwerty	wsderfgth	Bangalore	India	Karnataka	562101	1
\.


--
-- Data for Name: analytics_objectviewed; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.analytics_objectviewed (id, ip_address, object_id, "timestamp", content_type_id, user_id) FROM stdin;
1	127.0.0.1	4	2021-01-12 17:06:54.402745+05:30	16	1
2	127.0.0.1	6	2021-01-12 17:07:10.337166+05:30	16	1
3	127.0.0.1	8	2021-01-12 17:07:16.218476+05:30	16	1
4	127.0.0.1	8	2021-01-12 17:08:51.726667+05:30	16	1
5	127.0.0.1	343	2021-01-12 17:09:17.714105+05:30	16	1
6	127.0.0.1	30	2021-01-12 17:09:47.997691+05:30	16	1
7	127.0.0.1	188	2021-01-12 17:09:51.628326+05:30	16	1
8	127.0.0.1	343	2021-01-12 17:09:55.2024+05:30	16	1
9	127.0.0.1	6	2021-01-12 17:10:39.979849+05:30	16	1
10	127.0.0.1	6	2021-01-12 17:14:48.790291+05:30	16	1
11	127.0.0.1	406	2021-01-12 17:15:17.658084+05:30	16	1
12	127.0.0.1	131	2021-01-12 17:24:34.681424+05:30	16	1
45	127.0.0.1	12	2021-01-13 10:50:46.612948+05:30	16	1
46	127.0.0.1	6	2021-01-13 10:51:12.93393+05:30	16	1
47	127.0.0.1	18	2021-01-13 10:52:06.097077+05:30	16	1
48	127.0.0.1	116	2021-01-13 10:53:12.721561+05:30	16	1
49	127.0.0.1	711	2021-01-13 10:56:30.419411+05:30	16	1
50	127.0.0.1	712	2021-01-13 10:56:37.815259+05:30	16	1
51	127.0.0.1	713	2021-01-13 10:56:41.520938+05:30	16	1
52	127.0.0.1	786	2021-01-13 10:56:45.519488+05:30	16	1
53	127.0.0.1	711	2021-01-13 11:07:18.442607+05:30	16	1
54	127.0.0.1	1362	2021-01-13 11:11:39.935375+05:30	16	1
55	127.0.0.1	1437	2021-01-13 11:11:43.151823+05:30	16	1
56	127.0.0.1	1650	2021-01-13 11:11:46.214306+05:30	16	1
57	127.0.0.1	1716	2021-01-13 11:11:52.801896+05:30	16	1
58	127.0.0.1	1716	2021-01-13 11:11:56.187618+05:30	16	1
59	127.0.0.1	1818	2021-01-13 11:11:59.479491+05:30	16	1
60	127.0.0.1	1424	2021-01-13 11:16:56.150961+05:30	16	1
61	127.0.0.1	1418	2021-01-13 11:17:06.329225+05:30	16	1
62	127.0.0.1	1362	2021-01-13 11:19:38.147644+05:30	16	1
63	127.0.0.1	1437	2021-01-13 11:19:43.319942+05:30	16	1
64	127.0.0.1	1650	2021-01-13 11:19:59.041318+05:30	16	1
65	127.0.0.1	1437	2021-01-13 11:54:13.932471+05:30	16	1
66	127.0.0.1	1363	2021-01-15 10:24:21.821683+05:30	16	1
67	127.0.0.1	1437	2021-01-15 10:24:31.149712+05:30	16	1
68	127.0.0.1	1364	2021-01-15 10:24:45.25315+05:30	16	1
69	127.0.0.1	3231	2021-01-15 11:15:02.171815+05:30	16	1
70	127.0.0.1	3426	2021-01-15 11:15:57.225146+05:30	16	1
71	127.0.0.1	3426	2021-01-15 11:17:35.041829+05:30	16	1
72	127.0.0.1	2955	2021-01-15 11:17:43.067638+05:30	16	1
73	127.0.0.1	2955	2021-01-15 11:18:36.966884+05:30	16	1
74	127.0.0.1	2955	2021-01-15 11:18:44.183525+05:30	16	1
75	127.0.0.1	3426	2021-01-15 11:18:53.120775+05:30	16	1
76	127.0.0.1	3426	2021-01-15 11:19:15.567733+05:30	16	1
77	127.0.0.1	3236	2021-01-15 11:21:14.724274+05:30	16	1
78	127.0.0.1	3426	2021-01-15 11:25:40.74812+05:30	16	1
79	127.0.0.1	3231	2021-01-15 11:35:15.585202+05:30	16	1
80	127.0.0.1	2955	2021-01-15 11:36:24.48045+05:30	16	1
81	127.0.0.1	3426	2021-01-15 11:43:14.222194+05:30	16	1
82	127.0.0.1	3426	2021-01-15 11:54:43.727824+05:30	16	1
83	127.0.0.1	3426	2021-01-15 12:16:56.593265+05:30	16	1
84	127.0.0.1	2955	2021-01-15 12:17:05.222216+05:30	16	1
85	127.0.0.1	2955	2021-01-15 12:28:50.545402+05:30	16	1
86	127.0.0.1	2955	2021-01-18 10:13:07.731853+05:30	16	1
87	127.0.0.1	3426	2021-01-18 13:33:46.187727+05:30	16	1
88	127.0.0.1	3428	2021-01-18 13:33:51.606069+05:30	16	1
89	127.0.0.1	3430	2021-01-18 13:33:56.264179+05:30	16	1
90	127.0.0.1	3174	2021-01-18 13:35:29.355054+05:30	16	1
91	127.0.0.1	3426	2021-01-18 13:37:50.65961+05:30	16	1
92	127.0.0.1	2955	2021-01-19 14:46:38.800557+05:30	16	1
93	127.0.0.1	2956	2021-01-20 10:33:39.768748+05:30	16	1
94	127.0.0.1	2962	2021-01-20 10:34:01.181429+05:30	16	1
95	127.0.0.1	2965	2021-01-20 10:34:17.318752+05:30	16	1
96	127.0.0.1	2962	2021-01-20 10:35:25.821611+05:30	16	1
97	127.0.0.1	2955	2021-01-20 10:36:28.596762+05:30	16	1
98	127.0.0.1	2956	2021-01-20 10:36:57.382463+05:30	16	1
99	127.0.0.1	2955	2021-01-20 10:37:12.092822+05:30	16	1
100	127.0.0.1	2956	2021-01-20 10:38:39.316159+05:30	16	1
101	127.0.0.1	3034	2021-01-20 10:54:35.848812+05:30	16	1
102	127.0.0.1	3575	2021-01-20 11:43:47.458651+05:30	16	1
103	127.0.0.1	3411	2021-01-20 11:46:01.913829+05:30	16	1
104	127.0.0.1	3467	2021-01-22 12:18:03.700106+05:30	16	1
105	127.0.0.1	3034	2021-01-22 12:19:49.438608+05:30	16	1
106	127.0.0.1	3524	2021-01-23 12:08:42.51581+05:30	16	1
107	127.0.0.1	3189	2021-01-23 12:20:53.84879+05:30	16	1
108	127.0.0.1	3189	2021-01-23 12:21:36.758006+05:30	16	1
109	127.0.0.1	2962	2021-01-25 10:38:37.856783+05:30	16	1
110	127.0.0.1	2962	2021-01-25 10:40:24.34586+05:30	16	1
111	127.0.0.1	2962	2021-01-25 10:40:46.734204+05:30	16	1
112	127.0.0.1	3444	2021-01-25 11:17:57.886259+05:30	16	1
113	127.0.0.1	3444	2021-01-25 11:19:19.544865+05:30	16	1
114	127.0.0.1	3444	2021-01-25 11:19:51.127295+05:30	16	1
115	127.0.0.1	3444	2021-01-25 11:20:06.008809+05:30	16	1
116	127.0.0.1	3444	2021-01-25 11:20:38.43341+05:30	16	1
117	127.0.0.1	3444	2021-01-25 11:21:18.602741+05:30	16	1
118	127.0.0.1	3444	2021-01-25 11:22:30.633906+05:30	16	1
119	127.0.0.1	3444	2021-01-25 11:22:58.215641+05:30	16	1
120	127.0.0.1	3444	2021-01-25 11:23:12.063661+05:30	16	1
121	127.0.0.1	3444	2021-01-25 11:23:31.408915+05:30	16	1
122	127.0.0.1	3444	2021-01-25 11:23:50.977597+05:30	16	1
123	127.0.0.1	3444	2021-01-25 11:24:01.193347+05:30	16	1
124	127.0.0.1	3444	2021-01-25 11:24:22.947142+05:30	16	1
125	127.0.0.1	3444	2021-01-25 11:24:35.832937+05:30	16	1
126	127.0.0.1	3444	2021-01-25 11:26:01.512266+05:30	16	1
127	127.0.0.1	3444	2021-01-25 11:27:08.648874+05:30	16	1
128	127.0.0.1	3444	2021-01-25 11:27:21.015438+05:30	16	1
129	127.0.0.1	3444	2021-01-25 11:27:50.591596+05:30	16	1
130	127.0.0.1	3444	2021-01-25 11:29:07.186336+05:30	16	1
131	127.0.0.1	3447	2021-01-25 11:29:16.227923+05:30	16	1
132	127.0.0.1	3411	2021-01-25 11:29:22.914515+05:30	16	1
133	127.0.0.1	3411	2021-01-25 11:29:43.521314+05:30	16	1
134	127.0.0.1	3411	2021-01-25 11:29:59.65111+05:30	16	1
135	127.0.0.1	3411	2021-01-25 11:30:12.807525+05:30	16	1
136	127.0.0.1	3411	2021-01-25 11:30:28.006683+05:30	16	1
137	127.0.0.1	2955	2021-01-25 11:30:32.496905+05:30	16	1
138	127.0.0.1	3174	2021-01-25 11:30:39.772258+05:30	16	1
139	127.0.0.1	3189	2021-01-25 11:30:49.603367+05:30	16	1
140	127.0.0.1	3189	2021-01-25 11:31:14.736872+05:30	16	1
141	127.0.0.1	3189	2021-01-25 11:31:54.557017+05:30	16	1
142	127.0.0.1	3174	2021-01-25 11:31:59.491147+05:30	16	1
143	127.0.0.1	3575	2021-01-25 11:32:06.578067+05:30	16	1
144	127.0.0.1	3411	2021-01-25 11:32:15.004437+05:30	16	1
145	127.0.0.1	3411	2021-01-25 11:32:29.506106+05:30	16	1
146	127.0.0.1	3411	2021-01-25 11:32:40.407074+05:30	16	1
147	127.0.0.1	2955	2021-01-25 11:32:50.495791+05:30	16	1
148	127.0.0.1	2955	2021-01-25 11:33:22.872735+05:30	16	1
149	127.0.0.1	2955	2021-01-25 11:34:22.692823+05:30	16	1
150	127.0.0.1	2955	2021-01-25 11:34:46.68849+05:30	16	1
151	127.0.0.1	2955	2021-01-25 11:35:03.211471+05:30	16	1
152	127.0.0.1	2955	2021-01-25 11:35:40.003124+05:30	16	1
153	127.0.0.1	2955	2021-01-25 11:37:13.354808+05:30	16	1
154	127.0.0.1	2955	2021-01-25 11:39:15.473176+05:30	16	1
155	127.0.0.1	2955	2021-01-25 13:03:42.735289+05:30	16	1
156	127.0.0.1	3444	2021-01-25 16:21:42.629902+05:30	16	1
157	127.0.0.1	2955	2021-01-26 14:20:06.226429+05:30	16	1
158	127.0.0.1	3174	2021-01-26 14:23:19.657078+05:30	16	1
159	127.0.0.1	3189	2021-01-26 14:23:35.773378+05:30	16	1
160	127.0.0.1	3189	2021-01-26 14:55:02.232535+05:30	16	1
161	127.0.0.1	3444	2021-01-26 15:24:21.585185+05:30	16	1
\.


--
-- Data for Name: analytics_usersession; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.analytics_usersession (id, ip_address, session_key, "timestamp", active, ended, user_id) FROM stdin;
1	127.0.0.1	mq0pq1iwoox3ivlin99mfconezrga8qh	2021-01-25 10:58:04.740523+05:30	t	f	1
2	127.0.0.1	wekkyl7xfrgesnpvztqjoxsuizun6x55	2021-01-26 14:19:52.536856+05:30	t	f	1
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add address	6	add_address
22	Can change address	6	change_address
23	Can delete address	6	delete_address
24	Can view address	6	view_address
25	Can add user	7	add_user
26	Can change user	7	change_user
27	Can delete user	7	delete_user
28	Can view user	7	view_user
29	Can add guest email	8	add_guestemail
30	Can change guest email	8	change_guestemail
31	Can delete guest email	8	delete_guestemail
32	Can view guest email	8	view_guestemail
33	Can add Object viewed	9	add_objectviewed
34	Can change Object viewed	9	change_objectviewed
35	Can delete Object viewed	9	delete_objectviewed
36	Can view Object viewed	9	view_objectviewed
37	Can add user session	10	add_usersession
38	Can change user session	10	change_usersession
39	Can delete user session	10	delete_usersession
40	Can view user session	10	view_usersession
41	Can add billing profile	11	add_billingprofile
42	Can change billing profile	11	change_billingprofile
43	Can delete billing profile	11	delete_billingprofile
44	Can view billing profile	11	view_billingprofile
45	Can add cart	12	add_cart
46	Can change cart	12	change_cart
47	Can delete cart	12	delete_cart
48	Can view cart	12	view_cart
49	Can add cart item	13	add_cartitem
50	Can change cart item	13	change_cartitem
51	Can delete cart item	13	delete_cartitem
52	Can view cart item	13	view_cartitem
53	Can add order	14	add_order
54	Can change order	14	change_order
55	Can delete order	14	delete_order
56	Can view order	14	view_order
57	Can add category	15	add_category
58	Can change category	15	change_category
59	Can delete category	15	delete_category
60	Can view category	15	view_category
61	Can add product	16	add_product
62	Can change product	16	change_product
63	Can delete product	16	delete_product
64	Can view product	16	view_product
65	Can add tag	17	add_tag
66	Can change tag	17	change_tag
67	Can delete tag	17	delete_tag
68	Can view tag	17	view_tag
\.


--
-- Data for Name: billing_billingprofile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.billing_billingprofile (id, email, active, update, "timestamp", user_id) FROM stdin;
1	admin@gmail.com	t	2021-01-11 14:05:12.953002+05:30	2021-01-11 14:05:12.953002+05:30	1
\.


--
-- Data for Name: carts_cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carts_cart (id, subtotal, total, updated, "timestamp", user_id) FROM stdin;
1	0.00	0.00	2021-01-12 17:15:35.250711+05:30	2021-01-12 17:06:54.465347+05:30	1
2	207.00	207.00	2021-01-12 17:24:38.113316+05:30	2021-01-12 17:24:34.686581+05:30	1
38	149.00	149.00	2021-01-26 14:20:08.889368+05:30	2021-01-26 14:19:11.936341+05:30	1
39	69.00	69.00	2021-01-26 14:23:23.008388+05:30	2021-01-26 14:20:32.579182+05:30	1
40	229.00	229.00	2021-01-26 14:23:40.074651+05:30	2021-01-26 14:23:35.779359+05:30	1
41	1999.00	1999.00	2021-01-26 14:55:05.018909+05:30	2021-01-26 14:55:02.236846+05:30	1
37	880.00	880.00	2021-01-26 15:24:25.45078+05:30	2021-01-25 16:21:42.636915+05:30	1
42	0.00	0.00	2021-01-26 15:27:18.217089+05:30	2021-01-26 15:27:18.217089+05:30	1
35	0.00	0.00	2021-01-23 12:20:58.855941+05:30	2021-01-13 10:50:46.673596+05:30	1
36	770.00	770.00	2021-01-25 13:03:57.938981+05:30	2021-01-25 11:17:57.890544+05:30	1
\.


--
-- Data for Name: carts_cartitem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carts_cartitem (id, quantity, cart_id, product_id, price) FROM stdin;
4	1	2	\N	149
5	2	2	\N	58
63	4	36	2957	596
64	6	36	2956	174
69	1	38	2957	149
70	1	39	3175	69
71	1	40	3190	229
72	1	41	3191	1999
73	1	37	3445	170
74	2	37	3446	710
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-01-11 14:19:06.12884+05:30	1	Commercial Products	1	[{"added": {}}]	15	1
2	2021-01-11 14:19:24.062452+05:30	2	Kitchen Garden	1	[{"added": {}}]	15	1
3	2021-01-11 14:20:54.539487+05:30	3	Herbs	1	[{"added": {}}]	15	1
4	2021-01-11 14:23:12.683891+05:30	4	Microgreens	1	[{"added": {}}]	15	1
5	2021-01-11 14:23:52.221946+05:30	5	Trees	1	[{"added": {}}]	15	1
6	2021-01-12 15:05:40.181682+05:30	3	Herbs	2	[{"changed": {"fields": ["File"]}}]	15	1
7	2021-01-13 10:53:38.855497+05:30	710	Chilly	3		16	1
8	2021-01-13 10:53:38.88009+05:30	709	Chilly	3		16	1
9	2021-01-13 10:53:38.881409+05:30	708	Chilly	3		16	1
10	2021-01-13 10:53:38.88241+05:30	707	Kholrabi/Knol-khol	3		16	1
11	2021-01-13 10:53:38.883406+05:30	706	Kholrabi/Knol-khol	3		16	1
12	2021-01-13 10:53:38.884433+05:30	705	Kholrabi/Knol-khol	3		16	1
13	2021-01-13 10:53:38.885402+05:30	704	Celery	3		16	1
14	2021-01-13 10:53:38.886889+05:30	703	Celery	3		16	1
15	2021-01-13 10:53:38.887684+05:30	702	Celery	3		16	1
16	2021-01-13 10:53:38.888371+05:30	701	Dill Seeds	3		16	1
17	2021-01-13 10:53:38.889372+05:30	700	Dill Seeds	3		16	1
18	2021-01-13 10:53:38.890404+05:30	699	Dill Seeds	3		16	1
19	2021-01-13 10:53:38.891404+05:30	698	Coriander	3		16	1
20	2021-01-13 10:53:38.892402+05:30	697	Coriander	3		16	1
21	2021-01-13 10:53:38.893398+05:30	696	Coriander	3		16	1
22	2021-01-13 10:53:38.894396+05:30	695	Fennel seeds (Sauf)	3		16	1
23	2021-01-13 10:53:38.895579+05:30	694	Fennel seeds (Sauf)	3		16	1
24	2021-01-13 10:53:38.896334+05:30	693	Fennel seeds (Sauf)	3		16	1
25	2021-01-13 10:53:38.897083+05:30	692	Carom seeds (Ajwain)	3		16	1
26	2021-01-13 10:53:38.897826+05:30	691	Carom seeds (Ajwain)	3		16	1
27	2021-01-13 10:53:38.89857+05:30	690	Carom seeds (Ajwain)	3		16	1
28	2021-01-13 10:53:38.89931+05:30	689	Cauliflower	3		16	1
29	2021-01-13 10:53:38.900049+05:30	688	Cauliflower	3		16	1
30	2021-01-13 10:53:38.900815+05:30	687	Cauliflower	3		16	1
31	2021-01-13 10:53:38.901558+05:30	686	Spinach/Palak	3		16	1
32	2021-01-13 10:53:38.902307+05:30	685	Spinach/Palak	3		16	1
33	2021-01-13 10:53:38.902307+05:30	684	Spinach/Palak	3		16	1
34	2021-01-13 10:53:38.903306+05:30	683	Carrot	3		16	1
35	2021-01-13 10:53:38.904304+05:30	682	Carrot	3		16	1
36	2021-01-13 10:53:38.904304+05:30	681	Carrot	3		16	1
37	2021-01-13 10:53:38.905301+05:30	680	Onion	3		16	1
38	2021-01-13 10:53:38.906582+05:30	679	Onion	3		16	1
39	2021-01-13 10:53:38.907319+05:30	678	Onion	3		16	1
40	2021-01-13 10:53:38.907319+05:30	677	Methi/Fenugreek	3		16	1
41	2021-01-13 10:53:38.908318+05:30	676	Methi/Fenugreek	3		16	1
42	2021-01-13 10:53:38.909388+05:30	675	Methi/Fenugreek	3		16	1
43	2021-01-13 10:53:38.909388+05:30	674	Beetroot	3		16	1
44	2021-01-13 10:53:38.910413+05:30	673	Beetroot	3		16	1
45	2021-01-13 10:53:38.911384+05:30	672	Beetroot	3		16	1
46	2021-01-13 10:53:38.912382+05:30	671	Broccoli	3		16	1
47	2021-01-13 10:53:38.91311+05:30	670	Broccoli	3		16	1
48	2021-01-13 10:53:38.913384+05:30	669	Broccoli	3		16	1
49	2021-01-13 10:53:38.914383+05:30	668	Kholrabi	3		16	1
50	2021-01-13 10:53:38.91538+05:30	667	Kholrabi	3		16	1
51	2021-01-13 10:53:38.916128+05:30	666	Kholrabi	3		16	1
52	2021-01-13 10:53:38.916857+05:30	665	Clover	3		16	1
53	2021-01-13 10:53:38.917489+05:30	664	Clover	3		16	1
54	2021-01-13 10:53:38.917489+05:30	663	Clover	3		16	1
55	2021-01-13 10:53:38.919004+05:30	662	Parsley Gaint	3		16	1
56	2021-01-13 10:53:38.919718+05:30	661	Parsley Gaint	3		16	1
57	2021-01-13 10:53:38.920387+05:30	660	Parsley Gaint	3		16	1
58	2021-01-13 10:53:38.920387+05:30	659	Red Lettuce	3		16	1
59	2021-01-13 10:53:38.921416+05:30	658	Red Lettuce	3		16	1
60	2021-01-13 10:53:38.922415+05:30	657	Red Lettuce	3		16	1
61	2021-01-13 10:53:38.923413+05:30	656	Lettuce	3		16	1
62	2021-01-13 10:53:38.923413+05:30	655	Lettuce	3		16	1
63	2021-01-13 10:53:38.924811+05:30	654	Lettuce	3		16	1
64	2021-01-13 10:53:38.925544+05:30	653	Pok Choi	3		16	1
65	2021-01-13 10:53:38.926275+05:30	652	Pok Choi	3		16	1
66	2021-01-13 10:53:38.926275+05:30	651	Pok Choi	3		16	1
67	2021-01-13 10:53:38.927274+05:30	650	Basil	3		16	1
68	2021-01-13 10:53:38.928297+05:30	649	Basil	3		16	1
69	2021-01-13 10:53:38.92931+05:30	648	Basil	3		16	1
70	2021-01-13 10:53:38.930391+05:30	647	Arugula	3		16	1
71	2021-01-13 10:53:38.931389+05:30	646	Arugula	3		16	1
72	2021-01-13 10:53:38.931389+05:30	645	Arugula	3		16	1
73	2021-01-13 10:53:38.932419+05:30	644	Mustard	3		16	1
74	2021-01-13 10:53:38.933386+05:30	643	Mustard	3		16	1
75	2021-01-13 10:53:38.933386+05:30	642	Mustard	3		16	1
76	2021-01-13 10:53:38.934383+05:30	641	Chia	3		16	1
77	2021-01-13 10:53:38.93538+05:30	640	Chia	3		16	1
78	2021-01-13 10:53:38.936378+05:30	639	Chia	3		16	1
79	2021-01-13 10:53:38.93694+05:30	638	Kale	3		16	1
80	2021-01-13 10:53:38.937572+05:30	637	Kale	3		16	1
81	2021-01-13 10:53:38.938206+05:30	636	Kale	3		16	1
82	2021-01-13 10:53:38.938847+05:30	635	Sesame	3		16	1
83	2021-01-13 10:53:38.93939+05:30	634	Sesame	3		16	1
84	2021-01-13 10:53:38.941297+05:30	633	Sesame	3		16	1
85	2021-01-13 10:53:38.942083+05:30	632	Alfalfa	3		16	1
86	2021-01-13 10:53:38.942827+05:30	631	Alfalfa	3		16	1
87	2021-01-13 10:53:38.943481+05:30	630	Alfalfa	3		16	1
88	2021-01-13 10:53:38.944387+05:30	629	Flax	3		16	1
89	2021-01-13 10:53:38.944387+05:30	628	Flax	3		16	1
90	2021-01-13 10:53:38.945386+05:30	627	Flax	3		16	1
91	2021-01-13 10:53:38.946384+05:30	626	Chinese Cabbage	3		16	1
92	2021-01-13 10:53:38.947395+05:30	625	Chinese Cabbage	3		16	1
93	2021-01-13 10:53:38.948382+05:30	624	Chinese Cabbage	3		16	1
94	2021-01-13 10:53:38.949159+05:30	623	Cabbage	3		16	1
95	2021-01-13 10:53:38.949911+05:30	622	Cabbage	3		16	1
96	2021-01-13 10:53:38.950194+05:30	621	Cabbage	3		16	1
97	2021-01-13 10:53:38.951194+05:30	620	White Radish (2 in 1)	3		16	1
98	2021-01-13 10:53:38.953292+05:30	619	White Radish (2 in 1)	3		16	1
99	2021-01-13 10:53:39.002726+05:30	618	White Radish (2 in 1)	3		16	1
100	2021-01-13 10:53:39.003727+05:30	617	Garden Cress	3		16	1
101	2021-01-13 10:53:39.045852+05:30	616	Garden Cress	3		16	1
102	2021-01-13 10:53:39.048842+05:30	615	Garden Cress	3		16	1
103	2021-01-13 10:53:39.050841+05:30	614	Amaranthus Green	3		16	1
104	2021-01-13 10:53:39.052868+05:30	613	Amaranthus Green	3		16	1
105	2021-01-13 10:53:39.05583+05:30	612	Amaranthus Green	3		16	1
106	2021-01-13 10:53:39.057823+05:30	611	Amaranthus Red	3		16	1
107	2021-01-13 10:53:47.997445+05:30	610	Amaranthus Red	3		16	1
108	2021-01-13 10:53:48.001676+05:30	609	Amaranthus Red	3		16	1
109	2021-01-13 10:53:48.002677+05:30	608	Tomato	3		16	1
110	2021-01-13 10:53:48.003705+05:30	607	Tomato	3		16	1
111	2021-01-13 10:53:48.005417+05:30	606	Tomato	3		16	1
112	2021-01-13 10:53:48.006417+05:30	605	Tomato	3		16	1
113	2021-01-13 10:53:48.007441+05:30	604	Tomato	3		16	1
114	2021-01-13 10:53:48.007441+05:30	603	Tomato	3		16	1
115	2021-01-13 10:53:48.008441+05:30	602	Tomato	3		16	1
116	2021-01-13 10:53:48.009439+05:30	601	Tomato	3		16	1
117	2021-01-13 10:53:48.010436+05:30	600	Avocado	3		16	1
118	2021-01-13 10:53:48.011681+05:30	599	Avocado	3		16	1
119	2021-01-13 10:53:48.012371+05:30	598	Avocado	3		16	1
120	2021-01-13 10:53:48.012997+05:30	597	Avocado	3		16	1
121	2021-01-13 10:53:48.012997+05:30	596	Avocado	3		16	1
122	2021-01-13 10:53:48.013996+05:30	595	Tamarind	3		16	1
123	2021-01-13 10:53:48.014993+05:30	594	Tamarind	3		16	1
124	2021-01-13 10:53:48.014993+05:30	593	Tamarind	3		16	1
125	2021-01-13 10:53:48.01599+05:30	592	Tamarind	3		16	1
126	2021-01-13 10:53:48.01599+05:30	591	Tamarind	3		16	1
127	2021-01-13 10:53:48.017234+05:30	590	Pomogranate	3		16	1
128	2021-01-13 10:53:48.017819+05:30	589	Pomogranate	3		16	1
129	2021-01-13 10:53:48.018397+05:30	588	Pomogranate	3		16	1
130	2021-01-13 10:53:48.018397+05:30	587	Pomogranate	3		16	1
131	2021-01-13 10:53:48.019397+05:30	586	Pomogranate	3		16	1
132	2021-01-13 10:53:48.019397+05:30	585	Chikkoo	3		16	1
133	2021-01-13 10:53:48.020394+05:30	584	Chikkoo	3		16	1
134	2021-01-13 10:53:48.021391+05:30	583	Chikkoo	3		16	1
135	2021-01-13 10:53:48.021391+05:30	582	Chikkoo	3		16	1
136	2021-01-13 10:53:48.023519+05:30	581	Chikkoo	3		16	1
137	2021-01-13 10:53:48.024485+05:30	580	Custard Apple	3		16	1
138	2021-01-13 10:53:48.025587+05:30	579	Custard Apple	3		16	1
139	2021-01-13 10:53:48.026443+05:30	578	Custard Apple	3		16	1
140	2021-01-13 10:53:48.028758+05:30	577	Custard Apple	3		16	1
141	2021-01-13 10:53:48.030112+05:30	576	Custard Apple	3		16	1
142	2021-01-13 10:53:48.030597+05:30	575	African Tulip	3		16	1
143	2021-01-13 10:53:48.032991+05:30	574	African Tulip	3		16	1
144	2021-01-13 10:53:48.034257+05:30	573	African Tulip	3		16	1
145	2021-01-13 10:53:48.034257+05:30	572	African Tulip	3		16	1
146	2021-01-13 10:53:48.035256+05:30	571	African Tulip	3		16	1
147	2021-01-13 10:53:48.036254+05:30	570	Raintree	3		16	1
148	2021-01-13 10:53:48.037251+05:30	569	Raintree	3		16	1
149	2021-01-13 10:53:48.037251+05:30	568	Raintree	3		16	1
150	2021-01-13 10:53:48.038248+05:30	567	Raintree	3		16	1
151	2021-01-13 10:53:48.039278+05:30	566	Raintree	3		16	1
152	2021-01-13 10:53:48.041214+05:30	565	Bauhinia	3		16	1
153	2021-01-13 10:53:48.041953+05:30	564	Bauhinia	3		16	1
154	2021-01-13 10:53:48.042605+05:30	563	Bauhinia	3		16	1
155	2021-01-13 10:53:48.0434+05:30	562	Bauhinia	3		16	1
156	2021-01-13 10:53:48.0434+05:30	561	Bauhinia	3		16	1
157	2021-01-13 10:53:48.044982+05:30	560	Tecoma	3		16	1
158	2021-01-13 10:53:48.045732+05:30	559	Tecoma	3		16	1
159	2021-01-13 10:53:48.046473+05:30	558	Tecoma	3		16	1
160	2021-01-13 10:53:48.047215+05:30	557	Tecoma	3		16	1
161	2021-01-13 10:53:48.048318+05:30	556	Tecoma	3		16	1
162	2021-01-13 10:53:48.049315+05:30	555	Trumpet Tree	3		16	1
163	2021-01-13 10:53:48.050542+05:30	554	Trumpet Tree	3		16	1
164	2021-01-13 10:53:48.051288+05:30	553	Trumpet Tree	3		16	1
165	2021-01-13 10:53:48.052028+05:30	552	Trumpet Tree	3		16	1
166	2021-01-13 10:53:48.052762+05:30	551	Trumpet Tree	3		16	1
167	2021-01-13 10:53:48.053498+05:30	550	Gulmohar	3		16	1
168	2021-01-13 10:53:48.054224+05:30	549	Gulmohar	3		16	1
169	2021-01-13 10:53:48.054963+05:30	548	Gulmohar	3		16	1
170	2021-01-13 10:53:48.055675+05:30	547	Gulmohar	3		16	1
171	2021-01-13 10:53:48.056918+05:30	546	Gulmohar	3		16	1
172	2021-01-13 10:53:48.057279+05:30	545	Acacia Magium	3		16	1
173	2021-01-13 10:53:48.058278+05:30	544	Acacia Magium	3		16	1
174	2021-01-13 10:53:48.059275+05:30	543	Acacia Magium	3		16	1
175	2021-01-13 10:53:48.060272+05:30	542	Acacia Magium	3		16	1
176	2021-01-13 10:53:48.060272+05:30	541	Acacia Magium	3		16	1
177	2021-01-13 10:53:48.06127+05:30	540	Eucalyptus Citriodora	3		16	1
178	2021-01-13 10:53:48.062682+05:30	539	Eucalyptus Citriodora	3		16	1
179	2021-01-13 10:53:48.064214+05:30	538	Eucalyptus Citriodora	3		16	1
180	2021-01-13 10:53:48.064976+05:30	537	Eucalyptus Citriodora	3		16	1
181	2021-01-13 10:53:48.065259+05:30	536	Eucalyptus Citriodora	3		16	1
182	2021-01-13 10:53:48.066468+05:30	535	Amla	3		16	1
183	2021-01-13 10:53:48.067207+05:30	534	Amla	3		16	1
184	2021-01-13 10:53:48.067207+05:30	533	Amla	3		16	1
185	2021-01-13 10:53:48.068206+05:30	532	Amla	3		16	1
186	2021-01-13 10:53:48.069331+05:30	531	Amla	3		16	1
187	2021-01-13 10:53:48.069981+05:30	530	Lagerstroemia	3		16	1
188	2021-01-13 10:53:48.069981+05:30	529	Lagerstroemia	3		16	1
189	2021-01-13 10:53:48.070981+05:30	528	Lagerstroemia	3		16	1
190	2021-01-13 10:53:48.072131+05:30	527	Lagerstroemia	3		16	1
191	2021-01-13 10:53:48.072909+05:30	526	Lagerstroemia	3		16	1
192	2021-01-13 10:53:48.074823+05:30	525	Soapnut	3		16	1
193	2021-01-13 10:53:48.074823+05:30	524	Soapnut	3		16	1
194	2021-01-13 10:53:48.075823+05:30	523	Soapnut	3		16	1
195	2021-01-13 10:53:48.07682+05:30	522	Soapnut	3		16	1
196	2021-01-13 10:53:48.077817+05:30	521	Soapnut	3		16	1
197	2021-01-13 10:53:48.077817+05:30	520	Areca Palm	3		16	1
198	2021-01-13 10:53:48.078815+05:30	519	Areca Palm	3		16	1
199	2021-01-13 10:53:48.079812+05:30	518	Areca Palm	3		16	1
200	2021-01-13 10:53:48.08082+05:30	517	Areca Palm	3		16	1
201	2021-01-13 10:53:48.08183+05:30	516	Areca Palm	3		16	1
202	2021-01-13 10:53:48.082915+05:30	515	Bamboo	3		16	1
203	2021-01-13 10:53:48.083705+05:30	514	Bamboo	3		16	1
204	2021-01-13 10:53:48.084422+05:30	513	Bamboo	3		16	1
205	2021-01-13 10:53:48.085139+05:30	512	Bamboo	3		16	1
206	2021-01-13 10:53:48.085856+05:30	511	Bamboo	3		16	1
207	2021-01-13 10:53:55.513814+05:30	510	Lucerne	3		16	1
208	2021-01-13 10:53:55.516806+05:30	509	Lucerne	3		16	1
209	2021-01-13 10:53:55.517832+05:30	508	Lucerne	3		16	1
210	2021-01-13 10:53:55.51883+05:30	507	Lucerne	3		16	1
211	2021-01-13 10:53:55.519798+05:30	506	Lucerne	3		16	1
212	2021-01-13 10:53:55.520795+05:30	505	Grass Seeds	3		16	1
213	2021-01-13 10:53:55.521793+05:30	504	Grass Seeds	3		16	1
214	2021-01-13 10:53:55.521793+05:30	503	Grass Seeds	3		16	1
215	2021-01-13 10:53:55.52279+05:30	502	Grass Seeds	3		16	1
216	2021-01-13 10:53:55.523787+05:30	501	Grass Seeds	3		16	1
217	2021-01-13 10:53:55.524715+05:30	500	Butea monosperma	3		16	1
218	2021-01-13 10:53:55.524715+05:30	499	Butea monosperma	3		16	1
219	2021-01-13 10:53:55.526714+05:30	498	Butea monosperma	3		16	1
633	2021-01-13 10:54:35.347858+05:30	84	Methi	3		16	1
220	2021-01-13 10:53:55.527744+05:30	497	Butea monosperma	3		16	1
221	2021-01-13 10:53:55.529167+05:30	496	Butea monosperma	3		16	1
222	2021-01-13 10:53:55.530267+05:30	495	Indian Elm (Tapasi)	3		16	1
223	2021-01-13 10:53:55.531468+05:30	494	Indian Elm (Tapasi)	3		16	1
224	2021-01-13 10:53:55.532682+05:30	493	Indian Elm (Tapasi)	3		16	1
225	2021-01-13 10:53:55.533732+05:30	492	Indian Elm (Tapasi)	3		16	1
226	2021-01-13 10:53:55.53617+05:30	491	Indian Elm (Tapasi)	3		16	1
227	2021-01-13 10:53:55.537332+05:30	490	Terminalia bellirica	3		16	1
228	2021-01-13 10:53:55.537613+05:30	489	Terminalia bellirica	3		16	1
229	2021-01-13 10:53:55.538613+05:30	488	Terminalia bellirica	3		16	1
230	2021-01-13 10:53:55.538613+05:30	487	Terminalia bellirica	3		16	1
231	2021-01-13 10:53:55.540608+05:30	486	Terminalia bellirica	3		16	1
232	2021-01-13 10:53:55.541544+05:30	485	Subabul	3		16	1
233	2021-01-13 10:53:55.542325+05:30	484	Subabul	3		16	1
234	2021-01-13 10:53:55.543321+05:30	483	Subabul	3		16	1
235	2021-01-13 10:53:55.544568+05:30	482	Subabul	3		16	1
236	2021-01-13 10:53:55.54531+05:30	481	Subabul	3		16	1
237	2021-01-13 10:53:55.546466+05:30	480	Neem	3		16	1
238	2021-01-13 10:53:55.546774+05:30	479	Neem	3		16	1
239	2021-01-13 10:53:55.547773+05:30	478	Neem	3		16	1
240	2021-01-13 10:53:55.547773+05:30	477	Neem	3		16	1
241	2021-01-13 10:53:55.548771+05:30	476	Neem	3		16	1
242	2021-01-13 10:53:55.549768+05:30	475	Melia Dubia	3		16	1
243	2021-01-13 10:53:55.550865+05:30	474	Melia Dubia	3		16	1
244	2021-01-13 10:53:55.552118+05:30	473	Melia Dubia	3		16	1
245	2021-01-13 10:53:55.5529+05:30	472	Melia Dubia	3		16	1
246	2021-01-13 10:53:55.5529+05:30	471	Melia Dubia	3		16	1
247	2021-01-13 10:53:55.553925+05:30	470	Terminalia elliptica	3		16	1
248	2021-01-13 10:53:55.554896+05:30	469	Terminalia elliptica	3		16	1
249	2021-01-13 10:53:55.556575+05:30	468	Terminalia elliptica	3		16	1
250	2021-01-13 10:53:55.556575+05:30	467	Terminalia elliptica	3		16	1
251	2021-01-13 10:53:55.557574+05:30	466	Terminalia elliptica	3		16	1
252	2021-01-13 10:53:55.558572+05:30	465	Almond 	3		16	1
253	2021-01-13 10:53:55.558572+05:30	464	Almond 	3		16	1
254	2021-01-13 10:53:55.561663+05:30	463	Almond 	3		16	1
255	2021-01-13 10:53:55.562561+05:30	462	Almond 	3		16	1
256	2021-01-13 10:53:55.563299+05:30	461	Almond 	3		16	1
257	2021-01-13 10:53:55.563578+05:30	460	Pterocarpus marsupium	3		16	1
258	2021-01-13 10:53:55.564577+05:30	459	Pterocarpus marsupium	3		16	1
259	2021-01-13 10:53:55.564577+05:30	458	Pterocarpus marsupium	3		16	1
260	2021-01-13 10:53:55.565995+05:30	457	Pterocarpus marsupium	3		16	1
261	2021-01-13 10:53:55.566755+05:30	456	Pterocarpus marsupium	3		16	1
262	2021-01-13 10:53:55.566755+05:30	455	Camara	3		16	1
263	2021-01-13 10:53:55.568781+05:30	454	Camara	3		16	1
264	2021-01-13 10:53:55.568781+05:30	453	Camara	3		16	1
265	2021-01-13 10:53:55.569774+05:30	452	Camara	3		16	1
266	2021-01-13 10:53:55.570893+05:30	451	Camara	3		16	1
267	2021-01-13 10:53:55.571726+05:30	450	Prosopis Juliflora	3		16	1
268	2021-01-13 10:53:55.571726+05:30	449	Prosopis Juliflora	3		16	1
269	2021-01-13 10:53:55.5731+05:30	448	Prosopis Juliflora	3		16	1
270	2021-01-13 10:53:55.574167+05:30	447	Prosopis Juliflora	3		16	1
271	2021-01-13 10:53:55.574905+05:30	446	Prosopis Juliflora	3		16	1
272	2021-01-13 10:53:55.57563+05:30	445	Gmelina arborea	3		16	1
273	2021-01-13 10:53:55.57563+05:30	444	Gmelina arborea	3		16	1
274	2021-01-13 10:53:55.57812+05:30	443	Gmelina arborea	3		16	1
275	2021-01-13 10:53:55.579039+05:30	442	Gmelina arborea	3		16	1
276	2021-01-13 10:53:55.57979+05:30	441	Gmelina arborea	3		16	1
277	2021-01-13 10:53:55.580512+05:30	440	Pongame	3		16	1
278	2021-01-13 10:53:55.581229+05:30	439	Pongame	3		16	1
279	2021-01-13 10:53:55.581855+05:30	438	Pongame	3		16	1
280	2021-01-13 10:53:55.581855+05:30	437	Pongame	3		16	1
281	2021-01-13 10:53:55.58339+05:30	436	Pongame	3		16	1
282	2021-01-13 10:53:55.584096+05:30	435	Rosewood	3		16	1
283	2021-01-13 10:53:55.584851+05:30	434	Rosewood	3		16	1
284	2021-01-13 10:53:55.586686+05:30	433	Rosewood	3		16	1
285	2021-01-13 10:53:55.587456+05:30	432	Rosewood	3		16	1
286	2021-01-13 10:53:55.587724+05:30	431	Rosewood	3		16	1
287	2021-01-13 10:53:55.588724+05:30	430	Silver Oak	3		16	1
288	2021-01-13 10:53:55.588724+05:30	429	Silver Oak	3		16	1
289	2021-01-13 10:53:55.589748+05:30	428	Silver Oak	3		16	1
290	2021-01-13 10:53:55.590718+05:30	427	Silver Oak	3		16	1
291	2021-01-13 10:53:55.59173+05:30	426	Silver Oak	3		16	1
292	2021-01-13 10:53:55.59247+05:30	425	Teak	3		16	1
293	2021-01-13 10:53:55.593029+05:30	424	Teak	3		16	1
294	2021-01-13 10:53:55.595008+05:30	423	Teak	3		16	1
295	2021-01-13 10:53:55.595008+05:30	422	Teak	3		16	1
296	2021-01-13 10:53:55.596007+05:30	421	Teak	3		16	1
297	2021-01-13 10:53:55.597161+05:30	420	Mahagony	3		16	1
298	2021-01-13 10:53:55.597916+05:30	419	Mahagony	3		16	1
299	2021-01-13 10:53:55.598403+05:30	418	Mahagony	3		16	1
300	2021-01-13 10:53:55.599247+05:30	417	Mahagony	3		16	1
301	2021-01-13 10:53:55.600035+05:30	416	Mahagony	3		16	1
302	2021-01-13 10:53:55.601041+05:30	415	Red Sandalwood	3		16	1
303	2021-01-13 10:53:55.603129+05:30	414	Red Sandalwood	3		16	1
304	2021-01-13 10:53:55.604038+05:30	413	Red Sandalwood	3		16	1
305	2021-01-13 10:53:55.604784+05:30	412	Red Sandalwood	3		16	1
306	2021-01-13 10:53:55.605511+05:30	411	Red Sandalwood	3		16	1
307	2021-01-13 10:54:03.268064+05:30	410	Sandalwood	3		16	1
308	2021-01-13 10:54:03.271763+05:30	409	Sandalwood	3		16	1
309	2021-01-13 10:54:03.272765+05:30	408	Sandalwood	3		16	1
310	2021-01-13 10:54:03.273617+05:30	407	Sandalwood	3		16	1
311	2021-01-13 10:54:03.274348+05:30	406	Sandalwood	3		16	1
312	2021-01-13 10:54:03.275273+05:30	405	Cabbage (Hybrid)	3		16	1
313	2021-01-13 10:54:03.275273+05:30	404	Cabbage (Hybrid)	3		16	1
314	2021-01-13 10:54:03.277271+05:30	403	Cabbage (Hybrid)	3		16	1
315	2021-01-13 10:54:03.278746+05:30	402	Cabbage	3		16	1
316	2021-01-13 10:54:03.279557+05:30	401	Cabbage	3		16	1
317	2021-01-13 10:54:03.280328+05:30	400	Cabbage	3		16	1
318	2021-01-13 10:54:03.280607+05:30	399	Red Lettuce	3		16	1
319	2021-01-13 10:54:03.281633+05:30	398	Red Lettuce	3		16	1
320	2021-01-13 10:54:03.281633+05:30	397	Red Lettuce	3		16	1
321	2021-01-13 10:54:03.282628+05:30	396	Lettuce	3		16	1
322	2021-01-13 10:54:03.283627+05:30	395	Lettuce	3		16	1
323	2021-01-13 10:54:03.283627+05:30	394	Lettuce	3		16	1
324	2021-01-13 10:54:03.285067+05:30	393	Pok Choi	3		16	1
325	2021-01-13 10:54:03.285067+05:30	392	Pok Choi	3		16	1
326	2021-01-13 10:54:03.286067+05:30	391	Pok Choi	3		16	1
327	2021-01-13 10:54:03.287064+05:30	390	Chinese Cabbage	3		16	1
328	2021-01-13 10:54:03.288061+05:30	389	Chinese Cabbage	3		16	1
329	2021-01-13 10:54:03.289456+05:30	388	Chinese Cabbage	3		16	1
330	2021-01-13 10:54:03.290205+05:30	387	BASIL	3		16	1
331	2021-01-13 10:54:03.290865+05:30	386	BASIL	3		16	1
332	2021-01-13 10:54:03.291512+05:30	385	BASIL	3		16	1
333	2021-01-13 10:54:03.292065+05:30	384	Oregano	3		16	1
334	2021-01-13 10:54:03.293013+05:30	383	Oregano	3		16	1
335	2021-01-13 10:54:03.293013+05:30	382	Oregano	3		16	1
336	2021-01-13 10:54:03.294013+05:30	381	Thyme	3		16	1
337	2021-01-13 10:54:03.29501+05:30	380	Thyme	3		16	1
338	2021-01-13 10:54:03.29501+05:30	379	Thyme	3		16	1
339	2021-01-13 10:54:03.296008+05:30	378	Leek	3		16	1
340	2021-01-13 10:54:03.297005+05:30	377	Leek	3		16	1
341	2021-01-13 10:54:03.298002+05:30	376	Leek	3		16	1
342	2021-01-13 10:54:03.299025+05:30	375	Kale	3		16	1
343	2021-01-13 10:54:03.300442+05:30	374	Kale	3		16	1
344	2021-01-13 10:54:03.301177+05:30	373	Kale	3		16	1
345	2021-01-13 10:54:03.301907+05:30	372	Chives	3		16	1
346	2021-01-13 10:54:03.302668+05:30	371	Chives	3		16	1
347	2021-01-13 10:54:03.302948+05:30	370	Chives	3		16	1
348	2021-01-13 10:54:03.303948+05:30	369	Celery	3		16	1
349	2021-01-13 10:54:03.303948+05:30	368	Celery	3		16	1
350	2021-01-13 10:54:03.305942+05:30	367	Celery	3		16	1
351	2021-01-13 10:54:03.306939+05:30	366	Rosemary	3		16	1
352	2021-01-13 10:54:03.307937+05:30	365	Rosemary	3		16	1
353	2021-01-13 10:54:03.308935+05:30	364	Rosemary	3		16	1
354	2021-01-13 10:54:03.308935+05:30	363	Mint	3		16	1
355	2021-01-13 10:54:03.309956+05:30	362	Mint	3		16	1
356	2021-01-13 10:54:03.311255+05:30	361	Mint	3		16	1
357	2021-01-13 10:54:03.311998+05:30	360	Parsley Gaint	3		16	1
358	2021-01-13 10:54:03.312743+05:30	359	Parsley Gaint	3		16	1
359	2021-01-13 10:54:03.31518+05:30	358	Parsley Gaint	3		16	1
360	2021-01-13 10:54:03.316111+05:30	357	Spinach/Palak	3		16	1
361	2021-01-13 10:54:03.316866+05:30	356	Spinach/Palak	3		16	1
362	2021-01-13 10:54:03.316866+05:30	355	Spinach/Palak	3		16	1
363	2021-01-13 10:54:03.317865+05:30	354	Methi/Fenugreek	3		16	1
364	2021-01-13 10:54:03.318863+05:30	353	Methi/Fenugreek	3		16	1
365	2021-01-13 10:54:03.318863+05:30	352	Methi/Fenugreek	3		16	1
366	2021-01-13 10:54:03.31986+05:30	351	Dill Seeds	3		16	1
367	2021-01-13 10:54:03.320892+05:30	350	Dill Seeds	3		16	1
368	2021-01-13 10:54:03.3224+05:30	349	Dill Seeds	3		16	1
369	2021-01-13 10:54:03.323181+05:30	348	Coriander	3		16	1
370	2021-01-13 10:54:03.323934+05:30	347	Coriander	3		16	1
371	2021-01-13 10:54:03.325267+05:30	346	Coriander	3		16	1
372	2021-01-13 10:54:03.326273+05:30	345	Amaranthus Red	3		16	1
373	2021-01-13 10:54:03.326273+05:30	344	Amaranthus Red	3		16	1
374	2021-01-13 10:54:03.327794+05:30	343	Amaranthus Red	3		16	1
375	2021-01-13 10:54:03.327794+05:30	342	Amaranthus Green	3		16	1
376	2021-01-13 10:54:03.328794+05:30	341	Amaranthus Green	3		16	1
377	2021-01-13 10:54:03.329821+05:30	340	Spinach/Palak	3		16	1
378	2021-01-13 10:54:03.330821+05:30	339	Spinach/Palak	3		16	1
379	2021-01-13 10:54:03.332056+05:30	338	Spinach/Palak	3		16	1
380	2021-01-13 10:54:03.332056+05:30	337	Parsley Gaint	3		16	1
381	2021-01-13 10:54:03.333213+05:30	336	Parsley Gaint	3		16	1
382	2021-01-13 10:54:03.334672+05:30	335	Parsley Gaint	3		16	1
383	2021-01-13 10:54:03.335359+05:30	334	Coriander	3		16	1
384	2021-01-13 10:54:03.336231+05:30	333	Coriander	3		16	1
385	2021-01-13 10:54:03.336985+05:30	332	Coriander	3		16	1
386	2021-01-13 10:54:03.337736+05:30	331	Dill Seeds	3		16	1
387	2021-01-13 10:54:03.339817+05:30	330	Dill Seeds	3		16	1
388	2021-01-13 10:54:03.340648+05:30	329	Dill Seeds	3		16	1
389	2021-01-13 10:54:03.341336+05:30	328	Methi/Fenugreek	3		16	1
390	2021-01-13 10:54:03.341336+05:30	327	Methi/Fenugreek	3		16	1
391	2021-01-13 10:54:03.342323+05:30	326	Methi/Fenugreek	3		16	1
392	2021-01-13 10:54:03.343323+05:30	325	Amaranthus Green	3		16	1
393	2021-01-13 10:54:03.344708+05:30	324	Amaranthus Green	3		16	1
394	2021-01-13 10:54:03.345469+05:30	323	Amaranthus Green	3		16	1
395	2021-01-13 10:54:03.346215+05:30	322	Amaranthus Red	3		16	1
396	2021-01-13 10:54:03.34828+05:30	321	Amaranthus Red	3		16	1
397	2021-01-13 10:54:03.34856+05:30	320	Amaranthus Red	3		16	1
398	2021-01-13 10:54:03.349559+05:30	319	Oregano	3		16	1
399	2021-01-13 10:54:03.350557+05:30	318	Oregano	3		16	1
400	2021-01-13 10:54:03.350557+05:30	317	Oregano	3		16	1
401	2021-01-13 10:54:03.351553+05:30	316	Leek	3		16	1
402	2021-01-13 10:54:03.352633+05:30	315	Leek	3		16	1
403	2021-01-13 10:54:03.353379+05:30	314	Leek	3		16	1
404	2021-01-13 10:54:03.354184+05:30	313	Kale	3		16	1
405	2021-01-13 10:54:03.354973+05:30	312	Kale	3		16	1
406	2021-01-13 10:54:03.356687+05:30	311	Kale	3		16	1
407	2021-01-13 10:54:09.344922+05:30	310	Celery	3		16	1
408	2021-01-13 10:54:09.34838+05:30	309	Celery	3		16	1
409	2021-01-13 10:54:09.350034+05:30	308	Celery	3		16	1
410	2021-01-13 10:54:09.350927+05:30	307	Basil	3		16	1
411	2021-01-13 10:54:09.351663+05:30	306	Basil	3		16	1
412	2021-01-13 10:54:09.352503+05:30	305	Basil	3		16	1
413	2021-01-13 10:54:09.352503+05:30	304	Chives	3		16	1
414	2021-01-13 10:54:09.354108+05:30	303	Chives	3		16	1
415	2021-01-13 10:54:09.354841+05:30	302	Chives	3		16	1
416	2021-01-13 10:54:09.355581+05:30	301	Thyme	3		16	1
417	2021-01-13 10:54:09.356308+05:30	300	Thyme	3		16	1
418	2021-01-13 10:54:09.357713+05:30	299	Thyme	3		16	1
419	2021-01-13 10:54:09.357933+05:30	298	Mint	3		16	1
420	2021-01-13 10:54:09.358933+05:30	297	Mint	3		16	1
421	2021-01-13 10:54:09.359931+05:30	296	Mint	3		16	1
422	2021-01-13 10:54:09.360927+05:30	295	Rosemary	3		16	1
423	2021-01-13 10:54:09.360927+05:30	294	Rosemary	3		16	1
424	2021-01-13 10:54:09.362302+05:30	293	Rosemary	3		16	1
425	2021-01-13 10:54:09.363228+05:30	292	Pok-Choi	3		16	1
426	2021-01-13 10:54:09.36372+05:30	291	Pok-Choi	3		16	1
427	2021-01-13 10:54:09.364656+05:30	290	Pok-Choi	3		16	1
428	2021-01-13 10:54:09.365404+05:30	289	Lettuce	3		16	1
429	2021-01-13 10:54:09.366202+05:30	288	Lettuce	3		16	1
430	2021-01-13 10:54:09.367388+05:30	287	Lettuce	3		16	1
431	2021-01-13 10:54:09.368154+05:30	286	Red Lettuce	3		16	1
432	2021-01-13 10:54:09.368899+05:30	285	Red Lettuce	3		16	1
433	2021-01-13 10:54:09.368899+05:30	284	Red Lettuce	3		16	1
434	2021-01-13 10:54:09.369898+05:30	283	Kholrabi/Knol-khol	3		16	1
435	2021-01-13 10:54:09.370926+05:30	282	Kholrabi/Knol-khol	3		16	1
436	2021-01-13 10:54:09.371933+05:30	281	Kholrabi/Knol-khol	3		16	1
437	2021-01-13 10:54:09.372923+05:30	280	Radish 2 in 1 (Palak and Radish)	3		16	1
438	2021-01-13 10:54:09.372923+05:30	279	Radish 2 in 1 (Palak and Radish)	3		16	1
439	2021-01-13 10:54:09.37392+05:30	278	Radish 2 in 1 (Palak and Radish)	3		16	1
440	2021-01-13 10:54:09.374917+05:30	277	Onion Light Red	3		16	1
441	2021-01-13 10:54:09.376653+05:30	276	Onion Light Red	3		16	1
442	2021-01-13 10:54:09.377418+05:30	275	Onion Light Red	3		16	1
443	2021-01-13 10:54:09.378154+05:30	274	Onion Dark Red	3		16	1
444	2021-01-13 10:54:09.378888+05:30	273	Onion Dark Red	3		16	1
445	2021-01-13 10:54:09.378888+05:30	272	Onion Dark Red	3		16	1
446	2021-01-13 10:54:09.379888+05:30	271	Muskmelon Rambo (Hybrid)	3		16	1
447	2021-01-13 10:54:09.380885+05:30	270	Muskmelon Rambo (Hybrid)	3		16	1
448	2021-01-13 10:54:09.380885+05:30	269	Muskmelon Rambo (Hybrid)	3		16	1
449	2021-01-13 10:54:09.381882+05:30	268	Muskmelon Sujay (Hybrid)	3		16	1
450	2021-01-13 10:54:09.383977+05:30	267	Muskmelon Sujay (Hybrid)	3		16	1
451	2021-01-13 10:54:09.384876+05:30	266	Muskmelon Sujay (Hybrid)	3		16	1
452	2021-01-13 10:54:09.385871+05:30	265	Muskmelon Samrat (Hybrid)	3		16	1
453	2021-01-13 10:54:09.386454+05:30	264	Muskmelon Samrat (Hybrid)	3		16	1
454	2021-01-13 10:54:09.386454+05:30	263	Muskmelon Samrat (Hybrid)	3		16	1
455	2021-01-13 10:54:09.387725+05:30	262	Muskmelon Mahi (Hybrid)	3		16	1
456	2021-01-13 10:54:09.387725+05:30	261	Muskmelon Mahi (Hybrid)	3		16	1
457	2021-01-13 10:54:09.388724+05:30	260	Muskmelon Mahi (Hybrid)	3		16	1
458	2021-01-13 10:54:09.389784+05:30	259	Marigold Yellow (Hybrid)	3		16	1
459	2021-01-13 10:54:09.390539+05:30	258	Marigold Yellow (Hybrid)	3		16	1
460	2021-01-13 10:54:09.39082+05:30	257	Marigold Yellow (Hybrid)	3		16	1
461	2021-01-13 10:54:09.392918+05:30	256	Marigold Orange (Hybrid)	3		16	1
462	2021-01-13 10:54:09.393815+05:30	255	Marigold Orange (Hybrid)	3		16	1
463	2021-01-13 10:54:09.393815+05:30	254	Marigold Orange (Hybrid)	3		16	1
464	2021-01-13 10:54:09.395265+05:30	253	Marigold Yellow	3		16	1
465	2021-01-13 10:54:09.395265+05:30	252	Marigold Yellow	3		16	1
466	2021-01-13 10:54:09.396265+05:30	251	Marigold Yellow	3		16	1
467	2021-01-13 10:54:09.397262+05:30	250	Marigold Orange	3		16	1
468	2021-01-13 10:54:09.398034+05:30	249	Marigold Orange	3		16	1
469	2021-01-13 10:54:09.39881+05:30	248	Marigold Orange	3		16	1
470	2021-01-13 10:54:09.399566+05:30	247	White Cucumber (Hybrid)	3		16	1
471	2021-01-13 10:54:09.401281+05:30	246	White Cucumber (Hybrid)	3		16	1
472	2021-01-13 10:54:09.401281+05:30	245	White Cucumber (Hybrid)	3		16	1
473	2021-01-13 10:54:09.40228+05:30	244	White Bittergourd (Hybrid)	3		16	1
474	2021-01-13 10:54:09.403276+05:30	243	White Bittergourd (Hybrid)	3		16	1
475	2021-01-13 10:54:09.404299+05:30	242	White Bittergourd (Hybrid)	3		16	1
476	2021-01-13 10:54:09.405087+05:30	241	Watermelon Green Stripes (Hybrid)	3		16	1
477	2021-01-13 10:54:09.405849+05:30	240	Watermelon Green Stripes (Hybrid)	3		16	1
478	2021-01-13 10:54:09.406592+05:30	239	Watermelon Green Stripes (Hybrid)	3		16	1
479	2021-01-13 10:54:09.407277+05:30	238	Watermelon Black (Hybrid)	3		16	1
480	2021-01-13 10:54:09.408452+05:30	237	Watermelon Black (Hybrid)	3		16	1
481	2021-01-13 10:54:09.409452+05:30	236	Watermelon Black (Hybrid)	3		16	1
482	2021-01-13 10:54:09.410644+05:30	235	Tomato Round Sour (Hybrid)	3		16	1
483	2021-01-13 10:54:09.411446+05:30	234	Tomato Round Sour (Hybrid)	3		16	1
484	2021-01-13 10:54:09.411446+05:30	233	Tomato Round Sour (Hybrid)	3		16	1
485	2021-01-13 10:54:09.412844+05:30	232	Tomato Oval (Hybrid)	3		16	1
486	2021-01-13 10:54:09.413455+05:30	231	Tomato Oval (Hybrid)	3		16	1
487	2021-01-13 10:54:09.414043+05:30	230	Tomato Oval (Hybrid)	3		16	1
488	2021-01-13 10:54:09.414628+05:30	229	Spongegourd Light Green (Hybrid)	3		16	1
489	2021-01-13 10:54:09.415405+05:30	228	Spongegourd Light Green (Hybrid)	3		16	1
490	2021-01-13 10:54:09.416122+05:30	227	Spongegourd Light Green (Hybrid)	3		16	1
491	2021-01-13 10:54:09.417953+05:30	226	Spongegourd Dark Green (Hybrid)	3		16	1
492	2021-01-13 10:54:09.418696+05:30	225	Spongegourd Dark Green (Hybrid)	3		16	1
493	2021-01-13 10:54:09.419415+05:30	224	Spongegourd Dark Green (Hybrid)	3		16	1
494	2021-01-13 10:54:09.420177+05:30	223	Round Bottlegourd (Hybrid)	3		16	1
495	2021-01-13 10:54:09.420909+05:30	222	Round Bottlegourd (Hybrid)	3		16	1
496	2021-01-13 10:54:09.421655+05:30	221	Round Bottlegourd (Hybrid)	3		16	1
497	2021-01-13 10:54:09.421936+05:30	220	Ridge Gourd (Hybrid)	3		16	1
498	2021-01-13 10:54:09.422935+05:30	219	Ridge Gourd (Hybrid)	3		16	1
499	2021-01-13 10:54:09.423934+05:30	218	Ridge Gourd (Hybrid)	3		16	1
500	2021-01-13 10:54:09.42613+05:30	217	Red Carrot (Hybrid)	3		16	1
501	2021-01-13 10:54:09.42726+05:30	216	Red Carrot (Hybrid)	3		16	1
502	2021-01-13 10:54:09.428032+05:30	215	Red Carrot (Hybrid)	3		16	1
503	2021-01-13 10:54:09.428775+05:30	214	Pumpkin Druva (Hybrid)	3		16	1
504	2021-01-13 10:54:09.429517+05:30	213	Pumpkin Druva (Hybrid)	3		16	1
505	2021-01-13 10:54:09.430252+05:30	212	Pumpkin Druva (Hybrid)	3		16	1
506	2021-01-13 10:54:09.430929+05:30	211	Pumpkin Boss (Hybrid)	3		16	1
507	2021-01-13 10:54:27.908279+05:30	210	Pumpkin Boss (Hybrid)	3		16	1
508	2021-01-13 10:54:27.913176+05:30	209	Pumpkin Boss (Hybrid)	3		16	1
509	2021-01-13 10:54:27.914173+05:30	208	Orange Carrot Nantes  (Hybrid)	3		16	1
510	2021-01-13 10:54:27.914926+05:30	207	Orange Carrot Nantes  (Hybrid)	3		16	1
511	2021-01-13 10:54:27.915806+05:30	206	Orange Carrot Nantes  (Hybrid)	3		16	1
512	2021-01-13 10:54:27.916545+05:30	205	Orange Carrot Kuroda (Hybrid)	3		16	1
513	2021-01-13 10:54:27.917385+05:30	204	Orange Carrot Kuroda (Hybrid)	3		16	1
514	2021-01-13 10:54:27.917385+05:30	203	Orange Carrot Kuroda (Hybrid)	3		16	1
515	2021-01-13 10:54:27.91841+05:30	202	Bottlegourd Long (Hybrid)	3		16	1
516	2021-01-13 10:54:27.919382+05:30	201	Bottlegourd Long (Hybrid)	3		16	1
517	2021-01-13 10:54:27.920409+05:30	200	Bottlegourd Long (Hybrid)	3		16	1
518	2021-01-13 10:54:27.921169+05:30	199	Green Bittergourd (Hybrid)	3		16	1
519	2021-01-13 10:54:27.922272+05:30	198	Green Bittergourd (Hybrid)	3		16	1
520	2021-01-13 10:54:27.923165+05:30	197	Green Bittergourd (Hybrid)	3		16	1
521	2021-01-13 10:54:27.923165+05:30	196	Chilly Dual Purpose-Dry/Fresh  (Hybrid)	3		16	1
522	2021-01-13 10:54:27.924163+05:30	195	Chilly Dual Purpose-Dry/Fresh  (Hybrid)	3		16	1
523	2021-01-13 10:54:27.925519+05:30	194	Chilly Dual Purpose-Dry/Fresh  (Hybrid)	3		16	1
524	2021-01-13 10:54:27.926302+05:30	193	Cucumber Light Green (Hybrid)	3		16	1
525	2021-01-13 10:54:27.927051+05:30	192	Cucumber Light Green (Hybrid)	3		16	1
526	2021-01-13 10:54:27.9278+05:30	191	Cucumber Light Green (Hybrid)	3		16	1
527	2021-01-13 10:54:27.928547+05:30	190	Cucumber Dark Green (Hybrid)	3		16	1
528	2021-01-13 10:54:27.92929+05:30	189	Cucumber Dark Green (Hybrid)	3		16	1
529	2021-01-13 10:54:27.930038+05:30	188	Cucumber Dark Green (Hybrid)	3		16	1
634	2021-01-13 10:54:35.349253+05:30	83	Palak	3		16	1
530	2021-01-13 10:54:27.930786+05:30	187	Chilly Spicy (Hybrid)	3		16	1
531	2021-01-13 10:54:27.931656+05:30	186	Chilly Spicy (Hybrid)	3		16	1
532	2021-01-13 10:54:27.933547+05:30	185	Chilly Spicy (Hybrid)	3		16	1
533	2021-01-13 10:54:27.93426+05:30	184	Chilly Dry/Tadka Purpose (Hybrid)	3		16	1
534	2021-01-13 10:54:27.93426+05:30	183	Chilly Dry/Tadka Purpose (Hybrid)	3		16	1
535	2021-01-13 10:54:27.935284+05:30	182	Chilly Dry/Tadka Purpose (Hybrid)	3		16	1
536	2021-01-13 10:54:27.936551+05:30	181	Chilly Bhajji  (Hybrid)	3		16	1
537	2021-01-13 10:54:27.937299+05:30	180	Chilly Bhajji  (Hybrid)	3		16	1
538	2021-01-13 10:54:27.937956+05:30	179	Chilly Bhajji  (Hybrid)	3		16	1
539	2021-01-13 10:54:27.938967+05:30	178	Chilly Achari  (Hybrid)	3		16	1
540	2021-01-13 10:54:27.938967+05:30	177	Chilly Achari  (Hybrid)	3		16	1
541	2021-01-13 10:54:27.940974+05:30	176	Chilly Achari  (Hybrid)	3		16	1
542	2021-01-13 10:54:27.942231+05:30	175	Cauliflower (Hybrid)	3		16	1
543	2021-01-13 10:54:27.943022+05:30	174	Cauliflower (Hybrid)	3		16	1
544	2021-01-13 10:54:27.943022+05:30	173	Cauliflower (Hybrid)	3		16	1
545	2021-01-13 10:54:27.944021+05:30	172	Cabbage (Hybrid)	3		16	1
546	2021-01-13 10:54:27.945036+05:30	171	Cabbage (Hybrid)	3		16	1
547	2021-01-13 10:54:27.945036+05:30	170	Cabbage (Hybrid)	3		16	1
548	2021-01-13 10:54:27.946036+05:30	169	Cabbage	3		16	1
549	2021-01-13 10:54:27.94713+05:30	168	Cabbage	3		16	1
550	2021-01-13 10:54:27.94713+05:30	167	Cabbage	3		16	1
551	2021-01-13 10:54:27.94813+05:30	166	Brinjal Naman (Hybrid)	3		16	1
552	2021-01-13 10:54:27.949127+05:30	165	Brinjal Naman (Hybrid)	3		16	1
553	2021-01-13 10:54:27.950527+05:30	164	Brinjal Naman (Hybrid)	3		16	1
554	2021-01-13 10:54:27.951264+05:30	163	Brinjal Myna (Hybrid)	3		16	1
555	2021-01-13 10:54:27.951986+05:30	162	Brinjal Myna (Hybrid)	3		16	1
556	2021-01-13 10:54:27.952614+05:30	161	Brinjal Myna (Hybrid)	3		16	1
557	2021-01-13 10:54:27.952614+05:30	160	Brinjal Hariya (Hybrid)	3		16	1
558	2021-01-13 10:54:27.953613+05:30	159	Brinjal Hariya (Hybrid)	3		16	1
559	2021-01-13 10:54:27.954644+05:30	158	Brinjal Hariya (Hybrid)	3		16	1
560	2021-01-13 10:54:27.954644+05:30	157	Brinjal Dhiraj (Hybrid)	3		16	1
561	2021-01-13 10:54:27.955608+05:30	156	Brinjal Dhiraj (Hybrid)	3		16	1
562	2021-01-13 10:54:27.957667+05:30	155	Brinjal Dhiraj (Hybrid)	3		16	1
563	2021-01-13 10:54:27.958403+05:30	154	Brinjal Aira (Hybrid)	3		16	1
564	2021-01-13 10:54:27.95923+05:30	153	Brinjal Aira (Hybrid)	3		16	1
565	2021-01-13 10:54:27.960404+05:30	152	Brinjal Aira (Hybrid)	3		16	1
566	2021-01-13 10:54:27.960404+05:30	151	Bhendi/Okra Mejestic (Hybrid)	3		16	1
567	2021-01-13 10:54:27.961428+05:30	150	Bhendi/Okra Mejestic (Hybrid)	3		16	1
568	2021-01-13 10:54:27.962401+05:30	149	Bhendi/Okra Mejestic (Hybrid)	3		16	1
569	2021-01-13 10:54:27.963398+05:30	148	Bhendi/Okra Deepa (Hybrid)	3		16	1
570	2021-01-13 10:54:27.963398+05:30	147	Bhendi/Okra Deepa (Hybrid)	3		16	1
571	2021-01-13 10:54:27.964396+05:30	146	Bhendi/Okra Deepa (Hybrid)	3		16	1
572	2021-01-13 10:54:27.966506+05:30	145	Beetroot Rado (Hybrid)	3		16	1
573	2021-01-13 10:54:27.967582+05:30	144	Beetroot Rado (Hybrid)	3		16	1
574	2021-01-13 10:54:27.968378+05:30	143	Beetroot Rado (Hybrid)	3		16	1
575	2021-01-13 10:54:27.969108+05:30	142	French Beans Tony	3		16	1
576	2021-01-13 10:54:27.969395+05:30	141	French Beans Tony	3		16	1
577	2021-01-13 10:54:27.970394+05:30	140	French Beans Tony	3		16	1
578	2021-01-13 10:54:27.970394+05:30	139	Chinese Cabbage	3		16	1
579	2021-01-13 10:54:27.971391+05:30	138	Chinese Cabbage	3		16	1
580	2021-01-13 10:54:27.972404+05:30	137	Chinese Cabbage	3		16	1
581	2021-01-13 10:54:27.975107+05:30	136	Brinjal Purple long	3		16	1
582	2021-01-13 10:54:27.976+05:30	135	Brinjal Purple long	3		16	1
583	2021-01-13 10:54:27.976745+05:30	134	Brinjal Purple long	3		16	1
584	2021-01-13 10:54:27.977469+05:30	133	Brinjal Black long	3		16	1
585	2021-01-13 10:54:27.978184+05:30	132	Brinjal Black long	3		16	1
586	2021-01-13 10:54:27.978891+05:30	131	Brinjal Black long	3		16	1
587	2021-01-13 10:54:27.979595+05:30	130	Beetroot Gulab	3		16	1
588	2021-01-13 10:54:27.98031+05:30	129	Beetroot Gulab	3		16	1
589	2021-01-13 10:54:27.98031+05:30	128	Beetroot Gulab	3		16	1
590	2021-01-13 10:54:27.98131+05:30	127	Watermelon	3		16	1
591	2021-01-13 10:54:27.983548+05:30	126	Watermelon	3		16	1
592	2021-01-13 10:54:27.984341+05:30	125	watermelon 	3		16	1
593	2021-01-13 10:54:27.985055+05:30	124	watermelon 	3		16	1
594	2021-01-13 10:54:27.985723+05:30	123	Watermelon	3		16	1
595	2021-01-13 10:54:27.986586+05:30	122	Watermelon	3		16	1
596	2021-01-13 10:54:27.986586+05:30	121	Tomato	3		16	1
597	2021-01-13 10:54:27.987585+05:30	120	Tomato	3		16	1
598	2021-01-13 10:54:27.988654+05:30	119	Tomato	3		16	1
599	2021-01-13 10:54:27.988654+05:30	118	Tomato	3		16	1
600	2021-01-13 10:54:27.989581+05:30	117	Tomato	3		16	1
601	2021-01-13 10:54:27.992506+05:30	116	Tomato	3		16	1
602	2021-01-13 10:54:27.993801+05:30	115	Tomato	3		16	1
603	2021-01-13 10:54:27.994535+05:30	114	Tomato	3		16	1
604	2021-01-13 10:54:27.995272+05:30	113	Sponge Gound	3		16	1
605	2021-01-13 10:54:27.996009+05:30	112	Sponge Gound	3		16	1
606	2021-01-13 10:54:27.996734+05:30	111	Sponge Gound	3		16	1
607	2021-01-13 10:54:35.155916+05:30	110	Sponge Gound	3		16	1
608	2021-01-13 10:54:35.188328+05:30	109	Ridge Gourd	3		16	1
609	2021-01-13 10:54:35.219633+05:30	108	Ridge Gourd	3		16	1
610	2021-01-13 10:54:35.24191+05:30	107	Radish	3		16	1
611	2021-01-13 10:54:35.277337+05:30	106	Radish	3		16	1
612	2021-01-13 10:54:35.309364+05:30	105	Pumpkin	3		16	1
613	2021-01-13 10:54:35.311358+05:30	104	Pumpkin	3		16	1
614	2021-01-13 10:54:35.313353+05:30	103	Pumpkin	3		16	1
615	2021-01-13 10:54:35.315117+05:30	102	Pumpkin	3		16	1
616	2021-01-13 10:54:35.316995+05:30	101	Muskmelon	3		16	1
617	2021-01-13 10:54:35.318994+05:30	100	Muskmelon	3		16	1
618	2021-01-13 10:54:35.321021+05:30	99	Muskmelon	3		16	1
619	2021-01-13 10:54:35.321987+05:30	98	Muskmelon	3		16	1
620	2021-01-13 10:54:35.323982+05:30	97	Muskmelon	3		16	1
621	2021-01-13 10:54:35.324978+05:30	96	Muskmelon	3		16	1
622	2021-01-13 10:54:35.328291+05:30	95	Muskmelon	3		16	1
623	2021-01-13 10:54:35.33029+05:30	94	Muskmelon	3		16	1
624	2021-01-13 10:54:35.332285+05:30	93	HY.Maize	3		16	1
625	2021-01-13 10:54:35.334078+05:30	92	HY.Maize	3		16	1
626	2021-01-13 10:54:35.336434+05:30	91	Cucumber	3		16	1
627	2021-01-13 10:54:35.338431+05:30	90	Cucumber	3		16	1
628	2021-01-13 10:54:35.339431+05:30	89	Cucumber	3		16	1
629	2021-01-13 10:54:35.341426+05:30	88	Cucumber	3		16	1
630	2021-01-13 10:54:35.342421+05:30	87	Cucumber	3		16	1
631	2021-01-13 10:54:35.344923+05:30	86	Cucumber	3		16	1
632	2021-01-13 10:54:35.34639+05:30	85	Methi	3		16	1
635	2021-01-13 10:54:35.350626+05:30	82	Palak	3		16	1
636	2021-01-13 10:54:35.353294+05:30	81	Coriander	3		16	1
637	2021-01-13 10:54:35.355223+05:30	80	Coriander	3		16	1
638	2021-01-13 10:54:35.357124+05:30	79	Coriander	3		16	1
639	2021-01-13 10:54:35.35896+05:30	78	Coriander	3		16	1
640	2021-01-13 10:54:35.361962+05:30	77	Chilly	3		16	1
641	2021-01-13 10:54:35.362957+05:30	76	Chilly	3		16	1
642	2021-01-13 10:54:35.365052+05:30	75	Chilly	3		16	1
643	2021-01-13 10:54:35.366427+05:30	74	Chilly	3		16	1
644	2021-01-13 10:54:35.367925+05:30	73	Chilly	3		16	1
645	2021-01-13 10:54:35.370017+05:30	72	Chilly	3		16	1
646	2021-01-13 10:54:35.371919+05:30	71	Chilly	3		16	1
647	2021-01-13 10:54:35.372918+05:30	70	Chilly	3		16	1
648	2021-01-13 10:54:35.374911+05:30	69	Chilly	3		16	1
649	2021-01-13 10:54:35.376773+05:30	68	Chilly	3		16	1
650	2021-01-13 10:54:35.378762+05:30	67	Chilly	3		16	1
651	2021-01-13 10:54:35.380698+05:30	66	Chilly	3		16	1
652	2021-01-13 10:54:35.382697+05:30	65	Chilly	3		16	1
653	2021-01-13 10:54:35.384692+05:30	64	Chilly	3		16	1
654	2021-01-13 10:54:35.386687+05:30	63	Chilly	3		16	1
655	2021-01-13 10:54:35.38868+05:30	62	Chilly	3		16	1
656	2021-01-13 10:54:35.390141+05:30	61	Chilly	3		16	1
657	2021-01-13 10:54:35.39185+05:30	60	Chilly	3		16	1
658	2021-01-13 10:54:35.39355+05:30	59	Carrot	3		16	1
659	2021-01-13 10:54:35.395616+05:30	58	Carrot	3		16	1
660	2021-01-13 10:54:35.3974+05:30	57	Carrot	3		16	1
661	2021-01-13 10:54:35.399402+05:30	56	Carrot	3		16	1
662	2021-01-13 10:54:35.4004+05:30	55	Carrot	3		16	1
663	2021-01-13 10:54:35.403453+05:30	54	Carrot	3		16	1
664	2021-01-13 10:54:35.404455+05:30	53	Carrot	3		16	1
665	2021-01-13 10:54:35.405484+05:30	52	Carrot	3		16	1
666	2021-01-13 10:54:35.407447+05:30	51	Capsicum	3		16	1
667	2021-01-13 10:54:35.408654+05:30	50	Capsicum	3		16	1
668	2021-01-13 10:54:35.411819+05:30	49	Redgram	3		16	1
669	2021-01-13 10:54:35.41389+05:30	48	Redgram	3		16	1
670	2021-01-13 10:54:35.4152+05:30	47	Redgram	3		16	1
671	2021-01-13 10:54:35.417203+05:30	46	Redgram	3		16	1
672	2021-01-13 10:54:35.419236+05:30	45	Beans 	3		16	1
673	2021-01-13 10:54:35.421038+05:30	44	Beans 	3		16	1
674	2021-01-13 10:54:35.422036+05:30	43	Brinjal 	3		16	1
675	2021-01-13 10:54:35.424029+05:30	42	Brinjal 	3		16	1
676	2021-01-13 10:54:35.425027+05:30	41	Brinjal 	3		16	1
677	2021-01-13 10:54:35.428204+05:30	40	Brinjal 	3		16	1
678	2021-01-13 10:54:35.430204+05:30	39	Brinjal 	3		16	1
679	2021-01-13 10:54:35.431442+05:30	38	Brinjal 	3		16	1
680	2021-01-13 10:54:35.432664+05:30	37	Brinjal	3		16	1
681	2021-01-13 10:54:35.433692+05:30	36	Brinjal	3		16	1
682	2021-01-13 10:54:35.43469+05:30	35	Brinjal	3		16	1
683	2021-01-13 10:54:35.436775+05:30	34	Brinjal	3		16	1
684	2021-01-13 10:54:35.438477+05:30	33	Brinjal	3		16	1
685	2021-01-13 10:54:35.440206+05:30	32	Brinjal	3		16	1
686	2021-01-13 10:54:35.442239+05:30	31	Brinjal	3		16	1
687	2021-01-13 10:54:35.444198+05:30	30	Brinjal	3		16	1
688	2021-01-13 10:54:35.445196+05:30	29	Brinjal	3		16	1
689	2021-01-13 10:54:35.446194+05:30	28	Brinjal	3		16	1
690	2021-01-13 10:54:35.448189+05:30	27	Brinjal	3		16	1
691	2021-01-13 10:54:35.449185+05:30	26	Brinjal	3		16	1
692	2021-01-13 10:54:35.450185+05:30	25	Bottle Gourd	3		16	1
693	2021-01-13 10:54:35.452177+05:30	24	Bottle Gourd	3		16	1
694	2021-01-13 10:54:35.453174+05:30	23	Bottle Gourd	3		16	1
695	2021-01-13 10:54:35.454203+05:30	22	Bottle Gourd	3		16	1
696	2021-01-13 10:54:35.4552+05:30	21	Bitter Gourd	3		16	1
697	2021-01-13 10:54:35.457165+05:30	20	Bitter Gourd	3		16	1
698	2021-01-13 10:54:35.458161+05:30	19	Bitter Gourd	3		16	1
699	2021-01-13 10:54:35.459158+05:30	18	Bitter Gourd	3		16	1
700	2021-01-13 10:54:35.461152+05:30	17	Bhendi/Okra	3		16	1
701	2021-01-13 10:54:35.462179+05:30	16	Bhendi/Okra	3		16	1
702	2021-01-13 10:54:35.463147+05:30	15	Bhendi/Okra	3		16	1
703	2021-01-13 10:54:35.464145+05:30	14	Bhendi/Okra	3		16	1
704	2021-01-13 10:54:35.465142+05:30	13	Bhendi/Okra	3		16	1
705	2021-01-13 10:54:35.465142+05:30	12	Bhendi/Okra	3		16	1
706	2021-01-13 10:54:35.466141+05:30	11	Bhendi/Okra	3		16	1
707	2021-01-13 10:54:44.498869+05:30	10	Bhendi/Okra	3		16	1
708	2021-01-13 10:54:44.502817+05:30	9	Bhendi/Okra	3		16	1
709	2021-01-13 10:54:44.502817+05:30	8	Bhendi/Okra	3		16	1
710	2021-01-13 10:54:44.503813+05:30	7	Bhendi/Okra	3		16	1
711	2021-01-13 10:54:44.504811+05:30	6	Bhendi/Okra	3		16	1
712	2021-01-13 10:54:44.505808+05:30	5	Beetroot	3		16	1
713	2021-01-13 10:54:44.506832+05:30	4	Beetroot	3		16	1
714	2021-01-13 10:54:44.507802+05:30	3	Beetroot	3		16	1
715	2021-01-13 10:54:44.507802+05:30	2	Amaranthus Green	3		16	1
716	2021-01-13 10:54:44.509163+05:30	1	Beetroot	3		16	1
717	2021-01-13 11:07:43.333579+05:30	1361	Avocado	3		16	1
718	2021-01-13 11:07:43.33785+05:30	1360	Avocado	3		16	1
719	2021-01-13 11:07:43.339233+05:30	1359	Avocado	3		16	1
720	2021-01-13 11:07:43.340591+05:30	1358	Avocado	3		16	1
721	2021-01-13 11:07:43.341591+05:30	1357	Avocado	3		16	1
722	2021-01-13 11:07:43.34262+05:30	1356	Tamarind	3		16	1
723	2021-01-13 11:07:43.34262+05:30	1355	Tamarind	3		16	1
724	2021-01-13 11:07:43.343627+05:30	1354	Tamarind	3		16	1
725	2021-01-13 11:07:43.344619+05:30	1353	Tamarind	3		16	1
726	2021-01-13 11:07:43.345638+05:30	1352	Tamarind	3		16	1
727	2021-01-13 11:07:43.34697+05:30	1351	Pomogranate	3		16	1
728	2021-01-13 11:07:43.34748+05:30	1350	Pomogranate	3		16	1
729	2021-01-13 11:07:43.349478+05:30	1349	Pomogranate	3		16	1
730	2021-01-13 11:07:43.350475+05:30	1348	Pomogranate	3		16	1
731	2021-01-13 11:07:43.350475+05:30	1347	Pomogranate	3		16	1
732	2021-01-13 11:07:43.351472+05:30	1346	Chikkoo	3		16	1
733	2021-01-13 11:07:43.352469+05:30	1345	Chikkoo	3		16	1
734	2021-01-13 11:07:43.353526+05:30	1344	Chikkoo	3		16	1
735	2021-01-13 11:07:43.353526+05:30	1343	Chikkoo	3		16	1
736	2021-01-13 11:07:43.354527+05:30	1342	Chikkoo	3		16	1
737	2021-01-13 11:07:43.355553+05:30	1341	Custard Apple	3		16	1
738	2021-01-13 11:07:43.355553+05:30	1340	Custard Apple	3		16	1
739	2021-01-13 11:07:43.356551+05:30	1339	Custard Apple	3		16	1
740	2021-01-13 11:07:43.357548+05:30	1338	Custard Apple	3		16	1
741	2021-01-13 11:07:43.359594+05:30	1337	Custard Apple	3		16	1
742	2021-01-13 11:07:43.359594+05:30	1336	African Tulip	3		16	1
743	2021-01-13 11:07:43.360576+05:30	1335	African Tulip	3		16	1
744	2021-01-13 11:07:43.361576+05:30	1334	African Tulip	3		16	1
745	2021-01-13 11:07:43.362573+05:30	1333	African Tulip	3		16	1
746	2021-01-13 11:07:43.363579+05:30	1332	African Tulip	3		16	1
747	2021-01-13 11:07:43.363579+05:30	1331	Raintree	3		16	1
748	2021-01-13 11:07:43.364567+05:30	1330	Raintree	3		16	1
749	2021-01-13 11:07:43.365808+05:30	1329	Raintree	3		16	1
750	2021-01-13 11:07:43.367693+05:30	1328	Raintree	3		16	1
751	2021-01-13 11:07:43.367693+05:30	1327	Raintree	3		16	1
752	2021-01-13 11:07:43.368717+05:30	1326	Bauhinia	3		16	1
753	2021-01-13 11:07:43.36969+05:30	1325	Bauhinia	3		16	1
754	2021-01-13 11:07:43.36969+05:30	1324	Bauhinia	3		16	1
755	2021-01-13 11:07:43.37117+05:30	1323	Bauhinia	3		16	1
756	2021-01-13 11:07:43.371452+05:30	1322	Bauhinia	3		16	1
757	2021-01-13 11:07:43.372451+05:30	1321	Tecoma	3		16	1
758	2021-01-13 11:07:43.372451+05:30	1320	Tecoma	3		16	1
759	2021-01-13 11:07:43.373449+05:30	1319	Tecoma	3		16	1
760	2021-01-13 11:07:43.376184+05:30	1318	Tecoma	3		16	1
761	2021-01-13 11:07:43.376947+05:30	1317	Tecoma	3		16	1
762	2021-01-13 11:07:43.377627+05:30	1316	Trumpet Tree	3		16	1
763	2021-01-13 11:07:43.377627+05:30	1315	Trumpet Tree	3		16	1
764	2021-01-13 11:07:43.378585+05:30	1314	Trumpet Tree	3		16	1
765	2021-01-13 11:07:43.379585+05:30	1313	Trumpet Tree	3		16	1
766	2021-01-13 11:07:43.38097+05:30	1312	Trumpet Tree	3		16	1
767	2021-01-13 11:07:43.381688+05:30	1311	Gulmohar	3		16	1
768	2021-01-13 11:07:43.381688+05:30	1310	Gulmohar	3		16	1
769	2021-01-13 11:07:43.383736+05:30	1309	Gulmohar	3		16	1
770	2021-01-13 11:07:43.384633+05:30	1308	Gulmohar	3		16	1
771	2021-01-13 11:07:43.385872+05:30	1307	Gulmohar	3		16	1
772	2021-01-13 11:07:43.386531+05:30	1306	Acacia Magium	3		16	1
773	2021-01-13 11:07:43.386531+05:30	1305	Acacia Magium	3		16	1
774	2021-01-13 11:07:43.387819+05:30	1304	Acacia Magium	3		16	1
775	2021-01-13 11:07:43.388818+05:30	1303	Acacia Magium	3		16	1
776	2021-01-13 11:07:43.388818+05:30	1302	Acacia Magium	3		16	1
777	2021-01-13 11:07:43.390212+05:30	1301	Eucalyptus Citriodora	3		16	1
778	2021-01-13 11:07:43.390212+05:30	1300	Eucalyptus Citriodora	3		16	1
779	2021-01-13 11:07:43.392737+05:30	1299	Eucalyptus Citriodora	3		16	1
780	2021-01-13 11:07:43.392737+05:30	1298	Eucalyptus Citriodora	3		16	1
781	2021-01-13 11:07:43.393619+05:30	1297	Eucalyptus Citriodora	3		16	1
782	2021-01-13 11:07:43.394618+05:30	1296	Amla	3		16	1
783	2021-01-13 11:07:43.395616+05:30	1295	Amla	3		16	1
784	2021-01-13 11:07:43.396614+05:30	1294	Amla	3		16	1
785	2021-01-13 11:07:43.397611+05:30	1293	Amla	3		16	1
786	2021-01-13 11:07:43.397611+05:30	1292	Amla	3		16	1
787	2021-01-13 11:07:43.399306+05:30	1291	Lagerstroemia	3		16	1
788	2021-01-13 11:07:43.40116+05:30	1290	Lagerstroemia	3		16	1
789	2021-01-13 11:07:43.40116+05:30	1289	Lagerstroemia	3		16	1
790	2021-01-13 11:07:43.402159+05:30	1288	Lagerstroemia	3		16	1
791	2021-01-13 11:07:43.403157+05:30	1287	Lagerstroemia	3		16	1
792	2021-01-13 11:07:43.404205+05:30	1286	Soapnut	3		16	1
793	2021-01-13 11:07:43.404961+05:30	1285	Soapnut	3		16	1
794	2021-01-13 11:07:43.405723+05:30	1284	Soapnut	3		16	1
795	2021-01-13 11:07:43.406484+05:30	1283	Soapnut	3		16	1
796	2021-01-13 11:07:43.407269+05:30	1282	Soapnut	3		16	1
797	2021-01-13 11:07:43.408541+05:30	1281	Areca Palm	3		16	1
798	2021-01-13 11:07:43.40934+05:30	1280	Areca Palm	3		16	1
799	2021-01-13 11:07:43.410087+05:30	1279	Areca Palm	3		16	1
800	2021-01-13 11:07:43.411087+05:30	1278	Areca Palm	3		16	1
801	2021-01-13 11:07:43.411087+05:30	1277	Areca Palm	3		16	1
802	2021-01-13 11:07:43.412472+05:30	1276	Bamboo	3		16	1
803	2021-01-13 11:07:43.413141+05:30	1275	Bamboo	3		16	1
804	2021-01-13 11:07:43.413999+05:30	1274	Bamboo	3		16	1
805	2021-01-13 11:07:43.413999+05:30	1273	Bamboo	3		16	1
806	2021-01-13 11:07:43.414998+05:30	1272	Bamboo	3		16	1
807	2021-01-13 11:07:43.414998+05:30	1271	Lucerne	3		16	1
808	2021-01-13 11:07:43.417003+05:30	1270	Lucerne	3		16	1
809	2021-01-13 11:07:43.417003+05:30	1269	Lucerne	3		16	1
810	2021-01-13 11:07:43.417991+05:30	1268	Lucerne	3		16	1
811	2021-01-13 11:07:43.419017+05:30	1267	Lucerne	3		16	1
812	2021-01-13 11:07:43.419017+05:30	1266	Grass Seeds	3		16	1
813	2021-01-13 11:07:43.420017+05:30	1265	Grass Seeds	3		16	1
814	2021-01-13 11:07:43.421013+05:30	1264	Grass Seeds	3		16	1
815	2021-01-13 11:07:43.422147+05:30	1263	Grass Seeds	3		16	1
816	2021-01-13 11:07:43.422904+05:30	1262	Grass Seeds	3		16	1
817	2021-01-13 11:07:49.678698+05:30	1261	Butea monosperma	3		16	1
818	2021-01-13 11:07:49.682726+05:30	1260	Butea monosperma	3		16	1
819	2021-01-13 11:07:49.684468+05:30	1259	Butea monosperma	3		16	1
820	2021-01-13 11:07:49.685349+05:30	1258	Butea monosperma	3		16	1
821	2021-01-13 11:07:49.685629+05:30	1257	Butea monosperma	3		16	1
822	2021-01-13 11:07:49.686628+05:30	1256	Indian Elm (Tapasi)	3		16	1
823	2021-01-13 11:07:49.687651+05:30	1255	Indian Elm (Tapasi)	3		16	1
824	2021-01-13 11:07:49.688446+05:30	1254	Indian Elm (Tapasi)	3		16	1
825	2021-01-13 11:07:49.689185+05:30	1253	Indian Elm (Tapasi)	3		16	1
826	2021-01-13 11:07:49.689918+05:30	1252	Indian Elm (Tapasi)	3		16	1
827	2021-01-13 11:07:49.690643+05:30	1251	Terminalia bellirica	3		16	1
828	2021-01-13 11:07:49.692225+05:30	1250	Terminalia bellirica	3		16	1
829	2021-01-13 11:07:49.692895+05:30	1249	Terminalia bellirica	3		16	1
830	2021-01-13 11:07:49.693729+05:30	1248	Terminalia bellirica	3		16	1
831	2021-01-13 11:07:49.693729+05:30	1247	Terminalia bellirica	3		16	1
832	2021-01-13 11:07:49.69473+05:30	1246	Subabul	3		16	1
833	2021-01-13 11:07:49.695726+05:30	1245	Subabul	3		16	1
834	2021-01-13 11:07:49.696744+05:30	1244	Subabul	3		16	1
835	2021-01-13 11:07:49.697395+05:30	1243	Subabul	3		16	1
836	2021-01-13 11:07:49.698366+05:30	1242	Subabul	3		16	1
837	2021-01-13 11:07:49.698645+05:30	1241	Neem	3		16	1
838	2021-01-13 11:07:49.699645+05:30	1240	Neem	3		16	1
839	2021-01-13 11:07:49.699645+05:30	1239	Neem	3		16	1
840	2021-01-13 11:07:49.700642+05:30	1238	Neem	3		16	1
841	2021-01-13 11:07:49.701638+05:30	1237	Neem	3		16	1
842	2021-01-13 11:07:49.702725+05:30	1236	Melia Dubia	3		16	1
843	2021-01-13 11:07:49.703721+05:30	1235	Melia Dubia	3		16	1
844	2021-01-13 11:07:49.704488+05:30	1234	Melia Dubia	3		16	1
845	2021-01-13 11:07:49.705238+05:30	1233	Melia Dubia	3		16	1
846	2021-01-13 11:07:49.705893+05:30	1232	Melia Dubia	3		16	1
847	2021-01-13 11:07:49.706749+05:30	1231	Terminalia elliptica	3		16	1
848	2021-01-13 11:07:49.706749+05:30	1230	Terminalia elliptica	3		16	1
849	2021-01-13 11:07:49.707773+05:30	1229	Terminalia elliptica	3		16	1
850	2021-01-13 11:07:49.708746+05:30	1228	Terminalia elliptica	3		16	1
851	2021-01-13 11:07:49.709734+05:30	1227	Terminalia elliptica	3		16	1
852	2021-01-13 11:07:49.710733+05:30	1226	Almond 	3		16	1
853	2021-01-13 11:07:49.711731+05:30	1225	Almond 	3		16	1
1484	2021-01-15 10:29:17.216069+05:30	1968	Tecoma	3		16	1
854	2021-01-13 11:07:49.712729+05:30	1224	Almond 	3		16	1
855	2021-01-13 11:07:49.713826+05:30	1223	Almond 	3		16	1
856	2021-01-13 11:07:49.714596+05:30	1222	Almond 	3		16	1
857	2021-01-13 11:07:49.714881+05:30	1221	Pterocarpus marsupium	3		16	1
858	2021-01-13 11:07:49.715881+05:30	1220	Pterocarpus marsupium	3		16	1
859	2021-01-13 11:07:49.715881+05:30	1219	Pterocarpus marsupium	3		16	1
860	2021-01-13 11:07:49.716878+05:30	1218	Pterocarpus marsupium	3		16	1
861	2021-01-13 11:07:49.718156+05:30	1217	Pterocarpus marsupium	3		16	1
862	2021-01-13 11:07:49.718991+05:30	1216	Camara	3		16	1
863	2021-01-13 11:07:49.720329+05:30	1215	Camara	3		16	1
864	2021-01-13 11:07:49.720607+05:30	1214	Camara	3		16	1
865	2021-01-13 11:07:49.721606+05:30	1213	Camara	3		16	1
866	2021-01-13 11:07:49.722603+05:30	1212	Camara	3		16	1
867	2021-01-13 11:07:49.722603+05:30	1211	Prosopis Juliflora	3		16	1
868	2021-01-13 11:07:49.7236+05:30	1210	Prosopis Juliflora	3		16	1
869	2021-01-13 11:07:49.724674+05:30	1209	Prosopis Juliflora	3		16	1
870	2021-01-13 11:07:49.725464+05:30	1208	Prosopis Juliflora	3		16	1
871	2021-01-13 11:07:49.726121+05:30	1207	Prosopis Juliflora	3		16	1
872	2021-01-13 11:07:49.726884+05:30	1206	Gmelina arborea	3		16	1
873	2021-01-13 11:07:49.727975+05:30	1205	Gmelina arborea	3		16	1
874	2021-01-13 11:07:49.729062+05:30	1204	Gmelina arborea	3		16	1
875	2021-01-13 11:07:49.729821+05:30	1203	Gmelina arborea	3		16	1
876	2021-01-13 11:07:49.730567+05:30	1202	Gmelina arborea	3		16	1
877	2021-01-13 11:07:49.731307+05:30	1201	Pongame	3		16	1
878	2021-01-13 11:07:49.73205+05:30	1200	Pongame	3		16	1
879	2021-01-13 11:07:49.732784+05:30	1199	Pongame	3		16	1
880	2021-01-13 11:07:49.733511+05:30	1198	Pongame	3		16	1
881	2021-01-13 11:07:49.733511+05:30	1197	Pongame	3		16	1
882	2021-01-13 11:07:49.73451+05:30	1196	Rosewood	3		16	1
883	2021-01-13 11:07:49.735612+05:30	1195	Rosewood	3		16	1
884	2021-01-13 11:07:49.737223+05:30	1194	Rosewood	3		16	1
885	2021-01-13 11:07:49.738759+05:30	1193	Rosewood	3		16	1
886	2021-01-13 11:07:49.739654+05:30	1192	Rosewood	3		16	1
887	2021-01-13 11:07:49.740423+05:30	1191	Silver Oak	3		16	1
888	2021-01-13 11:07:49.741178+05:30	1190	Silver Oak	3		16	1
889	2021-01-13 11:07:49.741919+05:30	1189	Silver Oak	3		16	1
890	2021-01-13 11:07:49.742667+05:30	1188	Silver Oak	3		16	1
891	2021-01-13 11:07:49.742667+05:30	1187	Silver Oak	3		16	1
892	2021-01-13 11:07:49.743666+05:30	1186	Teak	3		16	1
893	2021-01-13 11:07:49.745692+05:30	1185	Teak	3		16	1
894	2021-01-13 11:07:49.74666+05:30	1184	Teak	3		16	1
895	2021-01-13 11:07:49.747656+05:30	1183	Teak	3		16	1
896	2021-01-13 11:07:49.747656+05:30	1182	Teak	3		16	1
897	2021-01-13 11:07:49.749233+05:30	1181	Mahagony	3		16	1
898	2021-01-13 11:07:49.749957+05:30	1180	Mahagony	3		16	1
899	2021-01-13 11:07:49.750681+05:30	1179	Mahagony	3		16	1
900	2021-01-13 11:07:49.751396+05:30	1178	Mahagony	3		16	1
901	2021-01-13 11:07:49.752111+05:30	1177	Mahagony	3		16	1
902	2021-01-13 11:07:49.752863+05:30	1176	Red Sandalwood	3		16	1
903	2021-01-13 11:07:49.754394+05:30	1175	Red Sandalwood	3		16	1
904	2021-01-13 11:07:49.755321+05:30	1174	Red Sandalwood	3		16	1
905	2021-01-13 11:07:49.756054+05:30	1173	Red Sandalwood	3		16	1
906	2021-01-13 11:07:49.756705+05:30	1172	Red Sandalwood	3		16	1
907	2021-01-13 11:07:49.756705+05:30	1171	Sandalwood	3		16	1
908	2021-01-13 11:07:49.758175+05:30	1170	Sandalwood	3		16	1
909	2021-01-13 11:07:49.758994+05:30	1169	Sandalwood	3		16	1
910	2021-01-13 11:07:49.759732+05:30	1168	Sandalwood	3		16	1
911	2021-01-13 11:07:49.760462+05:30	1167	Sandalwood	3		16	1
912	2021-01-13 11:07:49.760462+05:30	1166	Chilly	3		16	1
913	2021-01-13 11:07:49.762999+05:30	1165	Chilly	3		16	1
914	2021-01-13 11:07:49.763706+05:30	1164	Chilly	3		16	1
915	2021-01-13 11:07:49.763706+05:30	1163	Kholrabi/Knol-khol	3		16	1
916	2021-01-13 11:07:49.764746+05:30	1162	Kholrabi/Knol-khol	3		16	1
917	2021-01-13 11:07:56.887693+05:30	1161	Kholrabi/Knol-khol	3		16	1
918	2021-01-13 11:07:56.891044+05:30	1160	Celery	3		16	1
919	2021-01-13 11:07:56.892545+05:30	1159	Celery	3		16	1
920	2021-01-13 11:07:56.893635+05:30	1158	Celery	3		16	1
921	2021-01-13 11:07:56.89454+05:30	1157	Dill Seeds	3		16	1
922	2021-01-13 11:07:56.896533+05:30	1156	Dill Seeds	3		16	1
923	2021-01-13 11:07:56.897671+05:30	1155	Dill Seeds	3		16	1
924	2021-01-13 11:07:56.898671+05:30	1154	Coriander	3		16	1
925	2021-01-13 11:07:56.90016+05:30	1153	Coriander	3		16	1
926	2021-01-13 11:07:56.900724+05:30	1152	Coriander	3		16	1
927	2021-01-13 11:07:56.901602+05:30	1151	Fennel seeds (Sauf)	3		16	1
928	2021-01-13 11:07:56.902206+05:30	1150	Fennel seeds (Sauf)	3		16	1
929	2021-01-13 11:07:56.902799+05:30	1149	Fennel seeds (Sauf)	3		16	1
930	2021-01-13 11:07:56.903382+05:30	1148	Carom seeds (Ajwain)	3		16	1
931	2021-01-13 11:07:56.903969+05:30	1147	Carom seeds (Ajwain)	3		16	1
932	2021-01-13 11:07:56.904551+05:30	1146	Carom seeds (Ajwain)	3		16	1
933	2021-01-13 11:07:56.905127+05:30	1145	Cauliflower	3		16	1
934	2021-01-13 11:07:56.905709+05:30	1144	Cauliflower	3		16	1
935	2021-01-13 11:07:56.907883+05:30	1143	Cauliflower	3		16	1
936	2021-01-13 11:07:56.908654+05:30	1142	Spinach/Palak	3		16	1
937	2021-01-13 11:07:56.909427+05:30	1141	Spinach/Palak	3		16	1
938	2021-01-13 11:07:56.909691+05:30	1140	Spinach/Palak	3		16	1
939	2021-01-13 11:07:56.910692+05:30	1139	Carrot	3		16	1
940	2021-01-13 11:07:56.911687+05:30	1138	Carrot	3		16	1
941	2021-01-13 11:07:56.913038+05:30	1137	Carrot	3		16	1
942	2021-01-13 11:07:56.913539+05:30	1136	Onion	3		16	1
943	2021-01-13 11:07:56.915726+05:30	1135	Onion	3		16	1
944	2021-01-13 11:07:56.916544+05:30	1134	Onion	3		16	1
945	2021-01-13 11:07:56.917559+05:30	1133	Methi/Fenugreek	3		16	1
946	2021-01-13 11:07:56.919372+05:30	1132	Methi/Fenugreek	3		16	1
947	2021-01-13 11:07:56.920318+05:30	1131	Methi/Fenugreek	3		16	1
948	2021-01-13 11:07:56.921408+05:30	1130	Beetroot	3		16	1
949	2021-01-13 11:07:56.922345+05:30	1129	Beetroot	3		16	1
950	2021-01-13 11:07:56.924423+05:30	1128	Beetroot	3		16	1
951	2021-01-13 11:07:56.925422+05:30	1127	Broccoli	3		16	1
952	2021-01-13 11:07:56.925422+05:30	1126	Broccoli	3		16	1
953	2021-01-13 11:07:56.92642+05:30	1125	Broccoli	3		16	1
954	2021-01-13 11:07:56.927429+05:30	1124	Kholrabi	3		16	1
955	2021-01-13 11:07:56.928364+05:30	1123	Kholrabi	3		16	1
956	2021-01-13 11:07:56.929127+05:30	1122	Kholrabi	3		16	1
957	2021-01-13 11:07:56.929844+05:30	1121	Clover	3		16	1
958	2021-01-13 11:07:56.930559+05:30	1120	Clover	3		16	1
959	2021-01-13 11:07:56.931925+05:30	1119	Clover	3		16	1
960	2021-01-13 11:07:56.932693+05:30	1118	Parsley Gaint	3		16	1
961	2021-01-13 11:07:56.933421+05:30	1117	Parsley Gaint	3		16	1
962	2021-01-13 11:07:56.933684+05:30	1116	Parsley Gaint	3		16	1
963	2021-01-13 11:07:56.934683+05:30	1115	Red Lettuce	3		16	1
964	2021-01-13 11:07:56.935786+05:30	1114	Red Lettuce	3		16	1
965	2021-01-13 11:07:56.936766+05:30	1113	Red Lettuce	3		16	1
966	2021-01-13 11:07:56.936766+05:30	1112	Lettuce	3		16	1
967	2021-01-13 11:07:56.937675+05:30	1111	Lettuce	3		16	1
968	2021-01-13 11:07:56.938672+05:30	1110	Lettuce	3		16	1
969	2021-01-13 11:07:56.941095+05:30	1109	Pok Choi	3		16	1
970	2021-01-13 11:07:56.941852+05:30	1108	Pok Choi	3		16	1
971	2021-01-13 11:07:56.942602+05:30	1107	Pok Choi	3		16	1
972	2021-01-13 11:07:56.94333+05:30	1106	Basil	3		16	1
973	2021-01-13 11:07:56.94333+05:30	1105	Basil	3		16	1
974	2021-01-13 11:07:56.944942+05:30	1104	Basil	3		16	1
975	2021-01-13 11:07:56.945688+05:30	1103	Arugula	3		16	1
976	2021-01-13 11:07:56.946339+05:30	1102	Arugula	3		16	1
977	2021-01-13 11:07:56.946339+05:30	1101	Arugula	3		16	1
978	2021-01-13 11:07:56.949544+05:30	1100	Mustard	3		16	1
979	2021-01-13 11:07:56.950351+05:30	1099	Mustard	3		16	1
980	2021-01-13 11:07:56.951109+05:30	1098	Mustard	3		16	1
981	2021-01-13 11:07:56.95139+05:30	1097	Chia	3		16	1
982	2021-01-13 11:07:56.95239+05:30	1096	Chia	3		16	1
983	2021-01-13 11:07:56.95239+05:30	1095	Chia	3		16	1
984	2021-01-13 11:07:56.953902+05:30	1094	Kale	3		16	1
985	2021-01-13 11:07:56.954792+05:30	1093	Kale	3		16	1
986	2021-01-13 11:07:56.954792+05:30	1092	Kale	3		16	1
987	2021-01-13 11:07:56.955792+05:30	1091	Sesame	3		16	1
988	2021-01-13 11:07:56.957997+05:30	1090	Sesame	3		16	1
989	2021-01-13 11:07:56.958674+05:30	1089	Sesame	3		16	1
990	2021-01-13 11:07:56.959457+05:30	1088	Alfalfa	3		16	1
991	2021-01-13 11:07:56.959457+05:30	1087	Alfalfa	3		16	1
992	2021-01-13 11:07:56.960456+05:30	1086	Alfalfa	3		16	1
993	2021-01-13 11:07:56.961454+05:30	1085	Flax	3		16	1
994	2021-01-13 11:07:56.962451+05:30	1084	Flax	3		16	1
995	2021-01-13 11:07:56.963449+05:30	1083	Flax	3		16	1
996	2021-01-13 11:07:56.964411+05:30	1082	Chinese Cabbage	3		16	1
997	2021-01-13 11:07:56.965911+05:30	1081	Chinese Cabbage	3		16	1
998	2021-01-13 11:07:56.966532+05:30	1080	Chinese Cabbage	3		16	1
999	2021-01-13 11:07:56.967128+05:30	1079	Cabbage	3		16	1
1000	2021-01-13 11:07:56.967713+05:30	1078	Cabbage	3		16	1
1001	2021-01-13 11:07:56.9683+05:30	1077	Cabbage	3		16	1
1002	2021-01-13 11:07:56.968886+05:30	1076	White Radish (2 in 1)	3		16	1
1003	2021-01-13 11:07:56.969473+05:30	1075	White Radish (2 in 1)	3		16	1
1004	2021-01-13 11:07:56.970056+05:30	1074	White Radish (2 in 1)	3		16	1
1005	2021-01-13 11:07:56.97064+05:30	1073	Garden Cress	3		16	1
1006	2021-01-13 11:07:56.971833+05:30	1072	Garden Cress	3		16	1
1007	2021-01-13 11:07:56.972455+05:30	1071	Garden Cress	3		16	1
1008	2021-01-13 11:07:56.974537+05:30	1070	Amaranthus Green	3		16	1
1009	2021-01-13 11:07:56.974537+05:30	1069	Amaranthus Green	3		16	1
1010	2021-01-13 11:07:56.975536+05:30	1068	Amaranthus Green	3		16	1
1011	2021-01-13 11:07:56.976534+05:30	1067	Amaranthus Red	3		16	1
1012	2021-01-13 11:07:56.977531+05:30	1066	Amaranthus Red	3		16	1
1013	2021-01-13 11:07:56.977531+05:30	1065	Amaranthus Red	3		16	1
1014	2021-01-13 11:07:56.978528+05:30	1064	Cabbage (Hybrid)	3		16	1
1015	2021-01-13 11:07:56.979723+05:30	1063	Cabbage (Hybrid)	3		16	1
1016	2021-01-13 11:07:56.980671+05:30	1062	Cabbage (Hybrid)	3		16	1
1017	2021-01-13 11:08:05.012904+05:30	1061	Cabbage	3		16	1
1018	2021-01-13 11:08:05.016893+05:30	1060	Cabbage	3		16	1
1019	2021-01-13 11:08:05.01933+05:30	1059	Cabbage	3		16	1
1020	2021-01-13 11:08:05.01933+05:30	1058	Red Lettuce	3		16	1
1021	2021-01-13 11:08:05.020328+05:30	1057	Red Lettuce	3		16	1
1022	2021-01-13 11:08:05.021325+05:30	1056	Red Lettuce	3		16	1
1023	2021-01-13 11:08:05.022322+05:30	1055	Lettuce	3		16	1
1024	2021-01-13 11:08:05.02332+05:30	1054	Lettuce	3		16	1
1025	2021-01-13 11:08:05.02332+05:30	1053	Lettuce	3		16	1
1026	2021-01-13 11:08:05.024317+05:30	1052	Pok Choi	3		16	1
1027	2021-01-13 11:08:05.025314+05:30	1051	Pok Choi	3		16	1
1028	2021-01-13 11:08:05.025314+05:30	1050	Pok Choi	3		16	1
1029	2021-01-13 11:08:05.027309+05:30	1049	Chinese Cabbage	3		16	1
1030	2021-01-13 11:08:05.028306+05:30	1048	Chinese Cabbage	3		16	1
1031	2021-01-13 11:08:05.029303+05:30	1047	Chinese Cabbage	3		16	1
1032	2021-01-13 11:08:05.029303+05:30	1046	BASIL	3		16	1
1033	2021-01-13 11:08:05.030301+05:30	1045	BASIL	3		16	1
1034	2021-01-13 11:08:05.031298+05:30	1044	BASIL	3		16	1
1035	2021-01-13 11:08:05.031298+05:30	1043	Oregano	3		16	1
1036	2021-01-13 11:08:05.032296+05:30	1042	Oregano	3		16	1
1037	2021-01-13 11:08:05.033293+05:30	1041	Oregano	3		16	1
1038	2021-01-13 11:08:05.034291+05:30	1040	Thyme	3		16	1
1039	2021-01-13 11:08:05.036285+05:30	1039	Thyme	3		16	1
1040	2021-01-13 11:08:05.036285+05:30	1038	Thyme	3		16	1
1041	2021-01-13 11:08:05.037318+05:30	1037	Leek	3		16	1
1042	2021-01-13 11:08:05.03828+05:30	1036	Leek	3		16	1
1043	2021-01-13 11:08:05.03828+05:30	1035	Leek	3		16	1
1044	2021-01-13 11:08:05.039277+05:30	1034	Kale	3		16	1
1045	2021-01-13 11:08:05.040274+05:30	1033	Kale	3		16	1
1046	2021-01-13 11:08:05.040274+05:30	1032	Kale	3		16	1
1047	2021-01-13 11:08:05.041272+05:30	1031	Chives	3		16	1
1048	2021-01-13 11:08:05.042297+05:30	1030	Chives	3		16	1
1049	2021-01-13 11:08:05.044264+05:30	1029	Chives	3		16	1
1050	2021-01-13 11:08:05.04527+05:30	1028	Celery	3		16	1
1051	2021-01-13 11:08:05.046259+05:30	1027	Celery	3		16	1
1052	2021-01-13 11:08:05.047255+05:30	1026	Celery	3		16	1
1053	2021-01-13 11:08:05.047255+05:30	1025	Rosemary	3		16	1
1054	2021-01-13 11:08:05.048253+05:30	1024	Rosemary	3		16	1
1055	2021-01-13 11:08:05.04925+05:30	1023	Rosemary	3		16	1
1056	2021-01-13 11:08:05.050247+05:30	1022	Mint	3		16	1
1057	2021-01-13 11:08:05.050247+05:30	1021	Mint	3		16	1
1058	2021-01-13 11:08:05.052242+05:30	1020	Mint	3		16	1
1059	2021-01-13 11:08:05.052242+05:30	1019	Parsley Gaint	3		16	1
1060	2021-01-13 11:08:05.05324+05:30	1018	Parsley Gaint	3		16	1
1061	2021-01-13 11:08:05.054237+05:30	1017	Parsley Gaint	3		16	1
1062	2021-01-13 11:08:05.055235+05:30	1016	Spinach/Palak	3		16	1
1063	2021-01-13 11:08:05.055235+05:30	1015	Spinach/Palak	3		16	1
1064	2021-01-13 11:08:05.056231+05:30	1014	Spinach/Palak	3		16	1
1065	2021-01-13 11:08:05.057229+05:30	1013	Methi/Fenugreek	3		16	1
1066	2021-01-13 11:08:05.057229+05:30	1012	Methi/Fenugreek	3		16	1
1067	2021-01-13 11:08:05.058247+05:30	1011	Methi/Fenugreek	3		16	1
1068	2021-01-13 11:08:05.059223+05:30	1010	Dill Seeds	3		16	1
1069	2021-01-13 11:08:05.059223+05:30	1009	Dill Seeds	3		16	1
1070	2021-01-13 11:08:05.061218+05:30	1008	Dill Seeds	3		16	1
1071	2021-01-13 11:08:05.062215+05:30	1007	Coriander	3		16	1
1072	2021-01-13 11:08:05.062215+05:30	1006	Coriander	3		16	1
1073	2021-01-13 11:08:05.063213+05:30	1005	Coriander	3		16	1
1074	2021-01-13 11:08:05.06421+05:30	1004	Amaranthus Red	3		16	1
1075	2021-01-13 11:08:05.065208+05:30	1003	Amaranthus Red	3		16	1
1076	2021-01-13 11:08:05.065208+05:30	1002	Amaranthus Red	3		16	1
1077	2021-01-13 11:08:05.066205+05:30	1001	Amaranthus Green	3		16	1
1078	2021-01-13 11:08:05.067202+05:30	1000	Amaranthus Green	3		16	1
1079	2021-01-13 11:08:05.067202+05:30	999	Amaranthus Green	3		16	1
1080	2021-01-13 11:08:05.069197+05:30	998	Spinach/Palak	3		16	1
1081	2021-01-13 11:08:05.070194+05:30	997	Spinach/Palak	3		16	1
1082	2021-01-13 11:08:05.0712+05:30	996	Spinach/Palak	3		16	1
1083	2021-01-13 11:08:05.071541+05:30	995	Parsley Gaint	3		16	1
1084	2021-01-13 11:08:05.072541+05:30	994	Parsley Gaint	3		16	1
1085	2021-01-13 11:08:05.073538+05:30	993	Parsley Gaint	3		16	1
1086	2021-01-13 11:08:05.073538+05:30	992	Coriander	3		16	1
1087	2021-01-13 11:08:05.074547+05:30	991	Coriander	3		16	1
1088	2021-01-13 11:08:05.07556+05:30	990	Coriander	3		16	1
1089	2021-01-13 11:08:05.078241+05:30	989	Dill Seeds	3		16	1
1090	2021-01-13 11:08:05.07909+05:30	988	Dill Seeds	3		16	1
1091	2021-01-13 11:08:05.079867+05:30	987	Dill Seeds	3		16	1
1092	2021-01-13 11:08:05.080626+05:30	986	Methi/Fenugreek	3		16	1
1093	2021-01-13 11:08:05.081373+05:30	985	Methi/Fenugreek	3		16	1
1094	2021-01-13 11:08:05.082127+05:30	984	Methi/Fenugreek	3		16	1
1095	2021-01-13 11:08:05.08278+05:30	983	Amaranthus Green	3		16	1
1096	2021-01-13 11:08:05.083659+05:30	982	Amaranthus Green	3		16	1
1097	2021-01-13 11:08:05.083659+05:30	981	Amaranthus Green	3		16	1
1098	2021-01-13 11:08:05.08573+05:30	980	Amaranthus Red	3		16	1
1099	2021-01-13 11:08:05.08652+05:30	979	Amaranthus Red	3		16	1
1100	2021-01-13 11:08:05.087268+05:30	978	Amaranthus Red	3		16	1
1101	2021-01-13 11:08:05.088422+05:30	977	Oregano	3		16	1
1102	2021-01-13 11:08:05.089178+05:30	976	Oregano	3		16	1
1103	2021-01-13 11:08:05.08992+05:30	975	Oregano	3		16	1
1104	2021-01-13 11:08:05.090662+05:30	974	Leek	3		16	1
1105	2021-01-13 11:08:05.091407+05:30	973	Leek	3		16	1
1106	2021-01-13 11:08:05.092147+05:30	972	Leek	3		16	1
1107	2021-01-13 11:08:05.092426+05:30	971	Kale	3		16	1
1108	2021-01-13 11:08:05.094878+05:30	970	Kale	3		16	1
1109	2021-01-13 11:08:05.09517+05:30	969	Kale	3		16	1
1110	2021-01-13 11:08:05.096169+05:30	968	Celery	3		16	1
1111	2021-01-13 11:08:05.097167+05:30	967	Celery	3		16	1
1112	2021-01-13 11:08:05.097167+05:30	966	Celery	3		16	1
1113	2021-01-13 11:08:05.098164+05:30	965	Basil	3		16	1
1114	2021-01-13 11:08:05.099206+05:30	964	Basil	3		16	1
1115	2021-01-13 11:08:05.100085+05:30	963	Basil	3		16	1
1116	2021-01-13 11:08:05.100834+05:30	962	Chives	3		16	1
1117	2021-01-13 11:10:04.672713+05:30	961	Chives	3		16	1
1118	2021-01-13 11:10:04.675675+05:30	960	Chives	3		16	1
1119	2021-01-13 11:10:04.676701+05:30	959	Thyme	3		16	1
1120	2021-01-13 11:10:04.677694+05:30	958	Thyme	3		16	1
1121	2021-01-13 11:10:04.678666+05:30	957	Thyme	3		16	1
1122	2021-01-13 11:10:04.679663+05:30	956	Mint	3		16	1
1123	2021-01-13 11:10:04.680675+05:30	955	Mint	3		16	1
1124	2021-01-13 11:10:04.681661+05:30	954	Mint	3		16	1
1125	2021-01-13 11:10:04.682656+05:30	953	Rosemary	3		16	1
1126	2021-01-13 11:10:04.682656+05:30	952	Rosemary	3		16	1
1127	2021-01-13 11:10:04.683682+05:30	951	Rosemary	3		16	1
1128	2021-01-13 11:10:04.68568+05:30	950	Pok-Choi	3		16	1
1129	2021-01-13 11:10:04.68568+05:30	949	Pok-Choi	3		16	1
1130	2021-01-13 11:10:04.686679+05:30	948	Pok-Choi	3		16	1
1131	2021-01-13 11:10:04.687643+05:30	947	Lettuce	3		16	1
1132	2021-01-13 11:10:04.687643+05:30	946	Lettuce	3		16	1
1133	2021-01-13 11:10:04.688669+05:30	945	Lettuce	3		16	1
1134	2021-01-13 11:10:04.689638+05:30	944	Red Lettuce	3		16	1
1135	2021-01-13 11:10:04.689638+05:30	943	Red Lettuce	3		16	1
1136	2021-01-13 11:10:04.690635+05:30	942	Red Lettuce	3		16	1
1137	2021-01-13 11:10:04.691632+05:30	941	Kholrabi/Knol-khol	3		16	1
1138	2021-01-13 11:10:04.692629+05:30	940	Kholrabi/Knol-khol	3		16	1
1139	2021-01-13 11:10:04.692629+05:30	939	Kholrabi/Knol-khol	3		16	1
1140	2021-01-13 11:10:04.693658+05:30	938	Radish 2 in 1 (Palak and Radish)	3		16	1
1141	2021-01-13 11:10:04.695647+05:30	937	Radish 2 in 1 (Palak and Radish)	3		16	1
1142	2021-01-13 11:10:04.695647+05:30	936	Radish 2 in 1 (Palak and Radish)	3		16	1
1143	2021-01-13 11:10:04.698613+05:30	935	Onion Light Red	3		16	1
1144	2021-01-13 11:10:04.698613+05:30	934	Onion Light Red	3		16	1
1145	2021-01-13 11:10:04.699611+05:30	933	Onion Light Red	3		16	1
1146	2021-01-13 11:10:04.700608+05:30	932	Onion Dark Red	3		16	1
1147	2021-01-13 11:10:04.700608+05:30	931	Onion Dark Red	3		16	1
1148	2021-01-13 11:10:04.701606+05:30	930	Onion Dark Red	3		16	1
1149	2021-01-13 11:10:04.702602+05:30	929	Muskmelon Rambo (Hybrid)	3		16	1
1150	2021-01-13 11:10:04.703601+05:30	928	Muskmelon Rambo (Hybrid)	3		16	1
1151	2021-01-13 11:10:04.703601+05:30	927	Muskmelon Rambo (Hybrid)	3		16	1
1152	2021-01-13 11:10:04.704624+05:30	926	Muskmelon Sujay (Hybrid)	3		16	1
1153	2021-01-13 11:10:04.706602+05:30	925	Muskmelon Sujay (Hybrid)	3		16	1
1154	2021-01-13 11:10:04.707599+05:30	924	Muskmelon Sujay (Hybrid)	3		16	1
1155	2021-01-13 11:10:04.707599+05:30	923	Muskmelon Samrat (Hybrid)	3		16	1
1156	2021-01-13 11:10:04.708597+05:30	922	Muskmelon Samrat (Hybrid)	3		16	1
1157	2021-01-13 11:10:04.709595+05:30	921	Muskmelon Samrat (Hybrid)	3		16	1
1158	2021-01-13 11:10:04.710592+05:30	920	Muskmelon Mahi (Hybrid)	3		16	1
1159	2021-01-13 11:10:04.71159+05:30	919	Muskmelon Mahi (Hybrid)	3		16	1
1160	2021-01-13 11:10:04.71159+05:30	918	Muskmelon Mahi (Hybrid)	3		16	1
1161	2021-01-13 11:10:04.712585+05:30	917	Marigold Yellow (Hybrid)	3		16	1
1162	2021-01-13 11:10:04.713583+05:30	916	Marigold Yellow (Hybrid)	3		16	1
1163	2021-01-13 11:10:04.71558+05:30	915	Marigold Yellow (Hybrid)	3		16	1
1164	2021-01-13 11:10:04.716577+05:30	914	Marigold Orange (Hybrid)	3		16	1
1165	2021-01-13 11:10:04.716577+05:30	913	Marigold Orange (Hybrid)	3		16	1
1166	2021-01-13 11:10:04.717573+05:30	912	Marigold Orange (Hybrid)	3		16	1
1167	2021-01-13 11:10:04.71857+05:30	911	Marigold Yellow	3		16	1
1168	2021-01-13 11:10:04.719567+05:30	910	Marigold Yellow	3		16	1
1169	2021-01-13 11:10:04.719567+05:30	909	Marigold Yellow	3		16	1
1170	2021-01-13 11:10:04.720564+05:30	908	Marigold Orange	3		16	1
1171	2021-01-13 11:10:04.721561+05:30	907	Marigold Orange	3		16	1
1172	2021-01-13 11:10:04.723663+05:30	906	Marigold Orange	3		16	1
1173	2021-01-13 11:10:04.724554+05:30	905	White Cucumber (Hybrid)	3		16	1
1174	2021-01-13 11:10:04.724554+05:30	904	White Cucumber (Hybrid)	3		16	1
1175	2021-01-13 11:10:04.725583+05:30	903	White Cucumber (Hybrid)	3		16	1
1176	2021-01-13 11:10:04.726548+05:30	902	White Bittergourd (Hybrid)	3		16	1
1177	2021-01-13 11:10:04.727562+05:30	901	White Bittergourd (Hybrid)	3		16	1
1178	2021-01-13 11:10:04.728379+05:30	900	White Bittergourd (Hybrid)	3		16	1
1179	2021-01-13 11:10:04.729488+05:30	899	Watermelon Green Stripes (Hybrid)	3		16	1
1180	2021-01-13 11:10:04.731608+05:30	898	Watermelon Green Stripes (Hybrid)	3		16	1
1181	2021-01-13 11:10:04.733478+05:30	897	Watermelon Green Stripes (Hybrid)	3		16	1
1182	2021-01-13 11:10:04.734506+05:30	896	Watermelon Black (Hybrid)	3		16	1
1183	2021-01-13 11:10:04.735728+05:30	895	Watermelon Black (Hybrid)	3		16	1
1184	2021-01-13 11:10:04.736927+05:30	894	Watermelon Black (Hybrid)	3		16	1
1185	2021-01-13 11:10:04.738171+05:30	893	Tomato Round Sour (Hybrid)	3		16	1
1186	2021-01-13 11:10:04.740525+05:30	892	Tomato Round Sour (Hybrid)	3		16	1
1187	2021-01-13 11:10:04.741869+05:30	891	Tomato Round Sour (Hybrid)	3		16	1
1188	2021-01-13 11:10:04.743125+05:30	890	Tomato Oval (Hybrid)	3		16	1
1189	2021-01-13 11:10:04.744223+05:30	889	Tomato Oval (Hybrid)	3		16	1
1190	2021-01-13 11:10:04.745411+05:30	888	Tomato Oval (Hybrid)	3		16	1
1191	2021-01-13 11:10:04.746352+05:30	887	Spongegourd Light Green (Hybrid)	3		16	1
1192	2021-01-13 11:10:04.747452+05:30	886	Spongegourd Light Green (Hybrid)	3		16	1
1193	2021-01-13 11:10:04.749041+05:30	885	Spongegourd Light Green (Hybrid)	3		16	1
1194	2021-01-13 11:10:04.749862+05:30	884	Spongegourd Dark Green (Hybrid)	3		16	1
1195	2021-01-13 11:10:04.750617+05:30	883	Spongegourd Dark Green (Hybrid)	3		16	1
1196	2021-01-13 11:10:04.750617+05:30	882	Spongegourd Dark Green (Hybrid)	3		16	1
1197	2021-01-13 11:10:04.751616+05:30	881	Round Bottlegourd (Hybrid)	3		16	1
1198	2021-01-13 11:10:04.752644+05:30	880	Round Bottlegourd (Hybrid)	3		16	1
1199	2021-01-13 11:10:04.752644+05:30	879	Round Bottlegourd (Hybrid)	3		16	1
1200	2021-01-13 11:10:04.753644+05:30	878	Ridge Gourd (Hybrid)	3		16	1
1201	2021-01-13 11:10:04.754641+05:30	877	Ridge Gourd (Hybrid)	3		16	1
1202	2021-01-13 11:10:04.756192+05:30	876	Ridge Gourd (Hybrid)	3		16	1
1203	2021-01-13 11:10:04.757517+05:30	875	Red Carrot (Hybrid)	3		16	1
1204	2021-01-13 11:10:04.758273+05:30	874	Red Carrot (Hybrid)	3		16	1
1205	2021-01-13 11:10:04.759045+05:30	873	Red Carrot (Hybrid)	3		16	1
1206	2021-01-13 11:10:04.759784+05:30	872	Pumpkin Druva (Hybrid)	3		16	1
1207	2021-01-13 11:10:04.760443+05:30	871	Pumpkin Druva (Hybrid)	3		16	1
1208	2021-01-13 11:10:04.760443+05:30	870	Pumpkin Druva (Hybrid)	3		16	1
1209	2021-01-13 11:10:04.761442+05:30	869	Pumpkin Boss (Hybrid)	3		16	1
1210	2021-01-13 11:10:04.762439+05:30	868	Pumpkin Boss (Hybrid)	3		16	1
1211	2021-01-13 11:10:04.763437+05:30	867	Pumpkin Boss (Hybrid)	3		16	1
1212	2021-01-13 11:10:04.765431+05:30	866	Orange Carrot Nantes  (Hybrid)	3		16	1
1213	2021-01-13 11:10:04.766428+05:30	865	Orange Carrot Nantes  (Hybrid)	3		16	1
1214	2021-01-13 11:10:04.767112+05:30	864	Orange Carrot Nantes  (Hybrid)	3		16	1
1215	2021-01-13 11:10:04.767844+05:30	863	Orange Carrot Kuroda (Hybrid)	3		16	1
1216	2021-01-13 11:10:04.768439+05:30	862	Orange Carrot Kuroda (Hybrid)	3		16	1
1217	2021-01-13 11:10:12.336226+05:30	861	Orange Carrot Kuroda (Hybrid)	3		16	1
1218	2021-01-13 11:10:12.339764+05:30	860	Bottlegourd Long (Hybrid)	3		16	1
1219	2021-01-13 11:10:12.340735+05:30	859	Bottlegourd Long (Hybrid)	3		16	1
1220	2021-01-13 11:10:12.341023+05:30	858	Bottlegourd Long (Hybrid)	3		16	1
1221	2021-01-13 11:10:12.343021+05:30	857	Green Bittergourd (Hybrid)	3		16	1
1222	2021-01-13 11:10:12.344018+05:30	856	Green Bittergourd (Hybrid)	3		16	1
1223	2021-01-13 11:10:12.345183+05:30	855	Green Bittergourd (Hybrid)	3		16	1
1224	2021-01-13 11:10:12.346012+05:30	854	Chilly Dual Purpose-Dry/Fresh  (Hybrid)	3		16	1
1225	2021-01-13 11:10:12.347042+05:30	853	Chilly Dual Purpose-Dry/Fresh  (Hybrid)	3		16	1
1226	2021-01-13 11:10:12.349204+05:30	852	Chilly Dual Purpose-Dry/Fresh  (Hybrid)	3		16	1
1227	2021-01-13 11:10:12.350313+05:30	851	Cucumber Light Green (Hybrid)	3		16	1
1228	2021-01-13 11:10:12.351048+05:30	850	Cucumber Light Green (Hybrid)	3		16	1
1229	2021-01-13 11:10:12.353082+05:30	849	Cucumber Light Green (Hybrid)	3		16	1
1230	2021-01-13 11:10:12.354355+05:30	848	Cucumber Dark Green (Hybrid)	3		16	1
1231	2021-01-13 11:10:12.35561+05:30	847	Cucumber Dark Green (Hybrid)	3		16	1
1232	2021-01-13 11:10:12.35673+05:30	846	Cucumber Dark Green (Hybrid)	3		16	1
1233	2021-01-13 11:10:12.357868+05:30	845	Chilly Spicy (Hybrid)	3		16	1
1234	2021-01-13 11:10:12.359633+05:30	844	Chilly Spicy (Hybrid)	3		16	1
1235	2021-01-13 11:10:12.360313+05:30	843	Chilly Spicy (Hybrid)	3		16	1
1236	2021-01-13 11:10:12.362312+05:30	842	Chilly Dry/Tadka Purpose (Hybrid)	3		16	1
1237	2021-01-13 11:10:12.363309+05:30	841	Chilly Dry/Tadka Purpose (Hybrid)	3		16	1
1238	2021-01-13 11:10:12.364064+05:30	840	Chilly Dry/Tadka Purpose (Hybrid)	3		16	1
1239	2021-01-13 11:10:12.364064+05:30	839	Chilly Bhajji  (Hybrid)	3		16	1
1240	2021-01-13 11:10:12.364064+05:30	838	Chilly Bhajji  (Hybrid)	3		16	1
1241	2021-01-13 11:10:12.364064+05:30	837	Chilly Bhajji  (Hybrid)	3		16	1
1242	2021-01-13 11:10:12.364064+05:30	836	Chilly Achari  (Hybrid)	3		16	1
1243	2021-01-13 11:10:12.364064+05:30	835	Chilly Achari  (Hybrid)	3		16	1
1244	2021-01-13 11:10:12.364064+05:30	834	Chilly Achari  (Hybrid)	3		16	1
1245	2021-01-13 11:10:12.364064+05:30	833	Cauliflower (Hybrid)	3		16	1
1246	2021-01-13 11:10:12.364064+05:30	832	Cauliflower (Hybrid)	3		16	1
1247	2021-01-13 11:10:12.364064+05:30	831	Cauliflower (Hybrid)	3		16	1
1248	2021-01-13 11:10:12.364064+05:30	830	Cabbage (Hybrid)	3		16	1
1249	2021-01-13 11:10:12.364064+05:30	829	Cabbage (Hybrid)	3		16	1
1250	2021-01-13 11:10:12.364064+05:30	828	Cabbage (Hybrid)	3		16	1
1251	2021-01-13 11:10:12.364064+05:30	827	Cabbage	3		16	1
1252	2021-01-13 11:10:12.364064+05:30	826	Cabbage	3		16	1
1253	2021-01-13 11:10:12.364064+05:30	825	Cabbage	3		16	1
1254	2021-01-13 11:10:12.364064+05:30	824	Brinjal Naman (Hybrid)	3		16	1
1255	2021-01-13 11:10:12.364064+05:30	823	Brinjal Naman (Hybrid)	3		16	1
1256	2021-01-13 11:10:12.379736+05:30	822	Brinjal Naman (Hybrid)	3		16	1
1257	2021-01-13 11:10:12.379736+05:30	821	Brinjal Myna (Hybrid)	3		16	1
1258	2021-01-13 11:10:12.380733+05:30	820	Brinjal Myna (Hybrid)	3		16	1
1259	2021-01-13 11:10:12.381731+05:30	819	Brinjal Myna (Hybrid)	3		16	1
1260	2021-01-13 11:10:12.382448+05:30	818	Brinjal Hariya (Hybrid)	3		16	1
1261	2021-01-13 11:10:12.383083+05:30	817	Brinjal Hariya (Hybrid)	3		16	1
1262	2021-01-13 11:10:12.383763+05:30	816	Brinjal Hariya (Hybrid)	3		16	1
1263	2021-01-13 11:10:12.385614+05:30	815	Brinjal Dhiraj (Hybrid)	3		16	1
1264	2021-01-13 11:10:12.386281+05:30	814	Brinjal Dhiraj (Hybrid)	3		16	1
1265	2021-01-13 11:10:12.386969+05:30	813	Brinjal Dhiraj (Hybrid)	3		16	1
1266	2021-01-13 11:10:12.387765+05:30	812	Brinjal Aira (Hybrid)	3		16	1
1267	2021-01-13 11:10:12.388764+05:30	811	Brinjal Aira (Hybrid)	3		16	1
1268	2021-01-13 11:10:12.389789+05:30	810	Brinjal Aira (Hybrid)	3		16	1
1269	2021-01-13 11:10:12.39064+05:30	809	Bhendi/Okra Mejestic (Hybrid)	3		16	1
1270	2021-01-13 11:10:12.39064+05:30	808	Bhendi/Okra Mejestic (Hybrid)	3		16	1
1271	2021-01-13 11:10:12.39164+05:30	807	Bhendi/Okra Mejestic (Hybrid)	3		16	1
1272	2021-01-13 11:10:12.39366+05:30	806	Bhendi/Okra Deepa (Hybrid)	3		16	1
1273	2021-01-13 11:10:12.394691+05:30	805	Bhendi/Okra Deepa (Hybrid)	3		16	1
1274	2021-01-13 11:10:12.395491+05:30	804	Bhendi/Okra Deepa (Hybrid)	3		16	1
1275	2021-01-13 11:10:12.396157+05:30	803	Beetroot Rado (Hybrid)	3		16	1
1276	2021-01-13 11:10:12.397037+05:30	802	Beetroot Rado (Hybrid)	3		16	1
1277	2021-01-13 11:10:12.397037+05:30	801	Beetroot Rado (Hybrid)	3		16	1
1278	2021-01-13 11:10:12.398036+05:30	800	French Beans Tony	3		16	1
1279	2021-01-13 11:10:12.39909+05:30	799	French Beans Tony	3		16	1
1280	2021-01-13 11:10:12.39909+05:30	798	French Beans Tony	3		16	1
1281	2021-01-13 11:10:12.40009+05:30	797	Chinese Cabbage	3		16	1
1282	2021-01-13 11:10:12.402481+05:30	796	Chinese Cabbage	3		16	1
1283	2021-01-13 11:10:12.403268+05:30	795	Chinese Cabbage	3		16	1
1284	2021-01-13 11:10:12.403927+05:30	794	Brinjal Purple long	3		16	1
1285	2021-01-13 11:10:12.40475+05:30	793	Brinjal Purple long	3		16	1
1286	2021-01-13 11:10:12.405477+05:30	792	Brinjal Purple long	3		16	1
1287	2021-01-13 11:10:12.406197+05:30	791	Brinjal Black long	3		16	1
1288	2021-01-13 11:10:12.406836+05:30	790	Brinjal Black long	3		16	1
1289	2021-01-13 11:10:12.406836+05:30	789	Brinjal Black long	3		16	1
1290	2021-01-13 11:10:12.407741+05:30	788	Beetroot Gulab	3		16	1
1291	2021-01-13 11:10:12.409704+05:30	787	Beetroot Gulab	3		16	1
1292	2021-01-13 11:10:12.409704+05:30	786	Beetroot Gulab	3		16	1
1293	2021-01-13 11:10:12.410703+05:30	785	Watermelon	3		16	1
1294	2021-01-13 11:10:12.411858+05:30	784	watermelon 	3		16	1
1295	2021-01-13 11:10:12.413179+05:30	783	Watermelon	3		16	1
1296	2021-01-13 11:10:12.414042+05:30	782	Tomato	3		16	1
1297	2021-01-13 11:10:12.415484+05:30	781	Tomato	3		16	1
1298	2021-01-13 11:10:12.416393+05:30	780	Tomato	3		16	1
1299	2021-01-13 11:10:12.417058+05:30	779	Tomato	3		16	1
1300	2021-01-13 11:10:12.419016+05:30	778	Tomato	3		16	1
1301	2021-01-13 11:10:12.419016+05:30	777	Tomato	3		16	1
1302	2021-01-13 11:10:12.420015+05:30	776	Tomato	3		16	1
1303	2021-01-13 11:10:12.421043+05:30	775	Tomato	3		16	1
1304	2021-01-13 11:10:12.422043+05:30	774	Tomato	3		16	1
1305	2021-01-13 11:10:12.422043+05:30	773	Tomato	3		16	1
1306	2021-01-13 11:10:12.423528+05:30	772	Tomato	3		16	1
1307	2021-01-13 11:10:12.42419+05:30	771	Tomato	3		16	1
1308	2021-01-13 11:10:12.425092+05:30	770	Tomato	3		16	1
1309	2021-01-13 11:10:12.426092+05:30	769	Tomato	3		16	1
1310	2021-01-13 11:10:12.42721+05:30	768	Tomato	3		16	1
1311	2021-01-13 11:10:12.427983+05:30	767	Tomato	3		16	1
1312	2021-01-13 11:10:12.428687+05:30	766	Sponge Gound	3		16	1
1313	2021-01-13 11:10:12.428687+05:30	765	Sponge Gound	3		16	1
1314	2021-01-13 11:10:12.430248+05:30	764	Ridge Gourd	3		16	1
1315	2021-01-13 11:10:12.431249+05:30	763	Radish	3		16	1
1316	2021-01-13 11:10:12.432245+05:30	762	Pumpkin	3		16	1
1317	2021-01-13 11:10:18.773103+05:30	761	Pumpkin	3		16	1
1318	2021-01-13 11:10:18.776454+05:30	760	Muskmelon	3		16	1
1319	2021-01-13 11:10:18.777385+05:30	759	Muskmelon	3		16	1
1320	2021-01-13 11:10:18.778118+05:30	758	Muskmelon	3		16	1
1321	2021-01-13 11:10:18.778934+05:30	757	Muskmelon	3		16	1
1322	2021-01-13 11:10:18.7799+05:30	756	HY.Maize	3		16	1
1323	2021-01-13 11:10:18.78093+05:30	755	Cucumber	3		16	1
1324	2021-01-13 11:10:18.781897+05:30	754	Cucumber	3		16	1
1325	2021-01-13 11:10:18.783464+05:30	753	Cucumber	3		16	1
1326	2021-01-13 11:10:18.784231+05:30	752	Methi	3		16	1
1327	2021-01-13 11:10:18.785605+05:30	751	Palak	3		16	1
1328	2021-01-13 11:10:18.786346+05:30	750	Coriander	3		16	1
1329	2021-01-13 11:10:18.786346+05:30	749	Coriander	3		16	1
1330	2021-01-13 11:10:18.78797+05:30	748	Chilly	3		16	1
1331	2021-01-13 11:10:18.78897+05:30	747	Chilly	3		16	1
1332	2021-01-13 11:10:18.789967+05:30	746	Chilly	3		16	1
1333	2021-01-13 11:10:18.789967+05:30	745	Chilly	3		16	1
1334	2021-01-13 11:10:18.790964+05:30	744	Chilly	3		16	1
1335	2021-01-13 11:10:18.791961+05:30	743	Chilly	3		16	1
1336	2021-01-13 11:10:18.792984+05:30	742	Chilly	3		16	1
1337	2021-01-13 11:10:18.792984+05:30	741	Chilly	3		16	1
1338	2021-01-13 11:10:18.794498+05:30	740	Chilly	3		16	1
1339	2021-01-13 11:10:18.796902+05:30	739	Carrot	3		16	1
1340	2021-01-13 11:10:18.797731+05:30	738	Carrot	3		16	1
1341	2021-01-13 11:10:18.798481+05:30	737	Carrot	3		16	1
1342	2021-01-13 11:10:18.799219+05:30	736	Carrot	3		16	1
1343	2021-01-13 11:10:18.799952+05:30	735	Capsicum	3		16	1
1344	2021-01-13 11:10:18.800664+05:30	734	Redgram	3		16	1
1345	2021-01-13 11:10:18.801374+05:30	733	Redgram	3		16	1
1346	2021-01-13 11:10:18.802005+05:30	732	Beans 	3		16	1
1347	2021-01-13 11:10:18.802005+05:30	731	Brinjal 	3		16	1
1348	2021-01-13 11:10:18.804159+05:30	730	Brinjal 	3		16	1
1349	2021-01-13 11:10:18.804921+05:30	729	Brinjal 	3		16	1
1350	2021-01-13 11:10:18.805677+05:30	728	Brinjal	3		16	1
1351	2021-01-13 11:10:18.806396+05:30	727	Brinjal	3		16	1
1352	2021-01-13 11:10:18.807117+05:30	726	Brinjal	3		16	1
1353	2021-01-13 11:10:18.807828+05:30	725	Brinjal	3		16	1
1354	2021-01-13 11:10:18.808543+05:30	724	Brinjal	3		16	1
1355	2021-01-13 11:10:18.809262+05:30	723	Brinjal	3		16	1
1356	2021-01-13 11:10:18.809926+05:30	722	Bottle Gourd	3		16	1
1357	2021-01-13 11:10:18.809926+05:30	721	Bottle Gourd	3		16	1
1358	2021-01-13 11:10:18.81095+05:30	720	Bitter Gourd	3		16	1
1359	2021-01-13 11:10:18.811923+05:30	719	Bitter Gourd	3		16	1
1360	2021-01-13 11:10:18.81292+05:30	718	Bhendi/Okra	3		16	1
1361	2021-01-13 11:10:18.814275+05:30	717	Bhendi/Okra	3		16	1
1362	2021-01-13 11:10:18.815074+05:30	716	Bhendi/Okra	3		16	1
1363	2021-01-13 11:10:18.815804+05:30	715	Bhendi/Okra	3		16	1
1364	2021-01-13 11:10:18.816528+05:30	714	Bhendi/Okra	3		16	1
1365	2021-01-13 11:10:18.817246+05:30	713	Bhendi/Okra	3		16	1
1366	2021-01-13 11:10:18.817962+05:30	712	Beetroot	3		16	1
1367	2021-01-13 11:10:18.818673+05:30	711	Beetroot	3		16	1
1368	2021-01-15 10:28:19.753808+05:30	2083	Watermelon	2	[{"changed": {"fields": ["Category id", "Type"]}}]	16	1
1369	2021-01-15 10:29:10.824663+05:30	2083	Watermelon	3		16	1
1370	2021-01-15 10:29:10.828432+05:30	2082	watermelon 	3		16	1
1371	2021-01-15 10:29:10.829398+05:30	2081	Watermelon	3		16	1
1372	2021-01-15 10:29:10.831397+05:30	2080	Sponge Gound	3		16	1
1373	2021-01-15 10:29:10.832811+05:30	2079	Sponge Gound	3		16	1
1374	2021-01-15 10:29:10.833811+05:30	2078	Ridge Gourd	3		16	1
1375	2021-01-15 10:29:10.835981+05:30	2077	Radish	3		16	1
1376	2021-01-15 10:29:10.837736+05:30	2076	Pumpkin	3		16	1
1377	2021-01-15 10:29:10.838572+05:30	2075	Pumpkin	3		16	1
1378	2021-01-15 10:29:10.839369+05:30	2074	Muskmelon	3		16	1
1379	2021-01-15 10:29:10.840163+05:30	2073	Muskmelon	3		16	1
1380	2021-01-15 10:29:10.840955+05:30	2072	Muskmelon	3		16	1
1381	2021-01-15 10:29:10.841733+05:30	2071	Muskmelon	3		16	1
1382	2021-01-15 10:29:10.842516+05:30	2070	HY.Maize	3		16	1
1383	2021-01-15 10:29:10.843295+05:30	2069	Cucumber	3		16	1
1384	2021-01-15 10:29:10.843983+05:30	2068	Cucumber	3		16	1
1385	2021-01-15 10:29:10.844837+05:30	2067	Cucumber	3		16	1
1386	2021-01-15 10:29:10.845653+05:30	2066	Methi	3		16	1
1387	2021-01-15 10:29:10.846453+05:30	2065	Methi	3		16	1
1388	2021-01-15 10:29:10.847244+05:30	2064	Methi	3		16	1
1389	2021-01-15 10:29:10.847683+05:30	2063	Palak	3		16	1
1390	2021-01-15 10:29:10.848716+05:30	2062	Palak	3		16	1
1391	2021-01-15 10:29:10.850633+05:30	2061	Coriander	3		16	1
1392	2021-01-15 10:29:10.85157+05:30	2060	Coriander	3		16	1
1393	2021-01-15 10:29:10.852678+05:30	2059	Coriander	3		16	1
1394	2021-01-15 10:29:10.853665+05:30	2058	Chilly	3		16	1
1395	2021-01-15 10:29:10.854666+05:30	2057	Chilly	3		16	1
1396	2021-01-15 10:29:10.855698+05:30	2056	Chilly	3		16	1
1397	2021-01-15 10:29:10.856699+05:30	2055	Chilly	3		16	1
1398	2021-01-15 10:29:10.858185+05:30	2054	Chilly	3		16	1
1399	2021-01-15 10:29:10.859049+05:30	2053	Chilly	3		16	1
1400	2021-01-15 10:29:10.859779+05:30	2052	Chilly	3		16	1
1401	2021-01-15 10:29:10.859779+05:30	2051	Chilly	3		16	1
1402	2021-01-15 10:29:10.860809+05:30	2050	Chilly	3		16	1
1403	2021-01-15 10:29:10.861976+05:30	2049	Carrot	3		16	1
1404	2021-01-15 10:29:10.861976+05:30	2048	Carrot	3		16	1
1405	2021-01-15 10:29:10.863972+05:30	2047	Carrot	3		16	1
1406	2021-01-15 10:29:10.863972+05:30	2046	Carrot	3		16	1
1407	2021-01-15 10:29:10.86497+05:30	2045	Redgram	3		16	1
1408	2021-01-15 10:29:10.865979+05:30	2044	Redgram	3		16	1
1409	2021-01-15 10:29:10.866966+05:30	2043	Redgram	3		16	1
1410	2021-01-15 10:29:10.866966+05:30	2042	Redgram	3		16	1
1411	2021-01-15 10:29:10.867963+05:30	2041	Beans 	3		16	1
1412	2021-01-15 10:29:10.868987+05:30	2040	Beans 	3		16	1
1413	2021-01-15 10:29:10.868987+05:30	2039	Beans 	3		16	1
1414	2021-01-15 10:29:10.869957+05:30	2038	Brinjal 	3		16	1
1415	2021-01-15 10:29:10.869957+05:30	2037	Brinjal 	3		16	1
1416	2021-01-15 10:29:10.870955+05:30	2036	Brinjal 	3		16	1
1417	2021-01-15 10:29:10.871982+05:30	2035	Brinjal	3		16	1
1418	2021-01-15 10:29:10.873307+05:30	2034	Brinjal	3		16	1
1419	2021-01-15 10:29:10.873966+05:30	2033	Brinjal	3		16	1
1420	2021-01-15 10:29:10.8746+05:30	2032	Brinjal	3		16	1
1421	2021-01-15 10:29:10.875484+05:30	2031	Brinjal	3		16	1
1422	2021-01-15 10:29:10.876505+05:30	2030	Brinjal	3		16	1
1423	2021-01-15 10:29:10.877803+05:30	2029	Bottle Gourd	3		16	1
1424	2021-01-15 10:29:10.878805+05:30	2028	Bottle Gourd	3		16	1
1425	2021-01-15 10:29:10.8798+05:30	2027	Bitter Gourd	3		16	1
1426	2021-01-15 10:29:10.880798+05:30	2026	Bitter Gourd	3		16	1
1427	2021-01-15 10:29:10.882412+05:30	2025	Bhendi/Okra	3		16	1
1428	2021-01-15 10:29:10.884196+05:30	2024	Bhendi/Okra	3		16	1
1429	2021-01-15 10:29:10.884901+05:30	2023	Bhendi/Okra	3		16	1
1430	2021-01-15 10:29:10.885801+05:30	2022	Bhendi/Okra	3		16	1
1431	2021-01-15 10:29:10.885801+05:30	2021	Bhendi/Okra	3		16	1
1432	2021-01-15 10:29:10.886829+05:30	2020	Bhendi/Okra	3		16	1
1433	2021-01-15 10:29:10.912596+05:30	2019	Bhendi/Okra	3		16	1
1434	2021-01-15 10:29:10.913627+05:30	2018	Bhendi/Okra	3		16	1
1435	2021-01-15 10:29:10.915591+05:30	2017	Bhendi/Okra	3		16	1
1436	2021-01-15 10:29:10.916591+05:30	2016	Bhendi/Okra	3		16	1
1437	2021-01-15 10:29:10.917623+05:30	2015	Bhendi/Okra	3		16	1
1438	2021-01-15 10:29:10.91859+05:30	2014	Beetroot	3		16	1
1439	2021-01-15 10:29:10.920054+05:30	2013	Beetroot	3		16	1
1440	2021-01-15 10:29:10.921055+05:30	2012	Avocado	3		16	1
1441	2021-01-15 10:29:10.922623+05:30	2011	Avocado	3		16	1
1442	2021-01-15 10:29:10.922623+05:30	2010	Avocado	3		16	1
1443	2021-01-15 10:29:10.923623+05:30	2009	Avocado	3		16	1
1444	2021-01-15 10:29:10.924631+05:30	2008	Avocado	3		16	1
1445	2021-01-15 10:29:10.926573+05:30	2007	Tamarind	3		16	1
1446	2021-01-15 10:29:10.927892+05:30	2006	Tamarind	3		16	1
1447	2021-01-15 10:29:10.930003+05:30	2005	Tamarind	3		16	1
1448	2021-01-15 10:29:10.931004+05:30	2004	Tamarind	3		16	1
1449	2021-01-15 10:29:10.932001+05:30	2003	Tamarind	3		16	1
1450	2021-01-15 10:29:10.932998+05:30	2002	Pomogranate	3		16	1
1451	2021-01-15 10:29:10.932998+05:30	2001	Pomogranate	3		16	1
1452	2021-01-15 10:29:10.934512+05:30	2000	Pomogranate	3		16	1
1453	2021-01-15 10:29:10.935299+05:30	1999	Pomogranate	3		16	1
1454	2021-01-15 10:29:10.936079+05:30	1998	Pomogranate	3		16	1
1455	2021-01-15 10:29:10.936849+05:30	1997	Chikkoo	3		16	1
1456	2021-01-15 10:29:10.937623+05:30	1996	Chikkoo	3		16	1
1457	2021-01-15 10:29:10.938397+05:30	1995	Chikkoo	3		16	1
1458	2021-01-15 10:29:10.9387+05:30	1994	Chikkoo	3		16	1
1459	2021-01-15 10:29:10.939938+05:30	1993	Chikkoo	3		16	1
1460	2021-01-15 10:29:10.940712+05:30	1992	Custard Apple	3		16	1
1461	2021-01-15 10:29:10.942479+05:30	1991	Custard Apple	3		16	1
1462	2021-01-15 10:29:10.943279+05:30	1990	Custard Apple	3		16	1
1463	2021-01-15 10:29:10.944061+05:30	1989	Custard Apple	3		16	1
1464	2021-01-15 10:29:10.944842+05:30	1988	Custard Apple	3		16	1
1465	2021-01-15 10:29:10.945619+05:30	1987	African Tulip	3		16	1
1466	2021-01-15 10:29:10.946391+05:30	1986	African Tulip	3		16	1
1467	2021-01-15 10:29:10.947071+05:30	1985	African Tulip	3		16	1
1468	2021-01-15 10:29:10.947071+05:30	1984	African Tulip	3		16	1
1469	2021-01-15 10:29:17.120437+05:30	1983	African Tulip	3		16	1
1470	2021-01-15 10:29:17.156987+05:30	1982	Raintree	3		16	1
1471	2021-01-15 10:29:17.159989+05:30	1981	Raintree	3		16	1
1472	2021-01-15 10:29:17.162982+05:30	1980	Raintree	3		16	1
1473	2021-01-15 10:29:17.166008+05:30	1979	Raintree	3		16	1
1474	2021-01-15 10:29:17.169999+05:30	1978	Raintree	3		16	1
1475	2021-01-15 10:29:17.206331+05:30	1977	Bauhinia	3		16	1
1476	2021-01-15 10:29:17.207924+05:30	1976	Bauhinia	3		16	1
1477	2021-01-15 10:29:17.20916+05:30	1975	Bauhinia	3		16	1
1478	2021-01-15 10:29:17.209945+05:30	1974	Bauhinia	3		16	1
1479	2021-01-15 10:29:17.210734+05:30	1973	Bauhinia	3		16	1
1480	2021-01-15 10:29:17.211035+05:30	1972	Tecoma	3		16	1
1481	2021-01-15 10:29:17.212035+05:30	1971	Tecoma	3		16	1
1482	2021-01-15 10:29:17.213107+05:30	1970	Tecoma	3		16	1
1483	2021-01-15 10:29:17.214697+05:30	1969	Tecoma	3		16	1
1485	2021-01-15 10:29:17.217311+05:30	1967	Trumpet Tree	3		16	1
1486	2021-01-15 10:29:17.218312+05:30	1966	Trumpet Tree	3		16	1
1487	2021-01-15 10:29:17.220375+05:30	1965	Trumpet Tree	3		16	1
1488	2021-01-15 10:29:17.220888+05:30	1964	Trumpet Tree	3		16	1
1489	2021-01-15 10:29:17.222885+05:30	1963	Trumpet Tree	3		16	1
1490	2021-01-15 10:29:17.224022+05:30	1962	Gulmohar	3		16	1
1491	2021-01-15 10:29:17.225443+05:30	1961	Gulmohar	3		16	1
1492	2021-01-15 10:29:17.226574+05:30	1960	Gulmohar	3		16	1
1493	2021-01-15 10:29:17.228511+05:30	1959	Gulmohar	3		16	1
1494	2021-01-15 10:29:17.229314+05:30	1958	Gulmohar	3		16	1
1495	2021-01-15 10:29:17.231308+05:30	1957	Acacia Magium	3		16	1
1496	2021-01-15 10:29:17.233611+05:30	1956	Acacia Magium	3		16	1
1497	2021-01-15 10:29:17.234893+05:30	1955	Acacia Magium	3		16	1
1498	2021-01-15 10:29:17.236159+05:30	1954	Acacia Magium	3		16	1
1499	2021-01-15 10:29:17.237431+05:30	1953	Acacia Magium	3		16	1
1500	2021-01-15 10:29:17.2387+05:30	1952	Eucalyptus Citriodora	3		16	1
1501	2021-01-15 10:29:17.239955+05:30	1951	Eucalyptus Citriodora	3		16	1
1502	2021-01-15 10:29:17.241208+05:30	1950	Eucalyptus Citriodora	3		16	1
1503	2021-01-15 10:29:17.242209+05:30	1949	Eucalyptus Citriodora	3		16	1
1504	2021-01-15 10:29:17.243215+05:30	1948	Eucalyptus Citriodora	3		16	1
1505	2021-01-15 10:29:17.245343+05:30	1947	Amla	3		16	1
1506	2021-01-15 10:29:17.246407+05:30	1946	Amla	3		16	1
1507	2021-01-15 10:29:17.247211+05:30	1945	Amla	3		16	1
1508	2021-01-15 10:29:17.248544+05:30	1944	Amla	3		16	1
1509	2021-01-15 10:29:17.249631+05:30	1943	Amla	3		16	1
1510	2021-01-15 10:29:17.250433+05:30	1942	Lagerstroemia	3		16	1
1511	2021-01-15 10:29:17.251207+05:30	1941	Lagerstroemia	3		16	1
1512	2021-01-15 10:29:17.251987+05:30	1940	Lagerstroemia	3		16	1
1513	2021-01-15 10:29:17.253848+05:30	1939	Lagerstroemia	3		16	1
1514	2021-01-15 10:29:17.254633+05:30	1938	Lagerstroemia	3		16	1
1515	2021-01-15 10:29:17.254931+05:30	1937	Soapnut	3		16	1
1516	2021-01-15 10:29:17.255931+05:30	1936	Soapnut	3		16	1
1517	2021-01-15 10:29:17.255931+05:30	1935	Soapnut	3		16	1
1518	2021-01-15 10:29:17.256928+05:30	1934	Soapnut	3		16	1
1519	2021-01-15 10:29:17.286886+05:30	1933	Soapnut	3		16	1
1520	2021-01-15 10:29:17.306801+05:30	1932	Areca Palm	3		16	1
1521	2021-01-15 10:29:17.306801+05:30	1931	Areca Palm	3		16	1
1522	2021-01-15 10:29:17.307798+05:30	1930	Areca Palm	3		16	1
1523	2021-01-15 10:29:17.308794+05:30	1929	Areca Palm	3		16	1
1524	2021-01-15 10:29:17.309396+05:30	1928	Areca Palm	3		16	1
1525	2021-01-15 10:29:17.309396+05:30	1927	Bamboo	3		16	1
1526	2021-01-15 10:29:17.310396+05:30	1926	Bamboo	3		16	1
1527	2021-01-15 10:29:17.312495+05:30	1925	Bamboo	3		16	1
1528	2021-01-15 10:29:17.313664+05:30	1924	Bamboo	3		16	1
1529	2021-01-15 10:29:17.316188+05:30	1923	Bamboo	3		16	1
1530	2021-01-15 10:29:17.317518+05:30	1922	Lucerne	3		16	1
1531	2021-01-15 10:29:17.318818+05:30	1921	Lucerne	3		16	1
1532	2021-01-15 10:29:17.320115+05:30	1920	Lucerne	3		16	1
1533	2021-01-15 10:29:17.321417+05:30	1919	Lucerne	3		16	1
1534	2021-01-15 10:29:17.32271+05:30	1918	Lucerne	3		16	1
1535	2021-01-15 10:29:17.324007+05:30	1917	Grass Seeds	3		16	1
1536	2021-01-15 10:29:17.324544+05:30	1916	Grass Seeds	3		16	1
1537	2021-01-15 10:29:17.326541+05:30	1915	Grass Seeds	3		16	1
1538	2021-01-15 10:29:17.32873+05:30	1914	Grass Seeds	3		16	1
1539	2021-01-15 10:29:17.329533+05:30	1913	Grass Seeds	3		16	1
1540	2021-01-15 10:29:17.331666+05:30	1912	Butea monosperma	3		16	1
1541	2021-01-15 10:29:17.333037+05:30	1911	Butea monosperma	3		16	1
1542	2021-01-15 10:29:17.3342+05:30	1910	Butea monosperma	3		16	1
1543	2021-01-15 10:29:17.3352+05:30	1909	Butea monosperma	3		16	1
1544	2021-01-15 10:29:17.336616+05:30	1908	Butea monosperma	3		16	1
1545	2021-01-15 10:29:17.338615+05:30	1907	Indian Elm (Tapasi)	3		16	1
1546	2021-01-15 10:29:17.338615+05:30	1906	Indian Elm (Tapasi)	3		16	1
1547	2021-01-15 10:29:17.339612+05:30	1905	Indian Elm (Tapasi)	3		16	1
1548	2021-01-15 10:29:17.340852+05:30	1904	Indian Elm (Tapasi)	3		16	1
1549	2021-01-15 10:29:17.341499+05:30	1903	Indian Elm (Tapasi)	3		16	1
1550	2021-01-15 10:29:17.342104+05:30	1902	Terminalia bellirica	3		16	1
1551	2021-01-15 10:29:17.342707+05:30	1901	Terminalia bellirica	3		16	1
1552	2021-01-15 10:29:17.343302+05:30	1900	Terminalia bellirica	3		16	1
1553	2021-01-15 10:29:17.344339+05:30	1899	Terminalia bellirica	3		16	1
1554	2021-01-15 10:29:17.34585+05:30	1898	Terminalia bellirica	3		16	1
1555	2021-01-15 10:29:17.346682+05:30	1897	Subabul	3		16	1
1556	2021-01-15 10:29:17.346682+05:30	1896	Subabul	3		16	1
1557	2021-01-15 10:29:17.347682+05:30	1895	Subabul	3		16	1
1558	2021-01-15 10:29:17.348707+05:30	1894	Subabul	3		16	1
1559	2021-01-15 10:29:17.349676+05:30	1893	Subabul	3		16	1
1560	2021-01-15 10:29:17.350742+05:30	1892	Neem	3		16	1
1561	2021-01-15 10:29:17.351606+05:30	1891	Neem	3		16	1
1562	2021-01-15 10:29:17.352423+05:30	1890	Neem	3		16	1
1563	2021-01-15 10:29:17.35423+05:30	1889	Neem	3		16	1
1564	2021-01-15 10:29:17.355066+05:30	1888	Neem	3		16	1
1565	2021-01-15 10:29:17.355856+05:30	1887	Melia Dubia	3		16	1
1566	2021-01-15 10:29:17.356334+05:30	1886	Melia Dubia	3		16	1
1567	2021-01-15 10:29:17.357433+05:30	1885	Melia Dubia	3		16	1
1568	2021-01-15 10:29:17.358216+05:30	1884	Melia Dubia	3		16	1
1569	2021-01-15 10:29:23.438189+05:30	1883	Melia Dubia	3		16	1
1570	2021-01-15 10:29:23.44231+05:30	1882	Terminalia elliptica	3		16	1
1571	2021-01-15 10:29:23.443309+05:30	1881	Terminalia elliptica	3		16	1
1572	2021-01-15 10:29:23.444307+05:30	1880	Terminalia elliptica	3		16	1
1573	2021-01-15 10:29:23.445561+05:30	1879	Terminalia elliptica	3		16	1
1574	2021-01-15 10:29:23.446059+05:30	1878	Terminalia elliptica	3		16	1
1575	2021-01-15 10:29:23.448069+05:30	1877	Almond 	3		16	1
1576	2021-01-15 10:29:23.449054+05:30	1876	Almond 	3		16	1
1577	2021-01-15 10:29:23.450073+05:30	1875	Almond 	3		16	1
1578	2021-01-15 10:29:23.451355+05:30	1874	Almond 	3		16	1
1579	2021-01-15 10:29:23.452808+05:30	1873	Almond 	3		16	1
1580	2021-01-15 10:29:23.45392+05:30	1872	Pterocarpus marsupium	3		16	1
1581	2021-01-15 10:29:23.455207+05:30	1871	Pterocarpus marsupium	3		16	1
1582	2021-01-15 10:29:23.456083+05:30	1870	Pterocarpus marsupium	3		16	1
1583	2021-01-15 10:29:23.457267+05:30	1869	Pterocarpus marsupium	3		16	1
1584	2021-01-15 10:29:23.458011+05:30	1868	Pterocarpus marsupium	3		16	1
1585	2021-01-15 10:29:23.458702+05:30	1867	Camara	3		16	1
1586	2021-01-15 10:29:23.459347+05:30	1866	Camara	3		16	1
1587	2021-01-15 10:29:23.459938+05:30	1865	Camara	3		16	1
1588	2021-01-15 10:29:23.460484+05:30	1864	Camara	3		16	1
1589	2021-01-15 10:29:23.461125+05:30	1863	Camara	3		16	1
1590	2021-01-15 10:29:23.461709+05:30	1862	Prosopis Juliflora	3		16	1
1591	2021-01-15 10:29:23.462236+05:30	1861	Prosopis Juliflora	3		16	1
1592	2021-01-15 10:29:23.463003+05:30	1860	Prosopis Juliflora	3		16	1
1593	2021-01-15 10:29:23.465222+05:30	1859	Prosopis Juliflora	3		16	1
1594	2021-01-15 10:29:23.466006+05:30	1858	Prosopis Juliflora	3		16	1
1595	2021-01-15 10:29:23.466857+05:30	1857	Gmelina arborea	3		16	1
1596	2021-01-15 10:29:23.468128+05:30	1856	Gmelina arborea	3		16	1
1597	2021-01-15 10:29:23.469232+05:30	1855	Gmelina arborea	3		16	1
1598	2021-01-15 10:29:23.47001+05:30	1854	Gmelina arborea	3		16	1
1599	2021-01-15 10:29:23.472009+05:30	1853	Gmelina arborea	3		16	1
1600	2021-01-15 10:29:23.473903+05:30	1852	Pongame	3		16	1
1601	2021-01-15 10:29:23.475199+05:30	1851	Pongame	3		16	1
1602	2021-01-15 10:29:23.476482+05:30	1850	Pongame	3		16	1
1603	2021-01-15 10:29:23.477754+05:30	1849	Pongame	3		16	1
1604	2021-01-15 10:29:23.478866+05:30	1848	Pongame	3		16	1
1605	2021-01-15 10:29:23.479783+05:30	1847	Rosewood	3		16	1
1606	2021-01-15 10:29:23.481781+05:30	1846	Rosewood	3		16	1
1607	2021-01-15 10:29:23.482743+05:30	1845	Rosewood	3		16	1
1608	2021-01-15 10:29:23.482743+05:30	1844	Rosewood	3		16	1
1609	2021-01-15 10:29:23.484805+05:30	1843	Rosewood	3		16	1
1610	2021-01-15 10:29:23.486067+05:30	1842	Silver Oak	3		16	1
1611	2021-01-15 10:29:23.487344+05:30	1841	Silver Oak	3		16	1
1612	2021-01-15 10:29:23.488632+05:30	1840	Silver Oak	3		16	1
1613	2021-01-15 10:29:23.489783+05:30	1839	Silver Oak	3		16	1
1614	2021-01-15 10:29:23.490663+05:30	1838	Silver Oak	3		16	1
1615	2021-01-15 10:29:23.491627+05:30	1837	Teak	3		16	1
1616	2021-01-15 10:29:23.492623+05:30	1836	Teak	3		16	1
1617	2021-01-15 10:29:23.493621+05:30	1835	Teak	3		16	1
1618	2021-01-15 10:29:23.493621+05:30	1834	Teak	3		16	1
1619	2021-01-15 10:29:23.495141+05:30	1833	Teak	3		16	1
1620	2021-01-15 10:29:23.495782+05:30	1832	Mahagony	3		16	1
1621	2021-01-15 10:29:23.495782+05:30	1831	Mahagony	3		16	1
1622	2021-01-15 10:29:23.497784+05:30	1830	Mahagony	3		16	1
1623	2021-01-15 10:29:23.49863+05:30	1829	Mahagony	3		16	1
1624	2021-01-15 10:29:23.499334+05:30	1828	Mahagony	3		16	1
1625	2021-01-15 10:29:23.500102+05:30	1827	Red Sandalwood	3		16	1
1626	2021-01-15 10:29:23.500102+05:30	1826	Red Sandalwood	3		16	1
1627	2021-01-15 10:29:23.501126+05:30	1825	Red Sandalwood	3		16	1
1628	2021-01-15 10:29:23.502098+05:30	1824	Red Sandalwood	3		16	1
1629	2021-01-15 10:29:23.503192+05:30	1823	Red Sandalwood	3		16	1
1630	2021-01-15 10:29:23.503955+05:30	1822	Sandalwood	3		16	1
1631	2021-01-15 10:29:23.504705+05:30	1821	Sandalwood	3		16	1
1632	2021-01-15 10:29:23.505464+05:30	1820	Sandalwood	3		16	1
1633	2021-01-15 10:29:23.506236+05:30	1819	Sandalwood	3		16	1
1634	2021-01-15 10:29:23.507397+05:30	1818	Sandalwood	3		16	1
1635	2021-01-15 10:29:23.508181+05:30	1817	Chilly	3		16	1
1636	2021-01-15 10:29:23.508937+05:30	1816	Chilly	3		16	1
1637	2021-01-15 10:29:23.509697+05:30	1815	Chilly	3		16	1
1638	2021-01-15 10:29:23.51046+05:30	1814	Kholrabi/Knol-khol	3		16	1
1639	2021-01-15 10:29:23.511211+05:30	1813	Kholrabi/Knol-khol	3		16	1
1640	2021-01-15 10:29:23.511959+05:30	1812	Kholrabi/Knol-khol	3		16	1
1641	2021-01-15 10:29:23.511959+05:30	1811	Celery	3		16	1
1642	2021-01-15 10:29:23.512958+05:30	1810	Celery	3		16	1
1643	2021-01-15 10:29:23.514953+05:30	1809	Celery	3		16	1
1644	2021-01-15 10:29:23.515981+05:30	1808	Dill Seeds	3		16	1
1645	2021-01-15 10:29:23.516762+05:30	1807	Dill Seeds	3		16	1
1646	2021-01-15 10:29:23.516762+05:30	1806	Dill Seeds	3		16	1
1647	2021-01-15 10:29:23.517761+05:30	1805	Coriander	3		16	1
1648	2021-01-15 10:29:23.517761+05:30	1804	Coriander	3		16	1
1649	2021-01-15 10:29:23.518758+05:30	1803	Coriander	3		16	1
1650	2021-01-15 10:29:23.519755+05:30	1802	Fennel seeds (Sauf)	3		16	1
1651	2021-01-15 10:29:23.520752+05:30	1801	Fennel seeds (Sauf)	3		16	1
1652	2021-01-15 10:29:23.520752+05:30	1800	Fennel seeds (Sauf)	3		16	1
1653	2021-01-15 10:29:23.52283+05:30	1799	Carom seeds (Ajwain)	3		16	1
1654	2021-01-15 10:29:23.523591+05:30	1798	Carom seeds (Ajwain)	3		16	1
1655	2021-01-15 10:29:23.523876+05:30	1797	Carom seeds (Ajwain)	3		16	1
1656	2021-01-15 10:29:23.524875+05:30	1796	Cauliflower	3		16	1
1657	2021-01-15 10:29:23.526191+05:30	1795	Cauliflower	3		16	1
1658	2021-01-15 10:29:23.526884+05:30	1794	Cauliflower	3		16	1
1659	2021-01-15 10:29:23.527618+05:30	1793	Spinach/Palak	3		16	1
1660	2021-01-15 10:29:23.528383+05:30	1792	Spinach/Palak	3		16	1
1661	2021-01-15 10:29:23.529117+05:30	1791	Spinach/Palak	3		16	1
1662	2021-01-15 10:29:23.529776+05:30	1790	Carrot	3		16	1
1663	2021-01-15 10:29:23.531883+05:30	1789	Carrot	3		16	1
1664	2021-01-15 10:29:23.532893+05:30	1788	Carrot	3		16	1
1665	2021-01-15 10:29:23.534123+05:30	1787	Onion	3		16	1
1666	2021-01-15 10:29:23.534996+05:30	1786	Onion	3		16	1
1667	2021-01-15 10:29:23.534996+05:30	1785	Onion	3		16	1
1668	2021-01-15 10:29:23.535996+05:30	1784	Methi/Fenugreek	3		16	1
1669	2021-01-15 10:29:29.736963+05:30	1783	Methi/Fenugreek	3		16	1
1670	2021-01-15 10:29:29.74093+05:30	1782	Methi/Fenugreek	3		16	1
1671	2021-01-15 10:29:29.741922+05:30	1781	Beetroot	3		16	1
1672	2021-01-15 10:29:29.743084+05:30	1780	Beetroot	3		16	1
1673	2021-01-15 10:29:29.743084+05:30	1779	Beetroot	3		16	1
1674	2021-01-15 10:29:29.744083+05:30	1778	Broccoli	3		16	1
1675	2021-01-15 10:29:29.74508+05:30	1777	Broccoli	3		16	1
1676	2021-01-15 10:29:29.745954+05:30	1776	Broccoli	3		16	1
1677	2021-01-15 10:29:29.745954+05:30	1775	Kholrabi	3		16	1
1678	2021-01-15 10:29:29.745954+05:30	1774	Kholrabi	3		16	1
1679	2021-01-15 10:29:29.745954+05:30	1773	Kholrabi	3		16	1
1680	2021-01-15 10:29:29.745954+05:30	1772	Clover	3		16	1
1681	2021-01-15 10:29:29.745954+05:30	1771	Clover	3		16	1
1682	2021-01-15 10:29:29.745954+05:30	1770	Clover	3		16	1
1683	2021-01-15 10:29:29.745954+05:30	1769	Parsley Gaint	3		16	1
1684	2021-01-15 10:29:29.745954+05:30	1768	Parsley Gaint	3		16	1
1685	2021-01-15 10:29:29.745954+05:30	1767	Parsley Gaint	3		16	1
1686	2021-01-15 10:29:29.745954+05:30	1766	Red Lettuce	3		16	1
1687	2021-01-15 10:29:29.745954+05:30	1765	Red Lettuce	3		16	1
1688	2021-01-15 10:29:29.745954+05:30	1764	Red Lettuce	3		16	1
1689	2021-01-15 10:29:29.745954+05:30	1763	Lettuce	3		16	1
1690	2021-01-15 10:29:29.745954+05:30	1762	Lettuce	3		16	1
1691	2021-01-15 10:29:29.745954+05:30	1761	Lettuce	3		16	1
1692	2021-01-15 10:29:29.745954+05:30	1760	Pok Choi	3		16	1
1693	2021-01-15 10:29:29.745954+05:30	1759	Pok Choi	3		16	1
1694	2021-01-15 10:29:29.761576+05:30	1758	Pok Choi	3		16	1
1695	2021-01-15 10:29:29.761576+05:30	1757	Basil	3		16	1
1696	2021-01-15 10:29:29.762937+05:30	1756	Basil	3		16	1
1697	2021-01-15 10:29:29.763967+05:30	1755	Basil	3		16	1
1698	2021-01-15 10:29:29.764841+05:30	1754	Arugula	3		16	1
1699	2021-01-15 10:29:29.765734+05:30	1753	Arugula	3		16	1
1700	2021-01-15 10:29:29.766531+05:30	1752	Arugula	3		16	1
1701	2021-01-15 10:29:29.768205+05:30	1751	Mustard	3		16	1
1702	2021-01-15 10:29:29.768205+05:30	1750	Mustard	3		16	1
1703	2021-01-15 10:29:29.769205+05:30	1749	Mustard	3		16	1
1704	2021-01-15 10:29:29.770205+05:30	1748	Chia	3		16	1
1705	2021-01-15 10:29:29.771415+05:30	1747	Chia	3		16	1
1706	2021-01-15 10:29:29.772043+05:30	1746	Chia	3		16	1
1707	2021-01-15 10:29:29.772642+05:30	1745	Kale	3		16	1
1708	2021-01-15 10:29:29.773242+05:30	1744	Kale	3		16	1
1709	2021-01-15 10:29:29.773739+05:30	1743	Kale	3		16	1
1710	2021-01-15 10:29:29.773739+05:30	1742	Sesame	3		16	1
1711	2021-01-15 10:29:29.775765+05:30	1741	Sesame	3		16	1
1712	2021-01-15 10:29:29.776734+05:30	1740	Sesame	3		16	1
1713	2021-01-15 10:29:29.777742+05:30	1739	Alfalfa	3		16	1
1714	2021-01-15 10:29:29.777742+05:30	1738	Alfalfa	3		16	1
1715	2021-01-15 10:29:29.779726+05:30	1737	Alfalfa	3		16	1
1716	2021-01-15 10:29:29.780723+05:30	1736	Flax	3		16	1
1717	2021-01-15 10:29:29.781722+05:30	1735	Flax	3		16	1
1718	2021-01-15 10:29:29.782718+05:30	1734	Flax	3		16	1
1719	2021-01-15 10:29:29.785056+05:30	1733	Chinese Cabbage	3		16	1
1720	2021-01-15 10:29:29.785556+05:30	1732	Chinese Cabbage	3		16	1
1721	2021-01-15 10:29:29.787279+05:30	1731	Chinese Cabbage	3		16	1
1722	2021-01-15 10:29:29.788348+05:30	1730	Cabbage	3		16	1
1723	2021-01-15 10:29:29.788348+05:30	1729	Cabbage	3		16	1
1724	2021-01-15 10:29:29.789276+05:30	1728	Cabbage	3		16	1
1725	2021-01-15 10:29:29.790634+05:30	1727	White Radish (2 in 1)	3		16	1
1726	2021-01-15 10:29:29.790918+05:30	1726	White Radish (2 in 1)	3		16	1
1727	2021-01-15 10:29:29.793657+05:30	1725	White Radish (2 in 1)	3		16	1
1728	2021-01-15 10:29:29.79451+05:30	1724	Garden Cress	3		16	1
1729	2021-01-15 10:29:29.79451+05:30	1723	Garden Cress	3		16	1
1730	2021-01-15 10:29:29.79551+05:30	1722	Garden Cress	3		16	1
1731	2021-01-15 10:29:29.796834+05:30	1721	Amaranthus Green	3		16	1
1732	2021-01-15 10:29:29.797524+05:30	1720	Amaranthus Green	3		16	1
1733	2021-01-15 10:29:29.797524+05:30	1719	Amaranthus Green	3		16	1
1734	2021-01-15 10:29:29.79854+05:30	1718	Amaranthus Red	3		16	1
1735	2021-01-15 10:29:29.79954+05:30	1717	Amaranthus Red	3		16	1
1736	2021-01-15 10:29:29.801724+05:30	1716	Amaranthus Red	3		16	1
1737	2021-01-15 10:29:29.801724+05:30	1715	Cabbage (Hybrid)	3		16	1
1738	2021-01-15 10:29:29.802723+05:30	1714	Cabbage (Hybrid)	3		16	1
1739	2021-01-15 10:29:29.803751+05:30	1713	Cabbage (Hybrid)	3		16	1
1740	2021-01-15 10:29:29.804459+05:30	1712	Cabbage	3		16	1
1741	2021-01-15 10:29:29.805137+05:30	1711	Cabbage	3		16	1
1742	2021-01-15 10:29:29.805753+05:30	1710	Cabbage	3		16	1
1743	2021-01-15 10:29:29.806387+05:30	1709	Red Lettuce	3		16	1
1744	2021-01-15 10:29:29.806982+05:30	1708	Red Lettuce	3		16	1
1745	2021-01-15 10:29:29.807604+05:30	1707	Red Lettuce	3		16	1
1746	2021-01-15 10:29:29.808348+05:30	1706	Lettuce	3		16	1
1747	2021-01-15 10:29:29.809284+05:30	1705	Lettuce	3		16	1
1748	2021-01-15 10:29:29.810044+05:30	1704	Lettuce	3		16	1
1749	2021-01-15 10:29:29.810779+05:30	1703	Pok Choi	3		16	1
1750	2021-01-15 10:29:29.811421+05:30	1702	Pok Choi	3		16	1
1751	2021-01-15 10:29:29.812281+05:30	1701	Pok Choi	3		16	1
1752	2021-01-15 10:29:29.813282+05:30	1700	Chinese Cabbage	3		16	1
1753	2021-01-15 10:29:29.814279+05:30	1699	Chinese Cabbage	3		16	1
1754	2021-01-15 10:29:29.815754+05:30	1698	Chinese Cabbage	3		16	1
1755	2021-01-15 10:29:29.816041+05:30	1697	BASIL	3		16	1
1756	2021-01-15 10:29:29.818179+05:30	1696	BASIL	3		16	1
1757	2021-01-15 10:29:29.819008+05:30	1695	BASIL	3		16	1
1758	2021-01-15 10:29:29.819755+05:30	1694	Oregano	3		16	1
1759	2021-01-15 10:29:29.820404+05:30	1693	Oregano	3		16	1
1760	2021-01-15 10:29:29.821285+05:30	1692	Oregano	3		16	1
1761	2021-01-15 10:29:29.821556+05:30	1691	Thyme	3		16	1
1762	2021-01-15 10:29:29.822555+05:30	1690	Thyme	3		16	1
1763	2021-01-15 10:29:29.822555+05:30	1689	Thyme	3		16	1
1764	2021-01-15 10:29:29.823553+05:30	1688	Leek	3		16	1
1765	2021-01-15 10:29:29.82455+05:30	1687	Leek	3		16	1
1766	2021-01-15 10:29:29.826676+05:30	1686	Leek	3		16	1
1767	2021-01-15 10:29:29.827376+05:30	1685	Kale	3		16	1
1768	2021-01-15 10:29:29.828059+05:30	1684	Kale	3		16	1
1769	2021-01-15 10:29:37.190207+05:30	1683	Kale	3		16	1
1770	2021-01-15 10:29:37.194298+05:30	1682	Chives	3		16	1
1771	2021-01-15 10:29:37.195207+05:30	1681	Chives	3		16	1
1772	2021-01-15 10:29:37.196204+05:30	1680	Chives	3		16	1
1773	2021-01-15 10:29:37.197215+05:30	1679	Celery	3		16	1
1774	2021-01-15 10:29:37.198212+05:30	1678	Celery	3		16	1
1775	2021-01-15 10:29:37.199183+05:30	1677	Celery	3		16	1
1776	2021-01-15 10:29:37.199183+05:30	1676	Rosemary	3		16	1
1777	2021-01-15 10:29:37.200704+05:30	1675	Rosemary	3		16	1
1778	2021-01-15 10:29:37.201573+05:30	1674	Rosemary	3		16	1
1779	2021-01-15 10:29:37.202299+05:30	1673	Mint	3		16	1
1780	2021-01-15 10:29:37.203858+05:30	1672	Mint	3		16	1
1781	2021-01-15 10:29:37.204132+05:30	1671	Mint	3		16	1
1782	2021-01-15 10:29:37.205132+05:30	1670	Parsley Gaint	3		16	1
1783	2021-01-15 10:29:37.206129+05:30	1669	Parsley Gaint	3		16	1
1784	2021-01-15 10:29:37.20675+05:30	1668	Parsley Gaint	3		16	1
1785	2021-01-15 10:29:37.207038+05:30	1667	Spinach/Palak	3		16	1
1786	2021-01-15 10:29:37.208038+05:30	1666	Spinach/Palak	3		16	1
1787	2021-01-15 10:29:37.208038+05:30	1665	Spinach/Palak	3		16	1
1788	2021-01-15 10:29:37.209485+05:30	1664	Methi/Fenugreek	3		16	1
1789	2021-01-15 10:29:37.21018+05:30	1663	Methi/Fenugreek	3		16	1
1790	2021-01-15 10:29:37.210787+05:30	1662	Methi/Fenugreek	3		16	1
1791	2021-01-15 10:29:37.211372+05:30	1661	Dill Seeds	3		16	1
1792	2021-01-15 10:29:37.211372+05:30	1660	Dill Seeds	3		16	1
1793	2021-01-15 10:29:37.212702+05:30	1659	Dill Seeds	3		16	1
1794	2021-01-15 10:29:37.213622+05:30	1658	Coriander	3		16	1
1795	2021-01-15 10:29:37.214329+05:30	1657	Coriander	3		16	1
1796	2021-01-15 10:29:37.214329+05:30	1656	Coriander	3		16	1
1797	2021-01-15 10:29:37.215233+05:30	1655	Amaranthus Red	3		16	1
1798	2021-01-15 10:29:37.216232+05:30	1654	Amaranthus Red	3		16	1
1799	2021-01-15 10:29:37.216232+05:30	1653	Amaranthus Red	3		16	1
1800	2021-01-15 10:29:37.217822+05:30	1652	Amaranthus Green	3		16	1
1801	2021-01-15 10:29:37.218566+05:30	1651	Amaranthus Green	3		16	1
1802	2021-01-15 10:29:37.219308+05:30	1650	Amaranthus Green	3		16	1
1803	2021-01-15 10:29:37.220051+05:30	1649	Spinach/Palak	3		16	1
1804	2021-01-15 10:29:37.220324+05:30	1648	Spinach/Palak	3		16	1
1805	2021-01-15 10:29:37.221324+05:30	1647	Spinach/Palak	3		16	1
1806	2021-01-15 10:29:37.222352+05:30	1646	Parsley Gaint	3		16	1
1807	2021-01-15 10:29:37.223319+05:30	1645	Parsley Gaint	3		16	1
1808	2021-01-15 10:29:37.224834+05:30	1644	Parsley Gaint	3		16	1
1809	2021-01-15 10:29:37.225615+05:30	1643	Coriander	3		16	1
1810	2021-01-15 10:29:37.226376+05:30	1642	Coriander	3		16	1
1811	2021-01-15 10:29:37.227121+05:30	1641	Coriander	3		16	1
1812	2021-01-15 10:29:37.227121+05:30	1640	Dill Seeds	3		16	1
1813	2021-01-15 10:29:37.22812+05:30	1639	Dill Seeds	3		16	1
1814	2021-01-15 10:29:37.229434+05:30	1638	Dill Seeds	3		16	1
1815	2021-01-15 10:29:37.230464+05:30	1637	Methi/Fenugreek	3		16	1
1816	2021-01-15 10:29:37.23143+05:30	1636	Methi/Fenugreek	3		16	1
1817	2021-01-15 10:29:37.232428+05:30	1635	Methi/Fenugreek	3		16	1
1818	2021-01-15 10:29:37.232428+05:30	1634	Amaranthus Green	3		16	1
1819	2021-01-15 10:29:37.233425+05:30	1633	Amaranthus Green	3		16	1
1820	2021-01-15 10:29:37.234422+05:30	1632	Amaranthus Green	3		16	1
1821	2021-01-15 10:29:37.235419+05:30	1631	Amaranthus Red	3		16	1
1822	2021-01-15 10:29:37.235419+05:30	1630	Amaranthus Red	3		16	1
1823	2021-01-15 10:29:37.236417+05:30	1629	Amaranthus Red	3		16	1
1824	2021-01-15 10:29:37.237414+05:30	1628	Oregano	3		16	1
1825	2021-01-15 10:29:37.239456+05:30	1627	Oregano	3		16	1
1826	2021-01-15 10:29:37.239456+05:30	1626	Oregano	3		16	1
1827	2021-01-15 10:29:37.240406+05:30	1625	Leek	3		16	1
1828	2021-01-15 10:29:37.241404+05:30	1624	Leek	3		16	1
1829	2021-01-15 10:29:37.242433+05:30	1623	Leek	3		16	1
1830	2021-01-15 10:29:37.242433+05:30	1622	Kale	3		16	1
1831	2021-01-15 10:29:37.243427+05:30	1621	Kale	3		16	1
1832	2021-01-15 10:29:37.244396+05:30	1620	Kale	3		16	1
1833	2021-01-15 10:29:37.244396+05:30	1619	Celery	3		16	1
1834	2021-01-15 10:29:37.245393+05:30	1618	Celery	3		16	1
1835	2021-01-15 10:29:37.247788+05:30	1617	Celery	3		16	1
1836	2021-01-15 10:29:37.248385+05:30	1616	Basil	3		16	1
1837	2021-01-15 10:29:37.248962+05:30	1615	Basil	3		16	1
1838	2021-01-15 10:29:37.249509+05:30	1614	Basil	3		16	1
1839	2021-01-15 10:29:37.250141+05:30	1613	Chives	3		16	1
1840	2021-01-15 10:29:37.250746+05:30	1612	Chives	3		16	1
1841	2021-01-15 10:29:37.251356+05:30	1611	Chives	3		16	1
1842	2021-01-15 10:29:37.251356+05:30	1610	Thyme	3		16	1
1843	2021-01-15 10:29:37.252356+05:30	1609	Thyme	3		16	1
1844	2021-01-15 10:29:37.253387+05:30	1608	Thyme	3		16	1
1845	2021-01-15 10:29:37.254374+05:30	1607	Mint	3		16	1
1846	2021-01-15 10:29:37.256275+05:30	1606	Mint	3		16	1
1847	2021-01-15 10:29:37.256275+05:30	1605	Mint	3		16	1
1848	2021-01-15 10:29:37.257274+05:30	1604	Rosemary	3		16	1
1849	2021-01-15 10:29:37.258307+05:30	1603	Rosemary	3		16	1
1850	2021-01-15 10:29:37.259319+05:30	1602	Rosemary	3		16	1
1851	2021-01-15 10:29:37.260118+05:30	1601	Pok-Choi	3		16	1
1852	2021-01-15 10:29:37.260879+05:30	1600	Pok-Choi	3		16	1
1853	2021-01-15 10:29:37.261545+05:30	1599	Pok-Choi	3		16	1
1854	2021-01-15 10:29:37.262402+05:30	1598	Lettuce	3		16	1
1855	2021-01-15 10:29:37.26465+05:30	1597	Lettuce	3		16	1
1856	2021-01-15 10:29:37.265503+05:30	1596	Lettuce	3		16	1
1857	2021-01-15 10:29:37.266284+05:30	1595	Red Lettuce	3		16	1
1858	2021-01-15 10:29:37.26706+05:30	1594	Red Lettuce	3		16	1
1859	2021-01-15 10:29:37.267351+05:30	1593	Red Lettuce	3		16	1
1860	2021-01-15 10:29:37.26835+05:30	1592	Kholrabi/Knol-khol	3		16	1
1861	2021-01-15 10:29:37.269348+05:30	1591	Kholrabi/Knol-khol	3		16	1
1862	2021-01-15 10:29:37.270346+05:30	1590	Kholrabi/Knol-khol	3		16	1
1863	2021-01-15 10:29:37.271959+05:30	1589	Radish 2 in 1 (Palak and Radish)	3		16	1
1864	2021-01-15 10:29:37.272671+05:30	1588	Radish 2 in 1 (Palak and Radish)	3		16	1
1865	2021-01-15 10:29:37.273294+05:30	1587	Radish 2 in 1 (Palak and Radish)	3		16	1
1866	2021-01-15 10:29:37.2739+05:30	1586	Onion Light Red	3		16	1
1867	2021-01-15 10:29:37.274503+05:30	1585	Onion Light Red	3		16	1
1868	2021-01-15 10:29:37.275115+05:30	1584	Onion Light Red	3		16	1
1869	2021-01-15 10:29:45.98147+05:30	1583	Onion Dark Red	3		16	1
1870	2021-01-15 10:29:45.9851+05:30	1582	Onion Dark Red	3		16	1
1871	2021-01-15 10:29:45.986081+05:30	1581	Onion Dark Red	3		16	1
1872	2021-01-15 10:29:45.986949+05:30	1580	Muskmelon Rambo (Hybrid)	3		16	1
1873	2021-01-15 10:29:45.988306+05:30	1579	Muskmelon Rambo (Hybrid)	3		16	1
1874	2021-01-15 10:29:45.989159+05:30	1578	Muskmelon Rambo (Hybrid)	3		16	1
1875	2021-01-15 10:29:45.990012+05:30	1577	Muskmelon Sujay (Hybrid)	3		16	1
1876	2021-01-15 10:29:45.990787+05:30	1576	Muskmelon Sujay (Hybrid)	3		16	1
1877	2021-01-15 10:29:45.99155+05:30	1575	Muskmelon Sujay (Hybrid)	3		16	1
1878	2021-01-15 10:29:45.992309+05:30	1574	Muskmelon Samrat (Hybrid)	3		16	1
1879	2021-01-15 10:29:45.993075+05:30	1573	Muskmelon Samrat (Hybrid)	3		16	1
1880	2021-01-15 10:29:45.994371+05:30	1572	Muskmelon Samrat (Hybrid)	3		16	1
1881	2021-01-15 10:29:45.995367+05:30	1571	Muskmelon Mahi (Hybrid)	3		16	1
1882	2021-01-15 10:29:45.995367+05:30	1570	Muskmelon Mahi (Hybrid)	3		16	1
1883	2021-01-15 10:29:45.996393+05:30	1569	Muskmelon Mahi (Hybrid)	3		16	1
1884	2021-01-15 10:29:45.997652+05:30	1568	Marigold Yellow (Hybrid)	3		16	1
1885	2021-01-15 10:29:45.997946+05:30	1567	Marigold Yellow (Hybrid)	3		16	1
1886	2021-01-15 10:29:45.998945+05:30	1566	Marigold Yellow (Hybrid)	3		16	1
1887	2021-01-15 10:29:46.000941+05:30	1565	Marigold Orange (Hybrid)	3		16	1
1888	2021-01-15 10:29:46.002157+05:30	1564	Marigold Orange (Hybrid)	3		16	1
1889	2021-01-15 10:29:46.003615+05:30	1563	Marigold Orange (Hybrid)	3		16	1
1890	2021-01-15 10:29:46.0045+05:30	1562	Marigold Yellow	3		16	1
1891	2021-01-15 10:29:46.005266+05:30	1561	Marigold Yellow	3		16	1
1892	2021-01-15 10:29:46.006011+05:30	1560	Marigold Yellow	3		16	1
1893	2021-01-15 10:29:46.006663+05:30	1559	Marigold Orange	3		16	1
1894	2021-01-15 10:29:46.007508+05:30	1558	Marigold Orange	3		16	1
1895	2021-01-15 10:29:46.007508+05:30	1557	Marigold Orange	3		16	1
1896	2021-01-15 10:29:46.009609+05:30	1556	White Cucumber (Hybrid)	3		16	1
1897	2021-01-15 10:29:46.010503+05:30	1555	White Cucumber (Hybrid)	3		16	1
1898	2021-01-15 10:29:46.0115+05:30	1554	White Cucumber (Hybrid)	3		16	1
1899	2021-01-15 10:29:46.012497+05:30	1553	White Bittergourd (Hybrid)	3		16	1
1900	2021-01-15 10:29:46.04264+05:30	1552	White Bittergourd (Hybrid)	3		16	1
1901	2021-01-15 10:29:46.0437+05:30	1551	White Bittergourd (Hybrid)	3		16	1
1902	2021-01-15 10:29:46.0437+05:30	1550	Watermelon Green Stripes (Hybrid)	3		16	1
1903	2021-01-15 10:29:46.044636+05:30	1549	Watermelon Green Stripes (Hybrid)	3		16	1
1904	2021-01-15 10:29:46.046124+05:30	1548	Watermelon Green Stripes (Hybrid)	3		16	1
1905	2021-01-15 10:29:46.046914+05:30	1547	Watermelon Black (Hybrid)	3		16	1
1906	2021-01-15 10:29:46.047691+05:30	1546	Watermelon Black (Hybrid)	3		16	1
1907	2021-01-15 10:29:46.048558+05:30	1545	Watermelon Black (Hybrid)	3		16	1
1908	2021-01-15 10:29:46.049339+05:30	1544	Tomato Round Sour (Hybrid)	3		16	1
1909	2021-01-15 10:29:46.050121+05:30	1543	Tomato Round Sour (Hybrid)	3		16	1
1910	2021-01-15 10:29:46.050891+05:30	1542	Tomato Round Sour (Hybrid)	3		16	1
1911	2021-01-15 10:29:46.05216+05:30	1541	Tomato Oval (Hybrid)	3		16	1
1912	2021-01-15 10:29:46.052957+05:30	1540	Tomato Oval (Hybrid)	3		16	1
1913	2021-01-15 10:29:46.053741+05:30	1539	Tomato Oval (Hybrid)	3		16	1
1914	2021-01-15 10:29:46.054509+05:30	1538	Spongegourd Light Green (Hybrid)	3		16	1
1915	2021-01-15 10:29:46.05519+05:30	1537	Spongegourd Light Green (Hybrid)	3		16	1
1916	2021-01-15 10:29:46.056136+05:30	1536	Spongegourd Light Green (Hybrid)	3		16	1
1917	2021-01-15 10:29:46.056136+05:30	1535	Spongegourd Dark Green (Hybrid)	3		16	1
1918	2021-01-15 10:29:46.058135+05:30	1534	Spongegourd Dark Green (Hybrid)	3		16	1
1919	2021-01-15 10:29:46.060155+05:30	1533	Spongegourd Dark Green (Hybrid)	3		16	1
1920	2021-01-15 10:29:46.061127+05:30	1532	Round Bottlegourd (Hybrid)	3		16	1
1921	2021-01-15 10:29:46.061127+05:30	1531	Round Bottlegourd (Hybrid)	3		16	1
1922	2021-01-15 10:29:46.062149+05:30	1530	Round Bottlegourd (Hybrid)	3		16	1
1923	2021-01-15 10:29:46.06344+05:30	1529	Ridge Gourd (Hybrid)	3		16	1
1924	2021-01-15 10:29:46.06344+05:30	1528	Ridge Gourd (Hybrid)	3		16	1
1925	2021-01-15 10:29:46.064468+05:30	1527	Ridge Gourd (Hybrid)	3		16	1
1926	2021-01-15 10:29:46.065567+05:30	1526	Red Carrot (Hybrid)	3		16	1
1927	2021-01-15 10:29:46.075809+05:30	1525	Red Carrot (Hybrid)	3		16	1
1928	2021-01-15 10:29:46.077197+05:30	1524	Red Carrot (Hybrid)	3		16	1
1929	2021-01-15 10:29:46.078194+05:30	1523	Pumpkin Druva (Hybrid)	3		16	1
1930	2021-01-15 10:29:46.079359+05:30	1522	Pumpkin Druva (Hybrid)	3		16	1
1931	2021-01-15 10:29:46.080853+05:30	1521	Pumpkin Druva (Hybrid)	3		16	1
1932	2021-01-15 10:29:46.081854+05:30	1520	Pumpkin Boss (Hybrid)	3		16	1
1933	2021-01-15 10:29:46.08353+05:30	1519	Pumpkin Boss (Hybrid)	3		16	1
1934	2021-01-15 10:29:46.08487+05:30	1518	Pumpkin Boss (Hybrid)	3		16	1
1935	2021-01-15 10:29:46.086175+05:30	1517	Orange Carrot Nantes  (Hybrid)	3		16	1
1936	2021-01-15 10:29:46.087176+05:30	1516	Orange Carrot Nantes  (Hybrid)	3		16	1
1937	2021-01-15 10:29:46.088601+05:30	1515	Orange Carrot Nantes  (Hybrid)	3		16	1
1938	2021-01-15 10:29:46.089884+05:30	1514	Orange Carrot Kuroda (Hybrid)	3		16	1
1939	2021-01-15 10:29:46.090409+05:30	1513	Orange Carrot Kuroda (Hybrid)	3		16	1
1940	2021-01-15 10:29:46.093436+05:30	1512	Orange Carrot Kuroda (Hybrid)	3		16	1
1941	2021-01-15 10:29:46.094185+05:30	1511	Bottlegourd Long (Hybrid)	3		16	1
1942	2021-01-15 10:29:46.095674+05:30	1510	Bottlegourd Long (Hybrid)	3		16	1
1943	2021-01-15 10:29:46.096808+05:30	1509	Bottlegourd Long (Hybrid)	3		16	1
1944	2021-01-15 10:29:46.097314+05:30	1508	Green Bittergourd (Hybrid)	3		16	1
1945	2021-01-15 10:29:46.099311+05:30	1507	Green Bittergourd (Hybrid)	3		16	1
1946	2021-01-15 10:29:46.101306+05:30	1506	Green Bittergourd (Hybrid)	3		16	1
1947	2021-01-15 10:29:46.10276+05:30	1505	Chilly Dual Purpose-Dry/Fresh  (Hybrid)	3		16	1
1948	2021-01-15 10:29:46.103342+05:30	1504	Chilly Dual Purpose-Dry/Fresh  (Hybrid)	3		16	1
1949	2021-01-15 10:29:46.104097+05:30	1503	Chilly Dual Purpose-Dry/Fresh  (Hybrid)	3		16	1
1950	2021-01-15 10:29:46.104708+05:30	1502	Cucumber Light Green (Hybrid)	3		16	1
1951	2021-01-15 10:29:46.105345+05:30	1501	Cucumber Light Green (Hybrid)	3		16	1
1952	2021-01-15 10:29:46.105956+05:30	1500	Cucumber Light Green (Hybrid)	3		16	1
1953	2021-01-15 10:29:46.106566+05:30	1499	Cucumber Dark Green (Hybrid)	3		16	1
1954	2021-01-15 10:29:46.106566+05:30	1498	Cucumber Dark Green (Hybrid)	3		16	1
1955	2021-01-15 10:29:46.107566+05:30	1497	Cucumber Dark Green (Hybrid)	3		16	1
1956	2021-01-15 10:29:46.110144+05:30	1496	Chilly Spicy (Hybrid)	3		16	1
1957	2021-01-15 10:29:46.110144+05:30	1495	Chilly Spicy (Hybrid)	3		16	1
1958	2021-01-15 10:29:46.111143+05:30	1494	Chilly Spicy (Hybrid)	3		16	1
1959	2021-01-15 10:29:46.11214+05:30	1493	Chilly Dry/Tadka Purpose (Hybrid)	3		16	1
1960	2021-01-15 10:29:46.113137+05:30	1492	Chilly Dry/Tadka Purpose (Hybrid)	3		16	1
1961	2021-01-15 10:29:46.114135+05:30	1491	Chilly Dry/Tadka Purpose (Hybrid)	3		16	1
1962	2021-01-15 10:29:46.114957+05:30	1490	Chilly Bhajji  (Hybrid)	3		16	1
1963	2021-01-15 10:29:46.115728+05:30	1489	Chilly Bhajji  (Hybrid)	3		16	1
1964	2021-01-15 10:29:46.116009+05:30	1488	Chilly Bhajji  (Hybrid)	3		16	1
1965	2021-01-15 10:29:46.118106+05:30	1487	Chilly Achari  (Hybrid)	3		16	1
1966	2021-01-15 10:29:46.119003+05:30	1486	Chilly Achari  (Hybrid)	3		16	1
1967	2021-01-15 10:29:46.120086+05:30	1485	Chilly Achari  (Hybrid)	3		16	1
1968	2021-01-15 10:29:46.120998+05:30	1484	Cauliflower (Hybrid)	3		16	1
1969	2021-01-15 10:29:52.804148+05:30	1483	Cauliflower (Hybrid)	3		16	1
1970	2021-01-15 10:29:52.807319+05:30	1482	Cauliflower (Hybrid)	3		16	1
1971	2021-01-15 10:29:52.809155+05:30	1481	Cabbage (Hybrid)	3		16	1
1972	2021-01-15 10:29:52.810152+05:30	1480	Cabbage (Hybrid)	3		16	1
1973	2021-01-15 10:29:52.81166+05:30	1479	Cabbage (Hybrid)	3		16	1
1974	2021-01-15 10:29:52.812076+05:30	1478	Cabbage	3		16	1
1975	2021-01-15 10:29:52.814074+05:30	1477	Cabbage	3		16	1
1976	2021-01-15 10:29:52.815199+05:30	1476	Cabbage	3		16	1
1977	2021-01-15 10:29:52.816832+05:30	1475	Brinjal Naman (Hybrid)	3		16	1
1978	2021-01-15 10:29:52.817602+05:30	1474	Brinjal Naman (Hybrid)	3		16	1
1979	2021-01-15 10:29:52.818342+05:30	1473	Brinjal Naman (Hybrid)	3		16	1
1980	2021-01-15 10:29:52.819065+05:30	1472	Brinjal Myna (Hybrid)	3		16	1
1981	2021-01-15 10:29:52.819065+05:30	1471	Brinjal Myna (Hybrid)	3		16	1
1982	2021-01-15 10:29:52.820064+05:30	1470	Brinjal Myna (Hybrid)	3		16	1
1983	2021-01-15 10:29:52.821091+05:30	1469	Brinjal Hariya (Hybrid)	3		16	1
1984	2021-01-15 10:29:52.821091+05:30	1468	Brinjal Hariya (Hybrid)	3		16	1
1985	2021-01-15 10:29:52.822091+05:30	1467	Brinjal Hariya (Hybrid)	3		16	1
1986	2021-01-15 10:29:52.82335+05:30	1466	Brinjal Dhiraj (Hybrid)	3		16	1
1987	2021-01-15 10:29:52.824095+05:30	1465	Brinjal Dhiraj (Hybrid)	3		16	1
1988	2021-01-15 10:29:52.824824+05:30	1464	Brinjal Dhiraj (Hybrid)	3		16	1
1989	2021-01-15 10:29:52.825576+05:30	1463	Brinjal Aira (Hybrid)	3		16	1
1990	2021-01-15 10:29:52.826225+05:30	1462	Brinjal Aira (Hybrid)	3		16	1
1991	2021-01-15 10:29:52.827159+05:30	1461	Brinjal Aira (Hybrid)	3		16	1
1992	2021-01-15 10:29:52.828012+05:30	1460	Bhendi/Okra Mejestic (Hybrid)	3		16	1
1993	2021-01-15 10:29:52.829838+05:30	1459	Bhendi/Okra Mejestic (Hybrid)	3		16	1
1994	2021-01-15 10:29:52.830609+05:30	1458	Bhendi/Okra Mejestic (Hybrid)	3		16	1
1995	2021-01-15 10:29:52.831349+05:30	1457	Bhendi/Okra Deepa (Hybrid)	3		16	1
2317	2021-01-15 10:34:11.059581+05:30	2579	Onion	3		16	1
1996	2021-01-15 10:29:52.832089+05:30	1456	Bhendi/Okra Deepa (Hybrid)	3		16	1
1997	2021-01-15 10:29:52.832993+05:30	1455	Bhendi/Okra Deepa (Hybrid)	3		16	1
1998	2021-01-15 10:29:52.833738+05:30	1454	Beetroot Rado (Hybrid)	3		16	1
1999	2021-01-15 10:29:52.834499+05:30	1453	Beetroot Rado (Hybrid)	3		16	1
2000	2021-01-15 10:29:52.83524+05:30	1452	Beetroot Rado (Hybrid)	3		16	1
2001	2021-01-15 10:29:52.83598+05:30	1451	French Beans Tony	3		16	1
2002	2021-01-15 10:29:52.838165+05:30	1450	French Beans Tony	3		16	1
2003	2021-01-15 10:29:52.838165+05:30	1449	French Beans Tony	3		16	1
2004	2021-01-15 10:29:52.83919+05:30	1448	Chinese Cabbage	3		16	1
2005	2021-01-15 10:29:52.840162+05:30	1447	Chinese Cabbage	3		16	1
2006	2021-01-15 10:29:52.84116+05:30	1446	Chinese Cabbage	3		16	1
2007	2021-01-15 10:29:52.84116+05:30	1445	Brinjal Purple long	3		16	1
2008	2021-01-15 10:29:52.842156+05:30	1444	Brinjal Purple long	3		16	1
2009	2021-01-15 10:29:52.843213+05:30	1443	Brinjal Purple long	3		16	1
2010	2021-01-15 10:29:52.843213+05:30	1442	Brinjal Black long	3		16	1
2011	2021-01-15 10:29:52.845348+05:30	1441	Brinjal Black long	3		16	1
2012	2021-01-15 10:29:52.846347+05:30	1440	Brinjal Black long	3		16	1
2013	2021-01-15 10:29:52.846347+05:30	1439	Beetroot Gulab	3		16	1
2014	2021-01-15 10:29:52.847344+05:30	1438	Beetroot Gulab	3		16	1
2015	2021-01-15 10:29:52.848537+05:30	1437	Beetroot Gulab	3		16	1
2016	2021-01-15 10:29:52.849174+05:30	1436	Watermelon	3		16	1
2017	2021-01-15 10:29:52.849174+05:30	1435	watermelon 	3		16	1
2018	2021-01-15 10:29:52.850815+05:30	1434	Watermelon	3		16	1
2019	2021-01-15 10:29:52.852572+05:30	1433	Tomato	3		16	1
2020	2021-01-15 10:29:52.853251+05:30	1432	Tomato	3		16	1
2021	2021-01-15 10:29:52.853251+05:30	1431	Tomato	3		16	1
2022	2021-01-15 10:29:52.854162+05:30	1430	Tomato	3		16	1
2023	2021-01-15 10:29:52.855161+05:30	1429	Tomato	3		16	1
2024	2021-01-15 10:29:52.856249+05:30	1428	Tomato	3		16	1
2025	2021-01-15 10:29:52.856249+05:30	1427	Tomato	3		16	1
2026	2021-01-15 10:29:52.857249+05:30	1426	Tomato	3		16	1
2027	2021-01-15 10:29:52.858246+05:30	1425	Tomato	3		16	1
2028	2021-01-15 10:29:52.858246+05:30	1424	Tomato	3		16	1
2029	2021-01-15 10:29:52.859243+05:30	1423	Tomato	3		16	1
2030	2021-01-15 10:29:52.860276+05:30	1422	Tomato	3		16	1
2031	2021-01-15 10:29:52.861205+05:30	1421	Tomato	3		16	1
2032	2021-01-15 10:29:52.862339+05:30	1420	Tomato	3		16	1
2033	2021-01-15 10:29:52.863338+05:30	1419	Tomato	3		16	1
2034	2021-01-15 10:29:52.864363+05:30	1418	Tomato	3		16	1
2035	2021-01-15 10:29:52.864363+05:30	1417	Sponge Gound	3		16	1
2036	2021-01-15 10:29:52.865364+05:30	1416	Sponge Gound	3		16	1
2037	2021-01-15 10:29:52.866388+05:30	1415	Ridge Gourd	3		16	1
2038	2021-01-15 10:29:52.866388+05:30	1414	Radish	3		16	1
2039	2021-01-15 10:29:52.867358+05:30	1413	Pumpkin	3		16	1
2040	2021-01-15 10:29:52.868383+05:30	1412	Pumpkin	3		16	1
2041	2021-01-15 10:29:52.869353+05:30	1411	Muskmelon	3		16	1
2042	2021-01-15 10:29:52.870379+05:30	1410	Muskmelon	3		16	1
2043	2021-01-15 10:29:52.871568+05:30	1409	Muskmelon	3		16	1
2044	2021-01-15 10:29:52.872343+05:30	1408	Muskmelon	3		16	1
2045	2021-01-15 10:29:52.8731+05:30	1407	HY.Maize	3		16	1
2046	2021-01-15 10:29:52.873844+05:30	1406	Cucumber	3		16	1
2047	2021-01-15 10:29:52.874587+05:30	1405	Cucumber	3		16	1
2048	2021-01-15 10:29:52.874587+05:30	1404	Cucumber	3		16	1
2049	2021-01-15 10:29:52.875587+05:30	1403	Methi	3		16	1
2050	2021-01-15 10:29:52.876586+05:30	1402	Palak	3		16	1
2051	2021-01-15 10:29:52.877615+05:30	1401	Coriander	3		16	1
2052	2021-01-15 10:29:52.878458+05:30	1400	Coriander	3		16	1
2053	2021-01-15 10:29:52.879233+05:30	1399	Chilly	3		16	1
2054	2021-01-15 10:29:52.880393+05:30	1398	Chilly	3		16	1
2055	2021-01-15 10:29:52.88117+05:30	1397	Chilly	3		16	1
2056	2021-01-15 10:29:52.88192+05:30	1396	Chilly	3		16	1
2057	2021-01-15 10:29:52.882578+05:30	1395	Chilly	3		16	1
2058	2021-01-15 10:29:52.883399+05:30	1394	Chilly	3		16	1
2059	2021-01-15 10:29:52.883399+05:30	1393	Chilly	3		16	1
2060	2021-01-15 10:29:52.8844+05:30	1392	Chilly	3		16	1
2061	2021-01-15 10:29:52.885396+05:30	1391	Chilly	3		16	1
2062	2021-01-15 10:29:52.885396+05:30	1390	Carrot	3		16	1
2063	2021-01-15 10:29:52.888185+05:30	1389	Carrot	3		16	1
2064	2021-01-15 10:29:52.888185+05:30	1388	Carrot	3		16	1
2065	2021-01-15 10:29:52.889185+05:30	1387	Carrot	3		16	1
2066	2021-01-15 10:29:52.890523+05:30	1386	Capsicum	3		16	1
2067	2021-01-15 10:29:52.891266+05:30	1385	Redgram	3		16	1
2068	2021-01-15 10:29:52.892007+05:30	1384	Redgram	3		16	1
2069	2021-01-15 10:30:08.632085+05:30	1383	Beans 	3		16	1
2070	2021-01-15 10:30:08.63552+05:30	1382	Brinjal 	3		16	1
2071	2021-01-15 10:30:08.636443+05:30	1381	Brinjal 	3		16	1
2072	2021-01-15 10:30:08.637273+05:30	1380	Brinjal 	3		16	1
2073	2021-01-15 10:30:08.638087+05:30	1379	Brinjal	3		16	1
2074	2021-01-15 10:30:08.638904+05:30	1378	Brinjal	3		16	1
2075	2021-01-15 10:30:08.638904+05:30	1377	Brinjal	3		16	1
2076	2021-01-15 10:30:08.639903+05:30	1376	Brinjal	3		16	1
2077	2021-01-15 10:30:08.641163+05:30	1375	Brinjal	3		16	1
2078	2021-01-15 10:30:08.641909+05:30	1374	Brinjal	3		16	1
2079	2021-01-15 10:30:08.642909+05:30	1373	Bottle Gourd	3		16	1
2080	2021-01-15 10:30:08.643921+05:30	1372	Bottle Gourd	3		16	1
2081	2021-01-15 10:30:08.645008+05:30	1371	Bitter Gourd	3		16	1
2082	2021-01-15 10:30:08.6459+05:30	1370	Bitter Gourd	3		16	1
2083	2021-01-15 10:30:08.646599+05:30	1369	Bhendi/Okra	3		16	1
2084	2021-01-15 10:30:08.646599+05:30	1368	Bhendi/Okra	3		16	1
2085	2021-01-15 10:30:08.648073+05:30	1367	Bhendi/Okra	3		16	1
2086	2021-01-15 10:30:08.648818+05:30	1366	Bhendi/Okra	3		16	1
2087	2021-01-15 10:30:08.648818+05:30	1365	Bhendi/Okra	3		16	1
2088	2021-01-15 10:30:08.649818+05:30	1364	Bhendi/Okra	3		16	1
2089	2021-01-15 10:30:08.660772+05:30	1363	Beetroot	3		16	1
2090	2021-01-15 10:30:08.661949+05:30	1362	Beetroot	3		16	1
2091	2021-01-15 10:33:42.018595+05:30	2805	Avocado	3		16	1
2092	2021-01-15 10:33:42.020409+05:30	2804	Avocado	3		16	1
2093	2021-01-15 10:33:42.022324+05:30	2803	Avocado	3		16	1
2094	2021-01-15 10:33:42.023541+05:30	2802	Avocado	3		16	1
2095	2021-01-15 10:33:42.024541+05:30	2801	Avocado	3		16	1
2096	2021-01-15 10:33:42.02573+05:30	2800	Tamarind	3		16	1
2097	2021-01-15 10:33:42.02573+05:30	2799	Tamarind	3		16	1
2098	2021-01-15 10:33:42.026729+05:30	2798	Tamarind	3		16	1
2099	2021-01-15 10:33:42.028025+05:30	2797	Tamarind	3		16	1
2100	2021-01-15 10:33:42.028025+05:30	2796	Tamarind	3		16	1
2101	2021-01-15 10:33:42.03037+05:30	2795	Pomogranate	3		16	1
2102	2021-01-15 10:33:42.031139+05:30	2794	Pomogranate	3		16	1
2103	2021-01-15 10:33:42.03189+05:30	2793	Pomogranate	3		16	1
2318	2021-01-15 10:34:11.060579+05:30	2578	Onion	3		16	1
2104	2021-01-15 10:33:42.03189+05:30	2792	Pomogranate	3		16	1
2105	2021-01-15 10:33:42.032889+05:30	2791	Pomogranate	3		16	1
2106	2021-01-15 10:33:42.033887+05:30	2790	Chikkoo	3		16	1
2107	2021-01-15 10:33:42.034885+05:30	2789	Chikkoo	3		16	1
2108	2021-01-15 10:33:42.035589+05:30	2788	Chikkoo	3		16	1
2109	2021-01-15 10:33:42.036332+05:30	2787	Chikkoo	3		16	1
2110	2021-01-15 10:33:42.037123+05:30	2786	Chikkoo	3		16	1
2111	2021-01-15 10:33:42.039475+05:30	2785	Custard Apple	3		16	1
2112	2021-01-15 10:33:42.040221+05:30	2784	Custard Apple	3		16	1
2113	2021-01-15 10:33:42.041129+05:30	2783	Custard Apple	3		16	1
2114	2021-01-15 10:33:42.041812+05:30	2782	Custard Apple	3		16	1
2115	2021-01-15 10:33:42.042548+05:30	2781	Custard Apple	3		16	1
2116	2021-01-15 10:33:42.043287+05:30	2780	African Tulip	3		16	1
2117	2021-01-15 10:33:42.044054+05:30	2779	African Tulip	3		16	1
2118	2021-01-15 10:33:42.044054+05:30	2778	African Tulip	3		16	1
2119	2021-01-15 10:33:42.055101+05:30	2777	African Tulip	3		16	1
2120	2021-01-15 10:33:42.056089+05:30	2776	African Tulip	3		16	1
2121	2021-01-15 10:33:42.057088+05:30	2775	Raintree	3		16	1
2122	2021-01-15 10:33:42.057903+05:30	2774	Raintree	3		16	1
2123	2021-01-15 10:33:42.057903+05:30	2773	Raintree	3		16	1
2124	2021-01-15 10:33:42.059383+05:30	2772	Raintree	3		16	1
2125	2021-01-15 10:33:42.060124+05:30	2771	Raintree	3		16	1
2126	2021-01-15 10:33:42.060776+05:30	2770	Bauhinia	3		16	1
2127	2021-01-15 10:33:42.060776+05:30	2769	Bauhinia	3		16	1
2128	2021-01-15 10:33:42.062832+05:30	2768	Bauhinia	3		16	1
2129	2021-01-15 10:33:42.063971+05:30	2767	Bauhinia	3		16	1
2130	2021-01-15 10:33:42.064784+05:30	2766	Bauhinia	3		16	1
2131	2021-01-15 10:33:42.065072+05:30	2765	Tecoma	3		16	1
2132	2021-01-15 10:33:42.066071+05:30	2764	Tecoma	3		16	1
2133	2021-01-15 10:33:42.067069+05:30	2763	Tecoma	3		16	1
2134	2021-01-15 10:33:42.067069+05:30	2762	Tecoma	3		16	1
2135	2021-01-15 10:33:42.068427+05:30	2761	Tecoma	3		16	1
2136	2021-01-15 10:33:42.068427+05:30	2760	Trumpet Tree	3		16	1
2137	2021-01-15 10:33:42.069426+05:30	2759	Trumpet Tree	3		16	1
2138	2021-01-15 10:33:42.072236+05:30	2758	Trumpet Tree	3		16	1
2139	2021-01-15 10:33:42.072961+05:30	2757	Trumpet Tree	3		16	1
2140	2021-01-15 10:33:42.073666+05:30	2756	Trumpet Tree	3		16	1
2141	2021-01-15 10:33:42.074343+05:30	2755	Gulmohar	3		16	1
2142	2021-01-15 10:33:42.074948+05:30	2754	Gulmohar	3		16	1
2143	2021-01-15 10:33:42.074948+05:30	2753	Gulmohar	3		16	1
2144	2021-01-15 10:33:42.075948+05:30	2752	Gulmohar	3		16	1
2145	2021-01-15 10:33:42.07712+05:30	2751	Gulmohar	3		16	1
2146	2021-01-15 10:33:42.07712+05:30	2750	Acacia Magium	3		16	1
2147	2021-01-15 10:33:42.078738+05:30	2749	Acacia Magium	3		16	1
2148	2021-01-15 10:33:42.080594+05:30	2748	Acacia Magium	3		16	1
2149	2021-01-15 10:33:42.081362+05:30	2747	Acacia Magium	3		16	1
2150	2021-01-15 10:33:42.082123+05:30	2746	Acacia Magium	3		16	1
2151	2021-01-15 10:33:42.082885+05:30	2745	Eucalyptus Citriodora	3		16	1
2152	2021-01-15 10:33:42.08363+05:30	2744	Eucalyptus Citriodora	3		16	1
2153	2021-01-15 10:33:42.084385+05:30	2743	Eucalyptus Citriodora	3		16	1
2154	2021-01-15 10:33:42.085157+05:30	2742	Eucalyptus Citriodora	3		16	1
2155	2021-01-15 10:33:42.08591+05:30	2741	Eucalyptus Citriodora	3		16	1
2156	2021-01-15 10:33:42.086671+05:30	2740	Amla	3		16	1
2157	2021-01-15 10:33:42.087968+05:30	2739	Amla	3		16	1
2158	2021-01-15 10:33:42.088951+05:30	2738	Amla	3		16	1
2159	2021-01-15 10:33:42.089227+05:30	2737	Amla	3		16	1
2160	2021-01-15 10:33:42.090226+05:30	2736	Amla	3		16	1
2161	2021-01-15 10:33:42.090226+05:30	2735	Lagerstroemia	3		16	1
2162	2021-01-15 10:33:42.092222+05:30	2734	Lagerstroemia	3		16	1
2163	2021-01-15 10:33:42.092222+05:30	2733	Lagerstroemia	3		16	1
2164	2021-01-15 10:33:42.093219+05:30	2732	Lagerstroemia	3		16	1
2165	2021-01-15 10:33:42.094367+05:30	2731	Lagerstroemia	3		16	1
2166	2021-01-15 10:33:42.095304+05:30	2730	Soapnut	3		16	1
2167	2021-01-15 10:33:42.097307+05:30	2729	Soapnut	3		16	1
2168	2021-01-15 10:33:42.09808+05:30	2728	Soapnut	3		16	1
2169	2021-01-15 10:33:42.098843+05:30	2727	Soapnut	3		16	1
2170	2021-01-15 10:33:42.099589+05:30	2726	Soapnut	3		16	1
2171	2021-01-15 10:33:42.100337+05:30	2725	Areca Palm	3		16	1
2172	2021-01-15 10:33:42.101104+05:30	2724	Areca Palm	3		16	1
2173	2021-01-15 10:33:42.10139+05:30	2723	Areca Palm	3		16	1
2174	2021-01-15 10:33:42.102389+05:30	2722	Areca Palm	3		16	1
2175	2021-01-15 10:33:42.102389+05:30	2721	Areca Palm	3		16	1
2176	2021-01-15 10:33:42.103386+05:30	2720	Bamboo	3		16	1
2177	2021-01-15 10:33:42.10576+05:30	2719	Bamboo	3		16	1
2178	2021-01-15 10:33:42.106417+05:30	2718	Bamboo	3		16	1
2179	2021-01-15 10:33:42.107417+05:30	2717	Bamboo	3		16	1
2180	2021-01-15 10:33:42.107417+05:30	2716	Bamboo	3		16	1
2181	2021-01-15 10:33:42.108414+05:30	2715	Lucerne	3		16	1
2182	2021-01-15 10:33:42.109426+05:30	2714	Lucerne	3		16	1
2183	2021-01-15 10:33:42.110408+05:30	2713	Lucerne	3		16	1
2184	2021-01-15 10:33:42.111455+05:30	2712	Lucerne	3		16	1
2185	2021-01-15 10:33:42.111455+05:30	2711	Lucerne	3		16	1
2186	2021-01-15 10:33:42.113963+05:30	2710	Grass Seeds	3		16	1
2187	2021-01-15 10:33:42.114732+05:30	2709	Grass Seeds	3		16	1
2188	2021-01-15 10:33:42.114732+05:30	2708	Grass Seeds	3		16	1
2189	2021-01-15 10:33:42.116179+05:30	2707	Grass Seeds	3		16	1
2190	2021-01-15 10:33:42.116976+05:30	2706	Grass Seeds	3		16	1
2191	2021-01-15 10:33:50.674871+05:30	2705	Butea monosperma	3		16	1
2192	2021-01-15 10:33:50.678497+05:30	2704	Butea monosperma	3		16	1
2193	2021-01-15 10:33:50.680073+05:30	2703	Butea monosperma	3		16	1
2194	2021-01-15 10:33:50.681474+05:30	2702	Butea monosperma	3		16	1
2195	2021-01-15 10:33:50.682831+05:30	2701	Butea monosperma	3		16	1
2196	2021-01-15 10:33:50.684185+05:30	2700	Indian Elm (Tapasi)	3		16	1
2197	2021-01-15 10:33:50.685431+05:30	2699	Indian Elm (Tapasi)	3		16	1
2198	2021-01-15 10:33:50.686432+05:30	2698	Indian Elm (Tapasi)	3		16	1
2199	2021-01-15 10:33:50.687989+05:30	2697	Indian Elm (Tapasi)	3		16	1
2200	2021-01-15 10:33:50.689202+05:30	2696	Indian Elm (Tapasi)	3		16	1
2201	2021-01-15 10:33:50.690202+05:30	2695	Terminalia bellirica	3		16	1
2202	2021-01-15 10:33:50.690202+05:30	2694	Terminalia bellirica	3		16	1
2203	2021-01-15 10:33:50.691211+05:30	2693	Terminalia bellirica	3		16	1
2204	2021-01-15 10:33:50.69221+05:30	2692	Terminalia bellirica	3		16	1
2205	2021-01-15 10:33:50.693208+05:30	2691	Terminalia bellirica	3		16	1
2206	2021-01-15 10:33:50.693208+05:30	2690	Subabul	3		16	1
2207	2021-01-15 10:33:50.694233+05:30	2689	Subabul	3		16	1
2208	2021-01-15 10:33:50.695202+05:30	2688	Subabul	3		16	1
2209	2021-01-15 10:33:50.6962+05:30	2687	Subabul	3		16	1
2210	2021-01-15 10:33:50.6962+05:30	2686	Subabul	3		16	1
2211	2021-01-15 10:33:50.698195+05:30	2685	Neem	3		16	1
2212	2021-01-15 10:33:50.69983+05:30	2684	Neem	3		16	1
2213	2021-01-15 10:33:50.700545+05:30	2683	Neem	3		16	1
2214	2021-01-15 10:33:50.701341+05:30	2682	Neem	3		16	1
2215	2021-01-15 10:33:50.702178+05:30	2681	Neem	3		16	1
2216	2021-01-15 10:33:50.702178+05:30	2680	Melia Dubia	3		16	1
2217	2021-01-15 10:33:50.703777+05:30	2679	Melia Dubia	3		16	1
2218	2021-01-15 10:33:50.704595+05:30	2678	Melia Dubia	3		16	1
2219	2021-01-15 10:33:50.705362+05:30	2677	Melia Dubia	3		16	1
2220	2021-01-15 10:33:50.706542+05:30	2676	Melia Dubia	3		16	1
2221	2021-01-15 10:33:50.707205+05:30	2675	Terminalia elliptica	3		16	1
2222	2021-01-15 10:33:50.709214+05:30	2674	Terminalia elliptica	3		16	1
2223	2021-01-15 10:33:50.709986+05:30	2673	Terminalia elliptica	3		16	1
2224	2021-01-15 10:33:50.710733+05:30	2672	Terminalia elliptica	3		16	1
2225	2021-01-15 10:33:50.711182+05:30	2671	Terminalia elliptica	3		16	1
2226	2021-01-15 10:33:50.712182+05:30	2670	Almond 	3		16	1
2227	2021-01-15 10:33:50.712182+05:30	2669	Almond 	3		16	1
2228	2021-01-15 10:33:50.713206+05:30	2668	Almond 	3		16	1
2229	2021-01-15 10:33:50.714176+05:30	2667	Almond 	3		16	1
2230	2021-01-15 10:33:50.715274+05:30	2666	Almond 	3		16	1
2231	2021-01-15 10:33:50.717579+05:30	2665	Pterocarpus marsupium	3		16	1
2232	2021-01-15 10:33:50.718272+05:30	2664	Pterocarpus marsupium	3		16	1
2233	2021-01-15 10:33:50.719042+05:30	2663	Pterocarpus marsupium	3		16	1
2234	2021-01-15 10:33:50.719042+05:30	2662	Pterocarpus marsupium	3		16	1
2235	2021-01-15 10:33:50.720055+05:30	2661	Pterocarpus marsupium	3		16	1
2236	2021-01-15 10:33:50.721524+05:30	2660	Camara	3		16	1
2237	2021-01-15 10:33:50.722208+05:30	2659	Camara	3		16	1
2238	2021-01-15 10:33:50.722208+05:30	2658	Camara	3		16	1
2239	2021-01-15 10:33:50.72424+05:30	2657	Camara	3		16	1
2240	2021-01-15 10:33:50.725237+05:30	2656	Camara	3		16	1
2241	2021-01-15 10:33:50.726234+05:30	2655	Prosopis Juliflora	3		16	1
2242	2021-01-15 10:33:50.727463+05:30	2654	Prosopis Juliflora	3		16	1
2243	2021-01-15 10:33:50.728145+05:30	2653	Prosopis Juliflora	3		16	1
2244	2021-01-15 10:33:50.728794+05:30	2652	Prosopis Juliflora	3		16	1
2245	2021-01-15 10:33:50.729424+05:30	2651	Prosopis Juliflora	3		16	1
2246	2021-01-15 10:33:50.730087+05:30	2650	Gmelina arborea	3		16	1
2247	2021-01-15 10:33:50.730725+05:30	2649	Gmelina arborea	3		16	1
2248	2021-01-15 10:33:50.731485+05:30	2648	Gmelina arborea	3		16	1
2249	2021-01-15 10:33:50.732243+05:30	2647	Gmelina arborea	3		16	1
2250	2021-01-15 10:33:50.733996+05:30	2646	Gmelina arborea	3		16	1
2251	2021-01-15 10:33:50.734278+05:30	2645	Pongame	3		16	1
2252	2021-01-15 10:33:50.735278+05:30	2644	Pongame	3		16	1
2253	2021-01-15 10:33:50.736365+05:30	2643	Pongame	3		16	1
2254	2021-01-15 10:33:50.737274+05:30	2642	Pongame	3		16	1
2255	2021-01-15 10:33:50.738439+05:30	2641	Pongame	3		16	1
2256	2021-01-15 10:33:50.739266+05:30	2640	Rosewood	3		16	1
2257	2021-01-15 10:33:50.740032+05:30	2639	Rosewood	3		16	1
2258	2021-01-15 10:33:50.742044+05:30	2638	Rosewood	3		16	1
2259	2021-01-15 10:33:50.74296+05:30	2637	Rosewood	3		16	1
2260	2021-01-15 10:33:50.74296+05:30	2636	Rosewood	3		16	1
2261	2021-01-15 10:33:50.743959+05:30	2635	Silver Oak	3		16	1
2262	2021-01-15 10:33:50.745107+05:30	2634	Silver Oak	3		16	1
2263	2021-01-15 10:33:50.745853+05:30	2633	Silver Oak	3		16	1
2264	2021-01-15 10:33:50.746621+05:30	2632	Silver Oak	3		16	1
2265	2021-01-15 10:33:50.747285+05:30	2631	Silver Oak	3		16	1
2266	2021-01-15 10:33:50.747285+05:30	2630	Teak	3		16	1
2267	2021-01-15 10:33:50.74893+05:30	2629	Teak	3		16	1
2268	2021-01-15 10:33:50.750614+05:30	2628	Teak	3		16	1
2269	2021-01-15 10:33:50.751418+05:30	2627	Teak	3		16	1
2270	2021-01-15 10:33:50.751418+05:30	2626	Teak	3		16	1
2271	2021-01-15 10:33:50.752417+05:30	2625	Mahagony	3		16	1
2272	2021-01-15 10:33:50.753415+05:30	2624	Mahagony	3		16	1
2273	2021-01-15 10:33:50.754234+05:30	2623	Mahagony	3		16	1
2274	2021-01-15 10:33:50.754234+05:30	2622	Mahagony	3		16	1
2275	2021-01-15 10:33:50.755234+05:30	2621	Mahagony	3		16	1
2276	2021-01-15 10:33:50.756231+05:30	2620	Red Sandalwood	3		16	1
2277	2021-01-15 10:33:50.757233+05:30	2619	Red Sandalwood	3		16	1
2278	2021-01-15 10:33:50.758227+05:30	2618	Red Sandalwood	3		16	1
2279	2021-01-15 10:33:50.759847+05:30	2617	Red Sandalwood	3		16	1
2280	2021-01-15 10:33:50.760521+05:30	2616	Red Sandalwood	3		16	1
2281	2021-01-15 10:33:50.761134+05:30	2615	Sandalwood	3		16	1
2282	2021-01-15 10:33:50.761832+05:30	2614	Sandalwood	3		16	1
2283	2021-01-15 10:33:50.762453+05:30	2613	Sandalwood	3		16	1
2284	2021-01-15 10:33:50.763187+05:30	2612	Sandalwood	3		16	1
2285	2021-01-15 10:33:50.763919+05:30	2611	Sandalwood	3		16	1
2286	2021-01-15 10:33:50.764648+05:30	2610	Chilly	3		16	1
2287	2021-01-15 10:33:50.765373+05:30	2609	Chilly	3		16	1
2288	2021-01-15 10:33:50.767178+05:30	2608	Chilly	3		16	1
2289	2021-01-15 10:33:50.76797+05:30	2607	Kholrabi/Knol-khol	3		16	1
2290	2021-01-15 10:33:50.76797+05:30	2606	Kholrabi/Knol-khol	3		16	1
2291	2021-01-15 10:34:11.035955+05:30	2605	Kholrabi/Knol-khol	3		16	1
2292	2021-01-15 10:34:11.040263+05:30	2604	Celery	3		16	1
2293	2021-01-15 10:34:11.041177+05:30	2603	Celery	3		16	1
2294	2021-01-15 10:34:11.042066+05:30	2602	Celery	3		16	1
2295	2021-01-15 10:34:11.042066+05:30	2601	Dill Seeds	3		16	1
2296	2021-01-15 10:34:11.043831+05:30	2600	Dill Seeds	3		16	1
2297	2021-01-15 10:34:11.044689+05:30	2599	Dill Seeds	3		16	1
2298	2021-01-15 10:34:11.045472+05:30	2598	Coriander	3		16	1
2299	2021-01-15 10:34:11.046249+05:30	2597	Coriander	3		16	1
2300	2021-01-15 10:34:11.047016+05:30	2596	Coriander	3		16	1
2301	2021-01-15 10:34:11.047798+05:30	2595	Fennel seeds (Sauf)	3		16	1
2302	2021-01-15 10:34:11.048574+05:30	2594	Fennel seeds (Sauf)	3		16	1
2303	2021-01-15 10:34:11.049822+05:30	2593	Fennel seeds (Sauf)	3		16	1
2304	2021-01-15 10:34:11.049822+05:30	2592	Carom seeds (Ajwain)	3		16	1
2305	2021-01-15 10:34:11.050821+05:30	2591	Carom seeds (Ajwain)	3		16	1
2306	2021-01-15 10:34:11.051819+05:30	2590	Carom seeds (Ajwain)	3		16	1
2307	2021-01-15 10:34:11.052816+05:30	2589	Cauliflower	3		16	1
2308	2021-01-15 10:34:11.052816+05:30	2588	Cauliflower	3		16	1
2309	2021-01-15 10:34:11.053838+05:30	2587	Cauliflower	3		16	1
2310	2021-01-15 10:34:11.053838+05:30	2586	Spinach/Palak	3		16	1
2311	2021-01-15 10:34:11.05481+05:30	2585	Spinach/Palak	3		16	1
2312	2021-01-15 10:34:11.055811+05:30	2584	Spinach/Palak	3		16	1
2313	2021-01-15 10:34:11.056588+05:30	2583	Carrot	3		16	1
2314	2021-01-15 10:34:11.057624+05:30	2582	Carrot	3		16	1
2315	2021-01-15 10:34:11.058584+05:30	2581	Carrot	3		16	1
2316	2021-01-15 10:34:11.059581+05:30	2580	Onion	3		16	1
2319	2021-01-15 10:34:11.060579+05:30	2577	Methi/Fenugreek	3		16	1
2320	2021-01-15 10:34:11.062062+05:30	2576	Methi/Fenugreek	3		16	1
2321	2021-01-15 10:34:11.062674+05:30	2575	Methi/Fenugreek	3		16	1
2322	2021-01-15 10:34:11.063271+05:30	2574	Beetroot	3		16	1
2323	2021-01-15 10:34:11.06387+05:30	2573	Beetroot	3		16	1
2324	2021-01-15 10:34:11.064692+05:30	2572	Beetroot	3		16	1
2325	2021-01-15 10:34:11.066586+05:30	2571	Broccoli	3		16	1
2326	2021-01-15 10:34:11.06692+05:30	2570	Broccoli	3		16	1
2327	2021-01-15 10:34:11.06792+05:30	2569	Broccoli	3		16	1
2328	2021-01-15 10:34:11.068918+05:30	2568	Kholrabi	3		16	1
2329	2021-01-15 10:34:11.069948+05:30	2567	Kholrabi	3		16	1
2330	2021-01-15 10:34:11.070824+05:30	2566	Kholrabi	3		16	1
2331	2021-01-15 10:34:11.071609+05:30	2565	Clover	3		16	1
2332	2021-01-15 10:34:11.072384+05:30	2564	Clover	3		16	1
2333	2021-01-15 10:34:11.073145+05:30	2563	Clover	3		16	1
2334	2021-01-15 10:34:11.075065+05:30	2562	Parsley Gaint	3		16	1
2335	2021-01-15 10:34:11.075798+05:30	2561	Parsley Gaint	3		16	1
2336	2021-01-15 10:34:11.075798+05:30	2560	Parsley Gaint	3		16	1
2337	2021-01-15 10:34:11.076797+05:30	2559	Red Lettuce	3		16	1
2338	2021-01-15 10:34:11.078792+05:30	2558	Red Lettuce	3		16	1
2339	2021-01-15 10:34:11.079963+05:30	2557	Red Lettuce	3		16	1
2340	2021-01-15 10:34:11.080788+05:30	2556	Lettuce	3		16	1
2341	2021-01-15 10:34:11.083445+05:30	2555	Lettuce	3		16	1
2342	2021-01-15 10:34:11.083731+05:30	2554	Lettuce	3		16	1
2343	2021-01-15 10:34:11.084744+05:30	2553	Pok Choi	3		16	1
2344	2021-01-15 10:34:11.085728+05:30	2552	Pok Choi	3		16	1
2345	2021-01-15 10:34:11.086725+05:30	2551	Pok Choi	3		16	1
2346	2021-01-15 10:34:11.086725+05:30	2550	Basil	3		16	1
2347	2021-01-15 10:34:11.087734+05:30	2549	Basil	3		16	1
2348	2021-01-15 10:34:11.088745+05:30	2548	Basil	3		16	1
2349	2021-01-15 10:34:11.089717+05:30	2547	Arugula	3		16	1
2350	2021-01-15 10:34:11.091771+05:30	2546	Arugula	3		16	1
2351	2021-01-15 10:34:11.092537+05:30	2545	Arugula	3		16	1
2352	2021-01-15 10:34:11.093281+05:30	2544	Mustard	3		16	1
2353	2021-01-15 10:34:11.094024+05:30	2543	Mustard	3		16	1
2354	2021-01-15 10:34:11.094771+05:30	2542	Mustard	3		16	1
2355	2021-01-15 10:34:11.095518+05:30	2541	Chia	3		16	1
2356	2021-01-15 10:34:11.096258+05:30	2540	Chia	3		16	1
2357	2021-01-15 10:34:11.096995+05:30	2539	Chia	3		16	1
2358	2021-01-15 10:34:11.097641+05:30	2538	Kale	3		16	1
2359	2021-01-15 10:34:11.098554+05:30	2537	Kale	3		16	1
2360	2021-01-15 10:34:11.09953+05:30	2536	Kale	3		16	1
2361	2021-01-15 10:34:11.09953+05:30	2535	Sesame	3		16	1
2362	2021-01-15 10:34:11.100529+05:30	2534	Sesame	3		16	1
2363	2021-01-15 10:34:11.101527+05:30	2533	Sesame	3		16	1
2364	2021-01-15 10:34:11.102524+05:30	2532	Alfalfa	3		16	1
2365	2021-01-15 10:34:11.103972+05:30	2531	Alfalfa	3		16	1
2366	2021-01-15 10:34:11.104776+05:30	2530	Alfalfa	3		16	1
2367	2021-01-15 10:34:11.105548+05:30	2529	Flax	3		16	1
2368	2021-01-15 10:34:11.105548+05:30	2528	Flax	3		16	1
2369	2021-01-15 10:34:11.107649+05:30	2527	Flax	3		16	1
2370	2021-01-15 10:34:11.109196+05:30	2526	Chinese Cabbage	3		16	1
2371	2021-01-15 10:34:11.10995+05:30	2525	Chinese Cabbage	3		16	1
2372	2021-01-15 10:34:11.110701+05:30	2524	Chinese Cabbage	3		16	1
2373	2021-01-15 10:34:11.111445+05:30	2523	Cabbage	3		16	1
2374	2021-01-15 10:34:11.112133+05:30	2522	Cabbage	3		16	1
2375	2021-01-15 10:34:11.112133+05:30	2521	Cabbage	3		16	1
2376	2021-01-15 10:34:11.113165+05:30	2520	White Radish (2 in 1)	3		16	1
2377	2021-01-15 10:34:11.114397+05:30	2519	White Radish (2 in 1)	3		16	1
2378	2021-01-15 10:34:11.115199+05:30	2518	White Radish (2 in 1)	3		16	1
2379	2021-01-15 10:34:11.116771+05:30	2517	Garden Cress	3		16	1
2380	2021-01-15 10:34:11.117781+05:30	2516	Garden Cress	3		16	1
2381	2021-01-15 10:34:11.118768+05:30	2515	Garden Cress	3		16	1
2382	2021-01-15 10:34:11.118768+05:30	2514	Amaranthus Green	3		16	1
2383	2021-01-15 10:34:11.11979+05:30	2513	Amaranthus Green	3		16	1
2384	2021-01-15 10:34:11.121193+05:30	2512	Amaranthus Green	3		16	1
2385	2021-01-15 10:34:11.121846+05:30	2511	Amaranthus Red	3		16	1
2386	2021-01-15 10:34:11.122662+05:30	2510	Amaranthus Red	3		16	1
2387	2021-01-15 10:34:11.122662+05:30	2509	Amaranthus Red	3		16	1
2388	2021-01-15 10:34:11.125158+05:30	2508	Cabbage (Hybrid)	3		16	1
2389	2021-01-15 10:34:11.125922+05:30	2507	Cabbage (Hybrid)	3		16	1
2390	2021-01-15 10:34:11.126659+05:30	2506	Cabbage (Hybrid)	3		16	1
2391	2021-01-15 10:34:22.816651+05:30	2505	Cabbage	3		16	1
2392	2021-01-15 10:34:22.820638+05:30	2504	Cabbage	3		16	1
2393	2021-01-15 10:34:22.821636+05:30	2503	Cabbage	3		16	1
2394	2021-01-15 10:34:22.822633+05:30	2502	Red Lettuce	3		16	1
2395	2021-01-15 10:34:22.824427+05:30	2501	Red Lettuce	3		16	1
2396	2021-01-15 10:34:22.825335+05:30	2500	Red Lettuce	3		16	1
2397	2021-01-15 10:34:22.826179+05:30	2499	Lettuce	3		16	1
2398	2021-01-15 10:34:22.827003+05:30	2498	Lettuce	3		16	1
2399	2021-01-15 10:34:22.827756+05:30	2497	Lettuce	3		16	1
2400	2021-01-15 10:34:22.828494+05:30	2496	Pok Choi	3		16	1
2401	2021-01-15 10:34:22.828494+05:30	2495	Pok Choi	3		16	1
2402	2021-01-15 10:34:22.830532+05:30	2494	Pok Choi	3		16	1
2403	2021-01-15 10:34:22.831488+05:30	2493	Chinese Cabbage	3		16	1
2404	2021-01-15 10:34:22.832485+05:30	2492	Chinese Cabbage	3		16	1
2405	2021-01-15 10:34:22.832485+05:30	2491	Chinese Cabbage	3		16	1
2406	2021-01-15 10:34:22.834113+05:30	2490	BASIL	3		16	1
2407	2021-01-15 10:34:22.834113+05:30	2489	BASIL	3		16	1
2408	2021-01-15 10:34:22.835141+05:30	2488	BASIL	3		16	1
2409	2021-01-15 10:34:22.836164+05:30	2487	Oregano	3		16	1
2410	2021-01-15 10:34:22.838466+05:30	2486	Oregano	3		16	1
2411	2021-01-15 10:34:22.83975+05:30	2485	Oregano	3		16	1
2412	2021-01-15 10:34:22.841003+05:30	2484	Thyme	3		16	1
2413	2021-01-15 10:34:22.842276+05:30	2483	Thyme	3		16	1
2414	2021-01-15 10:34:22.843436+05:30	2482	Thyme	3		16	1
2415	2021-01-15 10:34:22.844874+05:30	2481	Leek	3		16	1
2416	2021-01-15 10:34:22.845367+05:30	2480	Leek	3		16	1
2417	2021-01-15 10:34:22.847364+05:30	2479	Leek	3		16	1
2418	2021-01-15 10:34:22.848395+05:30	2478	Kale	3		16	1
2419	2021-01-15 10:34:22.850392+05:30	2477	Kale	3		16	1
2420	2021-01-15 10:34:22.85139+05:30	2476	Kale	3		16	1
2421	2021-01-15 10:34:22.852411+05:30	2475	Chives	3		16	1
2422	2021-01-15 10:34:22.852411+05:30	2474	Chives	3		16	1
2423	2021-01-15 10:34:22.854382+05:30	2473	Chives	3		16	1
2424	2021-01-15 10:34:22.855379+05:30	2472	Celery	3		16	1
2425	2021-01-15 10:34:22.855379+05:30	2471	Celery	3		16	1
2426	2021-01-15 10:34:22.856402+05:30	2470	Celery	3		16	1
2427	2021-01-15 10:34:22.857374+05:30	2469	Rosemary	3		16	1
2428	2021-01-15 10:34:22.858372+05:30	2468	Rosemary	3		16	1
2429	2021-01-15 10:34:22.858372+05:30	2467	Rosemary	3		16	1
2430	2021-01-15 10:34:22.859399+05:30	2466	Mint	3		16	1
2431	2021-01-15 10:34:22.860366+05:30	2465	Mint	3		16	1
2432	2021-01-15 10:34:22.860366+05:30	2464	Mint	3		16	1
2433	2021-01-15 10:34:22.862391+05:30	2463	Parsley Gaint	3		16	1
2434	2021-01-15 10:34:22.863357+05:30	2462	Parsley Gaint	3		16	1
2435	2021-01-15 10:34:22.864373+05:30	2461	Parsley Gaint	3		16	1
2436	2021-01-15 10:34:22.865358+05:30	2460	Spinach/Palak	3		16	1
2437	2021-01-15 10:34:22.865358+05:30	2459	Spinach/Palak	3		16	1
2438	2021-01-15 10:34:22.866349+05:30	2458	Spinach/Palak	3		16	1
2439	2021-01-15 10:34:22.867347+05:30	2457	Methi/Fenugreek	3		16	1
2440	2021-01-15 10:34:22.868359+05:30	2456	Methi/Fenugreek	3		16	1
2441	2021-01-15 10:34:22.869342+05:30	2455	Methi/Fenugreek	3		16	1
2442	2021-01-15 10:34:22.869342+05:30	2454	Dill Seeds	3		16	1
2443	2021-01-15 10:34:22.870364+05:30	2453	Dill Seeds	3		16	1
2444	2021-01-15 10:34:22.871336+05:30	2452	Dill Seeds	3		16	1
2445	2021-01-15 10:34:22.872334+05:30	2451	Coriander	3		16	1
2446	2021-01-15 10:34:22.872334+05:30	2450	Coriander	3		16	1
2447	2021-01-15 10:34:22.874357+05:30	2449	Coriander	3		16	1
2448	2021-01-15 10:34:22.875325+05:30	2448	Amaranthus Red	3		16	1
2449	2021-01-15 10:34:22.876323+05:30	2447	Amaranthus Red	3		16	1
2450	2021-01-15 10:34:22.876323+05:30	2446	Amaranthus Red	3		16	1
2451	2021-01-15 10:34:22.877345+05:30	2445	Amaranthus Green	3		16	1
2452	2021-01-15 10:34:22.878318+05:30	2444	Amaranthus Green	3		16	1
2453	2021-01-15 10:34:22.879315+05:30	2443	Amaranthus Green	3		16	1
2454	2021-01-15 10:34:22.880313+05:30	2442	Spinach/Palak	3		16	1
2455	2021-01-15 10:34:22.88063+05:30	2441	Spinach/Palak	3		16	1
2456	2021-01-15 10:34:22.881629+05:30	2440	Spinach/Palak	3		16	1
2457	2021-01-15 10:34:22.883625+05:30	2439	Parsley Gaint	3		16	1
2458	2021-01-15 10:34:22.883625+05:30	2438	Parsley Gaint	3		16	1
2459	2021-01-15 10:34:22.885619+05:30	2437	Parsley Gaint	3		16	1
2460	2021-01-15 10:34:22.885619+05:30	2436	Coriander	3		16	1
2461	2021-01-15 10:34:22.886617+05:30	2435	Coriander	3		16	1
2462	2021-01-15 10:34:22.887625+05:30	2434	Coriander	3		16	1
2463	2021-01-15 10:34:22.88861+05:30	2433	Dill Seeds	3		16	1
2464	2021-01-15 10:34:22.889608+05:30	2432	Dill Seeds	3		16	1
2465	2021-01-15 10:34:22.891602+05:30	2431	Dill Seeds	3		16	1
2466	2021-01-15 10:34:22.891602+05:30	2430	Methi/Fenugreek	3		16	1
2467	2021-01-15 10:34:22.892628+05:30	2429	Methi/Fenugreek	3		16	1
2468	2021-01-15 10:34:22.893597+05:30	2428	Methi/Fenugreek	3		16	1
2469	2021-01-15 10:34:22.894594+05:30	2427	Amaranthus Green	3		16	1
2470	2021-01-15 10:34:22.894594+05:30	2426	Amaranthus Green	3		16	1
2471	2021-01-15 10:34:22.895592+05:30	2425	Amaranthus Green	3		16	1
2472	2021-01-15 10:34:22.896589+05:30	2424	Amaranthus Red	3		16	1
2473	2021-01-15 10:34:22.896589+05:30	2423	Amaranthus Red	3		16	1
2474	2021-01-15 10:34:22.897586+05:30	2422	Amaranthus Red	3		16	1
2475	2021-01-15 10:34:22.899581+05:30	2421	Oregano	3		16	1
2476	2021-01-15 10:34:22.90058+05:30	2420	Oregano	3		16	1
2477	2021-01-15 10:34:22.901607+05:30	2419	Oregano	3		16	1
2478	2021-01-15 10:34:22.902575+05:30	2418	Leek	3		16	1
2479	2021-01-15 10:34:22.903571+05:30	2417	Leek	3		16	1
2480	2021-01-15 10:34:22.903571+05:30	2416	Leek	3		16	1
2481	2021-01-15 10:34:22.904568+05:30	2415	Kale	3		16	1
2482	2021-01-15 10:34:22.905565+05:30	2414	Kale	3		16	1
2483	2021-01-15 10:34:22.906562+05:30	2413	Kale	3		16	1
2484	2021-01-15 10:34:22.90756+05:30	2412	Celery	3		16	1
2485	2021-01-15 10:34:22.908558+05:30	2411	Celery	3		16	1
2486	2021-01-15 10:34:22.909555+05:30	2410	Celery	3		16	1
2487	2021-01-15 10:34:22.910555+05:30	2409	Basil	3		16	1
2488	2021-01-15 10:34:22.911563+05:30	2408	Basil	3		16	1
2489	2021-01-15 10:34:22.911563+05:30	2407	Basil	3		16	1
2490	2021-01-15 10:34:22.912547+05:30	2406	Chives	3		16	1
2491	2021-01-15 10:34:35.499481+05:30	2405	Chives	3		16	1
2492	2021-01-15 10:34:35.503501+05:30	2404	Chives	3		16	1
2493	2021-01-15 10:34:35.504467+05:30	2403	Thyme	3		16	1
2494	2021-01-15 10:34:35.505464+05:30	2402	Thyme	3		16	1
2495	2021-01-15 10:34:35.505464+05:30	2401	Thyme	3		16	1
2496	2021-01-15 10:34:35.506491+05:30	2400	Mint	3		16	1
2497	2021-01-15 10:34:35.50746+05:30	2399	Mint	3		16	1
2498	2021-01-15 10:34:35.508456+05:30	2398	Mint	3		16	1
2499	2021-01-15 10:34:35.508456+05:30	2397	Rosemary	3		16	1
2500	2021-01-15 10:34:35.509483+05:30	2396	Rosemary	3		16	1
2501	2021-01-15 10:34:35.510451+05:30	2395	Rosemary	3		16	1
2502	2021-01-15 10:34:35.51145+05:30	2394	Pok-Choi	3		16	1
2503	2021-01-15 10:34:35.512446+05:30	2393	Pok-Choi	3		16	1
2504	2021-01-15 10:34:35.513443+05:30	2392	Pok-Choi	3		16	1
2505	2021-01-15 10:34:35.513443+05:30	2391	Lettuce	3		16	1
2506	2021-01-15 10:34:35.514441+05:30	2390	Lettuce	3		16	1
2507	2021-01-15 10:34:35.515438+05:30	2389	Lettuce	3		16	1
2508	2021-01-15 10:34:35.516771+05:30	2388	Red Lettuce	3		16	1
2509	2021-01-15 10:34:35.518053+05:30	2387	Red Lettuce	3		16	1
2510	2021-01-15 10:34:35.51917+05:30	2386	Red Lettuce	3		16	1
2511	2021-01-15 10:34:35.520117+05:30	2385	Kholrabi/Knol-khol	3		16	1
2512	2021-01-15 10:34:35.521848+05:30	2384	Kholrabi/Knol-khol	3		16	1
2513	2021-01-15 10:34:35.524442+05:30	2383	Kholrabi/Knol-khol	3		16	1
2514	2021-01-15 10:34:35.525442+05:30	2382	Radish 2 in 1 (Palak and Radish)	3		16	1
2515	2021-01-15 10:34:35.526448+05:30	2381	Radish 2 in 1 (Palak and Radish)	3		16	1
2516	2021-01-15 10:34:35.527438+05:30	2380	Radish 2 in 1 (Palak and Radish)	3		16	1
2517	2021-01-15 10:34:35.527438+05:30	2379	Onion Light Red	3		16	1
2518	2021-01-15 10:34:35.529015+05:30	2378	Onion Light Red	3		16	1
2519	2021-01-15 10:34:35.529684+05:30	2377	Onion Light Red	3		16	1
2520	2021-01-15 10:34:35.530537+05:30	2376	Onion Dark Red	3		16	1
2521	2021-01-15 10:34:35.531676+05:30	2375	Onion Dark Red	3		16	1
2522	2021-01-15 10:34:35.532686+05:30	2374	Onion Dark Red	3		16	1
2523	2021-01-15 10:34:35.534383+05:30	2373	Muskmelon Rambo (Hybrid)	3		16	1
2524	2021-01-15 10:34:35.535212+05:30	2372	Muskmelon Rambo (Hybrid)	3		16	1
2525	2021-01-15 10:34:35.535976+05:30	2371	Muskmelon Rambo (Hybrid)	3		16	1
2526	2021-01-15 10:34:35.536645+05:30	2370	Muskmelon Sujay (Hybrid)	3		16	1
2527	2021-01-15 10:34:35.537442+05:30	2369	Muskmelon Sujay (Hybrid)	3		16	1
2528	2021-01-15 10:34:35.537442+05:30	2368	Muskmelon Sujay (Hybrid)	3		16	1
2529	2021-01-15 10:34:35.538467+05:30	2367	Muskmelon Samrat (Hybrid)	3		16	1
2530	2021-01-15 10:34:35.540564+05:30	2366	Muskmelon Samrat (Hybrid)	3		16	1
2531	2021-01-15 10:34:35.540564+05:30	2365	Muskmelon Samrat (Hybrid)	3		16	1
2532	2021-01-15 10:34:35.541564+05:30	2364	Muskmelon Mahi (Hybrid)	3		16	1
2533	2021-01-15 10:34:35.542971+05:30	2363	Muskmelon Mahi (Hybrid)	3		16	1
2534	2021-01-15 10:34:35.542971+05:30	2362	Muskmelon Mahi (Hybrid)	3		16	1
2535	2021-01-15 10:34:35.54397+05:30	2361	Marigold Yellow (Hybrid)	3		16	1
2536	2021-01-15 10:34:35.545357+05:30	2360	Marigold Yellow (Hybrid)	3		16	1
2537	2021-01-15 10:34:35.546091+05:30	2359	Marigold Yellow (Hybrid)	3		16	1
2538	2021-01-15 10:34:35.546818+05:30	2358	Marigold Orange (Hybrid)	3		16	1
2539	2021-01-15 10:34:35.54749+05:30	2357	Marigold Orange (Hybrid)	3		16	1
2540	2021-01-15 10:34:35.548574+05:30	2356	Marigold Orange (Hybrid)	3		16	1
2541	2021-01-15 10:34:35.549573+05:30	2355	Marigold Yellow	3		16	1
2542	2021-01-15 10:34:35.550766+05:30	2354	Marigold Yellow	3		16	1
2543	2021-01-15 10:34:35.550766+05:30	2353	Marigold Yellow	3		16	1
2544	2021-01-15 10:34:35.551939+05:30	2352	Marigold Orange	3		16	1
2545	2021-01-15 10:34:35.552837+05:30	2351	Marigold Orange	3		16	1
2546	2021-01-15 10:34:35.553584+05:30	2350	Marigold Orange	3		16	1
2547	2021-01-15 10:34:35.554327+05:30	2349	White Cucumber (Hybrid)	3		16	1
2548	2021-01-15 10:34:35.55507+05:30	2348	White Cucumber (Hybrid)	3		16	1
2549	2021-01-15 10:34:35.555873+05:30	2347	White Cucumber (Hybrid)	3		16	1
2550	2021-01-15 10:34:35.556851+05:30	2346	White Bittergourd (Hybrid)	3		16	1
2551	2021-01-15 10:34:35.557635+05:30	2345	White Bittergourd (Hybrid)	3		16	1
2552	2021-01-15 10:34:35.558637+05:30	2344	White Bittergourd (Hybrid)	3		16	1
2553	2021-01-15 10:34:35.559377+05:30	2343	Watermelon Green Stripes (Hybrid)	3		16	1
2554	2021-01-15 10:34:35.560177+05:30	2342	Watermelon Green Stripes (Hybrid)	3		16	1
2555	2021-01-15 10:34:35.560465+05:30	2341	Watermelon Green Stripes (Hybrid)	3		16	1
2556	2021-01-15 10:34:35.561464+05:30	2340	Watermelon Black (Hybrid)	3		16	1
2557	2021-01-15 10:34:35.561464+05:30	2339	Watermelon Black (Hybrid)	3		16	1
2558	2021-01-15 10:34:35.562461+05:30	2338	Watermelon Black (Hybrid)	3		16	1
2559	2021-01-15 10:34:35.563458+05:30	2337	Tomato Round Sour (Hybrid)	3		16	1
2560	2021-01-15 10:34:35.56455+05:30	2336	Tomato Round Sour (Hybrid)	3		16	1
2561	2021-01-15 10:34:35.565953+05:30	2335	Tomato Round Sour (Hybrid)	3		16	1
2562	2021-01-15 10:34:35.567001+05:30	2334	Tomato Oval (Hybrid)	3		16	1
2563	2021-01-15 10:34:35.567647+05:30	2333	Tomato Oval (Hybrid)	3		16	1
2564	2021-01-15 10:34:35.568271+05:30	2332	Tomato Oval (Hybrid)	3		16	1
2565	2021-01-15 10:34:35.568884+05:30	2331	Spongegourd Light Green (Hybrid)	3		16	1
2566	2021-01-15 10:34:35.569498+05:30	2330	Spongegourd Light Green (Hybrid)	3		16	1
2567	2021-01-15 10:34:35.57011+05:30	2329	Spongegourd Light Green (Hybrid)	3		16	1
2568	2021-01-15 10:34:35.570716+05:30	2328	Spongegourd Dark Green (Hybrid)	3		16	1
2569	2021-01-15 10:34:35.571332+05:30	2327	Spongegourd Dark Green (Hybrid)	3		16	1
2570	2021-01-15 10:34:35.572165+05:30	2326	Spongegourd Dark Green (Hybrid)	3		16	1
2571	2021-01-15 10:34:35.574174+05:30	2325	Round Bottlegourd (Hybrid)	3		16	1
2572	2021-01-15 10:34:35.574976+05:30	2324	Round Bottlegourd (Hybrid)	3		16	1
2573	2021-01-15 10:34:35.575757+05:30	2323	Round Bottlegourd (Hybrid)	3		16	1
2574	2021-01-15 10:34:35.575757+05:30	2322	Ridge Gourd (Hybrid)	3		16	1
2575	2021-01-15 10:34:35.576757+05:30	2321	Ridge Gourd (Hybrid)	3		16	1
2576	2021-01-15 10:34:35.578685+05:30	2320	Ridge Gourd (Hybrid)	3		16	1
2577	2021-01-15 10:34:35.579471+05:30	2319	Red Carrot (Hybrid)	3		16	1
2578	2021-01-15 10:34:35.579471+05:30	2318	Red Carrot (Hybrid)	3		16	1
2579	2021-01-15 10:34:35.581532+05:30	2317	Red Carrot (Hybrid)	3		16	1
2580	2021-01-15 10:34:35.582466+05:30	2316	Pumpkin Druva (Hybrid)	3		16	1
2581	2021-01-15 10:34:35.583463+05:30	2315	Pumpkin Druva (Hybrid)	3		16	1
2582	2021-01-15 10:34:35.584583+05:30	2314	Pumpkin Druva (Hybrid)	3		16	1
2583	2021-01-15 10:34:35.585691+05:30	2313	Pumpkin Boss (Hybrid)	3		16	1
2584	2021-01-15 10:34:35.58676+05:30	2312	Pumpkin Boss (Hybrid)	3		16	1
2585	2021-01-15 10:34:35.587761+05:30	2311	Pumpkin Boss (Hybrid)	3		16	1
2586	2021-01-15 10:34:35.588762+05:30	2310	Orange Carrot Nantes  (Hybrid)	3		16	1
2587	2021-01-15 10:34:35.591041+05:30	2309	Orange Carrot Nantes  (Hybrid)	3		16	1
2588	2021-01-15 10:34:35.592327+05:30	2308	Orange Carrot Nantes  (Hybrid)	3		16	1
2589	2021-01-15 10:34:35.593591+05:30	2307	Orange Carrot Kuroda (Hybrid)	3		16	1
2590	2021-01-15 10:34:35.594855+05:30	2306	Orange Carrot Kuroda (Hybrid)	3		16	1
2591	2021-01-15 10:34:43.527819+05:30	2305	Orange Carrot Kuroda (Hybrid)	3		16	1
2592	2021-01-15 10:34:43.531926+05:30	2304	Bottlegourd Long (Hybrid)	3		16	1
2593	2021-01-15 10:34:43.533624+05:30	2303	Bottlegourd Long (Hybrid)	3		16	1
2594	2021-01-15 10:34:43.534511+05:30	2302	Bottlegourd Long (Hybrid)	3		16	1
2595	2021-01-15 10:34:43.535375+05:30	2301	Green Bittergourd (Hybrid)	3		16	1
2596	2021-01-15 10:34:43.536185+05:30	2300	Green Bittergourd (Hybrid)	3		16	1
2597	2021-01-15 10:34:43.536985+05:30	2299	Green Bittergourd (Hybrid)	3		16	1
2598	2021-01-15 10:34:43.537716+05:30	2298	Chilly Dual Purpose-Dry/Fresh  (Hybrid)	3		16	1
2599	2021-01-15 10:34:43.538449+05:30	2297	Chilly Dual Purpose-Dry/Fresh  (Hybrid)	3		16	1
2600	2021-01-15 10:34:43.539185+05:30	2296	Chilly Dual Purpose-Dry/Fresh  (Hybrid)	3		16	1
2601	2021-01-15 10:34:43.53992+05:30	2295	Cucumber Light Green (Hybrid)	3		16	1
2602	2021-01-15 10:34:43.541382+05:30	2294	Cucumber Light Green (Hybrid)	3		16	1
2603	2021-01-15 10:34:43.541939+05:30	2293	Cucumber Light Green (Hybrid)	3		16	1
2604	2021-01-15 10:34:43.542937+05:30	2292	Cucumber Dark Green (Hybrid)	3		16	1
2605	2021-01-15 10:34:43.544324+05:30	2291	Cucumber Dark Green (Hybrid)	3		16	1
2606	2021-01-15 10:34:43.545095+05:30	2290	Cucumber Dark Green (Hybrid)	3		16	1
2607	2021-01-15 10:34:43.545856+05:30	2289	Chilly Spicy (Hybrid)	3		16	1
2608	2021-01-15 10:34:43.546605+05:30	2288	Chilly Spicy (Hybrid)	3		16	1
2609	2021-01-15 10:34:43.546605+05:30	2287	Chilly Spicy (Hybrid)	3		16	1
2610	2021-01-15 10:34:43.547604+05:30	2286	Chilly Dry/Tadka Purpose (Hybrid)	3		16	1
2611	2021-01-15 10:34:43.548627+05:30	2285	Chilly Dry/Tadka Purpose (Hybrid)	3		16	1
2612	2021-01-15 10:34:43.549609+05:30	2284	Chilly Dry/Tadka Purpose (Hybrid)	3		16	1
2613	2021-01-15 10:34:43.550596+05:30	2283	Chilly Bhajji  (Hybrid)	3		16	1
2614	2021-01-15 10:34:43.552164+05:30	2282	Chilly Bhajji  (Hybrid)	3		16	1
2615	2021-01-15 10:34:43.553052+05:30	2281	Chilly Bhajji  (Hybrid)	3		16	1
2616	2021-01-15 10:34:43.553809+05:30	2280	Chilly Achari  (Hybrid)	3		16	1
2617	2021-01-15 10:34:43.554411+05:30	2279	Chilly Achari  (Hybrid)	3		16	1
2618	2021-01-15 10:34:43.555228+05:30	2278	Chilly Achari  (Hybrid)	3		16	1
2619	2021-01-15 10:34:43.555965+05:30	2277	Cauliflower (Hybrid)	3		16	1
2620	2021-01-15 10:34:43.556623+05:30	2276	Cauliflower (Hybrid)	3		16	1
2621	2021-01-15 10:34:43.556623+05:30	2275	Cauliflower (Hybrid)	3		16	1
2622	2021-01-15 10:34:43.557637+05:30	2274	Cabbage (Hybrid)	3		16	1
2623	2021-01-15 10:34:43.558636+05:30	2273	Cabbage (Hybrid)	3		16	1
2624	2021-01-15 10:34:43.560982+05:30	2272	Cabbage (Hybrid)	3		16	1
2625	2021-01-15 10:34:43.561794+05:30	2271	Cabbage	3		16	1
2626	2021-01-15 10:34:43.562542+05:30	2270	Cabbage	3		16	1
2627	2021-01-15 10:34:43.56382+05:30	2269	Cabbage	3		16	1
2628	2021-01-15 10:34:43.56382+05:30	2268	Brinjal Naman (Hybrid)	3		16	1
2629	2021-01-15 10:34:43.565547+05:30	2267	Brinjal Naman (Hybrid)	3		16	1
2630	2021-01-15 10:34:43.565858+05:30	2266	Brinjal Naman (Hybrid)	3		16	1
2631	2021-01-15 10:34:43.566858+05:30	2265	Brinjal Myna (Hybrid)	3		16	1
2632	2021-01-15 10:34:43.567958+05:30	2264	Brinjal Myna (Hybrid)	3		16	1
2633	2021-01-15 10:34:43.568852+05:30	2263	Brinjal Myna (Hybrid)	3		16	1
2634	2021-01-15 10:34:43.569849+05:30	2262	Brinjal Hariya (Hybrid)	3		16	1
2635	2021-01-15 10:34:43.569849+05:30	2261	Brinjal Hariya (Hybrid)	3		16	1
2636	2021-01-15 10:34:43.570847+05:30	2260	Brinjal Hariya (Hybrid)	3		16	1
2637	2021-01-15 10:34:43.571874+05:30	2259	Brinjal Dhiraj (Hybrid)	3		16	1
2638	2021-01-15 10:34:43.572697+05:30	2258	Brinjal Dhiraj (Hybrid)	3		16	1
2639	2021-01-15 10:34:43.573432+05:30	2257	Brinjal Dhiraj (Hybrid)	3		16	1
2640	2021-01-15 10:34:43.574013+05:30	2256	Brinjal Aira (Hybrid)	3		16	1
2641	2021-01-15 10:34:43.574013+05:30	2255	Brinjal Aira (Hybrid)	3		16	1
2642	2021-01-15 10:34:43.575013+05:30	2254	Brinjal Aira (Hybrid)	3		16	1
2643	2021-01-15 10:34:43.57639+05:30	2253	Bhendi/Okra Mejestic (Hybrid)	3		16	1
2644	2021-01-15 10:34:43.577428+05:30	2252	Bhendi/Okra Mejestic (Hybrid)	3		16	1
2645	2021-01-15 10:34:43.578059+05:30	2251	Bhendi/Okra Mejestic (Hybrid)	3		16	1
2646	2021-01-15 10:34:43.578059+05:30	2250	Bhendi/Okra Deepa (Hybrid)	3		16	1
2647	2021-01-15 10:34:43.579058+05:30	2249	Bhendi/Okra Deepa (Hybrid)	3		16	1
2648	2021-01-15 10:34:43.580056+05:30	2248	Bhendi/Okra Deepa (Hybrid)	3		16	1
2649	2021-01-15 10:34:43.581052+05:30	2247	Beetroot Rado (Hybrid)	3		16	1
2650	2021-01-15 10:34:43.58205+05:30	2246	Beetroot Rado (Hybrid)	3		16	1
2651	2021-01-15 10:34:43.582798+05:30	2245	Beetroot Rado (Hybrid)	3		16	1
2652	2021-01-15 10:34:43.58356+05:30	2244	French Beans Tony	3		16	1
2653	2021-01-15 10:34:43.584345+05:30	2243	French Beans Tony	3		16	1
2654	2021-01-15 10:34:43.586416+05:30	2242	French Beans Tony	3		16	1
2655	2021-01-15 10:34:43.587052+05:30	2241	Chinese Cabbage	3		16	1
2656	2021-01-15 10:34:43.587052+05:30	2240	Chinese Cabbage	3		16	1
2657	2021-01-15 10:34:43.588052+05:30	2239	Chinese Cabbage	3		16	1
2658	2021-01-15 10:34:43.58938+05:30	2238	Brinjal Purple long	3		16	1
2659	2021-01-15 10:34:43.58938+05:30	2237	Brinjal Purple long	3		16	1
2660	2021-01-15 10:34:43.59038+05:30	2236	Brinjal Purple long	3		16	1
2661	2021-01-15 10:34:43.591404+05:30	2235	Brinjal Black long	3		16	1
2662	2021-01-15 10:34:43.591404+05:30	2234	Brinjal Black long	3		16	1
2663	2021-01-15 10:34:43.594258+05:30	2233	Brinjal Black long	3		16	1
2664	2021-01-15 10:34:43.595034+05:30	2232	Beetroot Gulab	3		16	1
2665	2021-01-15 10:34:43.595792+05:30	2231	Beetroot Gulab	3		16	1
2666	2021-01-15 10:34:43.596533+05:30	2230	Beetroot Gulab	3		16	1
2667	2021-01-15 10:34:43.597185+05:30	2229	Watermelon	3		16	1
2668	2021-01-15 10:34:43.597185+05:30	2228	Watermelon	3		16	1
2669	2021-01-15 10:34:43.598054+05:30	2227	watermelon 	3		16	1
2670	2021-01-15 10:34:43.599573+05:30	2226	watermelon 	3		16	1
2671	2021-01-15 10:34:43.600397+05:30	2225	Watermelon	3		16	1
2672	2021-01-15 10:34:43.601651+05:30	2224	Watermelon	3		16	1
2673	2021-01-15 10:34:43.602539+05:30	2223	Tomato	3		16	1
2674	2021-01-15 10:34:43.603296+05:30	2222	Tomato	3		16	1
2675	2021-01-15 10:34:43.604047+05:30	2221	Tomato	3		16	1
2676	2021-01-15 10:34:43.605113+05:30	2220	Tomato	3		16	1
2677	2021-01-15 10:34:43.605829+05:30	2219	Tomato	3		16	1
2678	2021-01-15 10:34:43.60666+05:30	2218	Tomato	3		16	1
2679	2021-01-15 10:34:43.607409+05:30	2217	Tomato	3		16	1
2680	2021-01-15 10:34:43.608152+05:30	2216	Tomato	3		16	1
2681	2021-01-15 10:34:43.608883+05:30	2215	Tomato	3		16	1
2682	2021-01-15 10:34:43.610867+05:30	2214	Tomato	3		16	1
2683	2021-01-15 10:34:43.611433+05:30	2213	Tomato	3		16	1
2684	2021-01-15 10:34:43.612432+05:30	2212	Tomato	3		16	1
2685	2021-01-15 10:34:43.612432+05:30	2211	Tomato	3		16	1
2686	2021-01-15 10:34:43.613429+05:30	2210	Tomato	3		16	1
2687	2021-01-15 10:34:43.614427+05:30	2209	Tomato	3		16	1
2688	2021-01-15 10:34:43.615424+05:30	2208	Tomato	3		16	1
2689	2021-01-15 10:34:43.615424+05:30	2207	Sponge Gound	3		16	1
2690	2021-01-15 10:34:43.616421+05:30	2206	Sponge Gound	3		16	1
2691	2021-01-15 10:34:49.238996+05:30	2205	Sponge Gound	3		16	1
2692	2021-01-15 10:34:49.242952+05:30	2204	Sponge Gound	3		16	1
2693	2021-01-15 10:34:49.24395+05:30	2203	Ridge Gourd	3		16	1
2694	2021-01-15 10:34:49.244947+05:30	2202	Ridge Gourd	3		16	1
2695	2021-01-15 10:34:49.244947+05:30	2201	Radish	3		16	1
2696	2021-01-15 10:34:49.245968+05:30	2200	Radish	3		16	1
2697	2021-01-15 10:34:49.246941+05:30	2199	Pumpkin	3		16	1
2698	2021-01-15 10:34:49.247939+05:30	2198	Pumpkin	3		16	1
2699	2021-01-15 10:34:49.248945+05:30	2197	Pumpkin	3		16	1
2700	2021-01-15 10:34:49.248945+05:30	2196	Pumpkin	3		16	1
2701	2021-01-15 10:34:49.249934+05:30	2195	Muskmelon	3		16	1
2702	2021-01-15 10:34:49.250931+05:30	2194	Muskmelon	3		16	1
2703	2021-01-15 10:34:49.251928+05:30	2193	Muskmelon	3		16	1
2704	2021-01-15 10:34:49.252926+05:30	2192	Muskmelon	3		16	1
2705	2021-01-15 10:34:49.253923+05:30	2191	Muskmelon	3		16	1
2706	2021-01-15 10:34:49.253923+05:30	2190	Muskmelon	3		16	1
2707	2021-01-15 10:34:49.254921+05:30	2189	Muskmelon	3		16	1
2708	2021-01-15 10:34:49.255917+05:30	2188	Muskmelon	3		16	1
2709	2021-01-15 10:34:49.256916+05:30	2187	HY.Maize	3		16	1
2710	2021-01-15 10:34:49.256916+05:30	2186	HY.Maize	3		16	1
2711	2021-01-15 10:34:49.258263+05:30	2185	Cucumber	3		16	1
2712	2021-01-15 10:34:49.259014+05:30	2184	Cucumber	3		16	1
2713	2021-01-15 10:34:49.259745+05:30	2183	Cucumber	3		16	1
2714	2021-01-15 10:34:49.260482+05:30	2182	Cucumber	3		16	1
2715	2021-01-15 10:34:49.261225+05:30	2181	Cucumber	3		16	1
2716	2021-01-15 10:34:49.261959+05:30	2180	Cucumber	3		16	1
2717	2021-01-15 10:34:49.262605+05:30	2179	Methi	3		16	1
2718	2021-01-15 10:34:49.264476+05:30	2178	Methi	3		16	1
2719	2021-01-15 10:34:49.265195+05:30	2177	Methi	3		16	1
2720	2021-01-15 10:34:49.26595+05:30	2176	Methi	3		16	1
2721	2021-01-15 10:34:49.266677+05:30	2175	Palak	3		16	1
2722	2021-01-15 10:34:49.267317+05:30	2174	Palak	3		16	1
2723	2021-01-15 10:34:49.267317+05:30	2173	Palak	3		16	1
2724	2021-01-15 10:34:49.268956+05:30	2172	Coriander	3		16	1
2725	2021-01-15 10:34:49.26969+05:30	2171	Coriander	3		16	1
2726	2021-01-15 10:34:49.26969+05:30	2170	Coriander	3		16	1
2727	2021-01-15 10:34:49.270689+05:30	2169	Coriander	3		16	1
2728	2021-01-15 10:34:49.272941+05:30	2168	Coriander	3		16	1
2729	2021-01-15 10:34:49.27408+05:30	2167	Chilly	3		16	1
2730	2021-01-15 10:34:49.274878+05:30	2166	Chilly	3		16	1
2731	2021-01-15 10:34:49.275607+05:30	2165	Chilly	3		16	1
2732	2021-01-15 10:34:49.275878+05:30	2164	Chilly	3		16	1
2733	2021-01-15 10:34:49.276878+05:30	2163	Chilly	3		16	1
2734	2021-01-15 10:34:49.276878+05:30	2162	Chilly	3		16	1
2735	2021-01-15 10:34:49.277875+05:30	2161	Chilly	3		16	1
2736	2021-01-15 10:34:49.278871+05:30	2160	Chilly	3		16	1
2737	2021-01-15 10:34:49.280866+05:30	2159	Chilly	3		16	1
2738	2021-01-15 10:34:49.281894+05:30	2158	Chilly	3		16	1
2739	2021-01-15 10:34:49.281894+05:30	2157	Chilly	3		16	1
2740	2021-01-15 10:34:49.282894+05:30	2156	Chilly	3		16	1
2741	2021-01-15 10:34:49.284011+05:30	2155	Chilly	3		16	1
2742	2021-01-15 10:34:49.284743+05:30	2154	Chilly	3		16	1
2743	2021-01-15 10:34:49.285471+05:30	2153	Chilly	3		16	1
2744	2021-01-15 10:34:49.286212+05:30	2152	Chilly	3		16	1
2745	2021-01-15 10:34:49.286953+05:30	2151	Chilly	3		16	1
2746	2021-01-15 10:34:49.287685+05:30	2150	Chilly	3		16	1
2747	2021-01-15 10:34:49.289477+05:30	2149	Carrot	3		16	1
2748	2021-01-15 10:34:49.289976+05:30	2148	Carrot	3		16	1
2749	2021-01-15 10:34:49.290976+05:30	2147	Carrot	3		16	1
2750	2021-01-15 10:34:49.290976+05:30	2146	Carrot	3		16	1
2751	2021-01-15 10:34:49.292214+05:30	2145	Carrot	3		16	1
2752	2021-01-15 10:34:49.293054+05:30	2144	Carrot	3		16	1
2753	2021-01-15 10:34:49.293054+05:30	2143	Carrot	3		16	1
2754	2021-01-15 10:34:49.294191+05:30	2142	Carrot	3		16	1
2755	2021-01-15 10:34:49.2948+05:30	2141	Capsicum	3		16	1
2756	2021-01-15 10:34:49.295415+05:30	2140	Redgram	3		16	1
2757	2021-01-15 10:34:49.296029+05:30	2139	Redgram	3		16	1
2758	2021-01-15 10:34:49.297871+05:30	2138	Redgram	3		16	1
2759	2021-01-15 10:34:49.297871+05:30	2137	Redgram	3		16	1
2760	2021-01-15 10:34:49.29889+05:30	2136	Redgram	3		16	1
2761	2021-01-15 10:34:49.299869+05:30	2135	Redgram	3		16	1
2762	2021-01-15 10:34:49.300865+05:30	2134	Beans 	3		16	1
2763	2021-01-15 10:34:49.300865+05:30	2133	Beans 	3		16	1
2764	2021-01-15 10:34:49.301862+05:30	2132	Beans 	3		16	1
2765	2021-01-15 10:34:49.302893+05:30	2131	Beans 	3		16	1
2766	2021-01-15 10:34:49.303743+05:30	2130	Brinjal 	3		16	1
2767	2021-01-15 10:34:49.304505+05:30	2129	Brinjal 	3		16	1
2768	2021-01-15 10:34:49.306282+05:30	2128	Brinjal 	3		16	1
2769	2021-01-15 10:34:49.307053+05:30	2127	Brinjal 	3		16	1
2770	2021-01-15 10:34:49.307797+05:30	2126	Brinjal 	3		16	1
2771	2021-01-15 10:34:49.308532+05:30	2125	Brinjal 	3		16	1
2772	2021-01-15 10:34:49.308814+05:30	2124	Brinjal	3		16	1
2773	2021-01-15 10:34:49.309814+05:30	2123	Brinjal	3		16	1
2774	2021-01-15 10:34:49.309814+05:30	2122	Brinjal	3		16	1
2775	2021-01-15 10:34:49.31081+05:30	2121	Brinjal	3		16	1
2776	2021-01-15 10:34:49.312146+05:30	2120	Brinjal	3		16	1
2777	2021-01-15 10:34:49.312897+05:30	2119	Brinjal	3		16	1
2778	2021-01-15 10:34:49.313965+05:30	2118	Brinjal	3		16	1
2779	2021-01-15 10:34:49.314965+05:30	2117	Brinjal	3		16	1
2780	2021-01-15 10:34:49.31634+05:30	2116	Brinjal	3		16	1
2781	2021-01-15 10:34:49.31634+05:30	2115	Brinjal	3		16	1
2782	2021-01-15 10:34:49.31737+05:30	2114	Brinjal	3		16	1
2783	2021-01-15 10:34:49.31737+05:30	2113	Brinjal	3		16	1
2784	2021-01-15 10:34:49.318337+05:30	2112	Bottle Gourd	3		16	1
2785	2021-01-15 10:34:49.319334+05:30	2111	Bottle Gourd	3		16	1
2786	2021-01-15 10:34:49.319875+05:30	2110	Bottle Gourd	3		16	1
2787	2021-01-15 10:34:49.319875+05:30	2109	Bottle Gourd	3		16	1
2788	2021-01-15 10:34:49.320867+05:30	2108	Bitter Gourd	3		16	1
2789	2021-01-15 10:34:49.322959+05:30	2107	Bitter Gourd	3		16	1
2790	2021-01-15 10:34:49.323598+05:30	2106	Bitter Gourd	3		16	1
2791	2021-01-15 10:34:59.389164+05:30	2105	Bitter Gourd	3		16	1
2792	2021-01-15 10:34:59.393324+05:30	2104	Bhendi/Okra	3		16	1
2793	2021-01-15 10:34:59.394824+05:30	2103	Bhendi/Okra	3		16	1
2794	2021-01-15 10:34:59.395924+05:30	2102	Bhendi/Okra	3		16	1
2795	2021-01-15 10:34:59.39786+05:30	2101	Bhendi/Okra	3		16	1
2796	2021-01-15 10:34:59.398813+05:30	2100	Bhendi/Okra	3		16	1
2797	2021-01-15 10:34:59.399809+05:30	2099	Bhendi/Okra	3		16	1
2798	2021-01-15 10:34:59.401806+05:30	2098	Bhendi/Okra	3		16	1
2799	2021-01-15 10:34:59.40283+05:30	2097	Bhendi/Okra	3		16	1
2800	2021-01-15 10:34:59.403798+05:30	2096	Bhendi/Okra	3		16	1
2801	2021-01-15 10:34:59.404796+05:30	2095	Bhendi/Okra	3		16	1
2802	2021-01-15 10:34:59.405795+05:30	2094	Bhendi/Okra	3		16	1
2803	2021-01-15 10:34:59.407041+05:30	2093	Bhendi/Okra	3		16	1
2804	2021-01-15 10:34:59.40754+05:30	2092	Bhendi/Okra	3		16	1
2805	2021-01-15 10:34:59.41058+05:30	2091	Bhendi/Okra	3		16	1
2806	2021-01-15 10:34:59.411773+05:30	2090	Bhendi/Okra	3		16	1
2807	2021-01-15 10:34:59.412775+05:30	2089	Bhendi/Okra	3		16	1
2808	2021-01-15 10:34:59.414515+05:30	2088	Bhendi/Okra	3		16	1
2809	2021-01-15 10:34:59.415556+05:30	2087	Beetroot	3		16	1
2810	2021-01-15 10:34:59.416833+05:30	2086	Beetroot	3		16	1
2811	2021-01-15 10:34:59.418833+05:30	2085	Beetroot	3		16	1
2812	2021-01-15 10:34:59.41995+05:30	2084	Beetroot	3		16	1
2813	2021-01-15 10:36:07.710592+05:30	2951	Watermelon	3		16	1
2814	2021-01-15 10:36:07.715837+05:30	2950	Watermelon	3		16	1
2815	2021-01-15 10:36:07.716833+05:30	2949	watermelon 	3		16	1
2816	2021-01-15 10:36:07.717683+05:30	2948	watermelon 	3		16	1
2817	2021-01-15 10:36:07.718519+05:30	2947	Watermelon	3		16	1
2818	2021-01-15 10:36:07.719347+05:30	2946	Watermelon	3		16	1
2819	2021-01-15 10:36:07.719347+05:30	2945	Tomato	3		16	1
2820	2021-01-15 10:36:07.720346+05:30	2944	Tomato	3		16	1
2821	2021-01-15 10:36:07.721376+05:30	2943	Tomato	3		16	1
2822	2021-01-15 10:36:07.722376+05:30	2942	Tomato	3		16	1
2823	2021-01-15 10:36:07.722376+05:30	2941	Tomato	3		16	1
2824	2021-01-15 10:36:07.723373+05:30	2940	Tomato	3		16	1
2825	2021-01-15 10:36:07.724408+05:30	2939	Tomato	3		16	1
2826	2021-01-15 10:36:07.725408+05:30	2938	Tomato	3		16	1
2827	2021-01-15 10:36:07.726405+05:30	2937	Tomato	3		16	1
2828	2021-01-15 10:36:07.727454+05:30	2936	Tomato	3		16	1
2829	2021-01-15 10:36:07.728315+05:30	2935	Tomato	3		16	1
2830	2021-01-15 10:36:07.729079+05:30	2934	Tomato	3		16	1
2831	2021-01-15 10:36:07.729361+05:30	2933	Tomato	3		16	1
2832	2021-01-15 10:36:07.730444+05:30	2932	Tomato	3		16	1
2833	2021-01-15 10:36:07.730444+05:30	2931	Tomato	3		16	1
2834	2021-01-15 10:36:07.733382+05:30	2930	Tomato	3		16	1
2835	2021-01-15 10:36:07.733664+05:30	2929	Sponge Gound	3		16	1
2836	2021-01-15 10:36:07.734953+05:30	2928	Sponge Gound	3		16	1
2837	2021-01-15 10:36:07.735393+05:30	2927	Sponge Gound	3		16	1
2838	2021-01-15 10:36:07.736393+05:30	2926	Sponge Gound	3		16	1
2839	2021-01-15 10:36:07.736393+05:30	2925	Ridge Gourd	3		16	1
2840	2021-01-15 10:36:07.73739+05:30	2924	Ridge Gourd	3		16	1
2841	2021-01-15 10:36:07.738416+05:30	2923	Radish	3		16	1
2842	2021-01-15 10:36:07.738416+05:30	2922	Radish	3		16	1
2843	2021-01-15 10:36:07.739385+05:30	2921	Pumpkin	3		16	1
2844	2021-01-15 10:36:07.741501+05:30	2920	Pumpkin	3		16	1
2845	2021-01-15 10:36:07.742531+05:30	2919	Pumpkin	3		16	1
2846	2021-01-15 10:36:07.742531+05:30	2918	Pumpkin	3		16	1
2847	2021-01-15 10:36:07.744179+05:30	2917	Muskmelon	3		16	1
2848	2021-01-15 10:36:07.744179+05:30	2916	Muskmelon	3		16	1
2849	2021-01-15 10:36:07.745179+05:30	2915	Muskmelon	3		16	1
2850	2021-01-15 10:36:07.746178+05:30	2914	Muskmelon	3		16	1
2851	2021-01-15 10:36:07.746178+05:30	2913	Muskmelon	3		16	1
2852	2021-01-15 10:36:07.747178+05:30	2912	Muskmelon	3		16	1
2853	2021-01-15 10:36:07.748407+05:30	2911	Muskmelon	3		16	1
2854	2021-01-15 10:36:07.750021+05:30	2910	Muskmelon	3		16	1
2855	2021-01-15 10:36:07.751021+05:30	2909	HY.Maize	3		16	1
2856	2021-01-15 10:36:07.752019+05:30	2908	HY.Maize	3		16	1
2857	2021-01-15 10:36:07.753163+05:30	2907	Cucumber	3		16	1
2858	2021-01-15 10:36:07.754419+05:30	2906	Cucumber	3		16	1
2859	2021-01-15 10:36:07.754917+05:30	2905	Cucumber	3		16	1
2860	2021-01-15 10:36:07.758267+05:30	2904	Cucumber	3		16	1
2861	2021-01-15 10:36:07.759581+05:30	2903	Cucumber	3		16	1
2862	2021-01-15 10:36:07.760704+05:30	2902	Cucumber	3		16	1
2863	2021-01-15 10:36:07.761609+05:30	2901	Methi	3		16	1
2864	2021-01-15 10:36:07.762588+05:30	2900	Methi	3		16	1
2865	2021-01-15 10:36:07.763679+05:30	2899	Methi	3		16	1
2866	2021-01-15 10:36:07.76508+05:30	2898	Methi	3		16	1
2867	2021-01-15 10:36:07.766752+05:30	2897	Palak	3		16	1
2868	2021-01-15 10:36:07.767576+05:30	2896	Palak	3		16	1
2869	2021-01-15 10:36:07.769572+05:30	2895	Palak	3		16	1
2870	2021-01-15 10:36:07.770601+05:30	2894	Coriander	3		16	1
2871	2021-01-15 10:36:07.771566+05:30	2893	Coriander	3		16	1
2872	2021-01-15 10:36:07.772563+05:30	2892	Coriander	3		16	1
2873	2021-01-15 10:36:07.774559+05:30	2891	Coriander	3		16	1
2874	2021-01-15 10:36:07.776083+05:30	2890	Coriander	3		16	1
2875	2021-01-15 10:36:07.776997+05:30	2889	Chilly	3		16	1
2876	2021-01-15 10:36:07.777781+05:30	2888	Chilly	3		16	1
2877	2021-01-15 10:36:07.778529+05:30	2887	Chilly	3		16	1
2878	2021-01-15 10:36:07.779273+05:30	2886	Chilly	3		16	1
2879	2021-01-15 10:36:07.779554+05:30	2885	Chilly	3		16	1
2880	2021-01-15 10:36:07.780554+05:30	2884	Chilly	3		16	1
2881	2021-01-15 10:36:07.780554+05:30	2883	Chilly	3		16	1
2882	2021-01-15 10:36:07.783488+05:30	2882	Chilly	3		16	1
2883	2021-01-15 10:36:07.78432+05:30	2881	Chilly	3		16	1
2884	2021-01-15 10:36:07.785105+05:30	2880	Chilly	3		16	1
2885	2021-01-15 10:36:07.785888+05:30	2879	Chilly	3		16	1
2886	2021-01-15 10:36:07.786617+05:30	2878	Chilly	3		16	1
2887	2021-01-15 10:36:07.786617+05:30	2877	Chilly	3		16	1
2888	2021-01-15 10:36:07.787606+05:30	2876	Chilly	3		16	1
2889	2021-01-15 10:36:07.788606+05:30	2875	Chilly	3		16	1
2890	2021-01-15 10:36:07.789603+05:30	2874	Chilly	3		16	1
2891	2021-01-15 10:36:07.791713+05:30	2873	Chilly	3		16	1
2892	2021-01-15 10:36:07.791713+05:30	2872	Chilly	3		16	1
2893	2021-01-15 10:36:07.79331+05:30	2871	Carrot	3		16	1
2894	2021-01-15 10:36:07.794085+05:30	2870	Carrot	3		16	1
2895	2021-01-15 10:36:07.794859+05:30	2869	Carrot	3		16	1
2896	2021-01-15 10:36:07.795629+05:30	2868	Carrot	3		16	1
2897	2021-01-15 10:36:07.79641+05:30	2867	Carrot	3		16	1
2898	2021-01-15 10:36:07.79641+05:30	2866	Carrot	3		16	1
2899	2021-01-15 10:36:07.797409+05:30	2865	Carrot	3		16	1
2900	2021-01-15 10:36:07.799968+05:30	2864	Carrot	3		16	1
2901	2021-01-15 10:36:07.800582+05:30	2863	Capsicum	3		16	1
2902	2021-01-15 10:36:07.800582+05:30	2862	Redgram	3		16	1
2903	2021-01-15 10:36:07.801583+05:30	2861	Redgram	3		16	1
2904	2021-01-15 10:36:07.80293+05:30	2860	Redgram	3		16	1
2905	2021-01-15 10:36:07.803495+05:30	2859	Redgram	3		16	1
2906	2021-01-15 10:36:07.803495+05:30	2858	Redgram	3		16	1
2907	2021-01-15 10:36:07.804459+05:30	2857	Redgram	3		16	1
2908	2021-01-15 10:36:07.805459+05:30	2856	Beans 	3		16	1
2909	2021-01-15 10:36:07.808605+05:30	2855	Beans 	3		16	1
2910	2021-01-15 10:36:07.808605+05:30	2854	Beans 	3		16	1
2911	2021-01-15 10:36:07.80962+05:30	2853	Beans 	3		16	1
2912	2021-01-15 10:36:07.810674+05:30	2852	Brinjal 	3		16	1
2913	2021-01-15 10:36:13.017618+05:30	2851	Brinjal 	3		16	1
2914	2021-01-15 10:36:13.021139+05:30	2850	Brinjal 	3		16	1
2915	2021-01-15 10:36:13.022727+05:30	2849	Brinjal 	3		16	1
2916	2021-01-15 10:36:13.023725+05:30	2848	Brinjal 	3		16	1
2917	2021-01-15 10:36:13.024723+05:30	2847	Brinjal 	3		16	1
2918	2021-01-15 10:36:13.025719+05:30	2846	Brinjal	3		16	1
2919	2021-01-15 10:36:13.026715+05:30	2845	Brinjal	3		16	1
2920	2021-01-15 10:36:13.028055+05:30	2844	Brinjal	3		16	1
2921	2021-01-15 10:36:13.028823+05:30	2843	Brinjal	3		16	1
2922	2021-01-15 10:36:13.030418+05:30	2842	Brinjal	3		16	1
2923	2021-01-15 10:36:13.03118+05:30	2841	Brinjal	3		16	1
2924	2021-01-15 10:36:13.031929+05:30	2840	Brinjal	3		16	1
2925	2021-01-15 10:36:13.032674+05:30	2839	Brinjal	3		16	1
2926	2021-01-15 10:36:13.033414+05:30	2838	Brinjal	3		16	1
2927	2021-01-15 10:36:13.034153+05:30	2837	Brinjal	3		16	1
2928	2021-01-15 10:36:13.034837+05:30	2836	Brinjal	3		16	1
2929	2021-01-15 10:36:13.035718+05:30	2835	Brinjal	3		16	1
2930	2021-01-15 10:36:13.035718+05:30	2834	Bottle Gourd	3		16	1
2931	2021-01-15 10:36:13.036717+05:30	2833	Bottle Gourd	3		16	1
2932	2021-01-15 10:36:13.037715+05:30	2832	Bottle Gourd	3		16	1
2933	2021-01-15 10:36:13.039802+05:30	2831	Bottle Gourd	3		16	1
2934	2021-01-15 10:36:13.040707+05:30	2830	Bitter Gourd	3		16	1
2935	2021-01-15 10:36:13.041455+05:30	2829	Bitter Gourd	3		16	1
2936	2021-01-15 10:36:13.042207+05:30	2828	Bitter Gourd	3		16	1
2937	2021-01-15 10:36:13.042947+05:30	2827	Bitter Gourd	3		16	1
2938	2021-01-15 10:36:13.043684+05:30	2826	Bhendi/Okra	3		16	1
2939	2021-01-15 10:36:13.044421+05:30	2825	Bhendi/Okra	3		16	1
2940	2021-01-15 10:36:13.045158+05:30	2824	Bhendi/Okra	3		16	1
2941	2021-01-15 10:36:13.045807+05:30	2823	Bhendi/Okra	3		16	1
2942	2021-01-15 10:36:13.047819+05:30	2822	Bhendi/Okra	3		16	1
2943	2021-01-15 10:36:13.048715+05:30	2821	Bhendi/Okra	3		16	1
2944	2021-01-15 10:36:13.04975+05:30	2820	Bhendi/Okra	3		16	1
2945	2021-01-15 10:36:13.04975+05:30	2819	Bhendi/Okra	3		16	1
2946	2021-01-15 10:36:13.050709+05:30	2818	Bhendi/Okra	3		16	1
2947	2021-01-15 10:36:13.051706+05:30	2817	Bhendi/Okra	3		16	1
2948	2021-01-15 10:36:13.051706+05:30	2816	Bhendi/Okra	3		16	1
2949	2021-01-15 10:36:13.053095+05:30	2815	Bhendi/Okra	3		16	1
2950	2021-01-15 10:36:13.053839+05:30	2814	Bhendi/Okra	3		16	1
2951	2021-01-15 10:36:13.054436+05:30	2813	Bhendi/Okra	3		16	1
2952	2021-01-15 10:36:13.056438+05:30	2812	Bhendi/Okra	3		16	1
2953	2021-01-15 10:36:13.056438+05:30	2811	Bhendi/Okra	3		16	1
2954	2021-01-15 10:36:13.057933+05:30	2810	Bhendi/Okra	3		16	1
2955	2021-01-15 10:36:13.058512+05:30	2809	Beetroot	3		16	1
2956	2021-01-15 10:36:13.058512+05:30	2808	Beetroot	3		16	1
2957	2021-01-15 10:36:13.059511+05:30	2807	Beetroot	3		16	1
2958	2021-01-15 10:36:13.059511+05:30	2806	Beetroot	3		16	1
2959	2021-01-20 10:31:27.60838+05:30	2953	Beetroot Gulab	2	[{"changed": {"fields": ["Featured"]}}]	16	1
2960	2021-01-20 10:31:34.483956+05:30	2956	Brinjal Black long	2	[{"changed": {"fields": ["Featured"]}}]	16	1
2961	2021-01-20 10:31:40.461952+05:30	2962	Chinese Cabbage	2	[{"changed": {"fields": ["Featured"]}}]	16	1
2962	2021-01-20 10:31:46.700616+05:30	2965	French Beans Tony	2	[{"changed": {"fields": ["Featured"]}}]	16	1
2963	2021-01-20 10:31:52.621498+05:30	2968	Beetroot Rado (Hybrid)	2	[{"changed": {"fields": ["Featured"]}}]	16	1
2964	2021-01-20 10:32:12.324485+05:30	2971	Bhendi/Okra Deepa (Hybrid)	2	[{"changed": {"fields": ["Featured"]}}]	16	1
2965	2021-01-20 10:32:22.527322+05:30	2975	Bhendi/Okra Mejestic (Hybrid)	2	[{"changed": {"fields": ["Description", "Featured"]}}]	16	1
2966	2021-01-20 10:32:37.742657+05:30	2977	Brinjal Aira (Hybrid)	2	[{"changed": {"fields": ["Featured"]}}]	16	1
2967	2021-01-20 10:32:50.654207+05:30	3034	Pumpkin Boss (Hybrid)	2	[{"changed": {"fields": ["Featured"]}}]	16	1
2968	2021-01-20 10:55:06.428459+05:30	3034	Pumpkin Boss (Hybrid)	2	[{"changed": {"fields": ["Description"]}}]	16	1
2969	2021-01-20 10:55:28.432365+05:30	3035	Pumpkin Boss (Hybrid)	2	[{"changed": {"fields": ["Description"]}}]	16	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	addresses	address
7	accounts	user
8	accounts	guestemail
9	analytics	objectviewed
10	analytics	usersession
11	billing	billingprofile
12	carts	cart
13	carts	cartitem
14	orders	order
15	products	category
16	products	product
17	tags	tag
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	accounts	0001_initial	2021-01-11 13:12:33.838019+05:30
2	billing	0001_initial	2021-01-11 13:12:33.979497+05:30
3	addresses	0001_initial	2021-01-11 13:12:34.052005+05:30
4	contenttypes	0001_initial	2021-01-11 13:12:34.138809+05:30
5	admin	0001_initial	2021-01-11 13:12:34.199997+05:30
6	admin	0002_logentry_remove_auto_add	2021-01-11 13:12:34.234549+05:30
7	admin	0003_logentry_add_action_flag_choices	2021-01-11 13:12:34.241415+05:30
8	contenttypes	0002_remove_content_type_name	2021-01-11 13:12:34.256378+05:30
9	analytics	0001_initial	2021-01-11 13:12:34.288851+05:30
10	analytics	0002_usersession	2021-01-11 13:12:34.422002+05:30
11	auth	0001_initial	2021-01-11 13:12:34.657653+05:30
12	auth	0002_alter_permission_name_max_length	2021-01-11 13:12:34.774672+05:30
13	auth	0003_alter_user_email_max_length	2021-01-11 13:12:34.781273+05:30
14	auth	0004_alter_user_username_opts	2021-01-11 13:12:34.79292+05:30
15	auth	0005_alter_user_last_login_null	2021-01-11 13:12:34.800918+05:30
16	auth	0006_require_contenttypes_0002	2021-01-11 13:12:34.805787+05:30
17	auth	0007_alter_validators_add_error_messages	2021-01-11 13:12:34.811866+05:30
18	auth	0008_alter_user_username_max_length	2021-01-11 13:12:34.819374+05:30
19	auth	0009_alter_user_last_name_max_length	2021-01-11 13:12:34.826684+05:30
20	auth	0010_alter_group_name_max_length	2021-01-11 13:12:34.842612+05:30
21	auth	0011_update_proxy_permissions	2021-01-11 13:12:34.850623+05:30
22	auth	0012_alter_user_first_name_max_length	2021-01-11 13:12:34.856574+05:30
23	products	0001_initial	2021-01-11 13:12:35.03507+05:30
24	products	0002_auto_20201231_1558	2021-01-11 13:12:35.115839+05:30
25	products	0003_auto_20201231_1650	2021-01-11 13:12:35.150977+05:30
26	products	0004_auto_20210102_1023	2021-01-11 13:12:35.395102+05:30
27	products	0005_auto_20210102_1025	2021-01-11 13:12:35.403081+05:30
28	products	0006_auto_20210102_1026	2021-01-11 13:12:35.40707+05:30
29	products	0007_auto_20210102_1539	2021-01-11 13:12:35.597594+05:30
30	products	0008_auto_20210102_1623	2021-01-11 13:12:35.937716+05:30
31	products	0009_auto_20210108_2215	2021-01-11 13:12:36.162213+05:30
32	products	0010_auto_20210108_2257	2021-01-11 13:12:36.19913+05:30
33	products	0011_auto_20210108_2257	2021-01-11 13:12:36.204116+05:30
34	products	0012_auto_20210109_1655	2021-01-11 13:12:36.216511+05:30
35	products	0013_auto_20210109_1718	2021-01-11 13:12:36.223493+05:30
36	products	0014_auto_20210109_1723	2021-01-11 13:12:36.235619+05:30
37	products	0015_auto_20210109_1728	2021-01-11 13:12:36.245596+05:30
38	carts	0001_initial	2021-01-11 13:12:36.282678+05:30
39	carts	0002_auto_20210108_1733	2021-01-11 13:12:36.355146+05:30
40	carts	0003_auto_20210108_2106	2021-01-11 13:12:36.40209+05:30
41	carts	0004_cartitem_prince	2021-01-11 13:12:36.411088+05:30
42	carts	0005_auto_20210108_2109	2021-01-11 13:12:36.421039+05:30
43	carts	0006_auto_20210108_2126	2021-01-11 13:12:36.545302+05:30
44	carts	0007_auto_20210109_1005	2021-01-11 13:12:36.581236+05:30
45	carts	0008_auto_20210109_1046	2021-01-11 13:12:36.601372+05:30
46	carts	0009_auto_20210109_1723	2021-01-11 13:12:36.639434+05:30
47	carts	0010_auto_20210109_2254	2021-01-11 13:12:36.657912+05:30
48	carts	0011_auto_20210109_2256	2021-01-11 13:12:36.702919+05:30
49	carts	0012_auto_20210110_1612	2021-01-11 13:12:36.736255+05:30
50	orders	0001_initial	2021-01-11 13:12:36.813164+05:30
51	sessions	0001_initial	2021-01-11 13:12:36.97535+05:30
52	tags	0001_initial	2021-01-11 13:12:37.184403+05:30
53	products	0016_category_file	2021-01-12 12:53:10.666581+05:30
54	products	0016_category_myfile	2021-01-12 16:56:44.410503+05:30
55	products	0017_auto_20210112_1635	2021-01-12 16:56:44.482717+05:30
56	products	0018_auto_20210112_1642	2021-01-12 16:56:44.535499+05:30
57	products	0019_auto_20210112_1643	2021-01-12 16:56:44.932659+05:30
58	accounts	0002_user_is_active	2021-01-25 11:14:20.170755+05:30
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
wekkyl7xfrgesnpvztqjoxsuizun6x55	.eJxVjs0OgyAQhN-Fc0NYCgIee_cZyLKs1f5oInhq-u7VxCbtcWa-mcxLRFzrENfCSxyzaAWI06-XkO487UG-4XSdJc1TXcYkd0QeaZHdnPlxOdi_gQHLsLWxScwhWOu0R-WDNWRVIOXBeSTdOIMpa0TXU8g9aNCOwEBIyid17nkbJVxqHCs_i2jhK7dnBt4fbcRAjQ:1l4Kb9:rdVvoS7P88wp8nFlmwl1a7OnZ_aOAp-7adYqMQ-YVo4	2021-02-09 14:55:19.900136+05:30
mq0pq1iwoox3ivlin99mfconezrga8qh	.eJxVjksOwyAQQ-_CukJAIUCW3ecMaBgmhX4SKZBV1bs3kVKpXdp-tvxiAdaWw1ppCSWxnkl2-vUi4J2mPUg3mK4zx3lqS4l8R_iRVj7MiR6Xg_0byFDz1oYuEnlvjFUOhPNGoxEehZPWAarOaohJAdgRfRqlksqi1NJH4aI4j7SNIiwtlEbPynrxldszrd4fbbdAjQ:1l4L6C:9iFqOM3V-Ei2yyElInhKrpIvQFAEzVzYwD15IkS_0X0	2021-02-09 15:27:24.494976+05:30
\.


--
-- Data for Name: orders_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders_order (id, order_id, status, shipping_total, total, active, billing_address_id, billing_profile_id, cart_id, shipping_address_id) FROM stdin;
1	Q5YMHVFZ59	paid	5.99	212.99	t	1	1	2	1
34	9T18HATMC1	paid	5.99	775.99	t	1	1	36	1
35	61VDTYFM71	paid	5.99	154.99	t	1	1	38	1
36	D918SY8LKM	paid	5.99	74.99	t	1	1	39	1
37	9X4TD8PVJK	paid	5.99	234.99	t	1	1	40	1
38	Q3L3FB9737	created	5.99	2004.99	t	1	1	41	1
39	LCMIJ093O7	paid	5.99	885.99	t	1	1	37	1
40	QXIII8BR3L	created	5.99	5.99	t	1	1	42	1
\.


--
-- Data for Name: products_category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_category (id, name, file, myfile) FROM stdin;
1	Commercial Products	m/COMMERCIAL_PRODUCTS_JaMkExt.xlsx	
2	Kitchen Garden	\N	
3	Herbs	m/HERBS.xlsx	
4	Microgreens	\N	
5	Trees	\N	
\.


--
-- Data for Name: products_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_product (id, title, slug, description, price, image, featured, active, "timestamp", category_id_id, product_id, product_type, packaging_size, variety, variant_of_id, quantity) FROM stdin;
2954	Beetroot Gulab	beetroot-gulab-09hp	The Maturity is 50-55 days after sowing, root shape is round, root colour is blood red, fruit Av. Wt is 80-90 gm, FRC 30 days without cracking, crispy, sweet taste, less fibre, colour remains same, Pan India product.	129	products/1371580/1371580.jpg	f	t	2021-01-15 10:40:56.957019+05:30	2	K000001	1	0	nan	2952	1000 seeds
2955	Brinjal Black long	brinjal-black-long	Tall Erect open type Plants, 50-55 days after transplanting, Medium thick long with club fruit shape, Black fruit in color, Harvest weight is 100-200gm,  wider climate adaptive variety, Early maturity with high yielding.	0	products/1124169/1124169.jpg	f	t	2021-01-15 10:40:56.963003+05:30	2	K000002	1	0	nan	\N	
2962	Chinese Cabbage	chinese-cabbage-yan1	Chinese cabbage, also called Chinese leaves, is an exotic variety of lettuce that has pale, tightly wrapped and succulent leaves.	29	products/511490/511490.jpg	t	t	2021-01-15 10:40:57.006886+05:30	2	K000004	1	0	nan	2961	50 seeds
2957	Brinjal Black long	brinjal-black-long-2aqh	Tall Erect open type Plants, 50-55 days after transplanting, Medium thick long with club fruit shape, Black fruit in color, Harvest weight is 100-200gm,  wider climate adaptive variety, Early maturity with high yielding.	149	products/654204/654204.jpg	f	t	2021-01-15 10:40:56.974996+05:30	2	K000002	1	0	nan	2955	1000 seeds
2958	Brinjal Purple long	brinjal-purple-long	Tall Erect open type Plants, 50-55 days after transplanting, long cylindrical  thin fruit shape,purple fruit in color, 80-90 gm, Cluster bearing, wider adaptability suited in PPL growing areas, high level of resistance to sucking pests & disease.. 	0	products/51192/51192.jpg	f	t	2021-01-15 10:40:56.981952+05:30	2	K000003	1	0	nan	\N	
2959	Brinjal Purple long	brinjal-purple-long-1w5u	Tall Erect open type Plants, 50-55 days after transplanting, long cylindrical  thin fruit shape,purple fruit in color, 80-90 gm, Cluster bearing, wider adaptability suited in PPL growing areas, high level of resistance to sucking pests & disease.. 	29	products/799874/799874.jpg	f	t	2021-01-15 10:40:56.986969+05:30	2	K000003	1	0	nan	2958	50 seeds
2960	Brinjal Purple long	brinjal-purple-long-cdie	Tall Erect open type Plants, 50-55 days after transplanting, long cylindrical  thin fruit shape,purple fruit in color, 80-90 gm, Cluster bearing, wider adaptability suited in PPL growing areas, high level of resistance to sucking pests & disease.. 	149	products/258719/258719.jpg	f	t	2021-01-15 10:40:56.993922+05:30	2	K000003	1	0	nan	2958	1000 seeds
2961	Chinese Cabbage	chinese-cabbage	Chinese cabbage, also called Chinese leaves, is an exotic variety of lettuce that has pale, tightly wrapped and succulent leaves.	0	products/70568/70568.jpg	f	t	2021-01-15 10:40:57.000902+05:30	2	K000004	1	0	nan	\N	
2965	French Beans Tony	french-beans-tony-ba5c	Plant type is bushy spreading plants, first picking is 45 days after sowing, 14-16cm of pod length, green pod clour, pods are tender with less fibe and tolerant to bean mosaic virus.	29	products/1381499/1381499.jpg	t	t	2021-01-15 10:40:57.022843+05:30	2	K000005	1	0	nan	2964	50 seeds
2963	Chinese Cabbage	chinese-cabbage-qmjv	Chinese cabbage, also called Chinese leaves, is an exotic variety of lettuce that has pale, tightly wrapped and succulent leaves.	169	products/1470312/1470312.jpg	f	t	2021-01-15 10:40:57.011872+05:30	2	K000004	1	0	nan	2961	1000 seeds
2964	French Beans Tony	french-beans-tony	Plant type is bushy spreading plants, first picking is 45 days after sowing, 14-16cm of pod length, green pod clour, pods are tender with less fibe and tolerant to bean mosaic virus.	0	products/1443486/1443486.jpg	f	t	2021-01-15 10:40:57.017868+05:30	2	K000005	1	0	nan	\N	
2968	Beetroot Rado (Hybrid)	beetroot-rado-hybrid-tyrs	The Plant Type is Medium Tall Plants, first Picking is 45-48 days after swing, fruit color is dark  green, fruit length is 5-6 cm in length, with 5 ridges, talll plants with 2-3 branchesss, high yielder, high level of tolerance to YVMV.	49	products/717026/717026.jpg	t	t	2021-01-15 10:40:57.040013+05:30	2	K000006	1	0	nan	2967	50 seeds
2966	French Beans Tony	french-beans-tony-j9d0	Plant type is bushy spreading plants, first picking is 45 days after sowing, 14-16cm of pod length, green pod clour, pods are tender with less fibe and tolerant to bean mosaic virus.	159	products/1581862/1581862.jpg	f	t	2021-01-15 10:40:57.028976+05:30	2	K000005	1	0	nan	2964	1000 seeds
2967	Beetroot Rado (Hybrid)	beetroot-rado-hybrid	The Plant Type is Medium Tall Plants, first Picking is 45-48 days after swing, fruit color is dark  green, fruit length is 5-6 cm in length, with 5 ridges, talll plants with 2-3 branchesss, high yielder, high level of tolerance to YVMV.	0	products/707204/707204.jpg	f	t	2021-01-15 10:40:57.034577+05:30	2	K000006	1	0	nan	\N	
2969	Beetroot Rado (Hybrid)	beetroot-rado-hybrid-e7wt	The Plant Type is Medium Tall Plants, first Picking is 45-48 days after swing, fruit color is dark  green, fruit length is 5-6 cm in length, with 5 ridges, talll plants with 2-3 branchesss, high yielder, high level of tolerance to YVMV.	169	products/342560/342560.jpg	f	t	2021-01-15 10:40:57.04562+05:30	2	K000006	1	0	nan	2967	1000 seeds
2970	Bhendi/Okra Deepa (Hybrid)	bhendiokra-deepa-hybrid	The Plant Type is Medium Tall Plants, first Picking is 40-45 days after swing, fruit color is green, fruit length is 10-12 cm in lengty, with 5 ridges medium talll plants with 2-3 branchesss, high yielder, high level of tolerance to YVMV.	0	products/1247744/1247744.jpg	f	t	2021-01-15 10:40:57.052931+05:30	2	K000007	1	0	nan	\N	
2972	Bhendi/Okra Deepa (Hybrid)	bhendiokra-deepa-hybrid-5rdt	The Plant Type is Medium Tall Plants, first Picking is 40-45 days after swing, fruit color is green, fruit length is 10-12 cm in lengty, with 5 ridges medium talll plants with 2-3 branchesss, high yielder, high level of tolerance to YVMV.	169	products/82701/82701.jpg	f	t	2021-01-15 10:40:57.063902+05:30	2	K000007	1	0	nan	2970	1000 seeds
2973	Bhendi/Okra Mejestic (Hybrid)	bhendiokra-mejestic-hybrid	Plant type is medium, first picking is 42-48 days, fruit color is dark green, fruit length is 10-12 cm in length, 5 ridges,tall plant, 3-4 branches, prolific Beraing and short internodes resistant to YVMV.                                       	0	products/1274547/1274547.jpg	f	t	2021-01-15 10:40:57.071278+05:30	2	K000008	1	0	nan	\N	
2974	Bhendi/Okra Mejestic (Hybrid)	bhendiokra-mejestic-hybrid-bm7l	Plant type is medium, first picking is 42-48 days, fruit color is dark green, fruit length is 10-12 cm in length, 5 ridges,tall plant, 3-4 branches, prolific Beraing and short internodes resistant to YVMV.                                       	49	products/1846377/1846377.jpg	f	t	2021-01-15 10:40:57.074937+05:30	2	K000008	1	0	nan	2973	50 seeds
3174	Dill Seeds	dill-seeds-gn8v	Dill (Anethum graveolens) is an herb that's found throughout European and Asian cuisines. 	0	products/1144260/1144260.jpg	f	t	2021-01-15 10:44:50.474839+05:30	3	H000004	1	0	nan	\N	
2978	Brinjal Aira (Hybrid)	brinjal-aira-hybrid-xlqp	Plant type is tall erect spreading plants, first picking is 55-65 days after transplanting, fruit shape is round, fruit colour is dark purple, 200-300 gm of Harvest Wt., Attractive shiny fruits with low seed content, suitable for Bharta flying operations.	169	products/807406/807406.jpg	f	t	2021-01-15 10:40:57.101601+05:30	2	K000009	1	0	nan	2976	1000 seeds
2977	Brinjal Aira (Hybrid)	brinjal-aira-hybrid-b6cc	Plant type is tall erect spreading plants, first picking is 55-65 days after transplanting, fruit shape is round, fruit colour is dark purple, 200-300 gm of Harvest Wt., Attractive shiny fruits with low seed content, suitable for Bharta flying operations.	49	products/211967/211967.jpg	t	t	2021-01-15 10:40:57.095581+05:30	2	K000009	1	0	nan	2976	50 seeds
2979	Brinjal Dhiraj (Hybrid)	brinjal-dhiraj-hybrid	Fruit plant type is hardy tall spreading plants, first picking is 70-75 days after transplanting, oval fruit shape, harvesr Wt. is 200-400gm, Pan India Product, wider climate adaptability with disease 6 suckings pets tolerance,soft fruits with good keeping quality, good for frying dishes.	0	products/1959113/1959113.jpg	f	t	2021-01-15 10:40:57.107056+05:30	2	K000010	1	0	nan	\N	
2981	Brinjal Dhiraj (Hybrid)	brinjal-dhiraj-hybrid-apk8	Fruit plant type is hardy tall spreading plants, first picking is 70-75 days after transplanting, oval fruit shape, harvesr Wt. is 200-400gm, Pan India Product, wider climate adaptability with disease 6 suckings pets tolerance,soft fruits with good keeping quality, good for frying dishes.	169	products/1626631/1626631.jpg	f	t	2021-01-15 10:40:57.119039+05:30	2	K000010	1	0	nan	2979	1000 seeds
2982	Brinjal Hariya (Hybrid)	brinjal-hariya-hybrid	Tall Erect Plants, 50-65 days after transplanting, medium thick long cylindrical fruit shape, uniform green in color,70-80 gm, Cluster bearing, long peduncle, shiny straight fruits with high yielding, good disease tolerance.	0	products/935270/935270.jpg	f	t	2021-01-15 10:40:57.124728+05:30	2	K000011	1	0	nan	\N	
2983	Brinjal Hariya (Hybrid)	brinjal-hariya-hybrid-17a8	Tall Erect Plants, 50-65 days after transplanting, medium thick long cylindrical fruit shape, uniform green in color,70-80 gm, Cluster bearing, long peduncle, shiny straight fruits with high yielding, good disease tolerance.	49	products/1548675/1548675.jpg	f	t	2021-01-15 10:40:57.129083+05:30	2	K000011	1	0	nan	2982	50 seeds
2984	Brinjal Hariya (Hybrid)	brinjal-hariya-hybrid-9la6	Tall Erect Plants, 50-65 days after transplanting, medium thick long cylindrical fruit shape, uniform green in color,70-80 gm, Cluster bearing, long peduncle, shiny straight fruits with high yielding, good disease tolerance.	169	products/1579204/1579204.jpg	f	t	2021-01-15 10:40:57.134607+05:30	2	K000011	1	0	nan	2982	1000 seeds
2985	Brinjal Myna (Hybrid)	brinjal-myna-hybrid	Tall Erect Plants, 60-65 days after transplanting, medium thick long cylindrical fruit shape, glossy black fruit in color, 150-200 gm, Cluster bearing, shiny straight fruits with high yielding,good disease tolerance. 	0	products/1661763/1661763.jpg	f	t	2021-01-15 10:40:57.140592+05:30	2	K000012	1	0	nan	\N	
2986	Brinjal Myna (Hybrid)	brinjal-myna-hybrid-dowv	Tall Erect Plants, 60-65 days after transplanting, medium thick long cylindrical fruit shape, glossy black fruit in color, 150-200 gm, Cluster bearing, shiny straight fruits with high yielding,good disease tolerance. 	49	products/1894200/1894200.jpg	f	t	2021-01-15 10:40:57.145401+05:30	2	K000012	1	0	nan	2985	50 seeds
2987	Brinjal Myna (Hybrid)	brinjal-myna-hybrid-w91q	Tall Erect Plants, 60-65 days after transplanting, medium thick long cylindrical fruit shape, glossy black fruit in color, 150-200 gm, Cluster bearing, shiny straight fruits with high yielding,good disease tolerance. 	169	products/1629507/1629507.jpg	f	t	2021-01-15 10:40:57.154833+05:30	2	K000012	1	0	nan	2985	1000 seeds
2988	Brinjal Naman (Hybrid)	brinjal-naman-hybrid	Plant type is tall erect spreading thorny plants, first picking is 65 days after transplanting, fruit shape is roval, fruit colour is purple with green shiny shrips, 60-70gm of Harvest Wt.,  thorny fruits, Excellent taste, Good keeping quality, High yielder.	0	products/1843550/1843550.jpg	f	t	2021-01-15 10:40:57.17896+05:30	2	K000013	1	0	nan	\N	
2989	Brinjal Naman (Hybrid)	brinjal-naman-hybrid-kvlo	Plant type is tall erect spreading thorny plants, first picking is 65 days after transplanting, fruit shape is roval, fruit colour is purple with green shiny shrips, 60-70gm of Harvest Wt.,  thorny fruits, Excellent taste, Good keeping quality, High yielder.	49	products/92457/92457.jpg	f	t	2021-01-15 10:40:57.189923+05:30	2	K000013	1	0	nan	2988	50 seeds
2991	Cabbage	cabbage	The plant type is Erect type Green Small leaves, Days of Maturity 55-60 days after transplanting, Head shape is Round, Very Compact, Head Weight is 1- 1.5 kg, FH Capacity is 25-30days after Marurity, Very Compact with Small Erect Foliage suitable for close spacing.	0	products/833345/833345.jpg	f	t	2021-01-15 10:40:57.209584+05:30	2	K000014	1	0	nan	\N	
2992	Cabbage	cabbage-16bf	The plant type is Erect type Green Small leaves, Days of Maturity 55-60 days after transplanting, Head shape is Round, Very Compact, Head Weight is 1- 1.5 kg, FH Capacity is 25-30days after Marurity, Very Compact with Small Erect Foliage suitable for close spacing.	49	products/879597/879597.jpg	f	t	2021-01-15 10:40:57.21542+05:30	2	K000014	1	0	nan	2991	50 seeds
2993	Cabbage	cabbage-36qd	The plant type is Erect type Green Small leaves, Days of Maturity 55-60 days after transplanting, Head shape is Round, Very Compact, Head Weight is 1- 1.5 kg, FH Capacity is 25-30days after Marurity, Very Compact with Small Erect Foliage suitable for close spacing.	159	products/398402/398402.jpg	f	t	2021-01-15 10:40:57.224265+05:30	2	K000014	1	0	nan	2991	1000 seeds
3010	Chilly Spicy (Hybrid)	chilly-spicy-hybrid-oghy	Plant habit is medium Tall Spreading  plants, first picking is70 days after transplanting, fruit colour is dark green turns red, fruit length is 13-14cm, diameter is1.3-1.4cm fruit pungency is medium pungency, byadgi type hybrid, wrinkled fruits, good for dry purpose & colour value.	69	products/1876616/1876616.jpg	f	t	2021-01-15 10:40:57.382965+05:30	2	K000020	1	0	nan	3009	50 seeds
3189	Rosemary	rosemary-7syk	Rosemary is described as a woody, perennial herb that can become a bushy shrub. The leaves are evergreen and needlelike in shape, and they produce the essential oil that gives rosemary its characteristic scent.	0	products/1815648/1815648.jpg	f	t	2021-01-15 10:44:50.579264+05:30	3	H000009	1	0	nan	\N	
3631	Kholrabi	kholrabi-hxar	Kohlrabi microgreens are very nutritious and contains over 100% of the recommended daily value of Vitamin C. It's also high in Vitamin B6, Folate (B9), Thiamin (B1), potassium, phosphorus, and calcium.	159	products/339441/339441.jpg	f	t	2021-01-15 11:15:48.104753+05:30	4	M000020	1	0	nan	3629	1000 seeds
2996	Cabbage (Hybrid)	cabbage-hybrid-q38p	he plant type is Erect type Green Small leaves, Days of Maturity 55-60 days after transplanting, Head shape is Round, Very Compact, Head Weight is 1- 1.5 kg, FH Capacity is 25-30days after Marurity, Very Compact with Small Erect Foliage suitable for close spacing.	399	products/1610158/1610158.jpg	f	t	2021-01-15 10:40:57.240645+05:30	2	K000015	1	0	nan	2994	1000 seeds
2997	Cauliflower (Hybrid)	cauliflower-hybrid	he plant type is Erect light green, big  foliage plants, Days of Maturity  55-60days after transplanting, Curd shape is Dome shape, Very Compact Curds, Curd Weight is 1.2- 1.5 kg,  Very Early Hybrids.	0	products/778394/778394.jpg	f	t	2021-01-15 10:40:57.247605+05:30	2	K000016	1	0	nan	\N	
2998	Cauliflower (Hybrid)	cauliflower-hybrid-hloh	he plant type is Erect light green, big  foliage plants, Days of Maturity  55-60days after transplanting, Curd shape is Dome shape, Very Compact Curds, Curd Weight is 1.2- 1.5 kg,  Very Early Hybrids.	69	products/1008508/1008508.jpg	f	t	2021-01-15 10:40:57.252221+05:30	2	K000016	1	0	nan	2997	50 seeds
2999	Cauliflower (Hybrid)	cauliflower-hybrid-62qv	he plant type is Erect light green, big  foliage plants, Days of Maturity  55-60days after transplanting, Curd shape is Dome shape, Very Compact Curds, Curd Weight is 1.2- 1.5 kg,  Very Early Hybrids.	399	products/149139/149139.jpg	f	t	2021-01-15 10:40:57.258529+05:30	2	K000016	1	0	nan	2997	1000 seeds
3000	Chilly Achari  (Hybrid)	chilly-achari-hybrid	Plant habit is Tall plants, first picking is 60-65 days after transplanting, fruit colour is  Glossy yelowish  Green, 14-18cm of  fruit length, fruit diameter is 2 cm fruit pungency is medium pungency, Good product for fresh market.	0	products/552076/552076.jpg	f	t	2021-01-15 10:40:57.277702+05:30	2	K000017	1	0	nan	\N	
3001	Chilly Achari  (Hybrid)	chilly-achari-hybrid-bjq2	Plant habit is Tall plants, first picking is 60-65 days after transplanting, fruit colour is  Glossy yelowish  Green, 14-18cm of  fruit length, fruit diameter is 2 cm fruit pungency is medium pungency, Good product for fresh market.	99	products/1731889/1731889.jpg	f	t	2021-01-15 10:40:57.289756+05:30	2	K000017	1	0	nan	3000	50 seeds
3002	Chilly Achari  (Hybrid)	chilly-achari-hybrid-zi2v	Plant habit is Tall plants, first picking is 60-65 days after transplanting, fruit colour is  Glossy yelowish  Green, 14-18cm of  fruit length, fruit diameter is 2 cm fruit pungency is medium pungency, Good product for fresh market.	999	products/757039/757039.jpg	f	t	2021-01-15 10:40:57.314868+05:30	2	K000017	1	0	nan	3000	1000 seeds
3004	Chilly Bhajji  (Hybrid)	chilly-bhajji-hybrid-au1k	Plant habit is Tall plants, first picking is 60-65 days after transplanting, fruit colour is  Glossy yelowish  Green, 14-18cm of  fruit length, fruit diameter is 2 cm fruit pungency is medium pungency, Good product for fresh market.	99	products/886389/886389.jpg	f	t	2021-01-15 10:40:57.342014+05:30	2	K000018	1	0	nan	3003	50 seeds
3005	Chilly Bhajji  (Hybrid)	chilly-bhajji-hybrid-4ngp	Plant habit is Tall plants, first picking is 60-65 days after transplanting, fruit colour is  Glossy yelowish  Green, 14-18cm of  fruit length, fruit diameter is 2 cm fruit pungency is medium pungency, Good product for fresh market.	999	products/86296/86296.jpg	f	t	2021-01-15 10:40:57.350989+05:30	2	K000018	1	0	nan	3003	1000 seeds
3006	Chilly Dry/Tadka Purpose (Hybrid)	chilly-drytadka-purpose-hybrid	Plant habit is Tall plants, first picking is 60-65 days after transplanting, fruit colour is  Glossy yelowish  Green, 14-18cm of  fruit length, fruit diameter is 2 cm fruit pungency is medium pungency, Good product for fresh market.	0	products/1190333/1190333.jpg	f	t	2021-01-15 10:40:57.358139+05:30	2	K000019	1	0	nan	\N	
3007	Chilly Dry/Tadka Purpose (Hybrid)	chilly-drytadka-purpose-hybrid-s7xc	Plant habit is Tall plants, first picking is 60-65 days after transplanting, fruit colour is  Glossy yelowish  Green, 14-18cm of  fruit length, fruit diameter is 2 cm fruit pungency is medium pungency, Good product for fresh market.	89	products/905873/905873.jpg	f	t	2021-01-15 10:40:57.363605+05:30	2	K000019	1	0	nan	3006	50 seeds
3008	Chilly Dry/Tadka Purpose (Hybrid)	chilly-drytadka-purpose-hybrid-5nu2	Plant habit is Tall plants, first picking is 60-65 days after transplanting, fruit colour is  Glossy yelowish  Green, 14-18cm of  fruit length, fruit diameter is 2 cm fruit pungency is medium pungency, Good product for fresh market.	799	products/1316521/1316521.jpg	f	t	2021-01-15 10:40:57.36971+05:30	2	K000019	1	0	nan	3006	1000 seeds
3009	Chilly Spicy (Hybrid)	chilly-spicy-hybrid	Plant habit is medium Tall Spreading  plants, first picking is70 days after transplanting, fruit colour is dark green turns red, fruit length is 13-14cm, diameter is1.3-1.4cm fruit pungency is medium pungency, byadgi type hybrid, wrinkled fruits, good for dry purpose & colour value.	0	products/1380855/1380855.jpg	f	t	2021-01-15 10:40:57.377709+05:30	2	K000020	1	0	nan	\N	
3011	Chilly Spicy (Hybrid)	chilly-spicy-hybrid-sf1z	Plant habit is medium Tall Spreading  plants, first picking is70 days after transplanting, fruit colour is dark green turns red, fruit length is 13-14cm, diameter is1.3-1.4cm fruit pungency is medium pungency, byadgi type hybrid, wrinkled fruits, good for dry purpose & colour value.	499	products/1887126/1887126.jpg	f	t	2021-01-15 10:40:57.388926+05:30	2	K000020	1	0	nan	3009	1000 seeds
3012	Cucumber Dark Green (Hybrid)	cucumber-dark-green-hybrid	Fruit picking is 45-45 days after Sowing, fruit Shape is long cylindrical, fruit colour is mottle Green, 15-18cm of  fruit length, Av.fruit Wt. is 160-180gm, Vigorous branched vines with good disease tolerance & fruits with wide market acceptance.	0	products/1687614/1687614.jpg	f	t	2021-01-15 10:40:57.394637+05:30	2	K000021	1	0	nan	\N	
3013	Cucumber Dark Green (Hybrid)	cucumber-dark-green-hybrid-fs9e	Fruit picking is 45-45 days after Sowing, fruit Shape is long cylindrical, fruit colour is mottle Green, 15-18cm of  fruit length, Av.fruit Wt. is 160-180gm, Vigorous branched vines with good disease tolerance & fruits with wide market acceptance.	69	products/1724624/1724624.jpg	f	t	2021-01-15 10:40:57.400511+05:30	2	K000021	1	0	nan	3012	50 seeds
3076	Marigold Yellow	marigold-yellow-y582	The plant type is 60-75cm, Floweing is 60-65 days after transplanting, Flower Colour is Yeloow, Flower Av.Wt is 12-14 gm,  Double Petaled compact flowers with good keeping quality.	29	products/1125375/1125375.jpg	f	t	2021-01-15 10:40:57.877921+05:30	2	K000042	1	0	nan	3075	50 seeds
3264	Pongame	pongame-07zm	Póngame" in Spanish-English from Reverso Context: Don Ferdinando, póngame leche de almendra	329	products/217712/217712.jpg	f	t	2021-01-15 11:14:15.160469+05:30	5	T000007	1	0	nan	3261	500 seeds
3016	Cucumber Light Green (Hybrid)	cucumber-light-green-hybrid-s2rb	Fruit picking is 45-45 days after Sowing, fruit Shape is cylindrical, fruit colour is mottle Green, 15-18cm of  fruit length, Av.fruit Wt. is 150-200gm, Mosaic Tolerant, good Keeping quality and suitable for long transporation. 	69	products/1662918/1662918.jpg	f	t	2021-01-15 10:40:57.418077+05:30	2	K000022	1	0	nan	3015	50 seeds
3017	Cucumber Light Green (Hybrid)	cucumber-light-green-hybrid-5fy2	Fruit picking is 45-45 days after Sowing, fruit Shape is cylindrical, fruit colour is mottle Green, 15-18cm of  fruit length, Av.fruit Wt. is 150-200gm, Mosaic Tolerant, good Keeping quality and suitable for long transporation. 	499	products/79195/79195.jpg	f	t	2021-01-15 10:40:57.423518+05:30	2	K000022	1	0	nan	3015	1000 seeds
3020	Chilly Dual Purpose-Dry/Fresh  (Hybrid)	chilly-dual-purpose-dryfresh-hybrid-n7oc	Plant habit is Tall plants with dark green foliage, first picking is 60-65 days after transplanting, fruit colour is Green light wrinkled fruits, 8-10cm of  fruit length, fruit diameter is 1.3-1.5cm fruit pungency is high pungency,  light wrinkled high yielding hybrid,good for fresh maeket as well as for dry.	799	products/1932971/1932971.jpg	f	t	2021-01-15 10:40:57.441558+05:30	2	K000023	1	0	nan	3018	1000 seeds
3021	Green Bittergourd (Hybrid)	green-bittergourd-hybrid	First picking is 50-55 days fter sowing, medium long, prickly fruit shape, green colour fruit, 22-25 cm in fruit length, fruit Avg. Wt is 120-150 gm, Suitable for long duaration harvest. Good disease tolerance.	0	products/1302692/1302692.jpeg	f	t	2021-01-15 10:40:57.470924+05:30	2	K000024	1	0	nan	\N	
3022	Green Bittergourd (Hybrid)	green-bittergourd-hybrid-0alv	First picking is 50-55 days fter sowing, medium long, prickly fruit shape, green colour fruit, 22-25 cm in fruit length, fruit Avg. Wt is 120-150 gm, Suitable for long duaration harvest. Good disease tolerance.	89	products/1738847/1738847.jpeg	f	t	2021-01-15 10:40:57.477279+05:30	2	K000024	1	0	nan	3021	50 seeds
3023	Green Bittergourd (Hybrid)	green-bittergourd-hybrid-t2vm	First picking is 50-55 days fter sowing, medium long, prickly fruit shape, green colour fruit, 22-25 cm in fruit length, fruit Avg. Wt is 120-150 gm, Suitable for long duaration harvest. Good disease tolerance.	799	products/1516566/1516566.jpeg	f	t	2021-01-15 10:40:57.485976+05:30	2	K000024	1	0	nan	3021	1000 seeds
3024	Bottlegourd Long (Hybrid)	bottlegourd-long-hybrid	First picking is 45-50 days fter sowing, straight cylindrical fruit shape, whith green colour fruit,28-30cm in fruit length, fruit Avg. Wt is 600-800gm, early vigorous  hybrid,  uniform fruits, tenderr flesh, good keeping quality.	0	products/919779/919779.jpg	f	t	2021-01-15 10:40:57.493278+05:30	2	K000025	1	0	nan	\N	
3025	Bottlegourd Long (Hybrid)	bottlegourd-long-hybrid-yn4n	First picking is 45-50 days fter sowing, straight cylindrical fruit shape, whith green colour fruit,28-30cm in fruit length, fruit Avg. Wt is 600-800gm, early vigorous  hybrid,  uniform fruits, tenderr flesh, good keeping quality.	69	products/637935/637935.jpg	f	t	2021-01-15 10:40:57.499049+05:30	2	K000025	1	0	nan	3024	50 seeds
3026	Bottlegourd Long (Hybrid)	bottlegourd-long-hybrid-5eea	First picking is 45-50 days fter sowing, straight cylindrical fruit shape, whith green colour fruit,28-30cm in fruit length, fruit Avg. Wt is 600-800gm, early vigorous  hybrid,  uniform fruits, tenderr flesh, good keeping quality.	499	products/151444/151444.jpg	f	t	2021-01-15 10:40:57.505779+05:30	2	K000025	1	0	nan	3024	1000 seeds
3027	Orange Carrot Kuroda (Hybrid)	orange-carrot-kuroda-hybrid	Plant is gree errect coarse leaves foiage plants, maturity is 100-110 dayys from sowing, rot shape is conical with blunt tip, root colour is deep orange with self colour core, Erect growing, medium size, sweet with edible core.	0	products/1239472/1239472.jpg	f	t	2021-01-15 10:40:57.513318+05:30	2	K000026	1	0	nan	\N	
3029	Orange Carrot Kuroda (Hybrid)	orange-carrot-kuroda-hybrid-zv1z	Plant is gree errect coarse leaves foiage plants, maturity is 100-110 dayys from sowing, rot shape is conical with blunt tip, root colour is deep orange with self colour core, Erect growing, medium size, sweet with edible core.	149	products/1581996/1581996.jpg	f	t	2021-01-15 10:40:57.529396+05:30	2	K000026	1	0	nan	3027	1000 seeds
3030	Orange Carrot Nantes  (Hybrid)	orange-carrot-nantes-hybrid	Plant is Erect, green, medium foliage  plants, maturity is 90 days from sowing, root shape is long cylindrical with blunt tip, root colour is orange with self colour core, Erect foliage, long, soft, edible core.	0	products/833896/833896.jpeg	f	t	2021-01-15 10:40:57.535951+05:30	2	K000027	1	0	nan	\N	
3031	Orange Carrot Nantes  (Hybrid)	orange-carrot-nantes-hybrid-3t4r	Plant is Erect, green, medium foliage  plants, maturity is 90 days from sowing, root shape is long cylindrical with blunt tip, root colour is orange with self colour core, Erect foliage, long, soft, edible core.	59	products/1918097/1918097.jpeg	f	t	2021-01-15 10:40:57.541972+05:30	2	K000027	1	0	nan	3030	50 seeds
3032	Orange Carrot Nantes  (Hybrid)	orange-carrot-nantes-hybrid-f0u2	Plant is Erect, green, medium foliage  plants, maturity is 90 days from sowing, root shape is long cylindrical with blunt tip, root colour is orange with self colour core, Erect foliage, long, soft, edible core.	159	products/427506/427506.jpeg	f	t	2021-01-15 10:40:57.550215+05:30	2	K000027	1	0	nan	3030	1000 seeds
3033	Pumpkin Boss (Hybrid)	pumpkin-boss-hybrid	aturity days are 85-90 days from sowing, fruit shape is Flatish round, Fruit surface is Green with white stripes tuens yellowish orange on maturity, Fruit Av. Wt is 4-5 kg. Attractive Early medium size hybrid with export quality	0	products/1073601/1073601.jpg	f	t	2021-01-15 10:40:57.557687+05:30	2	K000028	1	0	nan	\N	
3573	Amaranthus Red	amaranthus-red-dvau	Amaranth contains high complete protein amounts with vital amino acids, in contrast with other protein sources. Amaranth is gluten-free. Amaranth microgreens also contains vitamin A, C, E, folate, iron, magnesium, phosphorus, potassium, dietary fiber, calcium, amino acids, antioxidants, minerals and essential lysine.	69	products/388934/388934.jpg	f	t	2021-01-15 11:15:47.696843+05:30	4	M000001	1	0	nan	3572	500 seeds
3166	Amaranthus Green	amaranthus-green-gi5w	Amaranth plants can reach heights of over 2 meters tall with fleshy oval shaped leaves that are sometimes pointed at the tips.	69	products/284357/284357.jpg	f	t	2021-01-15 10:44:50.418783+05:30	3	H000001	1	0	nan	3165	500 seeds
3350	Soapnut	soapnut-q9hu	The genus includes both deciduous and evergreen species. Members of the genus are commonly known as soapberries or soapnuts.	499	products/1734827/1734827.jpg	f	t	2021-01-15 11:14:15.759234+05:30	5	T000024	1	0	nan	3346	1000 seeds
3380	Trumpet Tree	trumpet-tree-v16o	Trumpet tree or trumpet bush may refer to: Several species of Cecropia, including: Cecropia obtusifolia · Cecropia peltata · Dolichandrone spathacea, mangrove .	499	products/837712/837712.jpg	f	t	2021-01-15 11:14:15.954731+05:30	5	T000030	1	0	nan	3376	1000 seeds
3036	Pumpkin Druva (Hybrid)	pumpkin-druva-hybrid	Medium size fruits, flat shape, with bright yellow flesh, greyish-green skin, light yellow at the bottom. The flavor is very sweet and delicate. Maturity: 82-85 days from sowing, weight about 2.5-3.2 kg (5.5-7 lb). Tolerant to heat, Powdery mildew, Downy mildew.	0	products/571954/571954.jpg	f	t	2021-01-15 10:40:57.575618+05:30	2	K000029	1	0	nan	\N	
3038	Pumpkin Druva (Hybrid)	pumpkin-druva-hybrid-hvpl	Medium size fruits, flat shape, with bright yellow flesh, greyish-green skin, light yellow at the bottom. The flavor is very sweet and delicate. Maturity: 82-85 days from sowing, weight about 2.5-3.2 kg (5.5-7 lb). Tolerant to heat, Powdery mildew, Downy mildew.	499	products/1459605/1459605.jpg	f	t	2021-01-15 10:40:57.589121+05:30	2	K000029	1	0	nan	3036	1000 seeds
3039	Red Carrot (Hybrid)	red-carrot-hybrid	Plant is gree errect coarse leaves foiage plants, maturity is 100-110 dayys from sowing, rot shape is conical with blunt tip, root colour is deep orange with self colour core, Erect growing, medium size, sweet with edible core.	0	products/1131178/1131178.jpg	f	t	2021-01-15 10:40:57.596845+05:30	2	K000030	1	0	nan	\N	
3040	Red Carrot (Hybrid)	red-carrot-hybrid-4iys	Plant is gree errect coarse leaves foiage plants, maturity is 100-110 dayys from sowing, rot shape is conical with blunt tip, root colour is deep orange with self colour core, Erect growing, medium size, sweet with edible core.	49	products/1436247/1436247.jpg	f	t	2021-01-15 10:40:57.601831+05:30	2	K000030	1	0	nan	3039	50 seeds
3041	Red Carrot (Hybrid)	red-carrot-hybrid-7py7	Plant is gree errect coarse leaves foiage plants, maturity is 100-110 dayys from sowing, rot shape is conical with blunt tip, root colour is deep orange with self colour core, Erect growing, medium size, sweet with edible core.	149	products/1544435/1544435.jpg	f	t	2021-01-15 10:40:57.607742+05:30	2	K000030	1	0	nan	3039	1000 seeds
3042	Ridge Gourd (Hybrid)	ridge-gourd-hybrid	First picking is 47-50 daysafter sowing, Fruit shape is medium cylindrical with ridges, Fruit colour is green, Fruit length is 25-35cm, Fruit Av.Wt is 140-160 gm, Early hybrid with high yield with good disease tolerance.	0	products/814811/814811.jpg	f	t	2021-01-15 10:40:57.613772+05:30	2	K000031	1	0	nan	\N	
3043	Ridge Gourd (Hybrid)	ridge-gourd-hybrid-x782	First picking is 47-50 daysafter sowing, Fruit shape is medium cylindrical with ridges, Fruit colour is green, Fruit length is 25-35cm, Fruit Av.Wt is 140-160 gm, Early hybrid with high yield with good disease tolerance.	89	products/472635/472635.jpg	f	t	2021-01-15 10:40:57.621675+05:30	2	K000031	1	0	nan	3042	50 seeds
3044	Ridge Gourd (Hybrid)	ridge-gourd-hybrid-utgz	First picking is 47-50 daysafter sowing, Fruit shape is medium cylindrical with ridges, Fruit colour is green, Fruit length is 25-35cm, Fruit Av.Wt is 140-160 gm, Early hybrid with high yield with good disease tolerance.	799	products/1451132/1451132.jpg	f	t	2021-01-15 10:40:57.629614+05:30	2	K000031	1	0	nan	3042	1000 seeds
3045	Round Bottlegourd (Hybrid)	round-bottlegourd-hybrid	The Fruit Picking is 40-45 days, Fruit Shape is Flat round, Fruit colour is light green, fruit Length is 8-12cm, Harvest Wt. is 400-600 gm, Vigorous vines with high fruit set. Attractive colour with soft flesh. Tolerant to mildews.	0	products/1040351/1040351.jpg	f	t	2021-01-15 10:40:57.635857+05:30	2	K000032	1	0	nan	\N	
3046	Round Bottlegourd (Hybrid)	round-bottlegourd-hybrid-h9po	The Fruit Picking is 40-45 days, Fruit Shape is Flat round, Fruit colour is light green, fruit Length is 8-12cm, Harvest Wt. is 400-600 gm, Vigorous vines with high fruit set. Attractive colour with soft flesh. Tolerant to mildews.	69	products/633041/633041.jpg	f	t	2021-01-15 10:40:57.640338+05:30	2	K000032	1	0	nan	3045	50 seeds
3047	Round Bottlegourd (Hybrid)	round-bottlegourd-hybrid-yfp3	The Fruit Picking is 40-45 days, Fruit Shape is Flat round, Fruit colour is light green, fruit Length is 8-12cm, Harvest Wt. is 400-600 gm, Vigorous vines with high fruit set. Attractive colour with soft flesh. Tolerant to mildews.	499	products/183124/183124.jpg	f	t	2021-01-15 10:40:57.647322+05:30	2	K000032	1	0	nan	3045	1000 seeds
3048	Spongegourd Dark Green (Hybrid)	spongegourd-dark-green-hybrid	Plant type is High yielding sponge gourd seeds. The fruit is 24-26 cm long & weight is 100-150 gm. The fruit is dark green in colour.Sowing period: Whole year.Relative days of matuarity: 45-50 Days.	0	products/399235/399235.jpg	f	t	2021-01-15 10:40:57.65412+05:30	2	K000033	1	0	nan	\N	
3049	Spongegourd Dark Green (Hybrid)	spongegourd-dark-green-hybrid-p80k	Plant type is High yielding sponge gourd seeds. The fruit is 24-26 cm long & weight is 100-150 gm. The fruit is dark green in colour.Sowing period: Whole year.Relative days of matuarity: 45-50 Days.	69	products/493345/493345.jpg	f	t	2021-01-15 10:40:57.65902+05:30	2	K000033	1	0	nan	3048	50 seeds
3050	Spongegourd Dark Green (Hybrid)	spongegourd-dark-green-hybrid-9kgq	Plant type is High yielding sponge gourd seeds. The fruit is 24-26 cm long & weight is 100-150 gm. The fruit is dark green in colour.Sowing period: Whole year.Relative days of matuarity: 45-50 Days.	499	products/1057494/1057494.jpg	f	t	2021-01-15 10:40:57.665266+05:30	2	K000033	1	0	nan	3048	1000 seeds
3052	Spongegourd Light Green (Hybrid)	spongegourd-light-green-hybrid-d778	Plant is vigorous & strong. Fruit is cylindrical- shaped. light green in color, 25-30 cm long and weighing 80-100 gm. It has prolific fruit bearing ability. With a smooth, green skin and ridges, sponge gourd has a creamy-white flesh with a mild.  Mature fruits are fibrous, and brown.	69	products/440295/440295.jpg	f	t	2021-01-15 10:40:57.676269+05:30	2	K000034	1	0	nan	3051	50 seeds
3053	Spongegourd Light Green (Hybrid)	spongegourd-light-green-hybrid-okej	Plant is vigorous & strong. Fruit is cylindrical- shaped. light green in color, 25-30 cm long and weighing 80-100 gm. It has prolific fruit bearing ability. With a smooth, green skin and ridges, sponge gourd has a creamy-white flesh with a mild.  Mature fruits are fibrous, and brown.	499	products/1808331/1808331.jpg	f	t	2021-01-15 10:40:57.682835+05:30	2	K000034	1	0	nan	3051	1000 seeds
2953	Beetroot Gulab	beetroot-gulab-o66n	The Maturity is 50-55 days after sowing, root shape is round, root colour is blood red, fruit Av. Wt is 80-90 gm, FRC 30 days without cracking, crispy, sweet taste, less fibre, colour remains same, Pan India product.	29	products/1388223/1388223.jpg	t	t	2021-01-15 10:40:56.951035+05:30	2	K000001	1	0	nan	2952	50 seeds
3411	Pomogranate	pomogranate	The pomegranate is a fruit that contains hundreds of edible seeds called arils. They are rich in fiber, vitamins, minerals and bioactive plant .	0	products/1477818/1477818.jpg	f	t	2021-01-15 11:14:16.162412+05:30	5	T000037	1	0	nan	\N	
3057	Tomato Round Sour (Hybrid)	tomato-round-sour-hybrid	Plant Habit is In-Determinate, Day to first harvest is 60-65 days after Transplanting, Fruit Weight is 120-130gm, Fruit shape is Round ,  Firm fruit, deep red colour, Suitable for long distance Transportation.	0	products/461996/461996.jpg	f	t	2021-01-15 10:40:57.707166+05:30	2	K000036	1	0	nan	\N	
3058	Tomato Round Sour (Hybrid)	tomato-round-sour-hybrid-hr22	Plant Habit is In-Determinate, Day to first harvest is 60-65 days after Transplanting, Fruit Weight is 120-130gm, Fruit shape is Round ,  Firm fruit, deep red colour, Suitable for long distance Transportation.	69	products/516949/516949.jpg	f	t	2021-01-15 10:40:57.713176+05:30	2	K000036	1	0	nan	3057	50 seeds
3059	Tomato Round Sour (Hybrid)	tomato-round-sour-hybrid-s3l9	Plant Habit is In-Determinate, Day to first harvest is 60-65 days after Transplanting, Fruit Weight is 120-130gm, Fruit shape is Round ,  Firm fruit, deep red colour, Suitable for long distance Transportation.	499	products/773964/773964.jpg	f	t	2021-01-15 10:40:57.721485+05:30	2	K000036	1	0	nan	3057	1000 seeds
3060	Watermelon Black (Hybrid)	watermelon-black-hybrid	Maturity days are 75-80 days after sowing, fruit shape is Oblong, Fruit Surface is Dark Black, Fruit Flesh clour is Dark Red Crispy, Fruit Av.Wt. is 4-5kg, Attractive icebix type having hard rind Good disease tolerance  keeping quality.	0	products/429180/429180.jpg	f	t	2021-01-15 10:40:57.728131+05:30	2	K000037	1	0	nan	\N	
3061	Watermelon Black (Hybrid)	watermelon-black-hybrid-o6u5	Maturity days are 75-80 days after sowing, fruit shape is Oblong, Fruit Surface is Dark Black, Fruit Flesh clour is Dark Red Crispy, Fruit Av.Wt. is 4-5kg, Attractive icebix type having hard rind Good disease tolerance  keeping quality.	99	products/1528762/1528762.jpg	f	t	2021-01-15 10:40:57.734026+05:30	2	K000037	1	0	nan	3060	50 seeds
3065	Watermelon Green Stripes (Hybrid)	watermelon-green-stripes-hybrid-ulpr	Fruits are attractive oblong shaped. Dark green with thick rind and small seeds, Excellent keeping quality, suitable for long transportation. High tolerance to mosaic diseases, Flesh colour is deep crimson red with good texture and sweetness. Fruit weight is 3.3-3.5 kgs, Sugar content is 14% TSS.	499	products/456080/456080.jpg	f	t	2021-01-15 10:40:57.760432+05:30	2	K000038	1	0	nan	3063	1000 seeds
3066	White Bittergourd (Hybrid)	white-bittergourd-hybrid	First picking is 65-70 days fter sowing, medium thick long with long, prickly fruit shape, whit colour fruit,18-20cm in fruit length, fruit Avg. Wt is 80-100gm,  vigorous foliage vines, high yielding, potential, wider market adaptability.	0	products/1242011/1242011.jpg	f	t	2021-01-15 10:40:57.766416+05:30	2	K000039	1	0	nan	\N	
3067	White Bittergourd (Hybrid)	white-bittergourd-hybrid-h0nh	First picking is 65-70 days fter sowing, medium thick long with long, prickly fruit shape, whit colour fruit,18-20cm in fruit length, fruit Avg. Wt is 80-100gm,  vigorous foliage vines, high yielding, potential, wider market adaptability.	89	products/1552058/1552058.jpg	f	t	2021-01-15 10:40:57.772401+05:30	2	K000039	1	0	nan	3066	50 seeds
3068	White Bittergourd (Hybrid)	white-bittergourd-hybrid-b30b	First picking is 65-70 days fter sowing, medium thick long with long, prickly fruit shape, whit colour fruit,18-20cm in fruit length, fruit Avg. Wt is 80-100gm,  vigorous foliage vines, high yielding, potential, wider market adaptability.	799	products/264521/264521.jpg	f	t	2021-01-15 10:40:57.801176+05:30	2	K000039	1	0	nan	3066	1000 seeds
3069	White Cucumber (Hybrid)	white-cucumber-hybrid	Fruit picking is 38-340 days after Sowing, fruit Shape is cylindrical, fruit colour is Greenish white, 18-20cm of  fruit length, Av.fruit Wt. is 120-150gm, Early Harvest Vigorous vegetative vines High Yield market acceptance.	0	products/1088730/1088730.jpg	f	t	2021-01-15 10:40:57.833061+05:30	2	K000040	1	0	nan	\N	
3070	White Cucumber (Hybrid)	white-cucumber-hybrid-55w9	Fruit picking is 38-340 days after Sowing, fruit Shape is cylindrical, fruit colour is Greenish white, 18-20cm of  fruit length, Av.fruit Wt. is 120-150gm, Early Harvest Vigorous vegetative vines High Yield market acceptance.	69	products/1685522/1685522.jpg	f	t	2021-01-15 10:40:57.839747+05:30	2	K000040	1	0	nan	3069	50 seeds
3071	White Cucumber (Hybrid)	white-cucumber-hybrid-mr5j	Fruit picking is 38-340 days after Sowing, fruit Shape is cylindrical, fruit colour is Greenish white, 18-20cm of  fruit length, Av.fruit Wt. is 120-150gm, Early Harvest Vigorous vegetative vines High Yield market acceptance.	499	products/1802622/1802622.jpg	f	t	2021-01-15 10:40:57.846036+05:30	2	K000040	1	0	nan	3069	1000 seeds
3072	Marigold Orange	marigold-orange	The plant type is 60-75cm, Floweing is 60-65 days after transplanting, Flower Colour is Orange, Flower Av.Wt is 12-14 gm, Double Petaled flowers good for disease tolerance long transport.	0	products/262442/262442.jpg	f	t	2021-01-15 10:40:57.852889+05:30	2	K000041	1	0	nan	\N	
3073	Marigold Orange	marigold-orange-sbl7	The plant type is 60-75cm, Floweing is 60-65 days after transplanting, Flower Colour is Orange, Flower Av.Wt is 12-14 gm, Double Petaled flowers good for disease tolerance long transport.	29	products/1837180/1837180.jpg	f	t	2021-01-15 10:40:57.858067+05:30	2	K000041	1	0	nan	3072	50 seeds
3074	Marigold Orange	marigold-orange-75el	The plant type is 60-75cm, Floweing is 60-65 days after transplanting, Flower Colour is Orange, Flower Av.Wt is 12-14 gm, Double Petaled flowers good for disease tolerance long transport.	199	products/654895/654895.jpg	f	t	2021-01-15 10:40:57.865484+05:30	2	K000041	1	0	nan	3072	1000 seeds
3575	Amaranthus Green	amaranthus-green-tvqp	Amaranth contains high complete protein amounts with vital amino acids, in contrast with other protein sources. Amaranth is gluten-free. Amaranth microgreens also contains vitamin A, C, E, folate, iron, magnesium, phosphorus, potassium, dietary fiber, calcium, amino acids, antioxidants, minerals and essential lysine.	0	products/1187263/1187263.jpg	f	t	2021-01-15 11:15:47.711094+05:30	4	M000002	1	0	nan	\N	
3231	Sandalwood	sandalwood	Sandalwood is a class of woods from trees in the genus Santalum. The woods are heavy, yellow, and fine-grained, and, unlike many other aromatic woods,	0	products/199919/199919.jpg	f	t	2021-01-15 11:14:14.936588+05:30	5	T000001	1	0	nan	\N	
3272	Prosopis Juliflora	prosopis-juliflora-wawb	Prosopis juliflora (Spanish: bayahonda blanca, Cuji [Venezuela], Aippia [Wayuunaiki] and long-thorn kiawe in Hawaii) is a shrub or small tree in the family Fabaceae, a kind of mesquite. It is native to Mexico, South America and the Caribbea	59	products/1065014/1065014.jpg	f	t	2021-01-15 11:14:15.213238+05:30	5	T000009	1	0	nan	3271	price/20 seeds
3080	Marigold Orange (Hybrid)	marigold-orange-hybrid-6ndv	The plnat Height is 75-90cm, Flowering is 55-60 days after Transplanting, Flower colour is Orange, Flower Av. Wt is 14-15gm, Double petales compact flowers, good keepin quality.	1799	products/1617658/1617658.jpg	f	t	2021-01-15 10:40:57.905874+05:30	2	K000043	1	0	nan	3078	1000 seeds
3081	Marigold Yellow (Hybrid)	marigold-yellow-hybrid	The plnat Height is 75-90cm, Flowering is 55-60 days after Transplanting, Flower colour is Yellow, Flower Av. Wt is 14-16gm, Double petales compact flowers, with long time freshness.	0	products/832654/832654.jpeg	f	t	2021-01-15 10:40:57.912184+05:30	2	K000044	1	0	nan	\N	
3082	Marigold Yellow (Hybrid)	marigold-yellow-hybrid-4j2h	The plnat Height is 75-90cm, Flowering is 55-60 days after Transplanting, Flower colour is Yellow, Flower Av. Wt is 14-16gm, Double petales compact flowers, with long time freshness.	149	products/1093361/1093361.jpeg	f	t	2021-01-15 10:40:57.917567+05:30	2	K000044	1	0	nan	3081	50 seeds
3083	Marigold Yellow (Hybrid)	marigold-yellow-hybrid-jr76	The plnat Height is 75-90cm, Flowering is 55-60 days after Transplanting, Flower colour is Yellow, Flower Av. Wt is 14-16gm, Double petales compact flowers, with long time freshness.	1799	products/1985536/1985536.jpeg	f	t	2021-01-15 10:40:57.924176+05:30	2	K000044	1	0	nan	3081	1000 seeds
3085	Muskmelon Mahi (Hybrid)	muskmelon-mahi-hybrid-9nv9	Maturity days are 75-80 days after sowing, fruit shape is round, Fruit Surface is Creamy white dense netting, Fruit Flesh clour is Orange, Fruit Av.Wt. is 1.5-2.0kg, Hard rind with good keeping quality. Good Tolerance against viruses & Fusarium.  	69	products/1239382/1239382.jpg	f	t	2021-01-15 10:40:57.934741+05:30	2	K000045	1	0	nan	3084	50 seeds
3086	Muskmelon Mahi (Hybrid)	muskmelon-mahi-hybrid-r6l5	Maturity days are 75-80 days after sowing, fruit shape is round, Fruit Surface is Creamy white dense netting, Fruit Flesh clour is Orange, Fruit Av.Wt. is 1.5-2.0kg, Hard rind with good keeping quality. Good Tolerance against viruses & Fusarium.  	699	products/1767854/1767854.jpg	f	t	2021-01-15 10:40:57.941562+05:30	2	K000045	1	0	nan	3084	1000 seeds
3087	Muskmelon Samrat (Hybrid)	muskmelon-samrat-hybrid	Maturity days are 85-90 days after sowing, fruit shape is round, Fruit Surface is Yellowish Orange with Netting, Fruit Flesh clour is Green, Fruit Av.Wt. is 1.5-2kg,   	0	products/1145463/1145463.jpg	f	t	2021-01-15 10:40:57.947434+05:30	2	K000046	1	0	nan	\N	
3088	Muskmelon Samrat (Hybrid)	muskmelon-samrat-hybrid-64pf	Maturity days are 85-90 days after sowing, fruit shape is round, Fruit Surface is Yellowish Orange with Netting, Fruit Flesh clour is Green, Fruit Av.Wt. is 1.5-2kg,   	69	products/7466/7466.jpg	f	t	2021-01-15 10:40:57.952551+05:30	2	K000046	1	0	nan	3087	50 seeds
3089	Muskmelon Samrat (Hybrid)	muskmelon-samrat-hybrid-aiwn	Maturity days are 85-90 days after sowing, fruit shape is round, Fruit Surface is Yellowish Orange with Netting, Fruit Flesh clour is Green, Fruit Av.Wt. is 1.5-2kg,   	699	products/466204/466204.jpg	f	t	2021-01-15 10:40:57.958645+05:30	2	K000046	1	0	nan	3087	1000 seeds
3090	Muskmelon Sujay (Hybrid)	muskmelon-sujay-hybrid	Maturity days are 80-85 days after sowing, fruit shape is round or flat, Fruit Surface is Yellowish Orange with Green strips, Fruit Flesh clour is Orange, Fruit Av.Wt. is 1.0-1.5kg, Vigorous vines with 2-3 Firm fruits, sweeet taste.	0	products/475917/475917.jpg	f	t	2021-01-15 10:40:57.966594+05:30	2	K000047	1	0	nan	\N	
3091	Muskmelon Sujay (Hybrid)	muskmelon-sujay-hybrid-88rx	Maturity days are 80-85 days after sowing, fruit shape is round or flat, Fruit Surface is Yellowish Orange with Green strips, Fruit Flesh clour is Orange, Fruit Av.Wt. is 1.0-1.5kg, Vigorous vines with 2-3 Firm fruits, sweeet taste.	69	products/1775582/1775582.jpg	f	t	2021-01-15 10:40:57.970713+05:30	2	K000047	1	0	nan	3090	50 seeds
3092	Muskmelon Sujay (Hybrid)	muskmelon-sujay-hybrid-fykm	Maturity days are 80-85 days after sowing, fruit shape is round or flat, Fruit Surface is Yellowish Orange with Green strips, Fruit Flesh clour is Orange, Fruit Av.Wt. is 1.0-1.5kg, Vigorous vines with 2-3 Firm fruits, sweeet taste.	699	products/1504573/1504573.jpg	f	t	2021-01-15 10:40:57.977495+05:30	2	K000047	1	0	nan	3090	1000 seeds
3093	Muskmelon Rambo (Hybrid)	muskmelon-rambo-hybrid	Maturity days are 110-120 days, Plant Height is 220-240cm, cobs are Conico Cylindrical, 22-24cm Long Bold, Orange Yellow, Dent like grains, 14-16  rows with 45-50 grains per row Single cross Hy. Tolerant to Major leaf diseases.	0	products/237787/237787.jpg	f	t	2021-01-15 10:40:57.983365+05:30	2	K000048	1	0	nan	\N	
3094	Muskmelon Rambo (Hybrid)	muskmelon-rambo-hybrid-dyt3	Maturity days are 110-120 days, Plant Height is 220-240cm, cobs are Conico Cylindrical, 22-24cm Long Bold, Orange Yellow, Dent like grains, 14-16  rows with 45-50 grains per row Single cross Hy. Tolerant to Major leaf diseases.	69	products/1361213/1361213.jpg	f	t	2021-01-15 10:40:57.98738+05:30	2	K000048	1	0	nan	3093	50 seeds
3095	Muskmelon Rambo (Hybrid)	muskmelon-rambo-hybrid-rskc	Maturity days are 110-120 days, Plant Height is 220-240cm, cobs are Conico Cylindrical, 22-24cm Long Bold, Orange Yellow, Dent like grains, 14-16  rows with 45-50 grains per row Single cross Hy. Tolerant to Major leaf diseases.	699	products/809042/809042.jpg	f	t	2021-01-15 10:40:57.997328+05:30	2	K000048	1	0	nan	3093	1000 seeds
3096	Onion Dark Red	onion-dark-red	The Maturity days are 110-120 days after transplanting, Bulb Shape is Flat Round, Bulb Colour is dark red, Bulb Av. Wt 100-120gm, Sowing season is Kharif, Medium Pungent, Attracrive dark Red, uniforn bulbs for fesh market.	0	products/46298/46298.jpg	f	t	2021-01-15 10:40:58.052811+05:30	2	K000049	1	0	nan	\N	
3097	Onion Dark Red	onion-dark-red-74bx	The Maturity days are 110-120 days after transplanting, Bulb Shape is Flat Round, Bulb Colour is dark red, Bulb Av. Wt 100-120gm, Sowing season is Kharif, Medium Pungent, Attracrive dark Red, uniforn bulbs for fesh market.	49	products/427618/427618.jpg	f	t	2021-01-15 10:40:58.058802+05:30	2	K000049	1	0	nan	3096	50 seeds
3098	Onion Dark Red	onion-dark-red-hh46	The Maturity days are 110-120 days after transplanting, Bulb Shape is Flat Round, Bulb Colour is dark red, Bulb Av. Wt 100-120gm, Sowing season is Kharif, Medium Pungent, Attracrive dark Red, uniforn bulbs for fesh market.	129	products/351499/351499.jpg	f	t	2021-01-15 10:40:58.066774+05:30	2	K000049	1	0	nan	3096	1000 seeds
3099	Onion Light Red	onion-light-red	The Maturity days are 110-120 days after transplanting, Bulb Shape is  Round, Bulb Colour is dark red, Bulb Av. Wt 100gm, Sowing season is Kharif, uniforn size bulbs for fesh market.	0	products/1669246/1669246.jpg	f	t	2021-01-15 10:40:58.073755+05:30	2	K000050	1	0	nan	\N	
3103	Radish 2 in 1 (Palak and Radish)	radish-2-in-1-palak-and-radish-of54	Maturity days are 35 days after sowing, fruit shape is cylindrical with tapering end,  Root colour is white,  Ealy, Tender & less fiber roots, Both roots  & leaves are edible.	49	products/1527639/1527639.jpg	f	t	2021-01-15 10:40:58.099963+05:30	2	K000051	1	0	nan	3102	50 seeds
3104	Radish 2 in 1 (Palak and Radish)	radish-2-in-1-palak-and-radish-r8rq	Maturity days are 35 days after sowing, fruit shape is cylindrical with tapering end,  Root colour is white,  Ealy, Tender & less fiber roots, Both roots  & leaves are edible.	129	products/1423295/1423295.jpg	f	t	2021-01-15 10:40:58.105936+05:30	2	K000051	1	0	nan	3102	1000 seeds
3107	Kholrabi/Knol-khol	kholrabiknol-khol-9h7j	Kohlrabi is another name for our not-so-popular Knol khol. It belongs to the same family as Cabbage and Cauliflower (Brassicaceae). The Whole plant is edible however, it is mostly used for its bulged swollen stem. It can be eaten raw as well as cooked.	129	products/1836952/1836952.jpg	f	t	2021-01-15 10:40:58.134914+05:30	2	K000052	1	0	nan	3105	1000 seeds
3108	Red Lettuce	red-lettuce	Red leaf lettuce (Lactuca sativa) is a leafy vegetable in the daisy family. It resembles romaine lettuce except in its tips, which have a red or purple tinge. Aside from adding a burst of color to your favorite salad or sandwich, this vegetable offers numerous benefits.	0	products/191324/191324.jpg	f	t	2021-01-15 10:40:58.142336+05:30	2	K000053	1	0	nan	\N	
3109	Red Lettuce	red-lettuce-xofu	Red leaf lettuce (Lactuca sativa) is a leafy vegetable in the daisy family. It resembles romaine lettuce except in its tips, which have a red or purple tinge. Aside from adding a burst of color to your favorite salad or sandwich, this vegetable offers numerous benefits.	49	products/947749/947749.jpg	f	t	2021-01-15 10:40:58.151054+05:30	2	K000053	1	0	nan	3108	50 seeds
3110	Red Lettuce	red-lettuce-psrh	Red leaf lettuce (Lactuca sativa) is a leafy vegetable in the daisy family. It resembles romaine lettuce except in its tips, which have a red or purple tinge. Aside from adding a burst of color to your favorite salad or sandwich, this vegetable offers numerous benefits.	179	products/63046/63046.jpg	f	t	2021-01-15 10:40:58.158267+05:30	2	K000053	1	0	nan	3108	1000 seeds
3111	Lettuce	lettuce	Lettuce, (Lactuca sativa), annual leaf vegetable of the aster family (Asteraceae). Most lettuce varieties are eaten fresh and are commonly served as the base of green salads. Lettuce is generally a rich source of vitamins K and A, though the nutritional quality varies, depending on the variety.	0	products/57279/57279.jpg	f	t	2021-01-15 10:40:58.164351+05:30	2	K000054	1	0	nan	\N	
3112	Lettuce	lettuce-864o	Lettuce, (Lactuca sativa), annual leaf vegetable of the aster family (Asteraceae). Most lettuce varieties are eaten fresh and are commonly served as the base of green salads. Lettuce is generally a rich source of vitamins K and A, though the nutritional quality varies, depending on the variety.	49	products/1449126/1449126.jpg	f	t	2021-01-15 10:40:58.171447+05:30	2	K000054	1	0	nan	3111	50 seeds
3113	Lettuce	lettuce-bggj	Lettuce, (Lactuca sativa), annual leaf vegetable of the aster family (Asteraceae). Most lettuce varieties are eaten fresh and are commonly served as the base of green salads. Lettuce is generally a rich source of vitamins K and A, though the nutritional quality varies, depending on the variety.	169	products/1571425/1571425.jpg	f	t	2021-01-15 10:40:58.179431+05:30	2	K000054	1	0	nan	3111	1000 seeds
3114	Pok-Choi	pok-choi	Its structure looks like a squat celery, with either white or very pale green short, chunky stalks and glossy, deep green leaves. The texture of both leaves and stalks is crisp, and the flavour is somewhere between mild cabbage and spinach. If very young it can be eaten raw in salads, but is best when briefly cooked.	0	products/435160/435160.jpg	f	t	2021-01-15 10:40:58.185517+05:30	2	K000055	1	0	nan	\N	
3115	Pok-Choi	pok-choi-bp0b	Its structure looks like a squat celery, with either white or very pale green short, chunky stalks and glossy, deep green leaves. The texture of both leaves and stalks is crisp, and the flavour is somewhere between mild cabbage and spinach. If very young it can be eaten raw in salads, but is best when briefly cooked.	49	products/197403/197403.jpg	f	t	2021-01-15 10:40:58.190421+05:30	2	K000055	1	0	nan	3114	50 seeds
3116	Pok-Choi	pok-choi-1esf	Its structure looks like a squat celery, with either white or very pale green short, chunky stalks and glossy, deep green leaves. The texture of both leaves and stalks is crisp, and the flavour is somewhere between mild cabbage and spinach. If very young it can be eaten raw in salads, but is best when briefly cooked.	169	products/1529429/1529429.jpg	f	t	2021-01-15 10:40:58.196337+05:30	2	K000055	1	0	nan	3114	1000 seeds
3117	Rosemary	rosemary	Rosemary is described as a woody, perennial herb that can become a bushy shrub. The leaves are evergreen and needlelike in shape, and they produce the essential oil that gives rosemary its characteristic scent. 	0	products/1782865/1782865.jpg	f	t	2021-01-15 10:40:58.202378+05:30	2	K000056	1	0	nan	\N	
3118	Rosemary	rosemary-wxmj	Rosemary is described as a woody, perennial herb that can become a bushy shrub. The leaves are evergreen and needlelike in shape, and they produce the essential oil that gives rosemary its characteristic scent. 	229	products/322552/322552.jpg	f	t	2021-01-15 10:40:58.207574+05:30	2	K000056	1	0	nan	3117	100 seeds
3119	Rosemary	rosemary-lg2h	Rosemary is described as a woody, perennial herb that can become a bushy shrub. The leaves are evergreen and needlelike in shape, and they produce the essential oil that gives rosemary its characteristic scent. 	1999	products/882787/882787.jpg	f	t	2021-01-15 10:40:58.215106+05:30	2	K000056	1	0	nan	3117	1000 seeds
3120	Mint	mint	Mint plants are mainly aromatic perennials and they possess erect, branching stems and oblong to ovate or lanceolate leaves arranged in opposing pairs on the stems. The leaves are often covered in tiny hairs and have a serrated margin.	0	products/422877/422877.jpg	f	t	2021-01-15 10:40:58.221124+05:30	2	K000057	1	0	nan	\N	
3292	Terminalia elliptica	terminalia-elliptica-nc0x	Deciduous trees, to 30 m high, bark 15-20 mm thick, surface grey-black, very rough, deeply vertically fissured, horizontally cracked, forming tessellated, thick flakes, blaze red.	59	products/1120239/1120239.jpg	f	t	2021-01-15 11:14:15.354903+05:30	5	T000013	1	0	nan	3291	price/20 seeds
3321	Butea monosperma	butea-monosperma	Butea monosperma is a species of Butea native to tropical and sub-tropical parts of the Indian Subcontinent and Southeast Asia, ranging across India, Bangladesh, Nepal, Sri Lanka	0	products/1538196/1538196.jpg	f	t	2021-01-15 11:14:15.564441+05:30	5	T000019	1	0	nan	\N	
3124	Thyme	thyme-rfn6	Thyme is a low growing (6-12 inches tall) to almost prostrate, wiry stemmed perennial. Stems are stiff and woody and leaves are small, oval and gray-green in color. Flowers can be white to lilac and are in small clusters.	49	products/321545/321545.jpg	f	t	2021-01-15 10:40:58.247476+05:30	2	K000058	1	0	nan	3123	100 seeds
3125	Thyme	thyme-96ge	Thyme is a low growing (6-12 inches tall) to almost prostrate, wiry stemmed perennial. Stems are stiff and woody and leaves are small, oval and gray-green in color. Flowers can be white to lilac and are in small clusters.	169	products/851307/851307.jpg	f	t	2021-01-15 10:40:58.253491+05:30	2	K000058	1	0	nan	3123	1000 seeds
3126	Chives	chives	Chives belong to the same family as onion, leeks and garlic. They are a hardy, drought-tolerant perennial growing to about 10-12 inches tall. They grow in clumps from underground bulbs and produce round, hollow leaves that are much finer than onion.	0	products/1551152/1551152.jpg	f	t	2021-01-15 10:40:58.260504+05:30	2	K000059	1	0	nan	\N	
3127	Chives	chives-adc2	Chives belong to the same family as onion, leeks and garlic. They are a hardy, drought-tolerant perennial growing to about 10-12 inches tall. They grow in clumps from underground bulbs and produce round, hollow leaves that are much finer than onion.	49	products/779418/779418.jpg	f	t	2021-01-15 10:40:58.266053+05:30	2	K000059	1	0	nan	3126	100 seeds
3128	Chives	chives-tyqe	Chives belong to the same family as onion, leeks and garlic. They are a hardy, drought-tolerant perennial growing to about 10-12 inches tall. They grow in clumps from underground bulbs and produce round, hollow leaves that are much finer than onion.	179	products/1446950/1446950.jpg	f	t	2021-01-15 10:40:58.271754+05:30	2	K000059	1	0	nan	3126	1000 seeds
3129	Basil	basil	Basil leaves are glossy and oval-shaped, with smooth or slightly toothed edges that typically cup slightly; the leaves are arranged oppositely along the square stems. The small flowers are borne in terminal clusters and range in colour from white to magenta.	0	products/333398/333398.jpg	f	t	2021-01-15 10:40:58.278425+05:30	2	K000060	1	0	nan	\N	
3130	Basil	basil-514x	Basil leaves are glossy and oval-shaped, with smooth or slightly toothed edges that typically cup slightly; the leaves are arranged oppositely along the square stems. The small flowers are borne in terminal clusters and range in colour from white to magenta.	49	products/1748962/1748962.jpg	f	t	2021-01-15 10:40:58.284494+05:30	2	K000060	1	0	nan	3129	100 seeds
3131	Basil	basil-5kzk	Basil leaves are glossy and oval-shaped, with smooth or slightly toothed edges that typically cup slightly; the leaves are arranged oppositely along the square stems. The small flowers are borne in terminal clusters and range in colour from white to magenta.	169	products/258382/258382.jpg	f	t	2021-01-15 10:40:58.290388+05:30	2	K000060	1	0	nan	3129	1000 seeds
3132	Celery	celery	Celery is usually eaten cooked as a vegetable or as a delicate flavouring in a variety of stocks, casseroles, and soups. In the United States raw celery is served by itself or with spreads or dips as an appetizer and in salads.	0	products/1114048/1114048.jpg	f	t	2021-01-15 10:40:58.296481+05:30	2	K000061	1	0	nan	\N	
3133	Celery	celery-baho	Celery is usually eaten cooked as a vegetable or as a delicate flavouring in a variety of stocks, casseroles, and soups. In the United States raw celery is served by itself or with spreads or dips as an appetizer and in salads.	49	products/1261144/1261144.jpg	f	t	2021-01-15 10:40:58.301497+05:30	2	K000061	1	0	nan	3132	100 seeds
3134	Celery	celery-ga7p	Celery is usually eaten cooked as a vegetable or as a delicate flavouring in a variety of stocks, casseroles, and soups. In the United States raw celery is served by itself or with spreads or dips as an appetizer and in salads.	159	products/1841716/1841716.jpg	f	t	2021-01-15 10:40:58.308253+05:30	2	K000061	1	0	nan	3132	1000 seeds
3135	Kale	kale	Kale plants produce a rosette of elongated leaves with wavy to frilled margins. The leaves are typically blue-green in colour but can also be light green, red, or purple, depending on the variety.	0	products/1843925/1843925.jpg	f	t	2021-01-15 10:40:58.315125+05:30	2	K000062	1	0	nan	\N	
3136	Kale	kale-9i5m	Kale plants produce a rosette of elongated leaves with wavy to frilled margins. The leaves are typically blue-green in colour but can also be light green, red, or purple, depending on the variety.	49	products/189008/189008.jpg	f	t	2021-01-15 10:40:58.320106+05:30	2	K000062	1	0	nan	3135	100 seeds
3137	Kale	kale-n4r4	Kale plants produce a rosette of elongated leaves with wavy to frilled margins. The leaves are typically blue-green in colour but can also be light green, red, or purple, depending on the variety.	169	products/404775/404775.jpg	f	t	2021-01-15 10:40:58.326217+05:30	2	K000062	1	0	nan	3135	1000 seeds
3138	Leek	leek	Leek is a tall, hardy robust herbaceous biennial with white, narrowly ovoid bulb and broad flat leaves. It resembles a green onion but is larger and, unlike onion and garlic, it does not form bulbs or cloves.	0	products/1753102/1753102.jpg	f	t	2021-01-15 10:40:58.333164+05:30	2	K000063	1	0	nan	\N	
3140	Leek	leek-r48r	Leek is a tall, hardy robust herbaceous biennial with white, narrowly ovoid bulb and broad flat leaves. It resembles a green onion but is larger and, unlike onion and garlic, it does not form bulbs or cloves.	199	products/758503/758503.jpg	f	t	2021-01-15 10:40:58.346048+05:30	2	K000063	1	0	nan	3138	1000 seeds
3141	Oregano	oregano	Oregano, (Origanum vulgare), also called origanum or wild marjoram, aromatic perennial herb of the mint family (Lamiaceae) known for its flavourful dried leaves and flowering tops.	0	products/894866/894866.jpg	f	t	2021-01-15 10:40:58.351742+05:30	2	K000064	1	0	nan	\N	
3142	Oregano	oregano-dmp2	Oregano, (Origanum vulgare), also called origanum or wild marjoram, aromatic perennial herb of the mint family (Lamiaceae) known for its flavourful dried leaves and flowering tops.	49	products/687808/687808.jpg	f	t	2021-01-15 10:40:58.356048+05:30	2	K000064	1	0	nan	3141	100 seeds
3143	Oregano	oregano-jql8	Oregano, (Origanum vulgare), also called origanum or wild marjoram, aromatic perennial herb of the mint family (Lamiaceae) known for its flavourful dried leaves and flowering tops.	169	products/606790/606790.jpg	f	t	2021-01-15 10:40:58.364141+05:30	2	K000064	1	0	nan	3141	1000 seeds
3168	Amaranthus Red	amaranthus-red-2h6u	The Red variety produces feathery purple, magenta or red flowers from the central stalk which is packed with edible seeds	0	products/912202/912202.jpg	f	t	2021-01-15 10:44:50.434476+05:30	3	H000002	1	0	nan	\N	
3605	Mustard	mustard	Mustard microgreens is dense with protein, fibre, folate, calcium, iron. These microgreens are capable for fighting with diabetes and other lifestyle conditions.  It also stimulates healthy hair growth. It helps to relieve congestion and clear out sinuses.	0	products/1476853/1476853.jpg	f	t	2021-01-15 11:15:47.918539+05:30	4	M000012	1	0	nan	\N	
3147	Amaranthus Green	amaranthus-green	maranthus viridis is an annual herb with an upright, light green stem that grows to about 60–80 cm in height. Numerous branches emerge from the base, and the leaves are ovate, 3–6 cm long, 2–4 cm wide, with long petioles of about 5 cm.	0	products/166233/166233.jpg	f	t	2021-01-15 10:40:58.396176+05:30	2	K000066	1	0	nan	\N	
3148	Amaranthus Green	amaranthus-green-1qgl	maranthus viridis is an annual herb with an upright, light green stem that grows to about 60–80 cm in height. Numerous branches emerge from the base, and the leaves are ovate, 3–6 cm long, 2–4 cm wide, with long petioles of about 5 cm.	69	products/1405927/1405927.jpg	f	t	2021-01-15 10:40:58.403168+05:30	2	K000066	1	0	nan	3147	500 seeds
3149	Amaranthus Green	amaranthus-green-r69z	maranthus viridis is an annual herb with an upright, light green stem that grows to about 60–80 cm in height. Numerous branches emerge from the base, and the leaves are ovate, 3–6 cm long, 2–4 cm wide, with long petioles of about 5 cm.	129	products/1430181/1430181.jpg	f	t	2021-01-15 10:40:58.409025+05:30	2	K000066	1	0	nan	3147	1000 seeds
3150	Methi/Fenugreek	methifenugreek	Fenugreek is an annual plant in the family Fabaceae, with leaves consisting of three small obovate to oblong leaflets.	0	products/904461/904461.jpg	f	t	2021-01-15 10:40:58.415806+05:30	2	K000067	1	0	nan	\N	
3151	Methi/Fenugreek	methifenugreek-wecs	Fenugreek is an annual plant in the family Fabaceae, with leaves consisting of three small obovate to oblong leaflets.	69	products/843572/843572.jpg	f	t	2021-01-15 10:40:58.420218+05:30	2	K000067	1	0	nan	3150	500 seeds
3152	Methi/Fenugreek	methifenugreek-ynhg	Fenugreek is an annual plant in the family Fabaceae, with leaves consisting of three small obovate to oblong leaflets.	129	products/1149958/1149958.jpg	f	t	2021-01-15 10:40:58.427382+05:30	2	K000067	1	0	nan	3150	1000 seeds
3153	Dill Seeds	dill-seeds	Dill (Anethum graveolens) is an herb that's found throughout European and Asian cuisines. While the leaves have a sweet, grassy flavor, dill seeds are more aromatic, with a slight citrus flavor that's similar to caraway seeds.	0	products/855579/855579.jpg	f	t	2021-01-15 10:40:58.433963+05:30	2	K000068	1	0	nan	\N	
3154	Dill Seeds	dill-seeds-edkc	Dill (Anethum graveolens) is an herb that's found throughout European and Asian cuisines. While the leaves have a sweet, grassy flavor, dill seeds are more aromatic, with a slight citrus flavor that's similar to caraway seeds.	69	products/51730/51730.jpg	f	t	2021-01-15 10:40:58.439692+05:30	2	K000068	1	0	nan	3153	500 seeds
3155	Dill Seeds	dill-seeds-viv9	Dill (Anethum graveolens) is an herb that's found throughout European and Asian cuisines. While the leaves have a sweet, grassy flavor, dill seeds are more aromatic, with a slight citrus flavor that's similar to caraway seeds.	129	products/1409555/1409555.jpg	f	t	2021-01-15 10:40:58.445951+05:30	2	K000068	1	0	nan	3153	1000 seeds
3156	Coriander	coriander	Plant habit  is Erect Spreading Plants., first cutting is 35 days after sowing, leaf colour is Shiny Green to Dark Green leaves, Broad leaves, Good Aroma, late bolting, Suitable for multi Cuttings.	0	products/1297206/1297206.jpg	f	t	2021-01-15 10:40:58.452718+05:30	2	K000069	1	0	nan	\N	
3157	Coriander	coriander-zydp	Plant habit  is Erect Spreading Plants., first cutting is 35 days after sowing, leaf colour is Shiny Green to Dark Green leaves, Broad leaves, Good Aroma, late bolting, Suitable for multi Cuttings.	69	products/1527921/1527921.jpg	f	t	2021-01-15 10:40:58.457746+05:30	2	K000069	1	0	nan	3156	500 seeds
3158	Coriander	coriander-lr1z	Plant habit  is Erect Spreading Plants., first cutting is 35 days after sowing, leaf colour is Shiny Green to Dark Green leaves, Broad leaves, Good Aroma, late bolting, Suitable for multi Cuttings.	129	products/1714335/1714335.jpg	f	t	2021-01-15 10:40:58.465853+05:30	2	K000069	1	0	nan	3156	1000 seeds
3159	Parsley Gaint	parsley-gaint	Parsley, Flat Leaf – Italian Giant is a vigorous, flat leaved parsley with brilliant green leaves and serrated edges. Excellent for cooking.	0		f	t	2021-01-15 10:40:58.471897+05:30	2	K000070	1	0	nan	\N	
3160	Parsley Gaint	parsley-gaint-zrpa	Parsley, Flat Leaf – Italian Giant is a vigorous, flat leaved parsley with brilliant green leaves and serrated edges. Excellent for cooking.	49		f	t	2021-01-15 10:40:58.476707+05:30	2	K000070	1	0	nan	3159	500 seeds
3161	Parsley Gaint	parsley-gaint-eexy	Parsley, Flat Leaf – Italian Giant is a vigorous, flat leaved parsley with brilliant green leaves and serrated edges. Excellent for cooking.	129		f	t	2021-01-15 10:40:58.48369+05:30	2	K000070	1	0	nan	3159	1000 seeds
3162	Spinach/Palak	spinachpalak	Leafy green vegetables like spinach with its delicate texture and jade green color provide more nutrients than any other food. 	0		f	t	2021-01-15 10:40:58.490892+05:30	2	K000071	1	0	nan	\N	
3163	Spinach/Palak	spinachpalak-jsmc	Leafy green vegetables like spinach with its delicate texture and jade green color provide more nutrients than any other food. 	69		f	t	2021-01-15 10:40:58.497196+05:30	2	K000071	1	0	nan	3162	500 seeds
3164	Spinach/Palak	spinachpalak-suwy	Leafy green vegetables like spinach with its delicate texture and jade green color provide more nutrients than any other food. 	129		f	t	2021-01-15 10:40:58.503154+05:30	2	K000071	1	0	nan	3162	1000 seeds
3169	Amaranthus Red	amaranthus-red-jyzh	The Red variety produces feathery purple, magenta or red flowers from the central stalk which is packed with edible seeds	69	products/1053966/1053966.jpg	f	t	2021-01-15 10:44:50.440466+05:30	3	H000002	1	0	nan	3168	500 seeds
3170	Amaranthus Red	amaranthus-red-k8cx	The Red variety produces feathery purple, magenta or red flowers from the central stalk which is packed with edible seeds	129	products/1155308/1155308.jpg	f	t	2021-01-15 10:44:50.446684+05:30	3	H000002	1	0	nan	3168	1000 seeds
3171	Coriander	coriander-05tm	Coriander is a spice produced from the round, tan-colored seeds of the coriander plant (Coriandrum sativum), which is a member of the parsley family.	0	products/589760/589760.jpg	f	t	2021-01-15 10:44:50.453666+05:30	3	H000003	1	0	nan	\N	
3172	Coriander	coriander-9ttu	Coriander is a spice produced from the round, tan-colored seeds of the coriander plant (Coriandrum sativum), which is a member of the parsley family.	69	products/533558/533558.jpg	f	t	2021-01-15 10:44:50.460309+05:30	3	H000003	1	0	nan	3171	500 seeds
3173	Coriander	coriander-70nj	Coriander is a spice produced from the round, tan-colored seeds of the coriander plant (Coriandrum sativum), which is a member of the parsley family.	129	products/1002349/1002349.jpg	f	t	2021-01-15 10:44:50.468289+05:30	3	H000003	1	0	nan	3171	1000 seeds
3175	Dill Seeds	dill-seeds-scry	Dill (Anethum graveolens) is an herb that's found throughout European and Asian cuisines. 	69	products/1675434/1675434.jpg	f	t	2021-01-15 10:44:50.481422+05:30	3	H000004	1	0	nan	3174	500 seeds
3176	Dill Seeds	dill-seeds-xp69	Dill (Anethum graveolens) is an herb that's found throughout European and Asian cuisines. 	129	products/171955/171955.jpg	f	t	2021-01-15 10:44:50.490113+05:30	3	H000004	1	0	nan	3174	1000 seeds
3177	Methi/Fenugreek	methifenugreek-8p51	Fenugreek is an annual plant in the family Fabaceae, with leaves consisting of three small obovate to oblong leaflets.	0	products/1867736/1867736.jpg	f	t	2021-01-15 10:44:50.497363+05:30	3	H000005	1	0	nan	\N	
3178	Methi/Fenugreek	methifenugreek-ofsh	Fenugreek is an annual plant in the family Fabaceae, with leaves consisting of three small obovate to oblong leaflets.	69	products/382834/382834.jpg	f	t	2021-01-15 10:44:50.502306+05:30	3	H000005	1	0	nan	3177	500 seeds
3179	Methi/Fenugreek	methifenugreek-8fdr	Fenugreek is an annual plant in the family Fabaceae, with leaves consisting of three small obovate to oblong leaflets.	129	products/591610/591610.jpg	f	t	2021-01-15 10:44:50.511254+05:30	3	H000005	1	0	nan	3177	1000 seeds
3180	Spinach/Palak	spinachpalak-vqwe	Leafy green vegetables like spinach with its delicate texture and jade green color provide more nutrients than any other food. 	0	products/1718063/1718063.jpg	f	t	2021-01-15 10:44:50.517233+05:30	3	H000006	1	0	nan	\N	
3181	Spinach/Palak	spinachpalak-u55e	Leafy green vegetables like spinach with its delicate texture and jade green color provide more nutrients than any other food. 	69	products/1204292/1204292.jpg	f	t	2021-01-15 10:44:50.52287+05:30	3	H000006	1	0	nan	3180	500 seeds
3182	Spinach/Palak	spinachpalak-uy8k	Leafy green vegetables like spinach with its delicate texture and jade green color provide more nutrients than any other food. 	129	products/1555807/1555807.jpg	f	t	2021-01-15 10:44:50.53011+05:30	3	H000006	1	0	nan	3180	1000 seeds
3183	Parsley Gaint	parsley-gaint-77p7	Giant of Italy plants are big, bushy plants that produce huge, dark green leaves with a rich, strong flavor.	0	products/242219/242219.jpg	f	t	2021-01-15 10:44:50.536451+05:30	3	H000007	1	0	nan	\N	
3184	Parsley Gaint	parsley-gaint-4vbh	Giant of Italy plants are big, bushy plants that produce huge, dark green leaves with a rich, strong flavor.	49	products/1122232/1122232.jpg	f	t	2021-01-15 10:44:50.543116+05:30	3	H000007	1	0	nan	3183	500 seeds
3185	Parsley Gaint	parsley-gaint-gj71	Giant of Italy plants are big, bushy plants that produce huge, dark green leaves with a rich, strong flavor.	129	products/1758068/1758068.jpg	f	t	2021-01-15 10:44:50.549138+05:30	3	H000007	1	0	nan	3183	1000 seeds
3186	Mint	mint-tyww	Mint plants are mainly aromatic perennials and they possess erect, branching stems and oblong to ovate or lanceolate leaves arranged in opposing pairs on the stems.	0	products/983269/983269.jpg	f	t	2021-01-15 10:44:50.556196+05:30	3	H000008	1	0	nan	\N	
3188	Mint	mint-x7el	Mint plants are mainly aromatic perennials and they possess erect, branching stems and oblong to ovate or lanceolate leaves arranged in opposing pairs on the stems.	1159	products/1865525/1865525.jpg	f	t	2021-01-15 10:44:50.571478+05:30	3	H000008	1	0	nan	3186	1000 seeds
3191	Rosemary	rosemary-qvln	Rosemary is described as a woody, perennial herb that can become a bushy shrub. The leaves are evergreen and needlelike in shape, and they produce the essential oil that gives rosemary its characteristic scent.	1999	products/369211/369211.jpg	f	t	2021-01-15 10:44:50.593228+05:30	3	H000009	1	0	nan	3189	1000 seeds
3192	Celery	celery-nxj9	Celery has a long fibrous stalk tapering into leaves. Depending on location and cultivar, either its stalks, leaves or hypocotyl are eaten and used in cooking.	0	products/903962/903962.jpg	f	t	2021-01-15 10:44:50.600209+05:30	3	H000010	1	0	nan	\N	
3193	Celery	celery-tora	Celery has a long fibrous stalk tapering into leaves. Depending on location and cultivar, either its stalks, leaves or hypocotyl are eaten and used in cooking.	49	products/126573/126573.jpg	f	t	2021-01-15 10:44:50.607215+05:30	3	H000010	1	0	nan	3192	100 seeds
3194	Celery	celery-xl26	Celery has a long fibrous stalk tapering into leaves. Depending on location and cultivar, either its stalks, leaves or hypocotyl are eaten and used in cooking.	159	products/35761/35761.jpg	f	t	2021-01-15 10:44:50.614201+05:30	3	H000010	1	0	nan	3192	1000 seeds
3195	Chives	chives-vn4t	Chives are an herb that's related to onions and garlic with long green stems and a mild, not-too-pungent flavor.	0	products/593048/593048.jpg	f	t	2021-01-15 10:44:50.62215+05:30	3	H000011	1	0	nan	\N	
3196	Chives	chives-owbp	Chives are an herb that's related to onions and garlic with long green stems and a mild, not-too-pungent flavor.	49	products/439858/439858.jpg	f	t	2021-01-15 10:44:50.628134+05:30	3	H000011	1	0	nan	3195	100 seeds
3197	Chives	chives-rdvq	Chives are an herb that's related to onions and garlic with long green stems and a mild, not-too-pungent flavor.	179	products/1691736/1691736.jpg	f	t	2021-01-15 10:44:50.635115+05:30	3	H000011	1	0	nan	3195	1000 seeds
3198	Kale	kale-icmr	Kale is a popular vegetable and a member of the cabbage family. It is a cruciferous vegetable like cabbage, broccoli, cauliflower, collard greens and Brussels sprouts.	0	products/1571232/1571232.jpg	f	t	2021-01-15 10:44:50.647083+05:30	3	H000012	1	0	nan	\N	
3200	Kale	kale-fwci	Kale is a popular vegetable and a member of the cabbage family. It is a cruciferous vegetable like cabbage, broccoli, cauliflower, collard greens and Brussels sprouts.	169	products/1202701/1202701.jpg	f	t	2021-01-15 10:44:50.660049+05:30	3	H000012	1	0	nan	3198	1000 seeds
3201	Leek	leek-megj	The leek is a vegetable, a cultivar of Allium ampeloprasum, the broadleaf wild leek. The edible part of the plant is a bundle of leaf sheaths that is sometimes .	0	products/1140551/1140551.jpeg	f	t	2021-01-15 10:44:50.668035+05:30	3	H000013	1	0	nan	\N	
3202	Leek	leek-mbcv	The leek is a vegetable, a cultivar of Allium ampeloprasum, the broadleaf wild leek. The edible part of the plant is a bundle of leaf sheaths that is sometimes .	49	products/1652163/1652163.jpeg	f	t	2021-01-15 10:44:50.68199+05:30	3	H000013	1	0	nan	3201	100 seeds
3203	Leek	leek-v345	The leek is a vegetable, a cultivar of Allium ampeloprasum, the broadleaf wild leek. The edible part of the plant is a bundle of leaf sheaths that is sometimes .	199	products/937745/937745.jpeg	f	t	2021-01-15 10:44:50.690969+05:30	3	H000013	1	0	nan	3201	1000 seeds
3204	Thyme	thyme-tvge	Thyme is a Mediterranean herb with dietary, medicinal, and ornamental uses. The flowers, leaves,	0	products/677854/677854.jpg	f	t	2021-01-15 10:44:50.698764+05:30	3	H000014	1	0	nan	\N	
3075	Marigold Yellow	marigold-yellow	The plant type is 60-75cm, Floweing is 60-65 days after transplanting, Flower Colour is Yeloow, Flower Av.Wt is 12-14 gm,  Double Petaled compact flowers with good keeping quality.	0	products/408920/408920.jpg	f	t	2021-01-15 10:40:57.872756+05:30	2	K000042	1	0	nan	\N	
2994	Cabbage (Hybrid)	cabbage-hybrid	he plant type is Erect type Green Small leaves, Days of Maturity 55-60 days after transplanting, Head shape is Round, Very Compact, Head Weight is 1- 1.5 kg, FH Capacity is 25-30days after Marurity, Very Compact with Small Erect Foliage suitable for close spacing.	0	products/1273880/1273880.jpg	f	t	2021-01-15 10:40:57.231246+05:30	2	K000015	1	0	nan	\N	
3205	Thyme	thyme-9cmg	Thyme is a Mediterranean herb with dietary, medicinal, and ornamental uses. The flowers, leaves,	49	products/1192438/1192438.jpg	f	t	2021-01-15 10:44:50.705745+05:30	3	H000014	1	0	nan	3204	100 seeds
3206	Thyme	thyme-q3oi	Thyme is a Mediterranean herb with dietary, medicinal, and ornamental uses. The flowers, leaves,	169	products/1978338/1978338.jpg	f	t	2021-01-15 10:44:50.71293+05:30	3	H000014	1	0	nan	3204	1000 seeds
3207	Oregano	oregano-4jvl	Oregano is a herb from the mint, or Lamiaceae family. People have used it for thousands of years to add flavor to dishes and to treat health conditions.	0	products/597906/597906.jpg	f	t	2021-01-15 10:44:50.719878+05:30	3	H000015	1	0	nan	\N	
3208	Oregano	oregano-68sm	Oregano is a herb from the mint, or Lamiaceae family. People have used it for thousands of years to add flavor to dishes and to treat health conditions.	49	products/226969/226969.jpg	f	t	2021-01-15 10:44:50.726888+05:30	3	H000015	1	0	nan	3207	100 seeds
3209	Oregano	oregano-us0e	Oregano is a herb from the mint, or Lamiaceae family. People have used it for thousands of years to add flavor to dishes and to treat health conditions.	169	products/1824273/1824273.jpg	f	t	2021-01-15 10:44:50.733841+05:30	3	H000015	1	0	nan	3207	1000 seeds
3210	BASIL	basil-5q9b	Basil, also called great basil, is a culinary herb of the family Lamiaceae (mints).	0	products/511402/511402.jpg	f	t	2021-01-15 10:44:50.742828+05:30	3	H000016	1	0	nan	\N	
3211	BASIL	basil-nc5b	Basil, also called great basil, is a culinary herb of the family Lamiaceae (mints).	49	products/789112/789112.jpg	f	t	2021-01-15 10:44:50.748801+05:30	3	H000016	1	0	nan	3210	100 seeds
3212	BASIL	basil-5hes	Basil, also called great basil, is a culinary herb of the family Lamiaceae (mints).	169	products/170954/170954.jpg	f	t	2021-01-15 10:44:50.756779+05:30	3	H000016	1	0	nan	3210	1000 seeds
3579	Garden Cress	garden-cress-r5mx	Garden Cress is a good source of nutrients, vitamins and minerals. Consuming 50 gram of garden cress 271 µg of Vitamin K, 34.5 mg of Vitamin C, 173 µg of Vitamin A,0.276 mg of Manganese,0.13 mg of Vitamin B2, 40 µg of Vitamin B9, 0.124 mg of Vitamin B6, 0.085 mg of Copper, 0.65 mg of Iron,303 mg of Potassium and 38 mg of Phosphorus.	69	products/1977398/1977398.jpg	f	t	2021-01-15 11:15:47.737039+05:30	4	M000003	1	0	nan	3578	500 seeds
3214	Chinese Cabbage	chinese-cabbage-kjdz	Chinese cabbage (Brassica rapa, subspecies pekinensis and chinensis) can refer to two cultivar groups of Chinese leaf vegetables often used in Chinese cuisine.	49	products/256530/256530.jpg	f	t	2021-01-15 10:44:50.770743+05:30	3	H000017	1	0	nan	3213	50 seeds
3215	Chinese Cabbage	chinese-cabbage-the2	Chinese cabbage (Brassica rapa, subspecies pekinensis and chinensis) can refer to two cultivar groups of Chinese leaf vegetables often used in Chinese cuisine.	169	products/577364/577364.jpg	f	t	2021-01-15 10:44:50.77872+05:30	3	H000017	1	0	nan	3213	1000 seeds
3216	Pok Choi	pok-choi-7j4h	Bok choy or Chinese white cabbage (brassica rapa spp. chinensis) is a staple ingredient in Asian dishes.	0	products/1841244/1841244.jpg	f	t	2021-01-15 10:44:50.785731+05:30	3	H000018	1	0	nan	\N	
3217	Pok Choi	pok-choi-44qg	Bok choy or Chinese white cabbage (brassica rapa spp. chinensis) is a staple ingredient in Asian dishes.	49	products/1914210/1914210.jpg	f	t	2021-01-15 10:44:50.792712+05:30	3	H000018	1	0	nan	3216	50 seeds
3218	Pok Choi	pok-choi-ln3i	Bok choy or Chinese white cabbage (brassica rapa spp. chinensis) is a staple ingredient in Asian dishes.	169	products/1344239/1344239.jpg	f	t	2021-01-15 10:44:50.799675+05:30	3	H000018	1	0	nan	3216	1000 seeds
3219	Lettuce	lettuce-y99q	Lettuce (Lactuca sativa) is an annual plant of the daisy family, Asteraceae. It is most often grown as a leaf vegetable, but sometimes for its stem and seeds.	0	products/1877184/1877184.jpg	f	t	2021-01-15 10:44:50.806646+05:30	3	H000019	1	0	nan	\N	
3220	Lettuce	lettuce-ypy1	Lettuce (Lactuca sativa) is an annual plant of the daisy family, Asteraceae. It is most often grown as a leaf vegetable, but sometimes for its stem and seeds.	49	products/141366/141366.jpg	f	t	2021-01-15 10:44:50.811633+05:30	3	H000019	1	0	nan	3219	50 seeds
3222	Red Lettuce	red-lettuce-awpu	Red leaf lettuce (Lactuca sativa) is a leafy vegetable in the daisy family. It resembles romaine lettuce except in its tips, which have a red or purple tinge.	0	products/826062/826062.jpg	f	t	2021-01-15 10:44:50.827591+05:30	3	H000020	1	0	nan	\N	
3223	Red Lettuce	red-lettuce-pqst	Red leaf lettuce (Lactuca sativa) is a leafy vegetable in the daisy family. It resembles romaine lettuce except in its tips, which have a red or purple tinge.	49	products/1055244/1055244.jpg	f	t	2021-01-15 10:44:50.833574+05:30	3	H000020	1	0	nan	3222	50 seeds
3224	Red Lettuce	red-lettuce-mr6v	Red leaf lettuce (Lactuca sativa) is a leafy vegetable in the daisy family. It resembles romaine lettuce except in its tips, which have a red or purple tinge.	179	products/1497094/1497094.jpg	f	t	2021-01-15 10:44:50.840556+05:30	3	H000020	1	0	nan	3222	1000 seeds
3225	Cabbage	cabbage-mrfm	Cabbage Is Packed With Nutrients · Calories: 22 · Protein: 1 gram · Fiber: 2 grams · Vitamin K: 85% of the RDI ·	0	products/903952/903952.jpg	f	t	2021-01-15 10:44:50.847537+05:30	3	H000021	1	0	nan	\N	
3226	Cabbage	cabbage-zb4z	Cabbage Is Packed With Nutrients · Calories: 22 · Protein: 1 gram · Fiber: 2 grams · Vitamin K: 85% of the RDI ·	49	products/794053/794053.jpg	f	t	2021-01-15 10:44:50.85355+05:30	3	H000021	1	0	nan	3225	50 seeds
3227	Cabbage	cabbage-z446	Cabbage Is Packed With Nutrients · Calories: 22 · Protein: 1 gram · Fiber: 2 grams · Vitamin K: 85% of the RDI ·	159	products/1048159/1048159.jpg	f	t	2021-01-15 10:44:50.860502+05:30	3	H000021	1	0	nan	3225	1000 seeds
3228	Cabbage (Hybrid)	cabbage-hybrid-c0ba	Cabbage is a good source of beta-carotene, vitamin C and fiber.	0	products/1405119/1405119.jpg	f	t	2021-01-15 10:44:50.867483+05:30	3	H000022	1	0	nan	\N	
3229	Cabbage (Hybrid)	cabbage-hybrid-ct8o	Cabbage is a good source of beta-carotene, vitamin C and fiber.	69	products/1939788/1939788.jpg	f	t	2021-01-15 10:44:50.873468+05:30	3	H000022	1	0	nan	3228	50 seeds
3230	Cabbage (Hybrid)	cabbage-hybrid-n6of	Cabbage is a good source of beta-carotene, vitamin C and fiber.	399	products/641794/641794.jpg	f	t	2021-01-15 10:44:50.881447+05:30	3	H000022	1	0	nan	3228	1000 seeds
3440	Bhendi/Okra	bhendiokra-lhlt	The plant type is medium, first picking is 45-48 Dys, dark green in color, 10-12 cm in length with 5 ridges and excellent keeping quality in remarks	625	products/134044/134044.jpg	f	t	2021-01-15 11:15:24.803765+05:30	1	C000006	1	0	F1-D-1011	3438	250 gms
3442	Bhendi/Okra	bhendiokra-1jvq	Plant type is medium, first picking is 42-48 days, fruit color is dark green, fruit length is 10-12 cm in length, 5 ridges,tall plant, 3-4 branches, prolific Beraing and short internodes resistant to YVMV.                                       	350	products/1729448/1729448.jpg	f	t	2021-01-15 11:15:24.817728+05:30	1	C000007	1	0	F1-D-1012	3441	100 gms
3444	Bhendi/Okra	bhendiokra-gj66	Plant type is medium, first picking is 42-48 days, fruit color is dark green, fruit length is 10-12 cm in length, 5 ridges,tall plant, 3-4 branches, prolific Beraing and short internodes, resistant to YVMV.                                     	0	products/296088/296088.jpg	f	t	2021-01-15 11:15:24.83169+05:30	1	C000008	1	0	Improved Bhendi/Okra Avanthi	\N	
3445	Bhendi/Okra	bhendiokra-qjky	Plant type is medium, first picking is 42-48 days, fruit color is dark green, fruit length is 10-12 cm in length, 5 ridges,tall plant, 3-4 branches, prolific Beraing and short internodes, resistant to YVMV.                                     	170	products/1874846/1874846.jpg	f	t	2021-01-15 11:15:24.837674+05:30	1	C000008	1	0	Improved Bhendi/Okra Avanthi	3444	100 gms
3446	Bhendi/Okra	bhendiokra-zxm3	Plant type is medium, first picking is 42-48 days, fruit color is dark green, fruit length is 10-12 cm in length, 5 ridges,tall plant, 3-4 branches, prolific Beraing and short internodes, resistant to YVMV.                                     	355	products/1730780/1730780.jpg	f	t	2021-01-15 11:15:24.843658+05:30	1	C000008	1	0	Improved Bhendi/Okra Avanthi	3444	250 gms
3447	Bitter Gourd	bitter-gourd	First picking is 50-55 days fter sowing, medium long, prickly fruit shape, green colour fruit, 22-25 cm in fruit length, fruit Avg. Wt is 120-150 gm, Suitable for long duaration harvest. Good disease tolerance.	0	products/664571/664571.jpg	f	t	2021-01-15 11:15:24.85064+05:30	1	C000009	1	0	F1-Akira	\N	
3034	Pumpkin Boss (Hybrid)	pumpkin-boss-hybrid-g98g	Maturity days are 85-90 days from sowing, fruit shape is Flatish round, Fruit surface is Green with white stripes tuens yellowish orange on maturity, Fruit Av. Wt is 4-5 kg. Attractive Early medium size hybrid with export quality	69	products/328385/328385.jpg	t	t	2021-01-15 10:40:57.56372+05:30	2	K000028	1	0	nan	3033	50 seeds
3448	Bitter Gourd	bitter-gourd-y6u4	First picking is 50-55 days fter sowing, medium long, prickly fruit shape, green colour fruit, 22-25 cm in fruit length, fruit Avg. Wt is 120-150 gm, Suitable for long duaration harvest. Good disease tolerance.	535	products/1590764/1590764.jpg	f	t	2021-01-15 11:15:24.85762+05:30	1	C000009	1	0	F1-Akira	3447	50 gms
3449	Bitter Gourd	bitter-gourd-mkdi	First picking is 65-70 days fter sowing, medium thick long with long, prickly fruit shape, whit colour fruit,18-20cm in fruit length, fruit Avg. Wt is 80-100gm,  vigorous foliage vines, high yielding, potential, wider market adaptability.	0	products/1165401/1165401.jpg	f	t	2021-01-15 11:15:24.863636+05:30	1	C000010	1	0	F1-Zakir	\N	
3450	Bitter Gourd	bitter-gourd-d41m	First picking is 65-70 days fter sowing, medium thick long with long, prickly fruit shape, whit colour fruit,18-20cm in fruit length, fruit Avg. Wt is 80-100gm,  vigorous foliage vines, high yielding, potential, wider market adaptability.	550	products/253419/253419.jpg	f	t	2021-01-15 11:15:24.870603+05:30	1	C000010	1	0	F1-Zakir	3449	50 gms
3054	Tomato Oval (Hybrid)	tomato-oval-hybrid	Plant Habit is Semi Determinate, Day to first harvest is 60-65 days after Transplanting, Fruit Weight is 100-120gm, Fruit shape is Oval,  Attractive Red High yielding hybrid with heat tolerance, tolerant to Fusarium, bacterial with 6 TYLCV.	0	products/1059189/1059189.jpg	f	t	2021-01-15 10:40:57.689791+05:30	2	K000035	1	0	nan	\N	
3451	Bottle Gourd	bottle-gourd	First picking is 65-70 days fter sowing, medium thick long with long, prickly fruit shape, whit colour fruit,18-20cm in fruit length, fruit Avg. Wt is 80-100gm,  vigorous foliage vines, high yielding, potential, wider market adaptability.	0	products/1134183/1134183.jpg	f	t	2021-01-15 11:15:24.877598+05:30	1	C000011	1	0	F1-Varsha	\N	
3452	Bottle Gourd	bottle-gourd-if8a	First picking is 65-70 days fter sowing, medium thick long with long, prickly fruit shape, whit colour fruit,18-20cm in fruit length, fruit Avg. Wt is 80-100gm,  vigorous foliage vines, high yielding, potential, wider market adaptability.	235	products/1209803/1209803.jpg	f	t	2021-01-15 11:15:24.883551+05:30	1	C000011	1	0	F1-Varsha	3451	50 gms
3077	Marigold Yellow	marigold-yellow-k1i2	The plant type is 60-75cm, Floweing is 60-65 days after transplanting, Flower Colour is Yeloow, Flower Av.Wt is 12-14 gm,  Double Petaled compact flowers with good keeping quality.	199	products/1597664/1597664.jpg	f	t	2021-01-15 10:40:57.884464+05:30	2	K000042	1	0	nan	3075	1000 seeds
3439	Bhendi/Okra	bhendiokra-9otv	The plant type is medium, first picking is 45-48 Dys, dark green in color, 10-12 cm in length with 5 ridges and excellent keeping quality in remarks	295	products/1133831/1133831.jpg	f	t	2021-01-15 11:15:24.796809+05:30	1	C000006	1	0	F1-D-1011	3438	100 gms
3079	Marigold Orange (Hybrid)	marigold-orange-hybrid-r1uu	The plnat Height is 75-90cm, Flowering is 55-60 days after Transplanting, Flower colour is Orange, Flower Av. Wt is 14-15gm, Double petales compact flowers, good keepin quality.	149	products/546612/546612.jpg	f	t	2021-01-15 10:40:57.899426+05:30	2	K000043	1	0	nan	3078	50 seeds
3121	Mint	mint-2zvj	Mint plants are mainly aromatic perennials and they possess erect, branching stems and oblong to ovate or lanceolate leaves arranged in opposing pairs on the stems. The leaves are often covered in tiny hairs and have a serrated margin.	149	products/88926/88926.jpg	f	t	2021-01-15 10:40:58.226374+05:30	2	K000057	1	0	nan	3120	100 seeds
3144	Amaranthus Red	amaranthus-red	It has a rosette of leaves at the base of the plant; a deep taproot; a smooth, hollow stem; leaves that may be nearly smooth-margined, toothed, or deeply cut; and a solitary yellow flower head composed only of ray flowers (no disk flowers).	0	products/1608056/1608056.jpg	f	t	2021-01-15 10:40:58.374003+05:30	2	K000065	1	0	nan	\N	
3580	Garden Cress	garden-cress-ef08	Garden Cress is a good source of nutrients, vitamins and minerals. Consuming 50 gram of garden cress 271 µg of Vitamin K, 34.5 mg of Vitamin C, 173 µg of Vitamin A,0.276 mg of Manganese,0.13 mg of Vitamin B2, 40 µg of Vitamin B9, 0.124 mg of Vitamin B6, 0.085 mg of Copper, 0.65 mg of Iron,303 mg of Potassium and 38 mg of Phosphorus.	129	products/1681877/1681877.jpg	f	t	2021-01-15 11:15:47.744897+05:30	4	M000003	1	0	nan	3578	1000 seeds
3233	Sandalwood	sandalwood-i2sc	Sandalwood is a class of woods from trees in the genus Santalum. The woods are heavy, yellow, and fine-grained, and, unlike many other aromatic woods,	199	products/1469901/1469901.jpg	f	t	2021-01-15 11:14:14.951021+05:30	5	T000001	1	0	nan	3231	100 seeds
3234	Sandalwood	sandalwood-w09l	Sandalwood is a class of woods from trees in the genus Santalum. The woods are heavy, yellow, and fine-grained, and, unlike many other aromatic woods,	399	products/3342/3342.jpg	f	t	2021-01-15 11:14:14.957455+05:30	5	T000001	1	0	nan	3231	500 seeds
3235	Sandalwood	sandalwood-14oh	Sandalwood is a class of woods from trees in the genus Santalum. The woods are heavy, yellow, and fine-grained, and, unlike many other aromatic woods,	599	products/115522/115522.jpg	f	t	2021-01-15 11:14:14.964313+05:30	5	T000001	1	0	nan	3231	1000 seeds
3236	Red Sandalwood	red-sandalwood	Red Sandalwood, is a native and endemic to India and can only be found in the southern parts of the Eastern Ghats.	0	products/1743282/1743282.jpeg	f	t	2021-01-15 11:14:14.970987+05:30	5	T000002	1	0	nan	\N	
3238	Red Sandalwood	red-sandalwood-sr4f	Red Sandalwood, is a native and endemic to India and can only be found in the southern parts of the Eastern Ghats.	249	products/383674/383674.jpeg	f	t	2021-01-15 11:14:14.982631+05:30	5	T000002	1	0	nan	3236	100 seeds
3239	Red Sandalwood	red-sandalwood-6xsq	Red Sandalwood, is a native and endemic to India and can only be found in the southern parts of the Eastern Ghats.	599	products/1379660/1379660.jpeg	f	t	2021-01-15 11:14:14.989846+05:30	5	T000002	1	0	nan	3236	500 seeds
3240	Red Sandalwood	red-sandalwood-slfb	Red Sandalwood, is a native and endemic to India and can only be found in the southern parts of the Eastern Ghats.	899	products/763289/763289.jpeg	f	t	2021-01-15 11:14:14.998116+05:30	5	T000002	1	0	nan	3236	1000 seeds
3241	Mahagony	mahagony	Mahagony/Swietenia Macrophylla/Sky Fruit Seeds (1 Kg Seeds): Amazon.in: Garden & Outdoors.	0	products/735785/735785.jpg	f	t	2021-01-15 11:14:15.004929+05:30	5	T000003	1	0	nan	\N	
3242	Mahagony	mahagony-fryt	Mahagony/Swietenia Macrophylla/Sky Fruit Seeds (1 Kg Seeds): Amazon.in: Garden & Outdoors.	59	products/957315/957315.jpg	f	t	2021-01-15 11:14:15.010528+05:30	5	T000003	1	0	nan	3241	price/20 seeds
3243	Mahagony	mahagony-mv0z	Mahagony/Swietenia Macrophylla/Sky Fruit Seeds (1 Kg Seeds): Amazon.in: Garden & Outdoors.	149	products/880948/880948.jpg	f	t	2021-01-15 11:14:15.016806+05:30	5	T000003	1	0	nan	3241	100 seeds
3244	Mahagony	mahagony-orst	Mahagony/Swietenia Macrophylla/Sky Fruit Seeds (1 Kg Seeds): Amazon.in: Garden & Outdoors.	329	products/1256530/1256530.jpg	f	t	2021-01-15 11:14:15.023798+05:30	5	T000003	1	0	nan	3241	500 seeds
3245	Mahagony	mahagony-6502	Mahagony/Swietenia Macrophylla/Sky Fruit Seeds (1 Kg Seeds): Amazon.in: Garden & Outdoors.	499	products/72275/72275.jpg	f	t	2021-01-15 11:14:15.030478+05:30	5	T000003	1	0	nan	3241	1000 seeds
3246	Teak	teak	Teak (Tectona grandis) is a tropical hardwood tree species in the family Lamiaceae. It is a large, deciduous tree that occurs in mixed hardwood forests	0	products/498227/498227.jpg	f	t	2021-01-15 11:14:15.036464+05:30	5	T000004	1	0	nan	\N	
3248	Teak	teak-l8iw	Teak (Tectona grandis) is a tropical hardwood tree species in the family Lamiaceae. It is a large, deciduous tree that occurs in mixed hardwood forests	149	products/1935061/1935061.jpg	f	t	2021-01-15 11:14:15.049685+05:30	5	T000004	1	0	nan	3246	100 seeds
3249	Teak	teak-75wx	Teak (Tectona grandis) is a tropical hardwood tree species in the family Lamiaceae. It is a large, deciduous tree that occurs in mixed hardwood forests	329	products/1154383/1154383.jpg	f	t	2021-01-15 11:14:15.058042+05:30	5	T000004	1	0	nan	3246	500 seeds
3250	Teak	teak-qgwu	Teak (Tectona grandis) is a tropical hardwood tree species in the family Lamiaceae. It is a large, deciduous tree that occurs in mixed hardwood forests	499	products/1203533/1203533.jpg	f	t	2021-01-15 11:14:15.066272+05:30	5	T000004	1	0	nan	3246	1000 seeds
3251	Silver Oak	silver-oak	The Silver Oak group of Institutes is known for its “Out of Box” initiatives and emphasis on “Education to Innovation”.	0	products/1200145/1200145.jpg	f	t	2021-01-15 11:14:15.073591+05:30	5	T000005	1	0	nan	\N	
3252	Silver Oak	silver-oak-gkwd	The Silver Oak group of Institutes is known for its “Out of Box” initiatives and emphasis on “Education to Innovation”.	59	products/996285/996285.jpg	f	t	2021-01-15 11:14:15.078885+05:30	5	T000005	1	0	nan	3251	price/20 seeds
3253	Silver Oak	silver-oak-2xqy	The Silver Oak group of Institutes is known for its “Out of Box” initiatives and emphasis on “Education to Innovation”.	149	products/676023/676023.jpg	f	t	2021-01-15 11:14:15.086011+05:30	5	T000005	1	0	nan	3251	100 seeds
3254	Silver Oak	silver-oak-t1vj	The Silver Oak group of Institutes is known for its “Out of Box” initiatives and emphasis on “Education to Innovation”.	329	products/1735934/1735934.jpg	f	t	2021-01-15 11:14:15.091995+05:30	5	T000005	1	0	nan	3251	500 seeds
3255	Silver Oak	silver-oak-r2tz	The Silver Oak group of Institutes is known for its “Out of Box” initiatives and emphasis on “Education to Innovation”.	499	products/750140/750140.jpg	f	t	2021-01-15 11:14:15.09842+05:30	5	T000005	1	0	nan	3251	1000 seeds
3256	Rosewood	rosewood	Rosewood Dalbergia latifolia. Also known as: Indonesian rosewood, Bombay blackwood, Malabar rosewood,	0	products/1253455/1253455.jpg	f	t	2021-01-15 11:14:15.105577+05:30	5	T000006	1	0	nan	\N	
3258	Rosewood	rosewood-hnjc	Rosewood Dalbergia latifolia. Also known as: Indonesian rosewood, Bombay blackwood, Malabar rosewood,	149	products/1201480/1201480.jpg	f	t	2021-01-15 11:14:15.117499+05:30	5	T000006	1	0	nan	3256	100 seeds
3259	Rosewood	rosewood-owqj	Rosewood Dalbergia latifolia. Also known as: Indonesian rosewood, Bombay blackwood, Malabar rosewood,	329	products/393304/393304.jpg	f	t	2021-01-15 11:14:15.124283+05:30	5	T000006	1	0	nan	3256	500 seeds
3260	Rosewood	rosewood-ek31	Rosewood Dalbergia latifolia. Also known as: Indonesian rosewood, Bombay blackwood, Malabar rosewood,	499	products/1435480/1435480.jpg	f	t	2021-01-15 11:14:15.132314+05:30	5	T000006	1	0	nan	3256	1000 seeds
3261	Pongame	pongame	Póngame" in Spanish-English from Reverso Context: Don Ferdinando, póngame leche de almendra	0	products/1596052/1596052.jpg	f	t	2021-01-15 11:14:15.139467+05:30	5	T000007	1	0	nan	\N	
3262	Pongame	pongame-zfoi	Póngame" in Spanish-English from Reverso Context: Don Ferdinando, póngame leche de almendra	59	products/1329842/1329842.jpg	f	t	2021-01-15 11:14:15.146051+05:30	5	T000007	1	0	nan	3261	price/20 seeds
3263	Pongame	pongame-6bx5	Póngame" in Spanish-English from Reverso Context: Don Ferdinando, póngame leche de almendra	149	products/452413/452413.jpg	f	t	2021-01-15 11:14:15.153471+05:30	5	T000007	1	0	nan	3261	100 seeds
3232	Sandalwood	sandalwood-to12	Sandalwood is a class of woods from trees in the genus Santalum. The woods are heavy, yellow, and fine-grained, and, unlike many other aromatic woods,	69	products/1062108/1062108.jpg	f	t	2021-01-15 11:14:14.944569+05:30	5	T000001	1	0	nan	3231	price/20 seeds
3266	Gmelina arborea	gmelina-arborea	Gmelina, goomar teak, Kashmir tree, Malay beechwood, white teak, yamane ), locally known as gamhar, is a fast-growing deciduous tree in the family Lamiaceae.	0	products/1019168/1019168.jpg	f	t	2021-01-15 11:14:15.173165+05:30	5	T000008	1	0	nan	\N	
3267	Gmelina arborea	gmelina-arborea-rujh	Gmelina, goomar teak, Kashmir tree, Malay beechwood, white teak, yamane ), locally known as gamhar, is a fast-growing deciduous tree in the family Lamiaceae.	59	products/629721/629721.jpg	f	t	2021-01-15 11:14:15.178522+05:30	5	T000008	1	0	nan	3266	price/20 seeds
3268	Gmelina arborea	gmelina-arborea-536f	Gmelina, goomar teak, Kashmir tree, Malay beechwood, white teak, yamane ), locally known as gamhar, is a fast-growing deciduous tree in the family Lamiaceae.	149	products/496667/496667.jpg	f	t	2021-01-15 11:14:15.186963+05:30	5	T000008	1	0	nan	3266	100 seeds
3269	Gmelina arborea	gmelina-arborea-b534	Gmelina, goomar teak, Kashmir tree, Malay beechwood, white teak, yamane ), locally known as gamhar, is a fast-growing deciduous tree in the family Lamiaceae.	329	products/416586/416586.jpg	f	t	2021-01-15 11:14:15.195157+05:30	5	T000008	1	0	nan	3266	500 seeds
3270	Gmelina arborea	gmelina-arborea-jepz	Gmelina, goomar teak, Kashmir tree, Malay beechwood, white teak, yamane ), locally known as gamhar, is a fast-growing deciduous tree in the family Lamiaceae.	499	products/1800293/1800293.jpg	f	t	2021-01-15 11:14:15.201953+05:30	5	T000008	1	0	nan	3266	1000 seeds
3271	Prosopis Juliflora	prosopis-juliflora	Prosopis juliflora (Spanish: bayahonda blanca, Cuji [Venezuela], Aippia [Wayuunaiki] and long-thorn kiawe in Hawaii) is a shrub or small tree in the family Fabaceae, a kind of mesquite. It is native to Mexico, South America and the Caribbea	0	products/1162166/1162166.jpg	f	t	2021-01-15 11:14:15.207938+05:30	5	T000009	1	0	nan	\N	
3273	Prosopis Juliflora	prosopis-juliflora-dky5	Prosopis juliflora (Spanish: bayahonda blanca, Cuji [Venezuela], Aippia [Wayuunaiki] and long-thorn kiawe in Hawaii) is a shrub or small tree in the family Fabaceae, a kind of mesquite. It is native to Mexico, South America and the Caribbea	149	products/1445779/1445779.jpg	f	t	2021-01-15 11:14:15.220299+05:30	5	T000009	1	0	nan	3271	100 seeds
3274	Prosopis Juliflora	prosopis-juliflora-5c1f	Prosopis juliflora (Spanish: bayahonda blanca, Cuji [Venezuela], Aippia [Wayuunaiki] and long-thorn kiawe in Hawaii) is a shrub or small tree in the family Fabaceae, a kind of mesquite. It is native to Mexico, South America and the Caribbea	329	products/445082/445082.jpg	f	t	2021-01-15 11:14:15.227522+05:30	5	T000009	1	0	nan	3271	500 seeds
3275	Prosopis Juliflora	prosopis-juliflora-aezz	Prosopis juliflora (Spanish: bayahonda blanca, Cuji [Venezuela], Aippia [Wayuunaiki] and long-thorn kiawe in Hawaii) is a shrub or small tree in the family Fabaceae, a kind of mesquite. It is native to Mexico, South America and the Caribbea	499	products/397246/397246.jpg	f	t	2021-01-15 11:14:15.233921+05:30	5	T000009	1	0	nan	3271	1000 seeds
3276	Camara	camara	Camara Education is an award-winning international not-for-profit whose mission is to use technology to improve education in low income communities.	0	products/795430/795430.jpg	f	t	2021-01-15 11:14:15.240902+05:30	5	T000010	1	0	nan	\N	
3277	Camara	camara-6j26	Camara Education is an award-winning international not-for-profit whose mission is to use technology to improve education in low income communities.	59	products/1164129/1164129.jpg	f	t	2021-01-15 11:14:15.246102+05:30	5	T000010	1	0	nan	3276	price/20 seeds
3278	Camara	camara-6ynw	Camara Education is an award-winning international not-for-profit whose mission is to use technology to improve education in low income communities.	149	products/897369/897369.jpg	f	t	2021-01-15 11:14:15.25517+05:30	5	T000010	1	0	nan	3276	100 seeds
3279	Camara	camara-85tt	Camara Education is an award-winning international not-for-profit whose mission is to use technology to improve education in low income communities.	329	products/1476352/1476352.jpg	f	t	2021-01-15 11:14:15.26215+05:30	5	T000010	1	0	nan	3276	500 seeds
3280	Camara	camara-4n76	Camara Education is an award-winning international not-for-profit whose mission is to use technology to improve education in low income communities.	499	products/1379245/1379245.jpg	f	t	2021-01-15 11:14:15.269132+05:30	5	T000010	1	0	nan	3276	1000 seeds
3282	Pterocarpus marsupium	pterocarpus-marsupium-nifw	Pterocarpus marsupium, also known as Malabar kino, Indian kino tree, or vijayasar, is a medium to large, deciduous tree that can grow up to 30 m (98 ft) tal	59	products/202675/202675.jpg	f	t	2021-01-15 11:14:15.282098+05:30	5	T000011	1	0	nan	3281	price/20 seeds
3283	Pterocarpus marsupium	pterocarpus-marsupium-85hb	Pterocarpus marsupium, also known as Malabar kino, Indian kino tree, or vijayasar, is a medium to large, deciduous tree that can grow up to 30 m (98 ft) tal	149	products/1696703/1696703.jpg	f	t	2021-01-15 11:14:15.290101+05:30	5	T000011	1	0	nan	3281	100 seeds
3284	Pterocarpus marsupium	pterocarpus-marsupium-h3ex	Pterocarpus marsupium, also known as Malabar kino, Indian kino tree, or vijayasar, is a medium to large, deciduous tree that can grow up to 30 m (98 ft) tal	329	products/423528/423528.jpg	f	t	2021-01-15 11:14:15.298055+05:30	5	T000011	1	0	nan	3281	500 seeds
3285	Pterocarpus marsupium	pterocarpus-marsupium-paka	Pterocarpus marsupium, also known as Malabar kino, Indian kino tree, or vijayasar, is a medium to large, deciduous tree that can grow up to 30 m (98 ft) tal	499	products/85968/85968.jpg	f	t	2021-01-15 11:14:15.305035+05:30	5	T000011	1	0	nan	3281	1000 seeds
3286	Almond 	almond	Almonds are the edible seeds of Prunus dulcis, more commonly called the almond tree.	0	products/1488005/1488005.jpg	f	t	2021-01-15 11:14:15.312018+05:30	5	T000012	1	0	nan	\N	
3287	Almond 	almond-2qhu	Almonds are the edible seeds of Prunus dulcis, more commonly called the almond tree.	59	products/1853377/1853377.jpg	f	t	2021-01-15 11:14:15.317004+05:30	5	T000012	1	0	nan	3286	price/20 seeds
3288	Almond 	almond-r5l8	Almonds are the edible seeds of Prunus dulcis, more commonly called the almond tree.	149	products/779478/779478.jpg	f	t	2021-01-15 11:14:15.324984+05:30	5	T000012	1	0	nan	3286	100 seeds
3289	Almond 	almond-a70q	Almonds are the edible seeds of Prunus dulcis, more commonly called the almond tree.	329	products/1238181/1238181.jpg	f	t	2021-01-15 11:14:15.332973+05:30	5	T000012	1	0	nan	3286	500 seeds
3290	Almond 	almond-iqx1	Almonds are the edible seeds of Prunus dulcis, more commonly called the almond tree.	499	products/487742/487742.jpg	f	t	2021-01-15 11:14:15.34094+05:30	5	T000012	1	0	nan	3286	1000 seeds
3265	Pongame	pongame-lni0	Póngame" in Spanish-English from Reverso Context: Don Ferdinando, póngame leche de almendra	499	products/1719680/1719680.jpg	f	t	2021-01-15 11:14:15.167276+05:30	5	T000007	1	0	nan	3261	1000 seeds
3294	Terminalia elliptica	terminalia-elliptica-c3d1	Deciduous trees, to 30 m high, bark 15-20 mm thick, surface grey-black, very rough, deeply vertically fissured, horizontally cracked, forming tessellated, thick flakes, blaze red.	329	products/300560/300560.jpg	f	t	2021-01-15 11:14:15.37086+05:30	5	T000013	1	0	nan	3291	500 seeds
3295	Terminalia elliptica	terminalia-elliptica-tkmd	Deciduous trees, to 30 m high, bark 15-20 mm thick, surface grey-black, very rough, deeply vertically fissured, horizontally cracked, forming tessellated, thick flakes, blaze red.	499	products/1478372/1478372.jpg	f	t	2021-01-15 11:14:15.378838+05:30	5	T000013	1	0	nan	3291	1000 seeds
3296	Melia Dubia	melia-dubia	Melia is a good agroforestry species and supports a variety of crops throughout its cultivation period. Ground nut, chilli, turmeric, blackgram, ...	0	products/143457/143457.jpeg	f	t	2021-01-15 11:14:15.38582+05:30	5	T000014	1	0	nan	\N	
3297	Melia Dubia	melia-dubia-y00r	Melia is a good agroforestry species and supports a variety of crops throughout its cultivation period. Ground nut, chilli, turmeric, blackgram, ...	59	products/650212/650212.jpeg	f	t	2021-01-15 11:14:15.390806+05:30	5	T000014	1	0	nan	3296	price/20 seeds
3298	Melia Dubia	melia-dubia-6h4r	Melia is a good agroforestry species and supports a variety of crops throughout its cultivation period. Ground nut, chilli, turmeric, blackgram, ...	149	products/214078/214078.jpeg	f	t	2021-01-15 11:14:15.40078+05:30	5	T000014	1	0	nan	3296	100 seeds
3299	Melia Dubia	melia-dubia-mzsp	Melia is a good agroforestry species and supports a variety of crops throughout its cultivation period. Ground nut, chilli, turmeric, blackgram, ...	329	products/1544556/1544556.jpeg	f	t	2021-01-15 11:14:15.407761+05:30	5	T000014	1	0	nan	3296	500 seeds
3300	Melia Dubia	melia-dubia-tj9l	Melia is a good agroforestry species and supports a variety of crops throughout its cultivation period. Ground nut, chilli, turmeric, blackgram, ...	499	products/1380757/1380757.jpeg	f	t	2021-01-15 11:14:15.41574+05:30	5	T000014	1	0	nan	3296	1000 seeds
3301	Neem	neem	Neem is a natural herb that comes from the neem tree, other names for which include Azadirachta indica and Indian lilac	0	products/515868/515868.jpg	f	t	2021-01-15 11:14:15.422721+05:30	5	T000015	1	0	nan	\N	
3302	Neem	neem-mepj	Neem is a natural herb that comes from the neem tree, other names for which include Azadirachta indica and Indian lilac	59	products/33027/33027.jpg	f	t	2021-01-15 11:14:15.428707+05:30	5	T000015	1	0	nan	3301	price/20 seeds
3303	Neem	neem-dd7a	Neem is a natural herb that comes from the neem tree, other names for which include Azadirachta indica and Indian lilac	149	products/1060797/1060797.jpg	f	t	2021-01-15 11:14:15.435777+05:30	5	T000015	1	0	nan	3301	100 seeds
3305	Neem	neem-tqt7	Neem is a natural herb that comes from the neem tree, other names for which include Azadirachta indica and Indian lilac	499	products/781371/781371.jpg	f	t	2021-01-15 11:14:15.451707+05:30	5	T000015	1	0	nan	3301	1000 seeds
3306	Subabul	subabul	Subabul Reloaded: How One Tree Could Be the Answer to India's Fodder, Fuel Needs. Interestingly, in India, Subabul wood is already being 	0	products/827982/827982.jpg	f	t	2021-01-15 11:14:15.457691+05:30	5	T000016	1	0	nan	\N	
3307	Subabul	subabul-5hv8	Subabul Reloaded: How One Tree Could Be the Answer to India's Fodder, Fuel Needs. Interestingly, in India, Subabul wood is already being 	59	products/1970867/1970867.jpg	f	t	2021-01-15 11:14:15.463674+05:30	5	T000016	1	0	nan	3306	price/20 seeds
3308	Subabul	subabul-ep7v	Subabul Reloaded: How One Tree Could Be the Answer to India's Fodder, Fuel Needs. Interestingly, in India, Subabul wood is already being 	149	products/411405/411405.jpg	f	t	2021-01-15 11:14:15.471653+05:30	5	T000016	1	0	nan	3306	100 seeds
3309	Subabul	subabul-pvpk	Subabul Reloaded: How One Tree Could Be the Answer to India's Fodder, Fuel Needs. Interestingly, in India, Subabul wood is already being 	329	products/998664/998664.jpg	f	t	2021-01-15 11:14:15.479271+05:30	5	T000016	1	0	nan	3306	500 seeds
3310	Subabul	subabul-4i23	Subabul Reloaded: How One Tree Could Be the Answer to India's Fodder, Fuel Needs. Interestingly, in India, Subabul wood is already being 	499	products/923770/923770.jpg	f	t	2021-01-15 11:14:15.486635+05:30	5	T000016	1	0	nan	3306	1000 seeds
3311	Terminalia bellirica	terminalia-bellirica	Traditional Indian Ayurvedic medicine, Beleric is known as "Bibhitaki" (Marathi: "Behada or Bhenda") (Terminalia bellirica)	0	products/944972/944972.jpg	f	t	2021-01-15 11:14:15.49262+05:30	5	T000017	1	0	nan	\N	
3313	Terminalia bellirica	terminalia-bellirica-e9gv	Traditional Indian Ayurvedic medicine, Beleric is known as "Bibhitaki" (Marathi: "Behada or Bhenda") (Terminalia bellirica)	149	products/1471652/1471652.jpg	f	t	2021-01-15 11:14:15.506581+05:30	5	T000017	1	0	nan	3311	100 seeds
3314	Terminalia bellirica	terminalia-bellirica-8hhb	Traditional Indian Ayurvedic medicine, Beleric is known as "Bibhitaki" (Marathi: "Behada or Bhenda") (Terminalia bellirica)	329	products/1414376/1414376.jpg	f	t	2021-01-15 11:14:15.513563+05:30	5	T000017	1	0	nan	3311	500 seeds
3315	Terminalia bellirica	terminalia-bellirica-8i1h	Traditional Indian Ayurvedic medicine, Beleric is known as "Bibhitaki" (Marathi: "Behada or Bhenda") (Terminalia bellirica)	499	products/1491178/1491178.jpg	f	t	2021-01-15 11:14:15.520544+05:30	5	T000017	1	0	nan	3311	1000 seeds
3316	Indian Elm (Tapasi)	indian-elm-tapasi	Indian Elm is a large deciduous tree, gowing up to 18 m tall. It has grey bark, covered with blisters, peeling in corky scales on old trees.	0	products/282641/282641.jpg	f	t	2021-01-15 11:14:15.52952+05:30	5	T000018	1	0	nan	\N	
3317	Indian Elm (Tapasi)	indian-elm-tapasi-ye7b	Indian Elm is a large deciduous tree, gowing up to 18 m tall. It has grey bark, covered with blisters, peeling in corky scales on old trees.	59	products/442081/442081.jpg	f	t	2021-01-15 11:14:15.535504+05:30	5	T000018	1	0	nan	3316	price/20 seeds
3318	Indian Elm (Tapasi)	indian-elm-tapasi-79y3	Indian Elm is a large deciduous tree, gowing up to 18 m tall. It has grey bark, covered with blisters, peeling in corky scales on old trees.	149	products/1556846/1556846.jpg	f	t	2021-01-15 11:14:15.5425+05:30	5	T000018	1	0	nan	3316	100 seeds
3319	Indian Elm (Tapasi)	indian-elm-tapasi-pi6w	Indian Elm is a large deciduous tree, gowing up to 18 m tall. It has grey bark, covered with blisters, peeling in corky scales on old trees.	329	products/1331423/1331423.jpg	f	t	2021-01-15 11:14:15.550464+05:30	5	T000018	1	0	nan	3316	500 seeds
3293	Terminalia elliptica	terminalia-elliptica-ur9v	Deciduous trees, to 30 m high, bark 15-20 mm thick, surface grey-black, very rough, deeply vertically fissured, horizontally cracked, forming tessellated, thick flakes, blaze red.	149	products/958722/958722.jpg	f	t	2021-01-15 11:14:15.362887+05:30	5	T000013	1	0	nan	3291	100 seeds
3324	Butea monosperma	butea-monosperma-mtya	Butea monosperma is a species of Butea native to tropical and sub-tropical parts of the Indian Subcontinent and Southeast Asia, ranging across India, Bangladesh, Nepal, Sri Lanka	329	products/255554/255554.jpg	f	t	2021-01-15 11:14:15.584661+05:30	5	T000019	1	0	nan	3321	500 seeds
3325	Butea monosperma	butea-monosperma-lq9p	Butea monosperma is a species of Butea native to tropical and sub-tropical parts of the Indian Subcontinent and Southeast Asia, ranging across India, Bangladesh, Nepal, Sri Lanka	499	products/627867/627867.jpg	f	t	2021-01-15 11:14:15.591644+05:30	5	T000019	1	0	nan	3321	1000 seeds
3326	Grass Seeds	grass-seeds	Grasses are often considered valuable for their aesthetic qualities, but there is much more to these plants than meets the eye. All grasses are in the Poaceae family,	0	products/301193/301193.jpg	f	t	2021-01-15 11:14:15.599622+05:30	5	T000020	1	0	nan	\N	
3327	Grass Seeds	grass-seeds-uxhn	Grasses are often considered valuable for their aesthetic qualities, but there is much more to these plants than meets the eye. All grasses are in the Poaceae family,	59	products/471834/471834.jpg	f	t	2021-01-15 11:14:15.604615+05:30	5	T000020	1	0	nan	3326	price/20 seeds
3322	Butea monosperma	butea-monosperma-u9eb	Butea monosperma is a species of Butea native to tropical and sub-tropical parts of the Indian Subcontinent and Southeast Asia, ranging across India, Bangladesh, Nepal, Sri Lanka	59	products/277859/277859.jpg	f	t	2021-01-15 11:14:15.570411+05:30	5	T000019	1	0	nan	3321	price/20 seeds
3329	Grass Seeds	grass-seeds-0zv4	Grasses are often considered valuable for their aesthetic qualities, but there is much more to these plants than meets the eye. All grasses are in the Poaceae family,	329	products/1900776/1900776.jpg	f	t	2021-01-15 11:14:15.618571+05:30	5	T000020	1	0	nan	3326	500 seeds
3330	Grass Seeds	grass-seeds-xx4l	Grasses are often considered valuable for their aesthetic qualities, but there is much more to these plants than meets the eye. All grasses are in the Poaceae family,	499	products/559384/559384.jpg	f	t	2021-01-15 11:14:15.625552+05:30	5	T000020	1	0	nan	3326	1000 seeds
3331	Lucerne	lucerne	Tree lucerne (Chamaecytisus palmensis L.), commonly known as tagasaste, is a leguminous fodder tree which is suited to the cool highland areas 	0	products/1415344/1415344.jpg	f	t	2021-01-15 11:14:15.633531+05:30	5	T000021	1	0	nan	\N	
3332	Lucerne	lucerne-cwlk	Tree lucerne (Chamaecytisus palmensis L.), commonly known as tagasaste, is a leguminous fodder tree which is suited to the cool highland areas 	59	products/1056710/1056710.jpg	f	t	2021-01-15 11:14:15.638506+05:30	5	T000021	1	0	nan	3331	price/20 seeds
3333	Lucerne	lucerne-ojkk	Tree lucerne (Chamaecytisus palmensis L.), commonly known as tagasaste, is a leguminous fodder tree which is suited to the cool highland areas 	149	products/1290546/1290546.jpg	f	t	2021-01-15 11:14:15.645156+05:30	5	T000021	1	0	nan	3331	100 seeds
3334	Lucerne	lucerne-rizv	Tree lucerne (Chamaecytisus palmensis L.), commonly known as tagasaste, is a leguminous fodder tree which is suited to the cool highland areas 	329	products/330811/330811.jpg	f	t	2021-01-15 11:14:15.654954+05:30	5	T000021	1	0	nan	3331	500 seeds
3335	Lucerne	lucerne-7twx	Tree lucerne (Chamaecytisus palmensis L.), commonly known as tagasaste, is a leguminous fodder tree which is suited to the cool highland areas 	499	products/605852/605852.jpg	f	t	2021-01-15 11:14:15.663172+05:30	5	T000021	1	0	nan	3331	1000 seeds
3336	Bamboo	bamboo	Bamboos are evergreen perennial flowering plants in the subfamily Bambusoideae of the grass family Poaceae	0	products/739670/739670.jpg	f	t	2021-01-15 11:14:15.669077+05:30	5	T000022	1	0	nan	\N	
3337	Bamboo	bamboo-dol5	Bamboos are evergreen perennial flowering plants in the subfamily Bambusoideae of the grass family Poaceae	59	products/722609/722609.jpg	f	t	2021-01-15 11:14:15.673982+05:30	5	T000022	1	0	nan	3336	price/20 seeds
3338	Bamboo	bamboo-kbs4	Bamboos are evergreen perennial flowering plants in the subfamily Bambusoideae of the grass family Poaceae	149	products/1178641/1178641.jpg	f	t	2021-01-15 11:14:15.681316+05:30	5	T000022	1	0	nan	3336	100 seeds
3339	Bamboo	bamboo-cdlv	Bamboos are evergreen perennial flowering plants in the subfamily Bambusoideae of the grass family Poaceae	329	products/169978/169978.jpg	f	t	2021-01-15 11:14:15.687606+05:30	5	T000022	1	0	nan	3336	500 seeds
3340	Bamboo	bamboo-i5ok	Bamboos are evergreen perennial flowering plants in the subfamily Bambusoideae of the grass family Poaceae	499	products/820514/820514.jpg	f	t	2021-01-15 11:14:15.693824+05:30	5	T000022	1	0	nan	3336	1000 seeds
3342	Areca Palm	areca-palm-piz7	Areca palm is one of the few palms that can tolerate trimming without serious harm, making it possible to keep mature plants indoors for their full lifespan of up to 10 years.	59	products/1303430/1303430.jpg	f	t	2021-01-15 11:14:15.70635+05:30	5	T000023	1	0	nan	3341	price/20 seeds
3343	Areca Palm	areca-palm-5xin	Areca palm is one of the few palms that can tolerate trimming without serious harm, making it possible to keep mature plants indoors for their full lifespan of up to 10 years.	149	products/1821459/1821459.jpg	f	t	2021-01-15 11:14:15.71331+05:30	5	T000023	1	0	nan	3341	100 seeds
3344	Areca Palm	areca-palm-w2co	Areca palm is one of the few palms that can tolerate trimming without serious harm, making it possible to keep mature plants indoors for their full lifespan of up to 10 years.	329	products/1071401/1071401.jpg	f	t	2021-01-15 11:14:15.720321+05:30	5	T000023	1	0	nan	3341	500 seeds
3345	Areca Palm	areca-palm-h3cs	Areca palm is one of the few palms that can tolerate trimming without serious harm, making it possible to keep mature plants indoors for their full lifespan of up to 10 years.	499	products/480143/480143.jpg	f	t	2021-01-15 11:14:15.726754+05:30	5	T000023	1	0	nan	3341	1000 seeds
3346	Soapnut	soapnut	The genus includes both deciduous and evergreen species. Members of the genus are commonly known as soapberries or soapnuts.	0	products/840235/840235.jpg	f	t	2021-01-15 11:14:15.734174+05:30	5	T000024	1	0	nan	\N	
3347	Soapnut	soapnut-x531	The genus includes both deciduous and evergreen species. Members of the genus are commonly known as soapberries or soapnuts.	59	products/1406577/1406577.jpg	f	t	2021-01-15 11:14:15.73949+05:30	5	T000024	1	0	nan	3346	price/20 seeds
3348	Soapnut	soapnut-67cj	The genus includes both deciduous and evergreen species. Members of the genus are commonly known as soapberries or soapnuts.	149	products/1486237/1486237.jpg	f	t	2021-01-15 11:14:15.745498+05:30	5	T000024	1	0	nan	3346	100 seeds
3349	Soapnut	soapnut-rxa9	The genus includes both deciduous and evergreen species. Members of the genus are commonly known as soapberries or soapnuts.	329	products/1670260/1670260.jpg	f	t	2021-01-15 11:14:15.752805+05:30	5	T000024	1	0	nan	3346	500 seeds
3353	Lagerstroemia	lagerstroemia-ocgz	Lagerstroemia, commonly known as crape myrtle (also spelled crepe myrtle or crêpe myrtle) is a genus of around 50 species of deciduous and evergreen trees and shrubs native to the Indian subcontinent.	149	products/1846792/1846792.jpg	f	t	2021-01-15 11:14:15.77981+05:30	5	T000025	1	0	nan	3351	100 seeds
3354	Lagerstroemia	lagerstroemia-o1y4	Lagerstroemia, commonly known as crape myrtle (also spelled crepe myrtle or crêpe myrtle) is a genus of around 50 species of deciduous and evergreen trees and shrubs native to the Indian subcontinent.	329	products/33396/33396.jpg	f	t	2021-01-15 11:14:15.785829+05:30	5	T000025	1	0	nan	3351	500 seeds
3355	Lagerstroemia	lagerstroemia-ljbg	Lagerstroemia, commonly known as crape myrtle (also spelled crepe myrtle or crêpe myrtle) is a genus of around 50 species of deciduous and evergreen trees and shrubs native to the Indian subcontinent.	499	products/674611/674611.jpg	f	t	2021-01-15 11:14:15.792307+05:30	5	T000025	1	0	nan	3351	1000 seeds
3356	Amla	amla	It helps fight the common cold The vitamin C in amla is absorbed more easily by the body.	0	products/371261/371261.jpg	f	t	2021-01-15 11:14:15.799358+05:30	5	T000026	1	0	nan	\N	
3357	Amla	amla-dcnx	It helps fight the common cold The vitamin C in amla is absorbed more easily by the body.	59	products/1027636/1027636.jpg	f	t	2021-01-15 11:14:15.805175+05:30	5	T000026	1	0	nan	3356	price/20 seeds
3358	Amla	amla-zmpr	It helps fight the common cold The vitamin C in amla is absorbed more easily by the body.	149	products/784257/784257.jpg	f	t	2021-01-15 11:14:15.813052+05:30	5	T000026	1	0	nan	3356	100 seeds
3359	Amla	amla-c32f	It helps fight the common cold The vitamin C in amla is absorbed more easily by the body.	329	products/1384038/1384038.jpg	f	t	2021-01-15 11:14:15.819035+05:30	5	T000026	1	0	nan	3356	500 seeds
3360	Amla	amla-yoje	It helps fight the common cold The vitamin C in amla is absorbed more easily by the body.	499	products/1857061/1857061.jpg	f	t	2021-01-15 11:14:15.825039+05:30	5	T000026	1	0	nan	3356	1000 seeds
3361	Eucalyptus Citriodora	eucalyptus-citriodora	Corymbia citriodora, commonly known as lemon-scented gum or spotted gum, is a species of tall tree that is endemic to north-eastern Australia.	0	products/104941/104941.jpg	f	t	2021-01-15 11:14:15.833183+05:30	5	T000027	1	0	nan	\N	
3362	Eucalyptus Citriodora	eucalyptus-citriodora-2jaq	Corymbia citriodora, commonly known as lemon-scented gum or spotted gum, is a species of tall tree that is endemic to north-eastern Australia.	59	products/1307479/1307479.jpg	f	t	2021-01-15 11:14:15.838952+05:30	5	T000027	1	0	nan	3361	price/20 seeds
3364	Eucalyptus Citriodora	eucalyptus-citriodora-pi61	Corymbia citriodora, commonly known as lemon-scented gum or spotted gum, is a species of tall tree that is endemic to north-eastern Australia.	329	products/1594022/1594022.jpg	f	t	2021-01-15 11:14:15.851459+05:30	5	T000027	1	0	nan	3361	500 seeds
3365	Eucalyptus Citriodora	eucalyptus-citriodora-mr38	Corymbia citriodora, commonly known as lemon-scented gum or spotted gum, is a species of tall tree that is endemic to north-eastern Australia.	499	products/207004/207004.jpg	f	t	2021-01-15 11:14:15.857958+05:30	5	T000027	1	0	nan	3361	1000 seeds
3366	Acacia Magium	acacia-magium	Acacia mangium is a species of flowering tree in the pea family, Fabaceae, that is native to northeastern Queensland in Australia	0	products/705618/705618.jpg	f	t	2021-01-15 11:14:15.865068+05:30	5	T000028	1	0	nan	\N	
3367	Acacia Magium	acacia-magium-ywvg	Acacia mangium is a species of flowering tree in the pea family, Fabaceae, that is native to northeastern Queensland in Australia	59	products/1180002/1180002.jpg	f	t	2021-01-15 11:14:15.869718+05:30	5	T000028	1	0	nan	3366	price/20 seeds
3368	Acacia Magium	acacia-magium-0iwx	Acacia mangium is a species of flowering tree in the pea family, Fabaceae, that is native to northeastern Queensland in Australia	149	products/210233/210233.jpg	f	t	2021-01-15 11:14:15.876079+05:30	5	T000028	1	0	nan	3366	100 seeds
3369	Acacia Magium	acacia-magium-gjr4	Acacia mangium is a species of flowering tree in the pea family, Fabaceae, that is native to northeastern Queensland in Australia	329	products/1238858/1238858.jpg	f	t	2021-01-15 11:14:15.883714+05:30	5	T000028	1	0	nan	3366	500 seeds
3370	Acacia Magium	acacia-magium-vktc	Acacia mangium is a species of flowering tree in the pea family, Fabaceae, that is native to northeastern Queensland in Australia	499	products/572631/572631.jpg	f	t	2021-01-15 11:14:15.889872+05:30	5	T000028	1	0	nan	3366	1000 seeds
3371	Gulmohar	gulmohar	Delonix regia is a species of flowering plant in the bean family Fabaceae, subfamily Caesalpinioideae native to Madagascar.	0	products/1513893/1513893.jpg	f	t	2021-01-15 11:14:15.895696+05:30	5	T000029	1	0	nan	\N	
3372	Gulmohar	gulmohar-y91f	Delonix regia is a species of flowering plant in the bean family Fabaceae, subfamily Caesalpinioideae native to Madagascar.	59	products/1147473/1147473.jpg	f	t	2021-01-15 11:14:15.902678+05:30	5	T000029	1	0	nan	3371	price/20 seeds
3373	Gulmohar	gulmohar-atyh	Delonix regia is a species of flowering plant in the bean family Fabaceae, subfamily Caesalpinioideae native to Madagascar.	149	products/1638240/1638240.jpg	f	t	2021-01-15 11:14:15.909386+05:30	5	T000029	1	0	nan	3371	100 seeds
3374	Gulmohar	gulmohar-ajf4	Delonix regia is a species of flowering plant in the bean family Fabaceae, subfamily Caesalpinioideae native to Madagascar.	329	products/1603245/1603245.jpg	f	t	2021-01-15 11:14:15.91682+05:30	5	T000029	1	0	nan	3371	500 seeds
3376	Trumpet Tree	trumpet-tree	Trumpet tree or trumpet bush may refer to: Several species of Cecropia, including: Cecropia obtusifolia · Cecropia peltata · Dolichandrone spathacea, mangrove .	0	products/741153/741153.jpg	f	t	2021-01-15 11:14:15.93036+05:30	5	T000030	1	0	nan	\N	
3377	Trumpet Tree	trumpet-tree-xk9i	Trumpet tree or trumpet bush may refer to: Several species of Cecropia, including: Cecropia obtusifolia · Cecropia peltata · Dolichandrone spathacea, mangrove .	59	products/1882618/1882618.jpg	f	t	2021-01-15 11:14:15.935307+05:30	5	T000030	1	0	nan	3376	price/20 seeds
3378	Trumpet Tree	trumpet-tree-f78w	Trumpet tree or trumpet bush may refer to: Several species of Cecropia, including: Cecropia obtusifolia · Cecropia peltata · Dolichandrone spathacea, mangrove .	149	products/1692284/1692284.jpg	f	t	2021-01-15 11:14:15.941408+05:30	5	T000030	1	0	nan	3376	100 seeds
3379	Trumpet Tree	trumpet-tree-dd46	Trumpet tree or trumpet bush may refer to: Several species of Cecropia, including: Cecropia obtusifolia · Cecropia peltata · Dolichandrone spathacea, mangrove .	329	products/941904/941904.jpg	f	t	2021-01-15 11:14:15.948607+05:30	5	T000030	1	0	nan	3376	500 seeds
3351	Lagerstroemia	lagerstroemia	Lagerstroemia, commonly known as crape myrtle (also spelled crepe myrtle or crêpe myrtle) is a genus of around 50 species of deciduous and evergreen trees and shrubs native to the Indian subcontinent.	0	products/1576491/1576491.jpg	f	t	2021-01-15 11:14:15.759234+05:30	5	T000025	1	0	nan	\N	
3382	Tecoma	tecoma-q5v9	Tecoma is a genus of 14 species of shrubs or small trees in the trumpet vine family, Bignoniaceae	59	products/270620/270620.jpg	f	t	2021-01-15 11:14:15.96795+05:30	5	T000031	1	0	nan	3381	price/20 seeds
3383	Tecoma	tecoma-e132	Tecoma is a genus of 14 species of shrubs or small trees in the trumpet vine family, Bignoniaceae	149	products/59054/59054.jpg	f	t	2021-01-15 11:14:15.974481+05:30	5	T000031	1	0	nan	3381	100 seeds
3384	Tecoma	tecoma-eegi	Tecoma is a genus of 14 species of shrubs or small trees in the trumpet vine family, Bignoniaceae	329	products/27583/27583.jpg	f	t	2021-01-15 11:14:15.981738+05:30	5	T000031	1	0	nan	3381	500 seeds
3385	Tecoma	tecoma-4t9l	Tecoma is a genus of 14 species of shrubs or small trees in the trumpet vine family, Bignoniaceae	499	products/27344/27344.jpg	f	t	2021-01-15 11:14:15.988544+05:30	5	T000031	1	0	nan	3381	1000 seeds
3386	Bauhinia	bauhinia	Bauhinia is a large genus of flowering plants in the subfamily Cercidoideae and tribe Bauhinieae, in the large flowering plant family Fabaceae, with a pantropical distribution.	0	products/1861700/1861700.jpg	f	t	2021-01-15 11:14:15.994618+05:30	5	T000032	1	0	nan	\N	
3387	Bauhinia	bauhinia-mwfp	Bauhinia is a large genus of flowering plants in the subfamily Cercidoideae and tribe Bauhinieae, in the large flowering plant family Fabaceae, with a pantropical distribution.	59	products/407916/407916.jpg	f	t	2021-01-15 11:14:16.000288+05:30	5	T000032	1	0	nan	3386	price/20 seeds
3388	Bauhinia	bauhinia-ac2l	Bauhinia is a large genus of flowering plants in the subfamily Cercidoideae and tribe Bauhinieae, in the large flowering plant family Fabaceae, with a pantropical distribution.	149	products/728232/728232.jpg	f	t	2021-01-15 11:14:16.00727+05:30	5	T000032	1	0	nan	3386	100 seeds
3389	Bauhinia	bauhinia-wlpe	Bauhinia is a large genus of flowering plants in the subfamily Cercidoideae and tribe Bauhinieae, in the large flowering plant family Fabaceae, with a pantropical distribution.	329	products/1872266/1872266.jpg	f	t	2021-01-15 11:14:16.015047+05:30	5	T000032	1	0	nan	3386	500 seeds
3391	Raintree	raintree	Raintree is a wide-canopied tree with a large symmetrical umbrella-shaped crown. It usually reaches a height of 15–25 m (49–82 ft) and a diameter of 30 m (98 ft).	0	products/379826/379826.jpg	f	t	2021-01-15 11:14:16.030202+05:30	5	T000033	1	0	nan	\N	
3392	Raintree	raintree-3xyb	Raintree is a wide-canopied tree with a large symmetrical umbrella-shaped crown. It usually reaches a height of 15–25 m (49–82 ft) and a diameter of 30 m (98 ft).	59	products/139452/139452.jpg	f	t	2021-01-15 11:14:16.035847+05:30	5	T000033	1	0	nan	3391	price/20 seeds
3393	Raintree	raintree-vu6p	Raintree is a wide-canopied tree with a large symmetrical umbrella-shaped crown. It usually reaches a height of 15–25 m (49–82 ft) and a diameter of 30 m (98 ft).	149	products/1554323/1554323.jpg	f	t	2021-01-15 11:14:16.041932+05:30	5	T000033	1	0	nan	3391	100 seeds
3394	Raintree	raintree-h88z	Raintree is a wide-canopied tree with a large symmetrical umbrella-shaped crown. It usually reaches a height of 15–25 m (49–82 ft) and a diameter of 30 m (98 ft).	329	products/514822/514822.jpg	f	t	2021-01-15 11:14:16.047621+05:30	5	T000033	1	0	nan	3391	500 seeds
3395	Raintree	raintree-hwpe	Raintree is a wide-canopied tree with a large symmetrical umbrella-shaped crown. It usually reaches a height of 15–25 m (49–82 ft) and a diameter of 30 m (98 ft).	499	products/1429587/1429587.jpg	f	t	2021-01-15 11:14:16.054629+05:30	5	T000033	1	0	nan	3391	1000 seeds
3396	African Tulip	african-tulip	African Tulip. Let's start with the African Tulip (Spathodea Campanulata) which was planted extensively on the 9th Main, running north to south.	0	products/126279/126279.jpg	f	t	2021-01-15 11:14:16.062182+05:30	5	T000034	1	0	nan	\N	
3397	African Tulip	african-tulip-r2ds	African Tulip. Let's start with the African Tulip (Spathodea Campanulata) which was planted extensively on the 9th Main, running north to south.	59	products/510546/510546.jpg	f	t	2021-01-15 11:14:16.066492+05:30	5	T000034	1	0	nan	3396	price/20 seeds
3398	African Tulip	african-tulip-u9pm	African Tulip. Let's start with the African Tulip (Spathodea Campanulata) which was planted extensively on the 9th Main, running north to south.	149	products/1376568/1376568.jpg	f	t	2021-01-15 11:14:16.072604+05:30	5	T000034	1	0	nan	3396	100 seeds
3399	African Tulip	african-tulip-if3v	African Tulip. Let's start with the African Tulip (Spathodea Campanulata) which was planted extensively on the 9th Main, running north to south.	329	products/1940645/1940645.jpg	f	t	2021-01-15 11:14:16.079156+05:30	5	T000034	1	0	nan	3396	500 seeds
3400	African Tulip	african-tulip-fae0	African Tulip. Let's start with the African Tulip (Spathodea Campanulata) which was planted extensively on the 9th Main, running north to south.	499	products/597771/597771.jpg	f	t	2021-01-15 11:14:16.085589+05:30	5	T000034	1	0	nan	3396	1000 seeds
3401	Custard Apple	custard-apple	Cherimoya (Annona cherimola) is a green, cone-shaped fruit with scaly skin and creamy, sweet flesh. Thought to have originated in the Andes mountains of South America	0	products/984133/984133.jpg	f	t	2021-01-15 11:14:16.093603+05:30	5	T000035	1	0	nan	\N	
3403	Custard Apple	custard-apple-2ojr	Cherimoya (Annona cherimola) is a green, cone-shaped fruit with scaly skin and creamy, sweet flesh. Thought to have originated in the Andes mountains of South America	149	products/1065085/1065085.jpg	f	t	2021-01-15 11:14:16.106539+05:30	5	T000035	1	0	nan	3401	100 seeds
3404	Custard Apple	custard-apple-jmep	Cherimoya (Annona cherimola) is a green, cone-shaped fruit with scaly skin and creamy, sweet flesh. Thought to have originated in the Andes mountains of South America	329	products/1023105/1023105.jpg	f	t	2021-01-15 11:14:16.113492+05:30	5	T000035	1	0	nan	3401	500 seeds
3405	Custard Apple	custard-apple-stoo	Cherimoya (Annona cherimola) is a green, cone-shaped fruit with scaly skin and creamy, sweet flesh. Thought to have originated in the Andes mountains of South America	499	products/996309/996309.jpg	f	t	2021-01-15 11:14:16.12126+05:30	5	T000035	1	0	nan	3401	1000 seeds
3406	Chikkoo	chikkoo	Sapotas, seasonal fruits also known as Chickoos or Chikoos.	0	products/1675762/1675762.jpg	f	t	2021-01-15 11:14:16.127712+05:30	5	T000036	1	0	nan	\N	
3407	Chikkoo	chikkoo-uj9y	Sapotas, seasonal fruits also known as Chickoos or Chikoos.	59	products/30396/30396.jpg	f	t	2021-01-15 11:14:16.132985+05:30	5	T000036	1	0	nan	3406	price/20 seeds
3408	Chikkoo	chikkoo-2p7j	Sapotas, seasonal fruits also known as Chickoos or Chikoos.	149	products/604924/604924.jpg	f	t	2021-01-15 11:14:16.139249+05:30	5	T000036	1	0	nan	3406	100 seeds
3409	Chikkoo	chikkoo-yqsr	Sapotas, seasonal fruits also known as Chickoos or Chikoos.	329	products/1541918/1541918.jpg	f	t	2021-01-15 11:14:16.147254+05:30	5	T000036	1	0	nan	3406	500 seeds
3410	Chikkoo	chikkoo-ckx1	Sapotas, seasonal fruits also known as Chickoos or Chikoos.	499	products/513684/513684.jpg	f	t	2021-01-15 11:14:16.15458+05:30	5	T000036	1	0	nan	3406	1000 seeds
3455	Brinjal	brinjal	Plant type is Medium Tall spreading, plants, First Picking  is 50-60 days after transplanting, fruit color is shiny balck, Harvest Wt. is 70-80gm thornless, 2-3 fruits in clusters,Tolerance to sucking pests, high Yielding  hybrid. 	0	products/1261620/1261620.jpg	f	t	2021-01-15 11:15:24.903977+05:30	1	C000013	1	0	F1-Rishi	\N	
3456	Brinjal	brinjal-g2wp	Plant type is Medium Tall spreading, plants, First Picking  is 50-60 days after transplanting, fruit color is shiny balck, Harvest Wt. is 70-80gm thornless, 2-3 fruits in clusters,Tolerance to sucking pests, high Yielding  hybrid. 	160	products/1544004/1544004.jpg	f	t	2021-01-15 11:15:24.909471+05:30	1	C000013	1	0	F1-Rishi	3455	10 gms
3457	Brinjal	brinjal-989v	Tall Erect Plntss, 50-65 days after transplantingt, medium thick long cylindrical fruit shape, uniform green in color,70-80 gm, Cluster bearing, long peduncle, shiny straight fruits with high yielding,good disease tolerance.	0	products/752557/752557.jpg	f	t	2021-01-15 11:15:24.915294+05:30	1	C000014	1	0	F1-Hariya	\N	
3458	Brinjal	brinjal-ckb9	Tall Erect Plntss, 50-65 days after transplantingt, medium thick long cylindrical fruit shape, uniform green in color,70-80 gm, Cluster bearing, long peduncle, shiny straight fruits with high yielding,good disease tolerance.	175	products/133499/133499.jpg	f	t	2021-01-15 11:15:24.920283+05:30	1	C000014	1	0	F1-Hariya	3457	10 gms
3459	Brinjal	brinjal-5rfp	Tall Erect Plants, 60-65 days after transplanting, medium thick long cylindrical fruit shape,glossy black fruit in color,150-200 gm, Cluster bearing, shiny straight fruits with high yielding,good disease tolerance. 	0	products/3277/3277.jpg	f	t	2021-01-15 11:15:24.927264+05:30	1	C000015	1	0	F1-Myna	\N	
3460	Brinjal	brinjal-xzup	Tall Erect Plants, 60-65 days after transplanting, medium thick long cylindrical fruit shape,glossy black fruit in color,150-200 gm, Cluster bearing, shiny straight fruits with high yielding,good disease tolerance. 	160	products/224055/224055.jpg	f	t	2021-01-15 11:15:24.93225+05:30	1	C000015	1	0	F1-Myna	3459	10 gms
3461	Brinjal	brinjal-l7er	Medium Tall Spreading Plants, 60-65 days after transplanting, sshiny black purple, thick long cylindrical fruit shape,gl 100-120 gm, slender shiny firm fruits with high yielding hybrid with,good disease tolerance.     	0	products/1954710/1954710.jpg	f	t	2021-01-15 11:15:24.940229+05:30	1	C000016	1	0	F1-Mohit	\N	
3462	Brinjal	brinjal-8wd8	Medium Tall Spreading Plants, 60-65 days after transplanting, sshiny black purple, thick long cylindrical fruit shape,gl 100-120 gm, slender shiny firm fruits with high yielding hybrid with,good disease tolerance.     	170	products/854961/854961.jpg	f	t	2021-01-15 11:15:24.945743+05:30	1	C000016	1	0	F1-Mohit	3461	10 gms
3463	Brinjal	brinjal-uiq8	Plant type is semi erect spresding plaants plants,first picking is 60-70 days after transplantig,  bright pink in colour,80-100gm, Gulabi/pink shiny fruits, excellent contineous bearing habit in higher temperature conditions. 	0	products/923014/923014.jpg	f	t	2021-01-15 11:15:24.951002+05:30	1	C000017	1	0	F1-Bilal	\N	
3413	Pomogranate	pomogranate-4ly4	The pomegranate is a fruit that contains hundreds of edible seeds called arils. They are rich in fiber, vitamins, minerals and bioactive plant .	149	products/1891233/1891233.jpg	f	t	2021-01-15 11:14:16.174432+05:30	5	T000037	1	0	nan	3411	100 seeds
3414	Pomogranate	pomogranate-m03m	The pomegranate is a fruit that contains hundreds of edible seeds called arils. They are rich in fiber, vitamins, minerals and bioactive plant .	329	products/98570/98570.jpg	f	t	2021-01-15 11:14:16.182254+05:30	5	T000037	1	0	nan	3411	500 seeds
3415	Pomogranate	pomogranate-2unf	The pomegranate is a fruit that contains hundreds of edible seeds called arils. They are rich in fiber, vitamins, minerals and bioactive plant .	499	products/1851965/1851965.jpg	f	t	2021-01-15 11:14:16.190281+05:30	5	T000037	1	0	nan	3411	1000 seeds
3416	Tamarind	tamarind	Tamarind is a hardwood tree known scientifically as Tamarindus indica. It's native to Africa but also grows in India, Pakistan and many other tropical regions.	0	products/866417/866417.jpg	f	t	2021-01-15 11:14:16.197174+05:30	5	T000038	1	0	nan	\N	
3417	Tamarind	tamarind-3azf	Tamarind is a hardwood tree known scientifically as Tamarindus indica. It's native to Africa but also grows in India, Pakistan and many other tropical regions.	59	products/1775628/1775628.jpg	f	t	2021-01-15 11:14:16.20292+05:30	5	T000038	1	0	nan	3416	price/20 seeds
3418	Tamarind	tamarind-1zm7	Tamarind is a hardwood tree known scientifically as Tamarindus indica. It's native to Africa but also grows in India, Pakistan and many other tropical regions.	149	products/632898/632898.jpg	f	t	2021-01-15 11:14:16.208904+05:30	5	T000038	1	0	nan	3416	100 seeds
3419	Tamarind	tamarind-qgfm	Tamarind is a hardwood tree known scientifically as Tamarindus indica. It's native to Africa but also grows in India, Pakistan and many other tropical regions.	329	products/772040/772040.jpg	f	t	2021-01-15 11:14:16.216898+05:30	5	T000038	1	0	nan	3416	500 seeds
3420	Tamarind	tamarind-baho	Tamarind is a hardwood tree known scientifically as Tamarindus indica. It's native to Africa but also grows in India, Pakistan and many other tropical regions.	499	products/43686/43686.jpg	f	t	2021-01-15 11:14:16.223956+05:30	5	T000038	1	0	nan	3416	1000 seeds
3421	Avocado	avocado	Also known as an alligator pear or butter fruit, the versatile avocado is the only fruit that provides a substantial amount of healthy monounsaturated fatty acids (MUFA)	0	products/1896561/1896561.jpg	f	t	2021-01-15 11:14:16.225895+05:30	5	T000039	1	0	nan	\N	
3422	Avocado	avocado-kwnn	Also known as an alligator pear or butter fruit, the versatile avocado is the only fruit that provides a substantial amount of healthy monounsaturated fatty acids (MUFA)	1499	products/1460446/1460446.jpg	f	t	2021-01-15 11:14:16.225895+05:30	5	T000039	1	0	nan	3421	price/20 seeds
3423	Avocado	avocado-7ws1	Also known as an alligator pear or butter fruit, the versatile avocado is the only fruit that provides a substantial amount of healthy monounsaturated fatty acids (MUFA)	4999	products/1715974/1715974.jpg	f	t	2021-01-15 11:14:16.241671+05:30	5	T000039	1	0	nan	3421	100 seeds
3424	Avocado	avocado-tclx	Also known as an alligator pear or butter fruit, the versatile avocado is the only fruit that provides a substantial amount of healthy monounsaturated fatty acids (MUFA)	19999	products/1862293/1862293.jpg	f	t	2021-01-15 11:14:16.249649+05:30	5	T000039	1	0	nan	3421	500 seeds
3425	Avocado	avocado-o06u	Also known as an alligator pear or butter fruit, the versatile avocado is the only fruit that provides a substantial amount of healthy monounsaturated fatty acids (MUFA)	29999	products/1882856/1882856.jpg	f	t	2021-01-15 11:14:16.257032+05:30	5	T000039	1	0	nan	3421	1000 seeds
3412	Pomogranate	pomogranate-jbr4	The pomegranate is a fruit that contains hundreds of edible seeds called arils. They are rich in fiber, vitamins, minerals and bioactive plant .	59	products/528543/528543.jpg	f	t	2021-01-15 11:14:16.167692+05:30	5	T000037	1	0	nan	3411	price/20 seeds
3466	Brinjal	brinjal-hv9s	Tall Erect open type Plants, 50-55 days after transplanting,k long cylindrical  thin fruit shape,purple fruit in color,80-90 gm, Cluster bearing, wider adaptabilit suited in PPL growing areas, high level of resistance to sucking pests & disease.. 	115	products/1288325/1288325.jpg	f	t	2021-01-15 11:15:24.97186+05:30	1	C000018	1	0	Purple Long	3465	10 gms
3470	Brinjal 	brinjal-6rmi	Plant type is tall erect spreading plants, first picking is 55-65 days afteer transplanting, fruit shape is round, fruit colour is dark purple, 200-300 gm of Harvest Wt., Attractive shiny fruits with low seed content, suitable for Bharta flying operations.	155	products/592048/592048.jpg	f	t	2021-01-15 11:15:24.996204+05:30	1	C000020	1	0	F1- Aira	3469	10 gms
3472	Brinjal 	brinjal-bxhe	Fruit plant type is hardy tall spreading plants, first picking is 70-75 days after transplanting, oval fruit shape, harvesr Wt. is 200-400gm, Pan India Product, wider climate adaptability with disease 6 suckings pets tolerance,soft fruits with good keeping quality, good for frying dishes.	155	products/1426280/1426280.jpg	f	t	2021-01-15 11:15:25.01068+05:30	1	C000021	1	0	F1-Dhairaj	3471	10 gms
3473	Beans 	beans	Plant type is bushy spreading plants, first picking is 45 days after sowing, 14-16cm of pod length, green pod clour, pods are tender with less fibe and tolerant to bean mosaic virus.	0	products/1773981/1773981.jpg	f	t	2021-01-15 11:15:25.018239+05:30	1	C000022	1	0	improved beans Tony	\N	
3474	Beans 	beans-hvll	Plant type is bushy spreading plants, first picking is 45 days after sowing, 14-16cm of pod length, green pod clour, pods are tender with less fibe and tolerant to bean mosaic virus.	120	products/461593/461593.jpg	f	t	2021-01-15 11:15:25.025209+05:30	1	C000022	1	0	improved beans Tony	3473	100 gms
3475	Beans 	beans-xss2	Plant type is bushy spreading plants, first picking is 45 days after sowing, 14-16cm of pod length, green pod clour, pods are tender with less fibe and tolerant to bean mosaic virus.	220	products/1256248/1256248.jpg	f	t	2021-01-15 11:15:25.032064+05:30	1	C000022	1	0	improved beans Tony	3473	250 gms
3476	Beans 	beans-1v26	Plant type is bushy spreading plants, first picking is 45 days after sowing, 14-16cm of pod length, green pod clour, pods are tender with less fibe and tolerant to bean mosaic virus.	370	products/1371806/1371806.jpg	f	t	2021-01-15 11:15:25.038074+05:30	1	C000022	1	0	improved beans Tony	3473	500 gms
3477	Redgram	redgram	Maturity in 150-160 days, plant height is 180-190cm, Leaves semi erect dark green, Seed bold size red coloured cluster bearing high yielding variety with tolerance to wilting. 	0	products/984058/984058.jpg	f	t	2021-01-15 11:15:25.043909+05:30	1	C000023	1	0	BRG- 2	\N	
3478	Redgram	redgram-vt3h	Maturity in 150-160 days, plant height is 180-190cm, Leaves semi erect dark green, Seed bold size red coloured cluster bearing high yielding variety with tolerance to wilting. 	120	products/625270/625270.jpg	f	t	2021-01-15 11:15:25.049224+05:30	1	C000023	1	0	BRG- 2	3477	500 gms
3479	Redgram	redgram-m9k3	Maturity in 150-160 days, plant height is 180-190cm, Leaves semi erect dark green, Seed bold size red coloured cluster bearing high yielding variety with tolerance to wilting. 	850	products/868173/868173.jpg	f	t	2021-01-15 11:15:25.057609+05:30	1	C000023	1	0	BRG- 2	3477	5 kg
3480	Redgram	redgram-euzo	Maturity in 140-145 days, plant height is 180-190cm, Leaves semi erect dark green, Seed bold size white coloured podsare in cluster bearing high yielding variety with resistance to disease. 	0	products/1373906/1373906.jpg	f	t	2021-01-15 11:15:25.063244+05:30	1	C000024	1	0	BRG-5	\N	
3481	Redgram	redgram-y7wc	Maturity in 140-145 days, plant height is 180-190cm, Leaves semi erect dark green, Seed bold size white coloured podsare in cluster bearing high yielding variety with resistance to disease. 	120	products/1017525/1017525.jpg	f	t	2021-01-15 11:15:25.069628+05:30	1	C000024	1	0	BRG-5	3480	500 gms
3483	Capsicum	capsicum	Plant habit is erect medim tall, first picking is G5-10 days after transplanting, fruit shape is round blocky with 4 lobes, fruit color is green turns yellow, fruit weight is 140-160gm, high yielder, good tolersnce for insects pests and diseases.	0	products/797698/797698.jpg	f	t	2021-01-15 11:15:25.083306+05:30	1	C000025	1	0	F1-D-690 (Yellow)	\N	
3484	Carrot	carrot	Plant is gree errect coarse leaves foiage plants, maturity is 100-110 dayys from sowing, rot shape is conical with blunt tip, root colour is deep orange with self colour core, Erect growing, medium size, sweet with edible core.	0	products/378589/378589.jpg	f	t	2021-01-15 11:15:25.088318+05:30	1	C000026	1	0	D-999	\N	
3486	Carrot	carrot-udyg	Plant is Erect, green, medium foliage  plants, maturity is 90 days from sowing, root shape is long cylindrical with blunt tip, root colour is orange with self colour core, Erect foliage, long, soft, edible core.	0	products/1706847/1706847.jpg	f	t	2021-01-15 11:15:25.100087+05:30	1	C000027	1	0	F1-Zara	\N	
3487	Carrot	carrot-49jg	Plant is Erect, green, medium foliage  plants, maturity is 90 days from sowing, root shape is long cylindrical with blunt tip, root colour is orange with self colour core, Erect foliage, long, soft, edible core.	2825	products/821190/821190.jpg	f	t	2021-01-15 11:15:25.106138+05:30	1	C000027	1	0	F1-Zara	3486	100 gms
3485	Carrot	carrot-pgxc	Plant is gree errect coarse leaves foiage plants, maturity is 100-110 dayys from sowing, rot shape is conical with blunt tip, root colour is deep orange with self colour core, Erect growing, medium size, sweet with edible core.	1485	products/1191610/1191610.jpg	f	t	2021-01-15 11:15:25.094301+05:30	1	C000026	1	0	D-999	3484	100 gms
3100	Onion Light Red	onion-light-red-h50w	The Maturity days are 110-120 days after transplanting, Bulb Shape is  Round, Bulb Colour is dark red, Bulb Av. Wt 100gm, Sowing season is Kharif, uniforn size bulbs for fesh market.	49	products/1411715/1411715.jpg	f	t	2021-01-15 10:40:58.078741+05:30	2	K000050	1	0	nan	3099	50 seeds
3106	Kholrabi/Knol-khol	kholrabiknol-khol-yagq	Kohlrabi is another name for our not-so-popular Knol khol. It belongs to the same family as Cabbage and Cauliflower (Brassicaceae). The Whole plant is edible however, it is mostly used for its bulged swollen stem. It can be eaten raw as well as cooked.	49	products/1701888/1701888.jpg	f	t	2021-01-15 10:40:58.126951+05:30	2	K000052	1	0	nan	3105	50 seeds
3465	Brinjal	brinjal-o7st	Tall Erect open type Plants, 50-55 days after transplanting,k long cylindrical  thin fruit shape,purple fruit in color,80-90 gm, Cluster bearing, wider adaptabilit suited in PPL growing areas, high level of resistance to sucking pests & disease.. 	0	products/1877668/1877668.jpg	f	t	2021-01-15 11:15:24.963952+05:30	1	C000018	1	0	Purple Long	\N	
3490	Carrot	carrot-7d6d	Plant is Erect, green, medium foliage  plants, maturity is 90 days from sowing, root shape is long cylindrical with blunt tip, root colour is orange with self colour core, Erect foliage, long, soft, edible core.	0	products/791393/791393.jpg	f	t	2021-01-15 11:15:25.126894+05:30	1	C000029	1	0	F1-Charly	\N	
3492	Chilly	chilly	Plant habit is Tall Spreading vigorous plants, first picking is 60-65 days after transplanting, fruit colour is dark green, fruit length is 9-10cm, diameter is1.3-1.4cm fruit pungency is medium pungency, vigorous plants with dark green foliage high yield, dualp purpose hybrid.	0	products/165763/165763.jpeg	f	t	2021-01-15 11:15:25.138953+05:30	1	C000030	1	0	F1-Narnia (Guntur)	\N	
3494	Chilly	chilly-lekn	Plant habit is  medium Tall Spreading  plants, first picking is 70-75 days after transplanting, fruit colour is dark green, fruit length is 10-12cm, diameter is1.0-1.2cm, fruit pungency is high pungency, vmedium smooth shiny fruits,round the year for fresh market.	0	products/1460523/1460523.jpg	f	t	2021-01-15 11:15:25.150013+05:30	1	C000031	1	0	F1-Priya	\N	
3495	Chilly	chilly-izpr	Plant habit is  medium Tall Spreading  plants, first picking is 70-75 days after transplanting, fruit colour is dark green, fruit length is 10-12cm, diameter is1.0-1.2cm, fruit pungency is high pungency, vmedium smooth shiny fruits,round the year for fresh market.	365	products/1582940/1582940.jpg	f	t	2021-01-15 11:15:25.158089+05:30	1	C000031	1	0	F1-Priya	3494	10 gms
3496	Chilly	chilly-rdmt	Plant habit is medium Tall Spreading  plants, first picking is 60-65 days after transplanting, fruit colour is dark green, fruit length is 7-9 cm, diameter is 0.8-1cm fruit pungency is medium pungency, Shiny green fruits turn deep red on maturity, dual purpose hybrid with heat tolerance..	0	products/175905/175905.jpeg	f	t	2021-01-15 11:15:25.164094+05:30	1	C000032	1	0	F1-Meera	\N	
3497	Chilly	chilly-cljd	Plant habit is medium Tall Spreading  plants, first picking is 60-65 days after transplanting, fruit colour is dark green, fruit length is 7-9 cm, diameter is 0.8-1cm fruit pungency is medium pungency, Shiny green fruits turn deep red on maturity, dual purpose hybrid with heat tolerance..	350	products/526816/526816.jpeg	f	t	2021-01-15 11:15:25.169504+05:30	1	C000032	1	0	F1-Meera	3496	10 gms
3498	Chilly	chilly-nx44	Plant habit is medium Tall Spreading  plants, first picking is70 days after transplanting, fruit colour is dark green turns red, fruit length is 13-14cm, diameter is1.3-1.4cm fruit pungency is medium pungency, byadgi type hybrid, wrinkled fruits, good for dry purpose & colour value.	0	products/893660/893660.jpg	f	t	2021-01-15 11:15:25.174816+05:30	1	C000033	1	0	F1-Prime (Byadagi)	\N	
3499	Chilly	chilly-65gj	Plant habit is medium Tall Spreading  plants, first picking is70 days after transplanting, fruit colour is dark green turns red, fruit length is 13-14cm, diameter is1.3-1.4cm fruit pungency is medium pungency, byadgi type hybrid, wrinkled fruits, good for dry purpose & colour value.	610	products/392000/392000.jpg	f	t	2021-01-15 11:15:25.182794+05:30	1	C000033	1	0	F1-Prime (Byadagi)	3498	10 gms
3500	Chilly	chilly-ve6j	Plant habit is Tall erect Spreading  plants, first picking is 50-60 days after transplanting, fruit colour is yellowish Green,, fruit length is 15-16cm, diameter is1.0-1.2cm fruit pungency is high pungency,  wider climate adaptability, wrinkled fruits good for fresh market..	0	products/1373049/1373049.jpg	f	t	2021-01-15 11:15:25.189136+05:30	1	C000034	1	0	F1-Gabbar	\N	
3502	Chilly	chilly-iffd	Plant habit is Tall plants with dark green foliage, first picking is 60-65 days after transplanting, fruit colour is Green light wrinkled fruits, 8-10cm of  fruit length, fruit diameter is 1.3-1.5cm fruit pungency is high pungency,  light wrinkled high yielding hybrid,good for fresh maeket as well as for dry.	0	products/1539842/1539842.jpg	f	t	2021-01-15 11:15:25.200445+05:30	1	C000035	1	0	F1-Akhil	\N	
3503	Chilly	chilly-xbbq	Plant habit is Tall plants with dark green foliage, first picking is 60-65 days after transplanting, fruit colour is Green light wrinkled fruits, 8-10cm of  fruit length, fruit diameter is 1.3-1.5cm fruit pungency is high pungency,  light wrinkled high yielding hybrid,good for fresh maeket as well as for dry.	590	products/808420/808420.jpg	f	t	2021-01-15 11:15:25.206791+05:30	1	C000035	1	0	F1-Akhil	3502	10 gms
3504	Chilly	chilly-nxgj	Plant habit is Medium Tall Spreading plants, first picking is 60-65 days after transplanting, fruit colour is Green, 10-12cm of  fruit length, fruit diameter is 1.2-1.3cm fruit pungency is medium pungency, dual purpose hybrid having good virus tolerance.	0	products/913889/913889.jpg	f	t	2021-01-15 11:15:25.212775+05:30	1	C000036	1	0	F1-Divya	\N	
3505	Chilly	chilly-ls8s	Plant habit is Medium Tall Spreading plants, first picking is 60-65 days after transplanting, fruit colour is Green, 10-12cm of  fruit length, fruit diameter is 1.2-1.3cm fruit pungency is medium pungency, dual purpose hybrid having good virus tolerance.	470	products/49655/49655.jpg	f	t	2021-01-15 11:15:25.218764+05:30	1	C000036	1	0	F1-Divya	3504	10 gms
3506	Chilly	chilly-18br	Plant habit isTall Erect Spreading plants, first picking is 65 days after transplanting, fruit colour is Green, 7-8cm of  fruit length, fruit diameter is 0.9-1cm fruit pungency is highly pungency, Excellent fruit wt due to seed contrnt, high potential with good virus tolerance. Dual purpose hybrid. 	0	products/720887/720887.jpg	f	t	2021-01-15 11:15:25.225708+05:30	1	C000037	1	0	F1-Teja	\N	
3507	Chilly	chilly-nhqz	Plant habit isTall Erect Spreading plants, first picking is 65 days after transplanting, fruit colour is Green, 7-8cm of  fruit length, fruit diameter is 0.9-1cm fruit pungency is highly pungency, Excellent fruit wt due to seed contrnt, high potential with good virus tolerance. Dual purpose hybrid. 	350	products/852328/852328.jpg	f	t	2021-01-15 11:15:25.231959+05:30	1	C000037	1	0	F1-Teja	3506	10 gms
3508	Chilly	chilly-jrbz	Plant habit is Intermediate Tall plants, first picking is 60-65 days after transplanting, fruit colour is  shiny yelowish  Green, 14-18cm of  fruit length, fruit diameter is 1.2cm fruit pungency is medium pungency, Good product for fresh market.	0	products/1471682/1471682.jpg	f	t	2021-01-15 11:15:25.237851+05:30	1	C000038	1	0	F1-D-540	\N	
3123	Thyme	thyme	Thyme is a low growing (6-12 inches tall) to almost prostrate, wiry stemmed perennial. Stems are stiff and woody and leaves are small, oval and gray-green in color. Flowers can be white to lilac and are in small clusters.	0	products/1590113/1590113.jpg	f	t	2021-01-15 10:40:58.239099+05:30	2	K000058	1	0	nan	\N	
3146	Amaranthus Red	amaranthus-red-0214	It has a rosette of leaves at the base of the plant; a deep taproot; a smooth, hollow stem; leaves that may be nearly smooth-margined, toothed, or deeply cut; and a solitary yellow flower head composed only of ray flowers (no disk flowers).	129	products/1993479/1993479.jpg	f	t	2021-01-15 10:40:58.388447+05:30	2	K000065	1	0	nan	3144	1000 seeds
3513	Coriander	coriander-toez	Plant habit  is Erect Spreading Plants., first cutting is 35 days after sowing, leaf colour is Shiny Green to Dark Green leaves, Broad leaves, Good Aroma, late bolting, Suitable for multi Cuttings.	0	products/1522331/1522331.jpeg	f	t	2021-01-15 11:15:25.273512+05:30	1	C000040	1	0	Raksha (Split Coriander)	\N	
3514	Coriander	coriander-m5bb	Plant habit  is Erect Spreading Plants., first cutting is 35 days after sowing, leaf colour is Shiny Green to Dark Green leaves, Broad leaves, Good Aroma, late bolting, Suitable for multi Cuttings.	4850	products/1485595/1485595.jpeg	f	t	2021-01-15 11:15:25.279496+05:30	1	C000040	1	0	Raksha (Split Coriander)	3513	25 kg
3515	Palak	palak	Leafy green vegetables like spinach with its delicate texture and jade green color provide more nutrients than any other food. 	0	products/193772/193772.jpg	f	t	2021-01-15 11:15:25.28648+05:30	1	C000041	1	0	All Green	\N	
3516	Palak	palak-pdjy	Leafy green vegetables like spinach with its delicate texture and jade green color provide more nutrients than any other food. 	60	products/1454793/1454793.jpg	f	t	2021-01-15 11:15:25.29291+05:30	1	C000041	1	0	All Green	3515	100 gms
3517	Palak	palak-g4b5	Leafy green vegetables like spinach with its delicate texture and jade green color provide more nutrients than any other food. 	3300	products/1811009/1811009.jpg	f	t	2021-01-15 11:15:25.299806+05:30	1	C000041	1	0	All Green	3515	25 kg
3518	Methi	methi	Fenugreek is an annual plant in the family Fabaceae, with leaves consisting of three small obovate to oblong leaflets.	0	products/547662/547662.jpg	f	t	2021-01-15 11:15:25.307409+05:30	1	C000042	1	0	Bhuvana	\N	
3519	Methi	methi-ob3v	Fenugreek is an annual plant in the family Fabaceae, with leaves consisting of three small obovate to oblong leaflets.	60	products/1986173/1986173.jpg	f	t	2021-01-15 11:15:25.312695+05:30	1	C000042	1	0	Bhuvana	3518	100 gms
3520	Methi	methi-acnp	Fenugreek is an annual plant in the family Fabaceae, with leaves consisting of three small obovate to oblong leaflets.	90	products/1154912/1154912.jpg	f	t	2021-01-15 11:15:25.320913+05:30	1	C000042	1	0	Bhuvana	3518	250 gms
3521	Methi	methi-uqyp	Fenugreek is an annual plant in the family Fabaceae, with leaves consisting of three small obovate to oblong leaflets.	5030	products/690076/690076.jpg	f	t	2021-01-15 11:15:25.326898+05:30	1	C000042	1	0	Bhuvana	3518	25 kg
3522	Cucumber	cucumber	Fruit picking is 45-45 days after Sowing, fruit Shape is Medium long cylindrical, fruit colour is mottle Green, 20-22cm of  fruit length, Av.fruit Wt. is 160-180gm, Vigorous branched vines with good disease tolerance & fruits with wide market acceptance.	0	products/1642766/1642766.jpg	f	t	2021-01-15 11:15:25.333726+05:30	1	C000043	1	0	F1-Mitra	\N	
3524	Cucumber	cucumber-63u0	Fruit picking is 38-340 days after Sowing, fruit Shape is cylindrical, fruit colour is Greenish white, 18-20cm of  fruit length, Av.fruit Wt. is 120-150gm, Early Harvest Vigorous vegetative vines High Yield market acceptance.	0	products/245319/245319.jpg	f	t	2021-01-15 11:15:25.346807+05:30	1	C000044	1	0	F1-Pushpa	\N	
3525	Cucumber	cucumber-a25g	Fruit picking is 38-340 days after Sowing, fruit Shape is cylindrical, fruit colour is Greenish white, 18-20cm of  fruit length, Av.fruit Wt. is 120-150gm, Early Harvest Vigorous vegetative vines High Yield market acceptance.	380	products/888407/888407.jpg	f	t	2021-01-15 11:15:25.352657+05:30	1	C000044	1	0	F1-Pushpa	3524	25 gms
3526	Cucumber	cucumber-qmj2	Fruit picking is 45-45 days after Sowing, fruit Shape is cylindrical, fruit colour is mottle Green, 15-18cm of  fruit length, Av.fruit Wt. is 150-200gm, Mosaic Tolerant, good Keeping quality and suitable for long transporation. 	0	products/1902418/1902418.jpg	f	t	2021-01-15 11:15:25.358879+05:30	1	C000045	1	0	F1-Alfa	\N	
3527	Cucumber	cucumber-id4x	Fruit picking is 45-45 days after Sowing, fruit Shape is cylindrical, fruit colour is mottle Green, 15-18cm of  fruit length, Av.fruit Wt. is 150-200gm, Mosaic Tolerant, good Keeping quality and suitable for long transporation. 	410	products/1364615/1364615.jpg	f	t	2021-01-15 11:15:25.364259+05:30	1	C000045	1	0	F1-Alfa	3526	25 gms
3528	HY.Maize	hymaize	Maturity days are 110-120 days, Plant Height is 220-240cm, cobs are Conico Cylindrical, 22-24cm Long Bold,, Orange Yellow, Dent like grains, 14-16  rows with 45-50 grains per row Single cross Hy. Tolerant to Major leaf diseases.	0	products/345527/345527.jpg	f	t	2021-01-15 11:15:25.371398+05:30	1	C000046	1	0	Hy.M-35	\N	
3529	HY.Maize	hymaize-sjcu	Maturity days are 110-120 days, Plant Height is 220-240cm, cobs are Conico Cylindrical, 22-24cm Long Bold,, Orange Yellow, Dent like grains, 14-16  rows with 45-50 grains per row Single cross Hy. Tolerant to Major leaf diseases.	910	products/286488/286488.jpg	f	t	2021-01-15 11:15:25.376407+05:30	1	C000046	1	0	Hy.M-35	3528	3 kg
3530	Muskmelon	muskmelon	Maturity days are 80-85 days after sowing, fruit shape is Oval, Fruit Surface is Orange with dense netting, Fruit Flesh clour is Orange, Fruit Av.Wt. is 2-2.5 kg, Firm sweeet fruits good keeping quality. 	0	products/52875/52875.jpg	f	t	2021-01-15 11:15:25.383001+05:30	1	C000047	1	0	F1-Rambo	\N	
3531	Muskmelon	muskmelon-udoj	Maturity days are 80-85 days after sowing, fruit shape is Oval, Fruit Surface is Orange with dense netting, Fruit Flesh clour is Orange, Fruit Av.Wt. is 2-2.5 kg, Firm sweeet fruits good keeping quality. 	410	products/607398/607398.jpg	f	t	2021-01-15 11:15:25.388032+05:30	1	C000047	1	0	F1-Rambo	3530	25 gms
3532	Muskmelon	muskmelon-9b8j	Maturity days are 80-85 days after sowing, fruit shape is round or flat, Fruit Surface is Yellowish Orange with Green strips, Fruit Flesh clour is Orange, Fruit Av.Wt. is 1.0-1.5kg, Vigorous vines with 2-3 Firm fruits, sweeet taste.	0	products/553122/553122.jpeg	f	t	2021-01-15 11:15:25.394069+05:30	1	C000048	1	0	F1-Sujay	\N	
3533	Muskmelon	muskmelon-qgib	Maturity days are 80-85 days after sowing, fruit shape is round or flat, Fruit Surface is Yellowish Orange with Green strips, Fruit Flesh clour is Orange, Fruit Av.Wt. is 1.0-1.5kg, Vigorous vines with 2-3 Firm fruits, sweeet taste.	410	products/532771/532771.jpeg	f	t	2021-01-15 11:15:25.401703+05:30	1	C000048	1	0	F1-Sujay	3532	25 gms
3534	Muskmelon	muskmelon-jbuw	Maturity days are 85-90 days after sowing, fruit shape is round, Fruit Surface is Yellowish Orange with Netting, Fruit Flesh clour is Green, Fruit Av.Wt. is 1.5-2kg,   	0	products/1147005/1147005.jpg	f	t	2021-01-15 11:15:25.40856+05:30	1	C000049	1	0	F1-Samrat	\N	
3165	Amaranthus Green	amaranthus-green-as99	Amaranth plants can reach heights of over 2 meters tall with fleshy oval shaped leaves that are sometimes pointed at the tips.	0	products/1523589/1523589.jpg	f	t	2021-01-15 10:44:50.410482+05:30	3	H000001	1	0	nan	\N	
3190	Rosemary	rosemary-s644	Rosemary is described as a woody, perennial herb that can become a bushy shrub. The leaves are evergreen and needlelike in shape, and they produce the essential oil that gives rosemary its characteristic scent.	229	products/716456/716456.jpg	f	t	2021-01-15 10:44:50.585249+05:30	3	H000009	1	0	nan	3189	100 seeds
3538	Pumpkin	pumpkin	Maturity days are 85-90 days from sowing, fruit shape is Flatish round, Fruit surface is Green with white stripes tuens yellowish orange on maturity, Fruit Av. Wt is 4-5 kg. Attractive Early medium size hybrid with export quality	0	products/668172/668172.jpg	f	t	2021-01-15 11:15:25.43241+05:30	1	C000051	1	0	F1-Boss	\N	
3540	Pumpkin	pumpkin-40lo	Medium size fruits, flat shape, with bright yellow flesh, greyish-green skin, light yellow at the bottom. The flavor is very sweet and delicate. Maturity: 82-85 days from sowing, weight about 2.5-3.2 kg (5.5-7 lb). Tolerant to heat, Powdery mildew, Downy mildew.	0	products/1496429/1496429.jpg	f	t	2021-01-15 11:15:25.444383+05:30	1	C000052	1	0	F1-Druva	\N	
3541	Pumpkin	pumpkin-pcmz	Medium size fruits, flat shape, with bright yellow flesh, greyish-green skin, light yellow at the bottom. The flavor is very sweet and delicate. Maturity: 82-85 days from sowing, weight about 2.5-3.2 kg (5.5-7 lb). Tolerant to heat, Powdery mildew, Downy mildew.	620	products/1337752/1337752.jpg	f	t	2021-01-15 11:15:25.450369+05:30	1	C000052	1	0	F1-Druva	3540	50 gms
3542	Radish	radish	Maturity days are 35 days after sowing, fruit shape is cylindrical with tapering end,  Root colour is white,  Ealy, Tender & less fiber roots, Both roots  & leaves are edible.	0	products/434058/434058.jpg	f	t	2021-01-15 11:15:25.456572+05:30	1	C000053	1	0	Striker (2 in 1) 	\N	
3543	Radish	radish-x11u	Maturity days are 35 days after sowing, fruit shape is cylindrical with tapering end,  Root colour is white,  Ealy, Tender & less fiber roots, Both roots  & leaves are edible.	225	products/53256/53256.jpg	f	t	2021-01-15 11:15:25.462559+05:30	1	C000053	1	0	Striker (2 in 1) 	3542	250 gms
3544	Ridge Gourd	ridge-gourd	First picking is 47-50 daysafter sowing, Fruit shape is medium cylindrical with ridges, Fruit colour is green, Fruit length is 25-35cm, Fruit Av.Wt is 140-160 gm, Early hybrid with high yield with good disease tolerance.	0	products/460282/460282.jpg	f	t	2021-01-15 11:15:25.468962+05:30	1	C000054	1	0	F1-Siri	\N	
3545	Ridge Gourd	ridge-gourd-mbjs	First picking is 47-50 daysafter sowing, Fruit shape is medium cylindrical with ridges, Fruit colour is green, Fruit length is 25-35cm, Fruit Av.Wt is 140-160 gm, Early hybrid with high yield with good disease tolerance.	485	products/323557/323557.jpg	f	t	2021-01-15 11:15:25.473943+05:30	1	C000054	1	0	F1-Siri	3544	50 gms
3548	Sponge Gound	sponge-gound-yzv0	Plant type is High yielding sponge gourd seeds. The fruit is 24-26 cm long & weight is 100-150 gm. The fruit is dark green in colour.Sowing period: Whole year.Relative days of matuarity: 45-50 Days.	0	products/1444466/1444466.jpg	f	t	2021-01-15 11:15:25.492421+05:30	1	C000056	1	0	F1-Sofia	\N	
3537	Muskmelon	muskmelon-z7fv	Maturity days are 75-80 days after sowing, fruit shape is round, Fruit Surface is Creamy white dense netting, Fruit Flesh clour is Orange, Fruit Av.Wt. is 1.5-2.0kg, Hard rind with good keeping quality. Good Tolerance against viruses & Fusarium.  	690	products/1307486/1307486.jpg	f	t	2021-01-15 11:15:25.427141+05:30	1	C000050	1	0	F1-Mahi 	3536	25 gms
3554	Tomato	tomato-a3al	Plant Habit is Semi Determinate, Day to first harvest is 60-65 days after Transplanting, Fruit Weight is 90-100gm, Fruit shape is Flat Round, Glossy deep red colour, good keeping quality and suitable for long distance transportaion.	0	products/1366871/1366871.jpeg	f	t	2021-01-15 11:15:25.529819+05:30	1	C000059	1	0	F1-D-82	\N	
3549	Sponge Gound	sponge-gound-ze19	Plant type is High yielding sponge gourd seeds. The fruit is 24-26 cm long & weight is 100-150 gm. The fruit is dark green in colour.Sowing period: Whole year.Relative days of matuarity: 45-50 Days.	180	products/1232760/1232760.jpg	f	t	2021-01-15 11:15:25.499374+05:30	1	C000056	1	0	F1-Sofia	3548	50 gms
3550	Tomato	tomato	Plant Habit is Semi Determinate, Day to first harvest is 60-65 days after Transplanting, Fruit Weight is 80-100gm, Fruit shape is Round , High yileding hybrid, suitable for long distance transportaion.	0	products/1650347/1650347.jpg	f	t	2021-01-15 11:15:25.505889+05:30	1	C000057	1	0	F1-D-444	\N	
3551	Tomato	tomato-yi0o	Plant Habit is Semi Determinate, Day to first harvest is 60-65 days after Transplanting, Fruit Weight is 80-100gm, Fruit shape is Round , High yileding hybrid, suitable for long distance transportaion.	420	products/813140/813140.jpg	f	t	2021-01-15 11:15:25.510119+05:30	1	C000057	1	0	F1-D-444	3550	3000 seeds
3552	Tomato	tomato-q9ik	Plant Habit is Semi Determinate, Day to first harvest is 60-65 days after Transplanting, Fruit Weight is 100-120gm, Fruit shape is Flat Round , High yileding hybrid, suitable for long distance transportaion.	0	products/1172892/1172892.jpg	f	t	2021-01-15 11:15:25.516104+05:30	1	C000058	1	0	F1-D-99(Ratna)	\N	
3553	Tomato	tomato-rg58	Plant Habit is Semi Determinate, Day to first harvest is 60-65 days after Transplanting, Fruit Weight is 100-120gm, Fruit shape is Flat Round , High yileding hybrid, suitable for long distance transportaion.	800	products/191691/191691.jpg	f	t	2021-01-15 11:15:25.524695+05:30	1	C000058	1	0	F1-D-99(Ratna)	3552	3000 seeds
3555	Tomato	tomato-lkyo	Plant Habit is Semi Determinate, Day to first harvest is 60-65 days after Transplanting, Fruit Weight is 90-100gm, Fruit shape is Flat Round, Glossy deep red colour, good keeping quality and suitable for long distance transportaion.	380	products/1978505/1978505.jpeg	f	t	2021-01-15 11:15:25.535781+05:30	1	C000059	1	0	F1-D-82	3554	3000 seeds
3556	Tomato	tomato-bdpu	Plant Habit is Semi Determinate, Day to first harvest is 60-65 days after Transplanting, Fruit Weight is 100-120gm, Fruit shape is Flat Round , High yileding hybrid, suitable for long distance transportaion.	0	products/534778/534778.jpg	f	t	2021-01-15 11:15:25.543043+05:30	1	C000060	1	0	F1-D-83	\N	
3557	Tomato	tomato-rzp5	Plant Habit is Semi Determinate, Day to first harvest is 60-65 days after Transplanting, Fruit Weight is 100-120gm, Fruit shape is Flat Round , High yileding hybrid, suitable for long distance transportaion.	365	products/1342171/1342171.jpg	f	t	2021-01-15 11:15:25.550053+05:30	1	C000060	1	0	F1-D-83	3556	3000 seeds
3558	Tomato	tomato-ee4g	Plant Habit is Semi Determinate, Day to first harvest is 60-65 days after Transplanting, Fruit Weight is 100-120gm, Fruit shape is Square Round , High yileding hybrid, suitable for long distance transportaion.	0	products/1453508/1453508.jpg	f	t	2021-01-15 11:15:25.555742+05:30	1	C000061	1	0	F1-D-98(Sarati)	\N	
3578	Garden Cress	garden-cress	Garden Cress is a good source of nutrients, vitamins and minerals. Consuming 50 gram of garden cress 271 µg of Vitamin K, 34.5 mg of Vitamin C, 173 µg of Vitamin A,0.276 mg of Manganese,0.13 mg of Vitamin B2, 40 µg of Vitamin B9, 0.124 mg of Vitamin B6, 0.085 mg of Copper, 0.65 mg of Iron,303 mg of Potassium and 38 mg of Phosphorus.	0	products/1488013/1488013.jpg	f	t	2021-01-15 11:15:47.731884+05:30	4	M000003	1	0	nan	\N	
2952	Beetroot Gulab	beetroot-gulab	The Maturity is 50-55 days after sowing, root shape is round, root colour is blood red, fruit Av. Wt is 80-90 gm, FRC 30 days without cracking, crispy, sweet taste, less fibre, colour remains same, Pan India product.	0	products/1600220/1600220.jpg	f	t	2021-01-15 10:40:56.944055+05:30	2	K000001	1	0	nan	\N	
3561	Tomato	tomato-hl2f	Plant Habit is Semi Determinate, Day to first harvest is 60-65 days after Transplanting, Fruit Weight is 120-130gm, Fruit shape is  Round ,   Green shoulder, deep red colour, suitale for medium distance transportaion.	505	products/822002/822002.jpg	f	t	2021-01-15 11:15:25.576069+05:30	1	C000062	1	0	F1-D-81	3560	3000 seeds
3563	Tomato	tomato-dbxb	Plant Habit is Semi Determinate, Day to first harvest is 60-65 days after Transplanting, Fruit Weight is 110-120gm, Fruit shape is  Round , High yileding hybrid, Green shoulder, deep red colour, suitale for medium distance transportaion.	510	products/1521349/1521349.jpg	f	t	2021-01-15 11:15:25.589603+05:30	1	C000063	1	0	F1-D-80	3562	3000 seeds
3564	Tomato	tomato-e7j5	Plant Habit is Semi Determinate, Day to first harvest is 60-65 days after Transplanting, Fruit Weight is 90-100gm, Fruit shape is Round, Firm fruit, deep red colour, suitale for medium distance transportaion.	0	products/994248/994248.jpg	f	t	2021-01-15 11:15:25.596676+05:30	1	C000064	1	0	F1-D-79	\N	
3565	Tomato	tomato-76hl	Plant Habit is Semi Determinate, Day to first harvest is 60-65 days after Transplanting, Fruit Weight is 90-100gm, Fruit shape is Round, Firm fruit, deep red colour, suitale for medium distance transportaion.	505	products/550665/550665.jpg	f	t	2021-01-15 11:15:25.603657+05:30	1	C000064	1	0	F1-D-79	3564	3000 seeds
3566	Watermelon	watermelon	Maturity days are 75-80 days after sowing, fruit shape is Oblong, Fruit Surface is Dark Black, Fruit Flesh clour is Dark Red Crispy, Fruit Av.Wt. is 4-5kg, Attractive icebix type having hard rind Good disease tolerance  keeping quality.	0	products/493697/493697.jpg	f	t	2021-01-15 11:15:25.610727+05:30	1	C000065	1	0	F1-Black Beauty	\N	
3567	Watermelon	watermelon-ukf2	Maturity days are 75-80 days after sowing, fruit shape is Oblong, Fruit Surface is Dark Black, Fruit Flesh clour is Dark Red Crispy, Fruit Av.Wt. is 4-5kg, Attractive icebix type having hard rind Good disease tolerance  keeping quality.	1740	products/512974/512974.jpg	f	t	2021-01-15 11:15:25.615917+05:30	1	C000065	1	0	F1-Black Beauty	3566	50 gms
3569	watermelon 	watermelon-fjm8	Fruits are attractive oblong shaped. Dark green with thick rind and small seeds, Excellent keeping quality, suitable for long transportation. High tolerance to mosaic diseases, Flesh colour is deep crimson red with good texture and sweetness. Fruit weight is 3.3-3.5 kgs, Sugar content is 14% TSS.	1995	products/21650/21650.jpg	f	t	2021-01-15 11:15:25.629035+05:30	1	C000066	1	0	F1- Rocky	3568	50 gms
3570	Watermelon	watermelon-1lkh	Maturity days are 85-90 days after sowing, fruit shape is big Oblong, Fruit Surface is Green with Dark strips, Fruit Flesh clour is Dark Red , Fruit Av.Wt. is 8-10kg, Wider market Aceptance, thick skin, sweet Et juicy flesh, long shellfire,  Good disease tolerance keeping quality.	0	products/1147542/1147542.jpeg	f	t	2021-01-15 11:15:25.636385+05:30	1	C000067	1	0	F1- Melon King	\N	
2975	Bhendi/Okra Mejestic (Hybrid)	bhendiokra-mejestic-hybrid-mnl1	Plant type is medium, first picking is 42-48 days, fruit color is dark green, fruit length is 10-12 cm in length, 5 ridges,tall plant, 3-4 branches, prolific Beraing and short internodes resistant to YVMV.	169	products/1880286/1880286.jpg	t	t	2021-01-15 10:40:57.081918+05:30	2	K000008	1	0	nan	2973	1000 seeds
3571	Watermelon	watermelon-51y7	Maturity days are 85-90 days after sowing, fruit shape is big Oblong, Fruit Surface is Green with Dark strips, Fruit Flesh clour is Dark Red , Fruit Av.Wt. is 8-10kg, Wider market Aceptance, thick skin, sweet Et juicy flesh, long shellfire,  Good disease tolerance keeping quality.	605	products/1179161/1179161.jpeg	f	t	2021-01-15 11:15:25.642237+05:30	1	C000067	1	0	F1- Melon King	3570	50 gms
3035	Pumpkin Boss (Hybrid)	pumpkin-boss-hybrid-sws9	Maturity days are 85-90 days from sowing, fruit shape is Flatish round, Fruit surface is Green with white stripes tuens yellowish orange on maturity, Fruit Av. Wt is 4-5 kg. Attractive Early medium size hybrid with export quality	499	products/673441/673441.jpg	f	t	2021-01-15 10:40:57.569911+05:30	2	K000028	1	0	nan	3033	1000 seeds
3560	Tomato	tomato-n2n2	Plant Habit is Semi Determinate, Day to first harvest is 60-65 days after Transplanting, Fruit Weight is 120-130gm, Fruit shape is  Round ,   Green shoulder, deep red colour, suitale for medium distance transportaion.	0	products/590721/590721.jpg	f	t	2021-01-15 11:15:25.570363+05:30	1	C000062	1	0	F1-D-81	\N	
2995	Cabbage (Hybrid)	cabbage-hybrid-f64x	he plant type is Erect type Green Small leaves, Days of Maturity 55-60 days after transplanting, Head shape is Round, Very Compact, Head Weight is 1- 1.5 kg, FH Capacity is 25-30days after Marurity, Very Compact with Small Erect Foliage suitable for close spacing.	69	products/1341875/1341875.jpg	f	t	2021-01-15 10:40:57.235025+05:30	2	K000015	1	0	nan	2994	50 seeds
3015	Cucumber Light Green (Hybrid)	cucumber-light-green-hybrid	Fruit picking is 45-45 days after Sowing, fruit Shape is cylindrical, fruit colour is mottle Green, 15-18cm of  fruit length, Av.fruit Wt. is 150-200gm, Mosaic Tolerant, good Keeping quality and suitable for long transporation. 	0	products/1509689/1509689.jpg	f	t	2021-01-15 10:40:57.412882+05:30	2	K000022	1	0	nan	\N	
3055	Tomato Oval (Hybrid)	tomato-oval-hybrid-rklf	Plant Habit is Semi Determinate, Day to first harvest is 60-65 days after Transplanting, Fruit Weight is 100-120gm, Fruit shape is Oval,  Attractive Red High yielding hybrid with heat tolerance, tolerant to Fusarium, bacterial with 6 TYLCV.	69	products/652481/652481.jpg	f	t	2021-01-15 10:40:57.695271+05:30	2	K000035	1	0	nan	3054	50 seeds
3078	Marigold Orange (Hybrid)	marigold-orange-hybrid	The plnat Height is 75-90cm, Flowering is 55-60 days after Transplanting, Flower colour is Orange, Flower Av. Wt is 14-15gm, Double petales compact flowers, good keepin quality.	0	products/561683/561683.jpg	f	t	2021-01-15 10:40:57.892445+05:30	2	K000043	1	0	nan	\N	
3581	White Radish (2 in 1)	white-radish-2-in-1	Radish microgreens are rich in various nutrients which includes carbohydrate, dietary fiber, and vitamins (folate, vitamin B1, B2, B3, B5, B6, and C).	0	products/991987/991987.jpg	f	t	2021-01-15 11:15:47.752632+05:30	4	M000004	1	0	nan	\N	
3606	Mustard	mustard-dr6u	Mustard microgreens is dense with protein, fibre, folate, calcium, iron. These microgreens are capable for fighting with diabetes and other lifestyle conditions.  It also stimulates healthy hair growth. It helps to relieve congestion and clear out sinuses.	69	products/303718/303718.jpg	f	t	2021-01-15 11:15:47.922944+05:30	4	M000012	1	0	nan	3605	500 seeds
3101	Onion Light Red	onion-light-red-vpqo	The Maturity days are 110-120 days after transplanting, Bulb Shape is  Round, Bulb Colour is dark red, Bulb Av. Wt 100gm, Sowing season is Kharif, uniforn size bulbs for fesh market.	129	products/308379/308379.jpg	f	t	2021-01-15 10:40:58.085723+05:30	2	K000050	1	0	nan	3099	1000 seeds
3122	Mint	mint-m96w	Mint plants are mainly aromatic perennials and they possess erect, branching stems and oblong to ovate or lanceolate leaves arranged in opposing pairs on the stems. The leaves are often covered in tiny hairs and have a serrated margin.	1159	products/1743828/1743828.jpg	f	t	2021-01-15 10:40:58.232081+05:30	2	K000057	1	0	nan	3120	1000 seeds
3145	Amaranthus Red	amaranthus-red-cnkz	It has a rosette of leaves at the base of the plant; a deep taproot; a smooth, hollow stem; leaves that may be nearly smooth-margined, toothed, or deeply cut; and a solitary yellow flower head composed only of ray flowers (no disk flowers).	69	products/1857419/1857419.jpg	f	t	2021-01-15 10:40:58.379716+05:30	2	K000065	1	0	nan	3144	500 seeds
3582	White Radish (2 in 1)	white-radish-2-in-1-nhbx	Radish microgreens are rich in various nutrients which includes carbohydrate, dietary fiber, and vitamins (folate, vitamin B1, B2, B3, B5, B6, and C).	69	products/1859725/1859725.jpg	f	t	2021-01-15 11:15:47.760894+05:30	4	M000004	1	0	nan	3581	500 seeds
3583	White Radish (2 in 1)	white-radish-2-in-1-p2f1	Radish microgreens are rich in various nutrients which includes carbohydrate, dietary fiber, and vitamins (folate, vitamin B1, B2, B3, B5, B6, and C).	129	products/323780/323780.jpg	f	t	2021-01-15 11:15:47.767893+05:30	4	M000004	1	0	nan	3581	1000 seeds
3584	Cabbage	cabbage-macr	Cabbage microgreen is packed with so many beneficial minerals, vitamins (C, K) minerals and other nutrients. It is rich in fiber, beta-carotene, calcium, magnesium, potassium, iodine, and sulfur.	0	products/1476453/1476453.jpg	f	t	2021-01-15 11:15:47.775857+05:30	4	M000005	1	0	nan	\N	
3585	Cabbage	cabbage-dipk	Cabbage microgreen is packed with so many beneficial minerals, vitamins (C, K) minerals and other nutrients. It is rich in fiber, beta-carotene, calcium, magnesium, potassium, iodine, and sulfur.	89	products/1137133/1137133.jpg	f	t	2021-01-15 11:15:47.780716+05:30	4	M000005	1	0	nan	3584	500 seeds
3587	Chinese Cabbage	chinese-cabbage-p4kb	Are rich in nutrients. They often contain larger amounts of vitamins, minerals and antioxidants than their more mature counterparts.	0	products/1425827/1425827.jpg	f	t	2021-01-15 11:15:47.795717+05:30	4	M000006	1	0	nan	\N	
3588	Chinese Cabbage	chinese-cabbage-1fyv	Are rich in nutrients. They often contain larger amounts of vitamins, minerals and antioxidants than their more mature counterparts.	89	products/1349776/1349776.jpg	f	t	2021-01-15 11:15:47.801901+05:30	4	M000006	1	0	nan	3587	500 seeds
3589	Chinese Cabbage	chinese-cabbage-qct6	Are rich in nutrients. They often contain larger amounts of vitamins, minerals and antioxidants than their more mature counterparts.	169	products/1246986/1246986.jpg	f	t	2021-01-15 11:15:47.808752+05:30	4	M000006	1	0	nan	3587	1000 seeds
3590	Flax	flax	Contains Vitamins A, B, C and E, Calcium, Iron, Magnesium, Niacin, Phosphorus, Potassium, All Essential Amino Acids, Antioxidants and 20-25% protein.	0	products/1072608/1072608.jpg	f	t	2021-01-15 11:15:47.815711+05:30	4	M000007	1	0	nan	\N	
3591	Flax	flax-dx26	Contains Vitamins A, B, C and E, Calcium, Iron, Magnesium, Niacin, Phosphorus, Potassium, All Essential Amino Acids, Antioxidants and 20-25% protein.	69	products/1342946/1342946.jpg	f	t	2021-01-15 11:15:47.820706+05:30	4	M000007	1	0	nan	3590	500 seeds
3592	Flax	flax-8r7v	Contains Vitamins A, B, C and E, Calcium, Iron, Magnesium, Niacin, Phosphorus, Potassium, All Essential Amino Acids, Antioxidants and 20-25% protein.	129	products/349583/349583.jpg	f	t	2021-01-15 11:15:47.829245+05:30	4	M000007	1	0	nan	3590	1000 seeds
3593	Alfalfa	alfalfa	Alfalfa has been shown to help lower cholesterol, and may also have benefits for blood sugar control and relieving symptoms of menopause. People also take it for its high content of antioxidants, vitamins C and K, copper, folate and magnesium. Alfalfa is also extremely low in calories.	0	products/1567722/1567722.jpg	f	t	2021-01-15 11:15:47.836078+05:30	4	M000008	1	0	nan	\N	
3594	Alfalfa	alfalfa-j2it	Alfalfa has been shown to help lower cholesterol, and may also have benefits for blood sugar control and relieving symptoms of menopause. People also take it for its high content of antioxidants, vitamins C and K, copper, folate and magnesium. Alfalfa is also extremely low in calories.	69	products/901249/901249.jpg	f	t	2021-01-15 11:15:47.841188+05:30	4	M000008	1	0	nan	3593	500 seeds
3595	Alfalfa	alfalfa-4x9f	Alfalfa has been shown to help lower cholesterol, and may also have benefits for blood sugar control and relieving symptoms of menopause. People also take it for its high content of antioxidants, vitamins C and K, copper, folate and magnesium. Alfalfa is also extremely low in calories.	129	products/978005/978005.jpg	f	t	2021-01-15 11:15:47.84794+05:30	4	M000008	1	0	nan	3593	1000 seeds
3596	Sesame	sesame	Are rich in nutrients. They often contain larger amounts of vitamins, minerals and antioxidants than their more mature counterparts.	0	products/1218312/1218312.jpg	f	t	2021-01-15 11:15:47.856709+05:30	4	M000009	1	0	nan	\N	
3597	Sesame	sesame-0ya7	Are rich in nutrients. They often contain larger amounts of vitamins, minerals and antioxidants than their more mature counterparts.	69	products/1831277/1831277.jpg	f	t	2021-01-15 11:15:47.863623+05:30	4	M000009	1	0	nan	3596	500 seeds
3598	Sesame	sesame-tp6l	Are rich in nutrients. They often contain larger amounts of vitamins, minerals and antioxidants than their more mature counterparts.	129	products/601979/601979.jpg	f	t	2021-01-15 11:15:47.871356+05:30	4	M000009	1	0	nan	3596	1000 seeds
3599	Kale	kale-ykye	Kale can be an especially good source of antioxidant vitamins and the minerals potassium and calcium.	0	products/1804056/1804056.jpg	f	t	2021-01-15 11:15:47.877259+05:30	4	M000010	1	0	nan	\N	
3600	Kale	kale-zm9n	Kale can be an especially good source of antioxidant vitamins and the minerals potassium and calcium.	89	products/1524943/1524943.jpg	f	t	2021-01-15 11:15:47.885269+05:30	4	M000010	1	0	nan	3599	500 seeds
3601	Kale	kale-3dgp	Kale can be an especially good source of antioxidant vitamins and the minerals potassium and calcium.	169	products/66014/66014.jpg	f	t	2021-01-15 11:15:47.892148+05:30	4	M000010	1	0	nan	3599	1000 seeds
3603	Chia	chia-pd3n	Contains Vitamins A, B, C, and E, Calcium, Iron, Magnesium, Niacin, Phosphorus, Potassium, Zinc, Chlorophyll, Amino Acids, Antioxidants and 20-25% protein.	69	products/369402/369402.jpg	f	t	2021-01-15 11:15:47.904118+05:30	4	M000011	1	0	nan	3602	500 seeds
3604	Chia	chia-cr5w	Contains Vitamins A, B, C, and E, Calcium, Iron, Magnesium, Niacin, Phosphorus, Potassium, Zinc, Chlorophyll, Amino Acids, Antioxidants and 20-25% protein.	129	products/1113407/1113407.jpg	f	t	2021-01-15 11:15:47.910596+05:30	4	M000011	1	0	nan	3602	1000 seeds
3607	Mustard	mustard-6dg4	Mustard microgreens is dense with protein, fibre, folate, calcium, iron. These microgreens are capable for fighting with diabetes and other lifestyle conditions.  It also stimulates healthy hair growth. It helps to relieve congestion and clear out sinuses.	129	products/1792307/1792307.jpg	f	t	2021-01-15 11:15:47.930637+05:30	4	M000012	1	0	nan	3605	1000 seeds
3608	Arugula	arugula	Arugula microgreens contain almost eight times the calcium, five times the vitamin A, vitamin C, and vitamin K, and four times the iron as the iceberg lettuce. Microgreens are also a rich source of nutrients, vitamins E, L, lutein, and beta-carotene.	0	products/417537/417537.jpg	f	t	2021-01-15 11:15:47.937643+05:30	4	M000013	1	0	nan	\N	
3609	Arugula	arugula-7wzf	Arugula microgreens contain almost eight times the calcium, five times the vitamin A, vitamin C, and vitamin K, and four times the iron as the iceberg lettuce. Microgreens are also a rich source of nutrients, vitamins E, L, lutein, and beta-carotene.	69	products/1207366/1207366.jpg	f	t	2021-01-15 11:15:47.944535+05:30	4	M000013	1	0	nan	3608	500 seeds
3611	Basil	basil-qgse	Basil microgreens are surprisingly full of nutrients. They contain protein, vitamins E, A, K, B6, and C; as well as calcium, iron, zinc, magnesium, copper, phosphorous, and even potassium.	0	products/1782895/1782895.jpg	f	t	2021-01-15 11:15:47.958776+05:30	4	M000014	1	0	nan	\N	
3612	Basil	basil-5zc2	Basil microgreens are surprisingly full of nutrients. They contain protein, vitamins E, A, K, B6, and C; as well as calcium, iron, zinc, magnesium, copper, phosphorous, and even potassium.	89	products/154469/154469.jpg	f	t	2021-01-15 11:15:47.964758+05:30	4	M000014	1	0	nan	3611	500 seeds
3613	Basil	basil-mbqf	Basil microgreens are surprisingly full of nutrients. They contain protein, vitamins E, A, K, B6, and C; as well as calcium, iron, zinc, magnesium, copper, phosphorous, and even potassium.	169	products/1693414/1693414.jpg	f	t	2021-01-15 11:15:47.972737+05:30	4	M000014	1	0	nan	3611	1000 seeds
3614	Pok Choi	pok-choi-hj6b	Bok choy’s folate, potassium, vitamin C, and vitamin B-6 content, coupled with its lack of cholesterol, all help to maintain a healthy heart.	0	products/225790/225790.jpg	f	t	2021-01-15 11:15:47.981713+05:30	4	M000015	1	0	nan	\N	
3615	Pok Choi	pok-choi-p9r3	Bok choy’s folate, potassium, vitamin C, and vitamin B-6 content, coupled with its lack of cholesterol, all help to maintain a healthy heart.	89	products/1937076/1937076.jpg	f	t	2021-01-15 11:15:47.988694+05:30	4	M000015	1	0	nan	3614	500 seeds
3616	Pok Choi	pok-choi-ke5q	Bok choy’s folate, potassium, vitamin C, and vitamin B-6 content, coupled with its lack of cholesterol, all help to maintain a healthy heart.	169	products/476109/476109.jpg	f	t	2021-01-15 11:15:47.995676+05:30	4	M000015	1	0	nan	3614	1000 seeds
3617	Lettuce	lettuce-qanu	Abundant in vitamin C, loaded with beta-carotene, which helps in reducing the risk of cancer and eye diseases. These tiny, edible greens also make for a good source of vitamin E and K.	0	products/369627/369627.jpg	f	t	2021-01-15 11:15:48.004652+05:30	4	M000016	1	0	nan	\N	
3618	Lettuce	lettuce-u1y4	Abundant in vitamin C, loaded with beta-carotene, which helps in reducing the risk of cancer and eye diseases. These tiny, edible greens also make for a good source of vitamin E and K.	89	products/691025/691025.jpg	f	t	2021-01-15 11:15:48.010992+05:30	4	M000016	1	0	nan	3617	500 seeds
3619	Lettuce	lettuce-bdoh	Abundant in vitamin C, loaded with beta-carotene, which helps in reducing the risk of cancer and eye diseases. These tiny, edible greens also make for a good source of vitamin E and K.	169	products/229289/229289.jpg	f	t	2021-01-15 11:15:48.018966+05:30	4	M000016	1	0	nan	3617	1000 seeds
3620	Red Lettuce	red-lettuce-g16a	Are rich in nutrients. They often contain larger amounts of vitamins, minerals and antioxidants than their more mature counterparts.	0	products/430311/430311.jpg	f	t	2021-01-15 11:15:48.026925+05:30	4	M000017	1	0	nan	\N	
3621	Red Lettuce	red-lettuce-dsq2	Are rich in nutrients. They often contain larger amounts of vitamins, minerals and antioxidants than their more mature counterparts.	99	products/702498/702498.jpg	f	t	2021-01-15 11:15:48.032909+05:30	4	M000017	1	0	nan	3620	500 seeds
3622	Red Lettuce	red-lettuce-uiln	Are rich in nutrients. They often contain larger amounts of vitamins, minerals and antioxidants than their more mature counterparts.	179	products/1919212/1919212.jpg	f	t	2021-01-15 11:15:48.040887+05:30	4	M000017	1	0	nan	3620	1000 seeds
3623	Parsley Gaint	parsley-gaint-ved8	Parsley offers excellent flavor to any dish it is added too.  Use it as a garnish, or anywhere you'd use parsley.  This micro boasts medium green stems with pale, light green stems.  Parsley is an easy microgreen to grow, but it does have longer germination times.  	0	products/1272905/1272905.jpg	f	t	2021-01-15 11:15:48.050266+05:30	4	M000018	1	0	nan	\N	
3625	Parsley Gaint	parsley-gaint-vpth	Parsley offers excellent flavor to any dish it is added too.  Use it as a garnish, or anywhere you'd use parsley.  This micro boasts medium green stems with pale, light green stems.  Parsley is an easy microgreen to grow, but it does have longer germination times.  	129	products/1530907/1530907.jpg	f	t	2021-01-15 11:15:48.063273+05:30	4	M000018	1	0	nan	3623	1000 seeds
3626	Clover	clover	Clover microgreen is a source of many valuable nutrients including proteins, minerals, including calcium, iron, magnesium, potassium, silicon, as well as vitamins A, B-12, C, E and K.	0	products/1295079/1295079.jpg	f	t	2021-01-15 11:15:48.070032+05:30	4	M000019	1	0	nan	\N	
3627	Clover	clover-16ha	Clover microgreen is a source of many valuable nutrients including proteins, minerals, including calcium, iron, magnesium, potassium, silicon, as well as vitamins A, B-12, C, E and K.	79	products/1104469/1104469.jpg	f	t	2021-01-15 11:15:48.077799+05:30	4	M000019	1	0	nan	3626	500 seeds
3628	Clover	clover-abur	Clover microgreen is a source of many valuable nutrients including proteins, minerals, including calcium, iron, magnesium, potassium, silicon, as well as vitamins A, B-12, C, E and K.	159	products/703826/703826.jpg	f	t	2021-01-15 11:15:48.084915+05:30	4	M000019	1	0	nan	3626	1000 seeds
3629	Kholrabi	kholrabi	Kohlrabi microgreens are very nutritious and contains over 100% of the recommended daily value of Vitamin C. It's also high in Vitamin B6, Folate (B9), Thiamin (B1), potassium, phosphorus, and calcium.	0	products/972837/972837.jpg	f	t	2021-01-15 11:15:48.091899+05:30	4	M000020	1	0	nan	\N	
3630	Kholrabi	kholrabi-avls	Kohlrabi microgreens are very nutritious and contains over 100% of the recommended daily value of Vitamin C. It's also high in Vitamin B6, Folate (B9), Thiamin (B1), potassium, phosphorus, and calcium.	79	products/942142/942142.jpg	f	t	2021-01-15 11:15:48.097381+05:30	4	M000020	1	0	nan	3629	500 seeds
3633	Broccoli	broccoli-7gi3	Nutritional powerhouse Broccoli microgreens have larger quantities of magnesium, manganese, copper, and zinc. These are very essential minerals that most people are deficient in.	99	products/1440684/1440684.jpg	f	t	2021-01-15 11:15:48.116918+05:30	4	M000021	1	0	nan	3632	500 seeds
3634	Broccoli	broccoli-iv3u	Nutritional powerhouse Broccoli microgreens have larger quantities of magnesium, manganese, copper, and zinc. These are very essential minerals that most people are deficient in.	179	products/517858/517858.jpg	f	t	2021-01-15 11:15:48.125009+05:30	4	M000021	1	0	nan	3632	1000 seeds
3635	Beetroot	beetroot-mvbi	These rosy green shoots are rich source of vitamins A, B, C, E and K. Shoots are also the rich reservoir of Calcium, Iron, Magnesium, Phosphorus, Potassium, and Zinc. Pigments such as Carotene, Chlorophyll, and Amino Acids are also found in it.	0	products/778987/778987.jpg	f	t	2021-01-15 11:15:48.130929+05:30	4	M000022	1	0	nan	\N	
3636	Beetroot	beetroot-2x09	These rosy green shoots are rich source of vitamins A, B, C, E and K. Shoots are also the rich reservoir of Calcium, Iron, Magnesium, Phosphorus, Potassium, and Zinc. Pigments such as Carotene, Chlorophyll, and Amino Acids are also found in it.	79	products/376434/376434.jpg	f	t	2021-01-15 11:15:48.13961+05:30	4	M000022	1	0	nan	3635	500 seeds
3637	Beetroot	beetroot-8he0	These rosy green shoots are rich source of vitamins A, B, C, E and K. Shoots are also the rich reservoir of Calcium, Iron, Magnesium, Phosphorus, Potassium, and Zinc. Pigments such as Carotene, Chlorophyll, and Amino Acids are also found in it.	159	products/647029/647029.jpg	f	t	2021-01-15 11:15:48.146446+05:30	4	M000022	1	0	nan	3635	1000 seeds
3639	Methi/Fenugreek	methifenugreek-gbfg	These are rich in vitamins and essential for optimum health such as vitamin A, C, thiamine and folic acid. Fenugreek also helps in improving the homeostasis of glucose. Two teaspoons of fenugreek contain 3 – 4 gm of fibre. Fenugreek is affordable, high in fibre and complex carbohydrates.	69	products/1862000/1862000.jpg	f	t	2021-01-15 11:15:48.159451+05:30	4	M000023	1	0	nan	3638	500 seeds
3640	Methi/Fenugreek	methifenugreek-wahx	These are rich in vitamins and essential for optimum health such as vitamin A, C, thiamine and folic acid. Fenugreek also helps in improving the homeostasis of glucose. Two teaspoons of fenugreek contain 3 – 4 gm of fibre. Fenugreek is affordable, high in fibre and complex carbohydrates.	129	products/347802/347802.jpg	f	t	2021-01-15 11:15:48.165851+05:30	4	M000023	1	0	nan	3638	1000 seeds
3641	Onion	onion	Onion microgreens do have nutritional benefits. Onion & leek microgreens contain Vitamins, A, B, C and E, calcium, iron, zinc, phosphorus, magnesium, potassium, and amino acids to your diet.	0	products/1779465/1779465.jpg	f	t	2021-01-15 11:15:48.173478+05:30	4	M000024	1	0	nan	\N	
3642	Onion	onion-spk5	Onion microgreens do have nutritional benefits. Onion & leek microgreens contain Vitamins, A, B, C and E, calcium, iron, zinc, phosphorus, magnesium, potassium, and amino acids to your diet.	69	products/1979242/1979242.jpg	f	t	2021-01-15 11:15:48.178456+05:30	4	M000024	1	0	nan	3641	500 seeds
3643	Onion	onion-y9g2	Onion microgreens do have nutritional benefits. Onion & leek microgreens contain Vitamins, A, B, C and E, calcium, iron, zinc, phosphorus, magnesium, potassium, and amino acids to your diet.	129	products/833771/833771.jpg	f	t	2021-01-15 11:15:48.185043+05:30	4	M000024	1	0	nan	3641	1000 seeds
3644	Carrot	carrot-5h7l	Exceptionally rich source of anti oxidants, carotenes and vitamin A, this variety of microgreens helps keep skin, lung and oral cavity cancers at bay. Best grown in soil or other growing medium.	0	products/1503195/1503195.jpg	f	t	2021-01-15 11:15:48.191838+05:30	4	M000025	1	0	nan	\N	
3645	Carrot	carrot-e7bv	Exceptionally rich source of anti oxidants, carotenes and vitamin A, this variety of microgreens helps keep skin, lung and oral cavity cancers at bay. Best grown in soil or other growing medium.	69	products/516280/516280.jpg	f	t	2021-01-15 11:15:48.197822+05:30	4	M000025	1	0	nan	3644	500 seeds
3646	Carrot	carrot-3xt0	Exceptionally rich source of anti oxidants, carotenes and vitamin A, this variety of microgreens helps keep skin, lung and oral cavity cancers at bay. Best grown in soil or other growing medium.	129	products/580656/580656.jpg	f	t	2021-01-15 11:15:48.204832+05:30	4	M000025	1	0	nan	3644	1000 seeds
3647	Spinach/Palak	spinachpalak-p8vu	Richer sources of various micronutrient especially vitamins and minerals. Some of the lipophilic vitamins are much higher in microgreens than mature parts. Like vitamin E content of microgreens is forty times higher than the mature parts.	0	products/1088716/1088716.jpg	f	t	2021-01-15 11:15:48.211785+05:30	4	M000026	1	0	nan	\N	
3649	Spinach/Palak	spinachpalak-c1rg	Richer sources of various micronutrient especially vitamins and minerals. Some of the lipophilic vitamins are much higher in microgreens than mature parts. Like vitamin E content of microgreens is forty times higher than the mature parts.	129	products/845996/845996.jpg	f	t	2021-01-15 11:15:48.225508+05:30	4	M000026	1	0	nan	3647	1000 seeds
3650	Cauliflower	cauliflower	Cauliflower microgreens have more flavor than broccoli microgreens. Nutrients: Vitamins C, K, and E, beta-carotene, and iron.	0	products/1234238/1234238.jpg	f	t	2021-01-15 11:15:48.234786+05:30	4	M000027	1	0	nan	\N	
3651	Cauliflower	cauliflower-nkog	Cauliflower microgreens have more flavor than broccoli microgreens. Nutrients: Vitamins C, K, and E, beta-carotene, and iron.	89	products/121102/121102.jpg	f	t	2021-01-15 11:15:48.240569+05:30	4	M000027	1	0	nan	3650	500 seeds
3652	Cauliflower	cauliflower-f489	Cauliflower microgreens have more flavor than broccoli microgreens. Nutrients: Vitamins C, K, and E, beta-carotene, and iron.	179	products/1714748/1714748.jpg	f	t	2021-01-15 11:15:48.247198+05:30	4	M000027	1	0	nan	3650	1000 seeds
3653	Carom seeds (Ajwain)	carom-seeds-ajwain	Are rich in nutrients. They often contain larger amounts of vitamins, minerals and antioxidants than their more mature counterparts.	0	products/1915978/1915978.jpg	f	t	2021-01-15 11:15:48.254629+05:30	4	M000028	1	0	nan	\N	
3654	Carom seeds (Ajwain)	carom-seeds-ajwain-negm	Are rich in nutrients. They often contain larger amounts of vitamins, minerals and antioxidants than their more mature counterparts.	69	products/1688745/1688745.jpg	f	t	2021-01-15 11:15:48.258856+05:30	4	M000028	1	0	nan	3653	500 seeds
3655	Carom seeds (Ajwain)	carom-seeds-ajwain-59a4	Are rich in nutrients. They often contain larger amounts of vitamins, minerals and antioxidants than their more mature counterparts.	129	products/982691/982691.jpg	f	t	2021-01-15 11:15:48.265342+05:30	4	M000028	1	0	nan	3653	1000 seeds
3656	Fennel seeds (Sauf)	fennel-seeds-sauf	Are rich in nutrients. They often contain larger amounts of vitamins, minerals and antioxidants than their more mature counterparts.	0	products/225528/225528.jpg	f	t	2021-01-15 11:15:48.271784+05:30	4	M000029	1	0	nan	\N	
3658	Fennel seeds (Sauf)	fennel-seeds-sauf-mx57	Are rich in nutrients. They often contain larger amounts of vitamins, minerals and antioxidants than their more mature counterparts.	129	products/1010246/1010246.jpg	f	t	2021-01-15 11:15:48.284777+05:30	4	M000029	1	0	nan	3656	1000 seeds
3659	Coriander	coriander-iy99	Cilantro microgreens have a slightly lower concentration of vitamin C than an orange. Cilantro microgreens contain very high levels of the carotenoids lutein/ zeaxanthin, violaxanthin and beta carotene, which are fat soluble antioxidants important for organ function and protecting cellular structures from damage.	0	products/344783/344783.jpg	f	t	2021-01-15 11:15:48.291378+05:30	4	M000030	1	0	nan	\N	
3660	Coriander	coriander-hdvn	Cilantro microgreens have a slightly lower concentration of vitamin C than an orange. Cilantro microgreens contain very high levels of the carotenoids lutein/ zeaxanthin, violaxanthin and beta carotene, which are fat soluble antioxidants important for organ function and protecting cellular structures from damage.	69	products/1241053/1241053.jpg	f	t	2021-01-15 11:15:48.297721+05:30	4	M000030	1	0	nan	3659	500 seeds
3661	Coriander	coriander-1cq3	Cilantro microgreens have a slightly lower concentration of vitamin C than an orange. Cilantro microgreens contain very high levels of the carotenoids lutein/ zeaxanthin, violaxanthin and beta carotene, which are fat soluble antioxidants important for organ function and protecting cellular structures from damage.	129	products/1949239/1949239.jpg	f	t	2021-01-15 11:15:48.304702+05:30	4	M000030	1	0	nan	3659	1000 seeds
3662	Dill Seeds	dill-seeds-6kgp	Contains Vitamins A, B, C, E and K. Calcium, Iron, Magnesium, Phosphorus, Potassium, Zinc. Carotene, Chlorophyll, Amino Acids, Trace Elements.	0	products/359810/359810.jpg	f	t	2021-01-15 11:15:48.311562+05:30	4	M000031	1	0	nan	\N	
3663	Dill Seeds	dill-seeds-i12v	Contains Vitamins A, B, C, E and K. Calcium, Iron, Magnesium, Phosphorus, Potassium, Zinc. Carotene, Chlorophyll, Amino Acids, Trace Elements.	69	products/434769/434769.jpg	f	t	2021-01-15 11:15:48.316755+05:30	4	M000031	1	0	nan	3662	500 seeds
3664	Dill Seeds	dill-seeds-flas	Contains Vitamins A, B, C, E and K. Calcium, Iron, Magnesium, Phosphorus, Potassium, Zinc. Carotene, Chlorophyll, Amino Acids, Trace Elements.	129	products/1267647/1267647.jpg	f	t	2021-01-15 11:15:48.324225+05:30	4	M000031	1	0	nan	3662	1000 seeds
3665	Celery	celery-ktcm	Contains Vitamins A, B, C, and E. Calcium, Iron, Magnesium, Phosphorus, Potassium, Zinc. Chlorophyll, Amino Acids. Antioxidants. Protein: 20%	0	products/1566877/1566877.jpg	f	t	2021-01-15 11:15:48.331491+05:30	4	M000032	1	0	nan	\N	
3666	Celery	celery-5m0k	Contains Vitamins A, B, C, and E. Calcium, Iron, Magnesium, Phosphorus, Potassium, Zinc. Chlorophyll, Amino Acids. Antioxidants. Protein: 20%	79	products/1583365/1583365.jpg	f	t	2021-01-15 11:15:48.336837+05:30	4	M000032	1	0	nan	3665	500 seeds
3667	Celery	celery-sfxv	Contains Vitamins A, B, C, and E. Calcium, Iron, Magnesium, Phosphorus, Potassium, Zinc. Chlorophyll, Amino Acids. Antioxidants. Protein: 20%	159	products/1348123/1348123.jpg	f	t	2021-01-15 11:15:48.344856+05:30	4	M000032	1	0	nan	3665	1000 seeds
3668	Kholrabi/Knol-khol	kholrabiknol-khol-o7gx	Knol knol microgreens are very nutritious and contains over 100% of the recommended daily value of Vitamin C. It's also high in Vitamin B6, Folate (B9), Thiamin (B1), potassium, phosphorus, and calcium.	0	products/1884562/1884562.jpg	f	t	2021-01-15 11:15:48.352213+05:30	4	M000033	1	0	nan	\N	
3669	Kholrabi/Knol-khol	kholrabiknol-khol-ehtk	Knol knol microgreens are very nutritious and contains over 100% of the recommended daily value of Vitamin C. It's also high in Vitamin B6, Folate (B9), Thiamin (B1), potassium, phosphorus, and calcium.	49	products/1720518/1720518.jpg	f	t	2021-01-15 11:15:48.35776+05:30	4	M000033	1	0	nan	3668	500 seeds
3671	Chilly	chilly-94ar	Are rich in nutrients. They often contain larger amounts of vitamins, minerals and antioxidants than their more mature counterparts.	0	products/171811/171811.jpg	f	t	2021-01-15 11:15:48.372846+05:30	4	M000034	1	0	nan	\N	
3672	Chilly	chilly-swl5	Are rich in nutrients. They often contain larger amounts of vitamins, minerals and antioxidants than their more mature counterparts.	49	products/602791/602791.jpg	f	t	2021-01-15 11:15:48.378362+05:30	4	M000034	1	0	nan	3671	500 seeds
3673	Chilly	chilly-fpn5	Are rich in nutrients. They often contain larger amounts of vitamins, minerals and antioxidants than their more mature counterparts.	129	products/1097342/1097342.jpg	f	t	2021-01-15 11:15:48.38514+05:30	4	M000034	1	0	nan	3671	1000 seeds
3427	Beetroot	beetroot-57px	Maturity is 50-55 days after sowing, Root shape is round, Root colour is Blood red. Fruit Av. Wt 80-100gm, FRC 30 days without cracking,Crispy, sweet taste, less fiber,Colour remains same. PAN India product	481	products/1333252/1333252.jpg	f	t	2021-01-15 11:15:24.720831+05:30	1	C000001	1	0	Gulab	3426	150 gms
3429	Beetroot	beetroot-xy43	Maturity is 40-45 days after sowing, Root shape is round, Root colour is Dark red. Fruit Av. Wt 120-150gm, FRC 30 days without cracking,Unique beetroot shape, sweet taste, Smooth and crispy flesh.	870	products/1322925/1322925.jpg	f	t	2021-01-15 11:15:24.733755+05:30	1	C000002	1	0	F1-Rado	3428	150 gms
3430	Bhendi/Okra	bhendiokra	Plant type is medium, first picking is 42-48 days, fruit color is dark green, fruit length is 10-12 cm in length, 5 ridges,tall plant, 3-4 branches, prolific Beraing and short internodes resistant to YVMV.  	0	products/568463/568463.jpg	f	t	2021-01-15 11:15:24.740246+05:30	1	C000003	1	0	F1-Majestic	\N	
3432	Bhendi/Okra	bhendiokra-cf4v	Plant type is medium, first picking is 42-48 days, fruit color is dark green, fruit length is 10-12 cm in length, 5 ridges,tall plant, 3-4 branches, prolific Beraing and short internodes resistant to YVMV.  	675	products/811570/811570.jpg	f	t	2021-01-15 11:15:24.753266+05:30	1	C000003	1	0	F1-Majestic	3430	250 gms
3434	Bhendi/Okra	bhendiokra-pv8c	The Plant typpe is Tall, first Picking takes 40-45 days after swing, fruit is dark colour in green,12-14cm in length, with 5 ridges. these are TallPlants with Profuse Branching, good tolerance to OLCV and YVMV.high yielding hybrid.	275	products/233364/233364.jpg	f	t	2021-01-15 11:15:24.764976+05:30	1	C000004	1	0	F1-Monika	3433	100 gms
3435	Bhendi/Okra	bhendiokra-fviy	The Plant typpe is Tall, first Picking takes 40-45 days after swing, fruit is dark colour in green,12-14cm in length, with 5 ridges. these are TallPlants with Profuse Branching, good tolerance to OLCV and YVMV.high yielding hybrid.	485	products/540515/540515.jpg	f	t	2021-01-15 11:15:24.771533+05:30	1	C000004	1	0	F1-Monika	3433	250 gms
3632	Broccoli	broccoli	Nutritional powerhouse Broccoli microgreens have larger quantities of magnesium, manganese, copper, and zinc. These are very essential minerals that most people are deficient in.	0	products/1498928/1498928.jpg	f	t	2021-01-15 11:15:48.111964+05:30	4	M000021	1	0	nan	\N	
3437	Bhendi/Okra	bhendiokra-b6dq	The Plant Type is Medium Tall Plants, first Picking is 40-45 days after swing, fruit color is green, fruit length is 10-12 cm in lengty, with 5 ridges medium talll plants with 2-3 branchesss, high yielder, high level of tolerance to YVMV.	225	products/1305617/1305617.jpg	f	t	2021-01-15 11:15:24.783793+05:30	1	C000005	1	0	F1-Deepa	3436	100 gms
3438	Bhendi/Okra	bhendiokra-lbfh	The plant type is medium, first picking is 45-48 Dys, dark green in color, 10-12 cm in length with 5 ridges and excellent keeping quality in remarks	0	products/1356349/1356349.jpg	f	t	2021-01-15 11:15:24.790776+05:30	1	C000006	1	0	F1-D-1011	\N	
3441	Bhendi/Okra	bhendiokra-va9z	Plant type is medium, first picking is 42-48 days, fruit color is dark green, fruit length is 10-12 cm in length, 5 ridges,tall plant, 3-4 branches, prolific Beraing and short internodes resistant to YVMV.                                       	0	products/216319/216319.jpg	f	t	2021-01-15 11:15:24.811768+05:30	1	C000007	1	0	F1-D-1012	\N	
3453	Bottle Gourd	bottle-gourd-3xr0	First picking is 45-50 days fter sowing, straight cylindrical fruit shape, whith green colour fruit,28-30cm in fruit length, fruit Avg. Wt is 600-800gm, early vigorous  hybrid,  uniform fruits, tenderr flesh, good keeping quality.	0	products/572859/572859.jpg	f	t	2021-01-15 11:15:24.890533+05:30	1	C000012	1	0	F1-Raman	\N	
3464	Brinjal	brinjal-jkx2	Plant type is semi erect spresding plaants plants,first picking is 60-70 days after transplantig,  bright pink in colour,80-100gm, Gulabi/pink shiny fruits, excellent contineous bearing habit in higher temperature conditions. 	170	products/399929/399929.jpg	f	t	2021-01-15 11:15:24.957536+05:30	1	C000017	1	0	F1-Bilal	3463	10 gms
3488	Carrot	carrot-ro1n	Plant is Erect, green, medium foliage  plants, maturity is 90 days from sowing, root shape is long cylindrical with blunt tip, root colour is orange with self colour core, Erect foliage, long, soft, edible core.	0	products/1558505/1558505.jpg	f	t	2021-01-15 11:15:25.112162+05:30	1	C000028	1	0	F1-Tarzan	\N	
3509	Chilly	chilly-gqim	Plant habit is Intermediate Tall plants, first picking is 60-65 days after transplanting, fruit colour is  shiny yelowish  Green, 14-18cm of  fruit length, fruit diameter is 1.2cm fruit pungency is medium pungency, Good product for fresh market.	560	products/1833970/1833970.jpg	f	t	2021-01-15 11:15:25.243851+05:30	1	C000038	1	0	F1-D-540	3508	10 gms
3535	Muskmelon	muskmelon-gzqr	Maturity days are 85-90 days after sowing, fruit shape is round, Fruit Surface is Yellowish Orange with Netting, Fruit Flesh clour is Green, Fruit Av.Wt. is 1.5-2kg,   	665	products/315643/315643.jpg	f	t	2021-01-15 11:15:25.413969+05:30	1	C000049	1	0	F1-Samrat	3534	25 gms
3536	Muskmelon	muskmelon-exmi	Maturity days are 75-80 days after sowing, fruit shape is round, Fruit Surface is Creamy white dense netting, Fruit Flesh clour is Orange, Fruit Av.Wt. is 1.5-2.0kg, Hard rind with good keeping quality. Good Tolerance against viruses & Fusarium.  	0	products/1716222/1716222.jpg	f	t	2021-01-15 11:15:25.420448+05:30	1	C000050	1	0	F1-Mahi 	\N	
3546	Sponge Gound	sponge-gound	Plant is vigorous & strong. Fruit is cylindrical- shaped. light green in color, 25-30 cm long and weighing 80-100 gm. It has prolific fruit bearing ability. With a smooth, green skin and ridges, sponge gourd has a creamy-white flesh with a mild.  Mature fruits are fibrous, and brown.	0	products/589475/589475.jpg	f	t	2021-01-15 11:15:25.479451+05:30	1	C000055	1	0	F1-Ravi	\N	
3559	Tomato	tomato-l8kw	Plant Habit is Semi Determinate, Day to first harvest is 60-65 days after Transplanting, Fruit Weight is 100-120gm, Fruit shape is Square Round , High yileding hybrid, suitable for long distance transportaion.	885	products/1842445/1842445.jpg	f	t	2021-01-15 11:15:25.563147+05:30	1	C000061	1	0	F1-D-98(Sarati)	3558	3000 seeds
3568	watermelon 	watermelon-5j9g	Fruits are attractive oblong shaped. Dark green with thick rind and small seeds, Excellent keeping quality, suitable for long transportation. High tolerance to mosaic diseases, Flesh colour is deep crimson red with good texture and sweetness. Fruit weight is 3.3-3.5 kgs, Sugar content is 14% TSS.	0	products/1756746/1756746.jpg	f	t	2021-01-15 11:15:25.622414+05:30	1	C000066	1	0	F1- Rocky	\N	
3426	Beetroot	beetroot	Maturity is 50-55 days after sowing, Root shape is round, Root colour is Blood red. Fruit Av. Wt 80-100gm, FRC 30 days without cracking,Crispy, sweet taste, less fiber,Colour remains same. PAN India product	0	products/1655470/1655470.jpg	f	t	2021-01-15 11:15:24.71096+05:30	1	C000001	1	0	Gulab	\N	
3428	Beetroot	beetroot-kh82	Maturity is 40-45 days after sowing, Root shape is round, Root colour is Dark red. Fruit Av. Wt 120-150gm, FRC 30 days without cracking,Unique beetroot shape, sweet taste, Smooth and crispy flesh.	0	products/1853661/1853661.jpg	f	t	2021-01-15 11:15:24.727823+05:30	1	C000002	1	0	F1-Rado	\N	
3433	Bhendi/Okra	bhendiokra-c8bz	The Plant typpe is Tall, first Picking takes 40-45 days after swing, fruit is dark colour in green,12-14cm in length, with 5 ridges. these are TallPlants with Profuse Branching, good tolerance to OLCV and YVMV.high yielding hybrid.	0	products/153439/153439.jpg	f	t	2021-01-15 11:15:24.760345+05:30	1	C000004	1	0	F1-Monika	\N	
3471	Brinjal 	brinjal-yz0i	Fruit plant type is hardy tall spreading plants, first picking is 70-75 days after transplanting, oval fruit shape, harvesr Wt. is 200-400gm, Pan India Product, wider climate adaptability with disease 6 suckings pets tolerance,soft fruits with good keeping quality, good for frying dishes.	0	products/1491259/1491259.jpg	f	t	2021-01-15 11:15:25.003373+05:30	1	C000021	1	0	F1-Dhairaj	\N	
3511	Coriander	coriander-keeh	Plant habit  is Erect Spreading Plants., first cutting is 35 days after sowing, leaf colour is Shiny Green to Dark Green leaves, Broad leaves, Good Aroma, late bolting, Suitable for multi Cuttings.	555	products/1616533/1616533.jpg	f	t	2021-01-15 11:15:25.257758+05:30	1	C000039	1	0	Dharma (Multi-Cut Coriander)	3510	2 kg
3638	Methi/Fenugreek	methifenugreek-iccs	These are rich in vitamins and essential for optimum health such as vitamin A, C, thiamine and folic acid. Fenugreek also helps in improving the homeostasis of glucose. Two teaspoons of fenugreek contain 3 – 4 gm of fibre. Fenugreek is affordable, high in fibre and complex carbohydrates.	0	products/1552504/1552504.jpg	f	t	2021-01-15 11:15:48.153454+05:30	4	M000023	1	0	nan	\N	
3657	Fennel seeds (Sauf)	fennel-seeds-sauf-6v8h	Are rich in nutrients. They often contain larger amounts of vitamins, minerals and antioxidants than their more mature counterparts.	69	products/1244117/1244117.jpg	f	t	2021-01-15 11:15:48.27787+05:30	4	M000029	1	0	nan	3656	500 seeds
3352	Lagerstroemia	lagerstroemia-g0j4	Lagerstroemia, commonly known as crape myrtle (also spelled crepe myrtle or crêpe myrtle) is a genus of around 50 species of deciduous and evergreen trees and shrubs native to the Indian subcontinent.	59	products/1601684/1601684.jpg	f	t	2021-01-15 11:14:15.759234+05:30	5	T000025	1	0	nan	3351	price/20 seeds
3454	Bottle Gourd	bottle-gourd-f15y	First picking is 45-50 days fter sowing, straight cylindrical fruit shape, whith green colour fruit,28-30cm in fruit length, fruit Avg. Wt is 600-800gm, early vigorous  hybrid,  uniform fruits, tenderr flesh, good keeping quality.	210	products/1430553/1430553.jpg	f	t	2021-01-15 11:15:24.896516+05:30	1	C000012	1	0	F1-Raman	3453	50 gms
3482	Redgram	redgram-647b	Maturity in 140-145 days, plant height is 180-190cm, Leaves semi erect dark green, Seed bold size white coloured podsare in cluster bearing high yielding variety with resistance to disease. 	850	products/1428426/1428426.jpg	f	t	2021-01-15 11:15:25.077191+05:30	1	C000024	1	0	BRG-5	3480	5 kg
3493	Chilly	chilly-ltly	Plant habit is Tall Spreading vigorous plants, first picking is 60-65 days after transplanting, fruit colour is dark green, fruit length is 9-10cm, diameter is1.3-1.4cm fruit pungency is medium pungency, vigorous plants with dark green foliage high yield, dualp purpose hybrid.	570	products/1415156/1415156.jpeg	f	t	2021-01-15 11:15:25.144154+05:30	1	C000030	1	0	F1-Narnia (Guntur)	3492	10 gms
3501	Chilly	chilly-vpzw	Plant habit is Tall erect Spreading  plants, first picking is 50-60 days after transplanting, fruit colour is yellowish Green,, fruit length is 15-16cm, diameter is1.0-1.2cm fruit pungency is high pungency,  wider climate adaptability, wrinkled fruits good for fresh market..	540	products/371051/371051.jpg	f	t	2021-01-15 11:15:25.193851+05:30	1	C000034	1	0	F1-Gabbar	3500	10 gms
3467	Brinjal 	brinjal-u33x	The plant type is tall semi spreading plants,   first picking is 65-70 days after transplanting, fruit shape is thick long cylindrical, fruit colour is dark purple, 150-180, thornless, tender, flesh,good texture, tast fruits.	0	products/1092567/1092567.jpeg	f	t	2021-01-15 11:15:24.977873+05:30	1	C000019	1	0	F1-Diksha	\N	
3510	Coriander	coriander-8yzf	Plant habit  is Erect Spreading Plants., first cutting is 35 days after sowing, leaf colour is Shiny Green to Dark Green leaves, Broad leaves, Good Aroma, late bolting, Suitable for multi Cuttings.	0	products/1179305/1179305.jpg	f	t	2021-01-15 11:15:25.252826+05:30	1	C000039	1	0	Dharma (Multi-Cut Coriander)	\N	
3489	Carrot	carrot-fi22	Plant is Erect, green, medium foliage  plants, maturity is 90 days from sowing, root shape is long cylindrical with blunt tip, root colour is orange with self colour core, Erect foliage, long, soft, edible core.	2850	products/237219/237219.jpg	f	t	2021-01-15 11:15:25.119432+05:30	1	C000028	1	0	F1-Tarzan	3488	100 gms
3523	Cucumber	cucumber-mexj	Fruit picking is 45-45 days after Sowing, fruit Shape is Medium long cylindrical, fruit colour is mottle Green, 20-22cm of  fruit length, Av.fruit Wt. is 160-180gm, Vigorous branched vines with good disease tolerance & fruits with wide market acceptance.	410	products/414092/414092.jpg	f	t	2021-01-15 11:15:25.340588+05:30	1	C000043	1	0	F1-Mitra	3522	25 gms
3436	Bhendi/Okra	bhendiokra-q81v	The Plant Type is Medium Tall Plants, first Picking is 40-45 days after swing, fruit color is green, fruit length is 10-12 cm in lengty, with 5 ridges medium talll plants with 2-3 branchesss, high yielder, high level of tolerance to YVMV.	0	products/678920/678920.jpg	f	t	2021-01-15 11:15:24.77904+05:30	1	C000005	1	0	F1-Deepa	\N	
3512	Coriander	coriander-zv3w	Plant habit  is Erect Spreading Plants., first cutting is 35 days after sowing, leaf colour is Shiny Green to Dark Green leaves, Broad leaves, Good Aroma, late bolting, Suitable for multi Cuttings.	5200	products/446482/446482.jpg	f	t	2021-01-15 11:15:25.266437+05:30	1	C000039	1	0	Dharma (Multi-Cut Coriander)	3510	25 kg
3491	Carrot	carrot-9ac6	Plant is Erect, green, medium foliage  plants, maturity is 90 days from sowing, root shape is long cylindrical with blunt tip, root colour is orange with self colour core, Erect foliage, long, soft, edible core.	2840	products/1551638/1551638.jpg	f	t	2021-01-15 11:15:25.131972+05:30	1	C000029	1	0	F1-Charly	3490	100 gms
3468	Brinjal 	brinjal-d133	The plant type is tall semi spreading plants,   first picking is 65-70 days after transplanting, fruit shape is thick long cylindrical, fruit colour is dark purple, 150-180, thornless, tender, flesh,good texture, tast fruits.	160	products/177783/177783.jpeg	f	t	2021-01-15 11:15:24.982889+05:30	1	C000019	1	0	F1-Diksha	3467	10 gms
3167	Amaranthus Green	amaranthus-green-qb7z	Amaranth plants can reach heights of over 2 meters tall with fleshy oval shaped leaves that are sometimes pointed at the tips.	129	products/154633/154633.jpg	f	t	2021-01-15 10:44:50.425427+05:30	3	H000001	1	0	nan	3165	1000 seeds
3443	Bhendi/Okra	bhendiokra-i5fh	Plant type is medium, first picking is 42-48 days, fruit color is dark green, fruit length is 10-12 cm in length, 5 ridges,tall plant, 3-4 branches, prolific Beraing and short internodes resistant to YVMV.                                       	715	products/458762/458762.jpg	f	t	2021-01-15 11:15:24.824735+05:30	1	C000007	1	0	F1-D-1012	3441	250 gms
3539	Pumpkin	pumpkin-j1zc	Maturity days are 85-90 days from sowing, fruit shape is Flatish round, Fruit surface is Green with white stripes tuens yellowish orange on maturity, Fruit Av. Wt is 4-5 kg. Attractive Early medium size hybrid with export quality	220	products/1554068/1554068.jpg	f	t	2021-01-15 11:15:25.438254+05:30	1	C000051	1	0	F1-Boss	3538	50 gms
3213	Chinese Cabbage	chinese-cabbage-yv0m	Chinese cabbage (Brassica rapa, subspecies pekinensis and chinensis) can refer to two cultivar groups of Chinese leaf vegetables often used in Chinese cuisine.	0	products/1111094/1111094.jpg	f	t	2021-01-15 10:44:50.763762+05:30	3	H000017	1	0	nan	\N	
3562	Tomato	tomato-iayx	Plant Habit is Semi Determinate, Day to first harvest is 60-65 days after Transplanting, Fruit Weight is 110-120gm, Fruit shape is  Round , High yileding hybrid, Green shoulder, deep red colour, suitale for medium distance transportaion.	0	products/1580948/1580948.jpg	f	t	2021-01-15 11:15:25.583051+05:30	1	C000063	1	0	F1-D-80	\N	
3187	Mint	mint-lfl0	Mint plants are mainly aromatic perennials and they possess erect, branching stems and oblong to ovate or lanceolate leaves arranged in opposing pairs on the stems.	149	products/1917527/1917527.jpg	f	t	2021-01-15 10:44:50.564494+05:30	3	H000008	1	0	nan	3186	100 seeds
3199	Kale	kale-jkny	Kale is a popular vegetable and a member of the cabbage family. It is a cruciferous vegetable like cabbage, broccoli, cauliflower, collard greens and Brussels sprouts.	49	products/254901/254901.jpg	f	t	2021-01-15 10:44:50.653068+05:30	3	H000012	1	0	nan	3198	100 seeds
3221	Lettuce	lettuce-ekfj	Lettuce (Lactuca sativa) is an annual plant of the daisy family, Asteraceae. It is most often grown as a leaf vegetable, but sometimes for its stem and seeds.	169	products/834780/834780.jpg	f	t	2021-01-15 10:44:50.820612+05:30	3	H000019	1	0	nan	3219	1000 seeds
2956	Brinjal Black long	brinjal-black-long-v2pw	Tall Erect open type Plants, 50-55 days after transplanting, Medium thick long with club fruit shape, Black fruit in color, Harvest weight is 100-200gm,  wider climate adaptive variety, Early maturity with high yielding.	29	products/270187/270187.jpg	t	t	2021-01-15 10:40:56.968987+05:30	2	K000002	1	0	nan	2955	50 seeds
3431	Bhendi/Okra	bhendiokra-d0z0	Plant type is medium, first picking is 42-48 days, fruit color is dark green, fruit length is 10-12 cm in length, 5 ridges,tall plant, 3-4 branches, prolific Beraing and short internodes resistant to YVMV.  	290	products/912874/912874.jpg	f	t	2021-01-15 11:15:24.746232+05:30	1	C000003	1	0	F1-Majestic	3430	100 gms
3547	Sponge Gound	sponge-gound-zyhq	Plant is vigorous & strong. Fruit is cylindrical- shaped. light green in color, 25-30 cm long and weighing 80-100 gm. It has prolific fruit bearing ability. With a smooth, green skin and ridges, sponge gourd has a creamy-white flesh with a mild.  Mature fruits are fibrous, and brown.	190	products/1427338/1427338.jpg	f	t	2021-01-15 11:15:25.486509+05:30	1	C000055	1	0	F1-Ravi	3546	50 gms
2971	Bhendi/Okra Deepa (Hybrid)	bhendiokra-deepa-hybrid-7wi3	The Plant Type is Medium Tall Plants, first Picking is 40-45 days after swing, fruit color is green, fruit length is 10-12 cm in lengty, with 5 ridges medium talll plants with 2-3 branchesss, high yielder, high level of tolerance to YVMV.	49	products/1153650/1153650.jpg	t	t	2021-01-15 10:40:57.057917+05:30	2	K000007	1	0	nan	2970	50 seeds
2976	Brinjal Aira (Hybrid)	brinjal-aira-hybrid	Plant type is tall erect spreading plants, first picking is 55-65 days after transplanting, fruit shape is round, fruit colour is dark purple, 200-300 gm of Harvest Wt., Attractive shiny fruits with low seed content, suitable for Bharta flying operations.	0	products/72671/72671.jpg	f	t	2021-01-15 10:40:57.088574+05:30	2	K000009	1	0	nan	\N	
2980	Brinjal Dhiraj (Hybrid)	brinjal-dhiraj-hybrid-qmj2	Fruit plant type is hardy tall spreading plants, first picking is 70-75 days after transplanting, oval fruit shape, harvesr Wt. is 200-400gm, Pan India Product, wider climate adaptability with disease 6 suckings pets tolerance,soft fruits with good keeping quality, good for frying dishes.	49	products/1292019/1292019.jpg	f	t	2021-01-15 10:40:57.113064+05:30	2	K000010	1	0	nan	2979	50 seeds
3019	Chilly Dual Purpose-Dry/Fresh  (Hybrid)	chilly-dual-purpose-dryfresh-hybrid-w0hy	Plant habit is Tall plants with dark green foliage, first picking is 60-65 days after transplanting, fruit colour is Green light wrinkled fruits, 8-10cm of  fruit length, fruit diameter is 1.3-1.5cm fruit pungency is high pungency,  light wrinkled high yielding hybrid,good for fresh maeket as well as for dry.	89	products/1165262/1165262.jpg	f	t	2021-01-15 10:40:57.4352+05:30	2	K000023	1	0	nan	3018	50 seeds
3051	Spongegourd Light Green (Hybrid)	spongegourd-light-green-hybrid	Plant is vigorous & strong. Fruit is cylindrical- shaped. light green in color, 25-30 cm long and weighing 80-100 gm. It has prolific fruit bearing ability. With a smooth, green skin and ridges, sponge gourd has a creamy-white flesh with a mild.  Mature fruits are fibrous, and brown.	0	products/1341491/1341491.jpg	f	t	2021-01-15 10:40:57.671283+05:30	2	K000034	1	0	nan	\N	
3056	Tomato Oval (Hybrid)	tomato-oval-hybrid-w9f7	Plant Habit is Semi Determinate, Day to first harvest is 60-65 days after Transplanting, Fruit Weight is 100-120gm, Fruit shape is Oval,  Attractive Red High yielding hybrid with heat tolerance, tolerant to Fusarium, bacterial with 6 TYLCV.	499	products/1050522/1050522.jpg	f	t	2021-01-15 10:40:57.702181+05:30	2	K000035	1	0	nan	3054	1000 seeds
3102	Radish 2 in 1 (Palak and Radish)	radish-2-in-1-palak-and-radish	Maturity days are 35 days after sowing, fruit shape is cylindrical with tapering end,  Root colour is white,  Ealy, Tender & less fiber roots, Both roots  & leaves are edible.	0	products/1446762/1446762.jpg	f	t	2021-01-15 10:40:58.094981+05:30	2	K000051	1	0	nan	\N	
3105	Kholrabi/Knol-khol	kholrabiknol-khol	Kohlrabi is another name for our not-so-popular Knol khol. It belongs to the same family as Cabbage and Cauliflower (Brassicaceae). The Whole plant is edible however, it is mostly used for its bulged swollen stem. It can be eaten raw as well as cooked.	0	products/1000809/1000809.jpg	f	t	2021-01-15 10:40:58.112626+05:30	2	K000052	1	0	nan	\N	
3028	Orange Carrot Kuroda (Hybrid)	orange-carrot-kuroda-hybrid-qse9	Plant is gree errect coarse leaves foiage plants, maturity is 100-110 dayys from sowing, rot shape is conical with blunt tip, root colour is deep orange with self colour core, Erect growing, medium size, sweet with edible core.	49	products/1972644/1972644.jpg	f	t	2021-01-15 10:40:57.520968+05:30	2	K000026	1	0	nan	3027	50 seeds
2990	Brinjal Naman (Hybrid)	brinjal-naman-hybrid-oq39	Plant type is tall erect spreading thorny plants, first picking is 65 days after transplanting, fruit shape is roval, fruit colour is purple with green shiny shrips, 60-70gm of Harvest Wt.,  thorny fruits, Excellent taste, Good keeping quality, High yielder.	169	products/335636/335636.jpg	f	t	2021-01-15 10:40:57.200492+05:30	2	K000013	1	0	nan	2988	1000 seeds
3003	Chilly Bhajji  (Hybrid)	chilly-bhajji-hybrid	Plant habit is Tall plants, first picking is 60-65 days after transplanting, fruit colour is  Glossy yelowish  Green, 14-18cm of  fruit length, fruit diameter is 2 cm fruit pungency is medium pungency, Good product for fresh market.	0	products/1243917/1243917.jpg	f	t	2021-01-15 10:40:57.333874+05:30	2	K000018	1	0	nan	\N	
3014	Cucumber Dark Green (Hybrid)	cucumber-dark-green-hybrid-a8wb	Fruit picking is 45-45 days after Sowing, fruit Shape is long cylindrical, fruit colour is mottle Green, 15-18cm of  fruit length, Av.fruit Wt. is 160-180gm, Vigorous branched vines with good disease tolerance & fruits with wide market acceptance.	499	products/1396303/1396303.jpg	f	t	2021-01-15 10:40:57.406321+05:30	2	K000021	1	0	nan	3012	1000 seeds
3037	Pumpkin Druva (Hybrid)	pumpkin-druva-hybrid-a7x3	Medium size fruits, flat shape, with bright yellow flesh, greyish-green skin, light yellow at the bottom. The flavor is very sweet and delicate. Maturity: 82-85 days from sowing, weight about 2.5-3.2 kg (5.5-7 lb). Tolerant to heat, Powdery mildew, Downy mildew.	69	products/1758007/1758007.jpg	f	t	2021-01-15 10:40:57.582618+05:30	2	K000029	1	0	nan	3036	50 seeds
3062	Watermelon Black (Hybrid)	watermelon-black-hybrid-rfcd	Maturity days are 75-80 days after sowing, fruit shape is Oblong, Fruit Surface is Dark Black, Fruit Flesh clour is Dark Red Crispy, Fruit Av.Wt. is 4-5kg, Attractive icebix type having hard rind Good disease tolerance  keeping quality.	999	products/1591074/1591074.jpg	f	t	2021-01-15 10:40:57.741392+05:30	2	K000037	1	0	nan	3060	1000 seeds
3139	Leek	leek-mbeq	Leek is a tall, hardy robust herbaceous biennial with white, narrowly ovoid bulb and broad flat leaves. It resembles a green onion but is larger and, unlike onion and garlic, it does not form bulbs or cloves.	49	products/1011913/1011913.jpg	f	t	2021-01-15 10:40:58.339258+05:30	2	K000063	1	0	nan	3138	100 seeds
3602	Chia	chia	Contains Vitamins A, B, C, and E, Calcium, Iron, Magnesium, Niacin, Phosphorus, Potassium, Zinc, Chlorophyll, Amino Acids, Antioxidants and 20-25% protein.	0	products/1540421/1540421.jpg	f	t	2021-01-15 11:15:47.898134+05:30	4	M000011	1	0	nan	\N	
3247	Teak	teak-nx6y	Teak (Tectona grandis) is a tropical hardwood tree species in the family Lamiaceae. It is a large, deciduous tree that occurs in mixed hardwood forests	59	products/475458/475458.jpg	f	t	2021-01-15 11:14:15.042054+05:30	5	T000004	1	0	nan	3246	price/20 seeds
3648	Spinach/Palak	spinachpalak-q8ft	Richer sources of various micronutrient especially vitamins and minerals. Some of the lipophilic vitamins are much higher in microgreens than mature parts. Like vitamin E content of microgreens is forty times higher than the mature parts.	69	products/263992/263992.jpg	f	t	2021-01-15 11:15:48.218791+05:30	4	M000026	1	0	nan	3647	500 seeds
3063	Watermelon Green Stripes (Hybrid)	watermelon-green-stripes-hybrid	Fruits are attractive oblong shaped. Dark green with thick rind and small seeds, Excellent keeping quality, suitable for long transportation. High tolerance to mosaic diseases, Flesh colour is deep crimson red with good texture and sweetness. Fruit weight is 3.3-3.5 kgs, Sugar content is 14% TSS.	0	products/1848874/1848874.jpg	f	t	2021-01-15 10:40:57.748397+05:30	2	K000038	1	0	nan	\N	
3574	Amaranthus Red	amaranthus-red-qm5d	Amaranth contains high complete protein amounts with vital amino acids, in contrast with other protein sources. Amaranth is gluten-free. Amaranth microgreens also contains vitamin A, C, E, folate, iron, magnesium, phosphorus, potassium, dietary fiber, calcium, amino acids, antioxidants, minerals and essential lysine.	129	products/1231927/1231927.jpg	f	t	2021-01-15 11:15:47.705001+05:30	4	M000001	1	0	nan	3572	1000 seeds
3577	Amaranthus Green	amaranthus-green-k5cg	Amaranth contains high complete protein amounts with vital amino acids, in contrast with other protein sources. Amaranth is gluten-free. Amaranth microgreens also contains vitamin A, C, E, folate, iron, magnesium, phosphorus, potassium, dietary fiber, calcium, amino acids, antioxidants, minerals and essential lysine.	129	products/46113/46113.jpg	f	t	2021-01-15 11:15:47.725551+05:30	4	M000002	1	0	nan	3575	1000 seeds
3576	Amaranthus Green	amaranthus-green-wbjg	Amaranth contains high complete protein amounts with vital amino acids, in contrast with other protein sources. Amaranth is gluten-free. Amaranth microgreens also contains vitamin A, C, E, folate, iron, magnesium, phosphorus, potassium, dietary fiber, calcium, amino acids, antioxidants, minerals and essential lysine.	69	products/756713/756713.jpg	f	t	2021-01-15 11:15:47.71714+05:30	4	M000002	1	0	nan	3575	500 seeds
3084	Muskmelon Mahi (Hybrid)	muskmelon-mahi-hybrid	Maturity days are 75-80 days after sowing, fruit shape is round, Fruit Surface is Creamy white dense netting, Fruit Flesh clour is Orange, Fruit Av.Wt. is 1.5-2.0kg, Hard rind with good keeping quality. Good Tolerance against viruses & Fusarium.  	0	products/956793/956793.jpg	f	t	2021-01-15 10:40:57.930165+05:30	2	K000045	1	0	nan	\N	
3610	Arugula	arugula-fnor	Arugula microgreens contain almost eight times the calcium, five times the vitamin A, vitamin C, and vitamin K, and four times the iron as the iceberg lettuce. Microgreens are also a rich source of nutrients, vitamins E, L, lutein, and beta-carotene.	129	products/403785/403785.jpg	f	t	2021-01-15 11:15:47.950825+05:30	4	M000013	1	0	nan	3608	1000 seeds
3586	Cabbage	cabbage-ibkk	Cabbage microgreen is packed with so many beneficial minerals, vitamins (C, K) minerals and other nutrients. It is rich in fiber, beta-carotene, calcium, magnesium, potassium, iodine, and sulfur.	169	products/252049/252049.jpg	f	t	2021-01-15 11:15:47.789343+05:30	4	M000005	1	0	nan	3584	1000 seeds
3624	Parsley Gaint	parsley-gaint-va7n	Parsley offers excellent flavor to any dish it is added too.  Use it as a garnish, or anywhere you'd use parsley.  This micro boasts medium green stems with pale, light green stems.  Parsley is an easy microgreen to grow, but it does have longer germination times.  	69	products/1447431/1447431.jpg	f	t	2021-01-15 11:15:48.056493+05:30	4	M000018	1	0	nan	3623	500 seeds
3670	Kholrabi/Knol-khol	kholrabiknol-khol-90er	Knol knol microgreens are very nutritious and contains over 100% of the recommended daily value of Vitamin C. It's also high in Vitamin B6, Folate (B9), Thiamin (B1), potassium, phosphorus, and calcium.	129	products/939976/939976.jpg	f	t	2021-01-15 11:15:48.364743+05:30	4	M000033	1	0	nan	3668	1000 seeds
3018	Chilly Dual Purpose-Dry/Fresh  (Hybrid)	chilly-dual-purpose-dryfresh-hybrid	Plant habit is Tall plants with dark green foliage, first picking is 60-65 days after transplanting, fruit colour is Green light wrinkled fruits, 8-10cm of  fruit length, fruit diameter is 1.3-1.5cm fruit pungency is high pungency,  light wrinkled high yielding hybrid,good for fresh maeket as well as for dry.	0	products/1135327/1135327.jpg	f	t	2021-01-15 10:40:57.429931+05:30	2	K000023	1	0	nan	\N	
3291	Terminalia elliptica	terminalia-elliptica	Deciduous trees, to 30 m high, bark 15-20 mm thick, surface grey-black, very rough, deeply vertically fissured, horizontally cracked, forming tessellated, thick flakes, blaze red.	0	products/1766767/1766767.jpg	f	t	2021-01-15 11:14:15.347923+05:30	5	T000013	1	0	nan	\N	
3312	Terminalia bellirica	terminalia-bellirica-ksm6	Traditional Indian Ayurvedic medicine, Beleric is known as "Bibhitaki" (Marathi: "Behada or Bhenda") (Terminalia bellirica)	59	products/597530/597530.jpg	f	t	2021-01-15 11:14:15.49863+05:30	5	T000017	1	0	nan	3311	price/20 seeds
3237	Red Sandalwood	red-sandalwood-ti5u	Red Sandalwood, is a native and endemic to India and can only be found in the southern parts of the Eastern Ghats.	89	products/1684338/1684338.jpeg	f	t	2021-01-15 11:14:14.976169+05:30	5	T000002	1	0	nan	3236	price/20 seeds
3257	Rosewood	rosewood-j7d8	Rosewood Dalbergia latifolia. Also known as: Indonesian rosewood, Bombay blackwood, Malabar rosewood,	59	products/110218/110218.jpg	f	t	2021-01-15 11:14:15.110677+05:30	5	T000006	1	0	nan	3256	price/20 seeds
3281	Pterocarpus marsupium	pterocarpus-marsupium	Pterocarpus marsupium, also known as Malabar kino, Indian kino tree, or vijayasar, is a medium to large, deciduous tree that can grow up to 30 m (98 ft) tal	0	products/1954970/1954970.jpg	f	t	2021-01-15 11:14:15.276116+05:30	5	T000011	1	0	nan	\N	
3304	Neem	neem-w1k0	Neem is a natural herb that comes from the neem tree, other names for which include Azadirachta indica and Indian lilac	329	products/1103974/1103974.jpg	f	t	2021-01-15 11:14:15.443728+05:30	5	T000015	1	0	nan	3301	500 seeds
3320	Indian Elm (Tapasi)	indian-elm-tapasi-4xkl	Indian Elm is a large deciduous tree, gowing up to 18 m tall. It has grey bark, covered with blisters, peeling in corky scales on old trees.	499	products/1762759/1762759.jpg	f	t	2021-01-15 11:14:15.557445+05:30	5	T000018	1	0	nan	3316	1000 seeds
3469	Brinjal 	brinjal-a9gd	Plant type is tall erect spreading plants, first picking is 55-65 days afteer transplanting, fruit shape is round, fruit colour is dark purple, 200-300 gm of Harvest Wt., Attractive shiny fruits with low seed content, suitable for Bharta flying operations.	0	products/1675282/1675282.jpg	f	t	2021-01-15 11:15:24.990405+05:30	1	C000020	1	0	F1- Aira	\N	
3064	Watermelon Green Stripes (Hybrid)	watermelon-green-stripes-hybrid-fhio	Fruits are attractive oblong shaped. Dark green with thick rind and small seeds, Excellent keeping quality, suitable for long transportation. High tolerance to mosaic diseases, Flesh colour is deep crimson red with good texture and sweetness. Fruit weight is 3.3-3.5 kgs, Sugar content is 14% TSS.	69	products/165219/165219.jpg	f	t	2021-01-15 10:40:57.753481+05:30	2	K000038	1	0	nan	3063	50 seeds
3572	Amaranthus Red	amaranthus-red-pr2s	Amaranth contains high complete protein amounts with vital amino acids, in contrast with other protein sources. Amaranth is gluten-free. Amaranth microgreens also contains vitamin A, C, E, folate, iron, magnesium, phosphorus, potassium, dietary fiber, calcium, amino acids, antioxidants, minerals and essential lysine.	0	products/631358/631358.jpg	f	t	2021-01-15 11:15:47.687855+05:30	4	M000001	1	0	nan	\N	
3323	Butea monosperma	butea-monosperma-5omb	Butea monosperma is a species of Butea native to tropical and sub-tropical parts of the Indian Subcontinent and Southeast Asia, ranging across India, Bangladesh, Nepal, Sri Lanka	149	products/1389797/1389797.jpg	f	t	2021-01-15 11:14:15.577721+05:30	5	T000019	1	0	nan	3321	100 seeds
3363	Eucalyptus Citriodora	eucalyptus-citriodora-8hjt	Corymbia citriodora, commonly known as lemon-scented gum or spotted gum, is a species of tall tree that is endemic to north-eastern Australia.	149	products/1174666/1174666.jpg	f	t	2021-01-15 11:14:15.845933+05:30	5	T000027	1	0	nan	3361	100 seeds
3328	Grass Seeds	grass-seeds-1gvv	Grasses are often considered valuable for their aesthetic qualities, but there is much more to these plants than meets the eye. All grasses are in the Poaceae family,	149	products/1338095/1338095.jpg	f	t	2021-01-15 11:14:15.61159+05:30	5	T000020	1	0	nan	3326	100 seeds
3341	Areca Palm	areca-palm	Areca palm is one of the few palms that can tolerate trimming without serious harm, making it possible to keep mature plants indoors for their full lifespan of up to 10 years.	0	products/530139/530139.jpg	f	t	2021-01-15 11:14:15.700806+05:30	5	T000023	1	0	nan	\N	
3375	Gulmohar	gulmohar-pjq5	Delonix regia is a species of flowering plant in the bean family Fabaceae, subfamily Caesalpinioideae native to Madagascar.	499	products/854272/854272.jpg	f	t	2021-01-15 11:14:15.922636+05:30	5	T000029	1	0	nan	3371	1000 seeds
3381	Tecoma	tecoma	Tecoma is a genus of 14 species of shrubs or small trees in the trumpet vine family, Bignoniaceae	0	products/1316121/1316121.jpg	f	t	2021-01-15 11:14:15.961971+05:30	5	T000031	1	0	nan	\N	
3390	Bauhinia	bauhinia-aslc	Bauhinia is a large genus of flowering plants in the subfamily Cercidoideae and tribe Bauhinieae, in the large flowering plant family Fabaceae, with a pantropical distribution.	499	products/1372767/1372767.jpg	f	t	2021-01-15 11:14:16.021261+05:30	5	T000032	1	0	nan	3386	1000 seeds
3402	Custard Apple	custard-apple-e9en	Cherimoya (Annona cherimola) is a green, cone-shaped fruit with scaly skin and creamy, sweet flesh. Thought to have originated in the Andes mountains of South America	59	products/685494/685494.jpg	f	t	2021-01-15 11:14:16.099637+05:30	5	T000035	1	0	nan	3401	price/20 seeds
\.


--
-- Data for Name: tags_tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tags_tag (id, title, slug, "timestamp", active) FROM stdin;
\.


--
-- Data for Name: tags_tag_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tags_tag_products (id, tag_id, product_id) FROM stdin;
\.


--
-- Name: accounts_guestemail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_guestemail_id_seq', 1, false);


--
-- Name: accounts_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_user_id_seq', 1, true);


--
-- Name: addresses_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.addresses_address_id_seq', 33, true);


--
-- Name: analytics_objectviewed_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.analytics_objectviewed_id_seq', 161, true);


--
-- Name: analytics_usersession_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.analytics_usersession_id_seq', 2, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 68, true);


--
-- Name: billing_billingprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.billing_billingprofile_id_seq', 1, true);


--
-- Name: carts_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carts_cart_id_seq', 42, true);


--
-- Name: carts_cartitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carts_cartitem_id_seq', 75, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 2969, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 17, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 58, true);


--
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 40, true);


--
-- Name: products_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_category_id_seq', 5, true);


--
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_product_id_seq', 3673, true);


--
-- Name: tags_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tags_tag_id_seq', 1, false);


--
-- Name: tags_tag_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tags_tag_products_id_seq', 1, false);


--
-- Name: accounts_guestemail accounts_guestemail_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_guestemail
    ADD CONSTRAINT accounts_guestemail_pkey PRIMARY KEY (id);


--
-- Name: accounts_user accounts_user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user
    ADD CONSTRAINT accounts_user_email_key UNIQUE (email);


--
-- Name: accounts_user accounts_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_user
    ADD CONSTRAINT accounts_user_pkey PRIMARY KEY (id);


--
-- Name: addresses_address addresses_address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses_address
    ADD CONSTRAINT addresses_address_pkey PRIMARY KEY (id);


--
-- Name: analytics_objectviewed analytics_objectviewed_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.analytics_objectviewed
    ADD CONSTRAINT analytics_objectviewed_pkey PRIMARY KEY (id);


--
-- Name: analytics_usersession analytics_usersession_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.analytics_usersession
    ADD CONSTRAINT analytics_usersession_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: billing_billingprofile billing_billingprofile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing_billingprofile
    ADD CONSTRAINT billing_billingprofile_pkey PRIMARY KEY (id);


--
-- Name: billing_billingprofile billing_billingprofile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing_billingprofile
    ADD CONSTRAINT billing_billingprofile_user_id_key UNIQUE (user_id);


--
-- Name: carts_cart carts_cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts_cart
    ADD CONSTRAINT carts_cart_pkey PRIMARY KEY (id);


--
-- Name: carts_cartitem carts_cartitem_cart_id_product_id_883bacdf_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts_cartitem
    ADD CONSTRAINT carts_cartitem_cart_id_product_id_883bacdf_uniq UNIQUE (cart_id, product_id);


--
-- Name: carts_cartitem carts_cartitem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts_cartitem
    ADD CONSTRAINT carts_cartitem_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: orders_order orders_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_order
    ADD CONSTRAINT orders_order_pkey PRIMARY KEY (id);


--
-- Name: products_category products_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_category
    ADD CONSTRAINT products_category_pkey PRIMARY KEY (id);


--
-- Name: products_product products_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_product
    ADD CONSTRAINT products_product_pkey PRIMARY KEY (id);


--
-- Name: products_product products_product_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_product
    ADD CONSTRAINT products_product_slug_key UNIQUE (slug);


--
-- Name: tags_tag tags_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags_tag
    ADD CONSTRAINT tags_tag_pkey PRIMARY KEY (id);


--
-- Name: tags_tag_products tags_tag_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags_tag_products
    ADD CONSTRAINT tags_tag_products_pkey PRIMARY KEY (id);


--
-- Name: tags_tag_products tags_tag_products_tag_id_product_id_ed6e4461_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags_tag_products
    ADD CONSTRAINT tags_tag_products_tag_id_product_id_ed6e4461_uniq UNIQUE (tag_id, product_id);


--
-- Name: accounts_user_email_b2644a56_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_user_email_b2644a56_like ON public.accounts_user USING btree (email varchar_pattern_ops);


--
-- Name: addresses_address_billing_profile_id_115cdf27; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX addresses_address_billing_profile_id_115cdf27 ON public.addresses_address USING btree (billing_profile_id);


--
-- Name: analytics_objectviewed_content_type_id_35d996a4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX analytics_objectviewed_content_type_id_35d996a4 ON public.analytics_objectviewed USING btree (content_type_id);


--
-- Name: analytics_objectviewed_user_id_b1e9cf2a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX analytics_objectviewed_user_id_b1e9cf2a ON public.analytics_objectviewed USING btree (user_id);


--
-- Name: analytics_usersession_user_id_548abc25; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX analytics_usersession_user_id_548abc25 ON public.analytics_usersession USING btree (user_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: carts_cart_user_id_bd0756c7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX carts_cart_user_id_bd0756c7 ON public.carts_cart USING btree (user_id);


--
-- Name: carts_cartitem_cart_id_9cb0a756; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX carts_cartitem_cart_id_9cb0a756 ON public.carts_cartitem USING btree (cart_id);


--
-- Name: carts_cartitem_product_id_acd010e4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX carts_cartitem_product_id_acd010e4 ON public.carts_cartitem USING btree (product_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: orders_order_billing_address_id_deb02e83; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orders_order_billing_address_id_deb02e83 ON public.orders_order USING btree (billing_address_id);


--
-- Name: orders_order_billing_profile_id_0e11b610; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orders_order_billing_profile_id_0e11b610 ON public.orders_order USING btree (billing_profile_id);


--
-- Name: orders_order_cart_id_7e0252e3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orders_order_cart_id_7e0252e3 ON public.orders_order USING btree (cart_id);


--
-- Name: orders_order_shipping_address_id_c4f8227a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX orders_order_shipping_address_id_c4f8227a ON public.orders_order USING btree (shipping_address_id);


--
-- Name: products_product_category_id_id_2778dc53; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_product_category_id_id_2778dc53 ON public.products_product USING btree (category_id_id);


--
-- Name: products_product_slug_70d3148d_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_product_slug_70d3148d_like ON public.products_product USING btree (slug varchar_pattern_ops);


--
-- Name: products_product_variant_of_id_132dd6c8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX products_product_variant_of_id_132dd6c8 ON public.products_product USING btree (variant_of_id);


--
-- Name: tags_tag_products_product_id_f64ffb65; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tags_tag_products_product_id_f64ffb65 ON public.tags_tag_products USING btree (product_id);


--
-- Name: tags_tag_products_tag_id_7ed0fcd2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tags_tag_products_tag_id_7ed0fcd2 ON public.tags_tag_products USING btree (tag_id);


--
-- Name: tags_tag_slug_78c2b8d8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tags_tag_slug_78c2b8d8 ON public.tags_tag USING btree (slug);


--
-- Name: tags_tag_slug_78c2b8d8_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tags_tag_slug_78c2b8d8_like ON public.tags_tag USING btree (slug varchar_pattern_ops);


--
-- Name: addresses_address addresses_address_billing_profile_id_115cdf27_fk_billing_b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses_address
    ADD CONSTRAINT addresses_address_billing_profile_id_115cdf27_fk_billing_b FOREIGN KEY (billing_profile_id) REFERENCES public.billing_billingprofile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: analytics_objectviewed analytics_objectview_content_type_id_35d996a4_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.analytics_objectviewed
    ADD CONSTRAINT analytics_objectview_content_type_id_35d996a4_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: analytics_objectviewed analytics_objectviewed_user_id_b1e9cf2a_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.analytics_objectviewed
    ADD CONSTRAINT analytics_objectviewed_user_id_b1e9cf2a_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: analytics_usersession analytics_usersession_user_id_548abc25_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.analytics_usersession
    ADD CONSTRAINT analytics_usersession_user_id_548abc25_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: billing_billingprofile billing_billingprofile_user_id_1a5112fa_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing_billingprofile
    ADD CONSTRAINT billing_billingprofile_user_id_1a5112fa_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_accounts_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_accounts_user_id FOREIGN KEY (user_id) REFERENCES public.accounts_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_order orders_order_billing_address_id_deb02e83_fk_addresses; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_order
    ADD CONSTRAINT orders_order_billing_address_id_deb02e83_fk_addresses FOREIGN KEY (billing_address_id) REFERENCES public.addresses_address(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_order orders_order_billing_profile_id_0e11b610_fk_billing_b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_order
    ADD CONSTRAINT orders_order_billing_profile_id_0e11b610_fk_billing_b FOREIGN KEY (billing_profile_id) REFERENCES public.billing_billingprofile(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_order orders_order_cart_id_7e0252e3_fk_carts_cart_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_order
    ADD CONSTRAINT orders_order_cart_id_7e0252e3_fk_carts_cart_id FOREIGN KEY (cart_id) REFERENCES public.carts_cart(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: orders_order orders_order_shipping_address_id_c4f8227a_fk_addresses; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders_order
    ADD CONSTRAINT orders_order_shipping_address_id_c4f8227a_fk_addresses FOREIGN KEY (shipping_address_id) REFERENCES public.addresses_address(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: products_product products_product_category_id_id_2778dc53_fk_products_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_product
    ADD CONSTRAINT products_product_category_id_id_2778dc53_fk_products_ FOREIGN KEY (category_id_id) REFERENCES public.products_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tags_tag_products tags_tag_products_product_id_f64ffb65_fk_products_product_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags_tag_products
    ADD CONSTRAINT tags_tag_products_product_id_f64ffb65_fk_products_product_id FOREIGN KEY (product_id) REFERENCES public.products_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tags_tag_products tags_tag_products_tag_id_7ed0fcd2_fk_tags_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags_tag_products
    ADD CONSTRAINT tags_tag_products_tag_id_7ed0fcd2_fk_tags_tag_id FOREIGN KEY (tag_id) REFERENCES public.tags_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

