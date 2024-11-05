--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.3

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

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: default
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO "default";

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: default
--

COMMENT ON SCHEMA public IS '';


--
-- Name: Role; Type: TYPE; Schema: public; Owner: default
--

CREATE TYPE public."Role" AS ENUM (
    'USER',
    'ADMIN',
    'GUEST'
);


ALTER TYPE public."Role" OWNER TO "default";

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: City; Type: TABLE; Schema: public; Owner: default
--

CREATE TABLE public."City" (
    id integer NOT NULL,
    region_id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public."City" OWNER TO "default";

--
-- Name: City_id_seq; Type: SEQUENCE; Schema: public; Owner: default
--

CREATE SEQUENCE public."City_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."City_id_seq" OWNER TO "default";

--
-- Name: City_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: default
--

ALTER SEQUENCE public."City_id_seq" OWNED BY public."City".id;


--
-- Name: Country; Type: TABLE; Schema: public; Owner: default
--

CREATE TABLE public."Country" (
    id integer NOT NULL,
    name text NOT NULL,
    has_toll_roads boolean NOT NULL,
    capital text,
    currency text,
    currency_name text,
    currency_symbol text,
    emoji text,
    "emojiU" text,
    flag text,
    "geoData" text,
    iso2 text NOT NULL,
    iso3 text NOT NULL,
    latitude double precision,
    longitude double precision,
    nationality text,
    native text,
    numeric_code text NOT NULL,
    phone_code text NOT NULL,
    region text,
    region_id text,
    subregion text,
    subregion_id text,
    timezones jsonb,
    tld text,
    translations jsonb
);


ALTER TABLE public."Country" OWNER TO "default";

--
-- Name: Country_id_seq; Type: SEQUENCE; Schema: public; Owner: default
--

CREATE SEQUENCE public."Country_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Country_id_seq" OWNER TO "default";

--
-- Name: Country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: default
--

ALTER SEQUENCE public."Country_id_seq" OWNED BY public."Country".id;


--
-- Name: Image; Type: TABLE; Schema: public; Owner: default
--

CREATE TABLE public."Image" (
    id integer NOT NULL,
    url text NOT NULL,
    country_id integer,
    post_id integer
);


ALTER TABLE public."Image" OWNER TO "default";

--
-- Name: Image_id_seq; Type: SEQUENCE; Schema: public; Owner: default
--

CREATE SEQUENCE public."Image_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Image_id_seq" OWNER TO "default";

--
-- Name: Image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: default
--

ALTER SEQUENCE public."Image_id_seq" OWNED BY public."Image".id;


--
-- Name: Language; Type: TABLE; Schema: public; Owner: default
--

CREATE TABLE public."Language" (
    id integer NOT NULL,
    code text NOT NULL,
    name text NOT NULL
);


ALTER TABLE public."Language" OWNER TO "default";

--
-- Name: Language_id_seq; Type: SEQUENCE; Schema: public; Owner: default
--

CREATE SEQUENCE public."Language_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Language_id_seq" OWNER TO "default";

--
-- Name: Language_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: default
--

ALTER SEQUENCE public."Language_id_seq" OWNED BY public."Language".id;


--
-- Name: Post; Type: TABLE; Schema: public; Owner: default
--

CREATE TABLE public."Post" (
    id integer NOT NULL,
    country_id integer,
    section_id integer
);


ALTER TABLE public."Post" OWNER TO "default";

--
-- Name: PostTranslation; Type: TABLE; Schema: public; Owner: default
--

CREATE TABLE public."PostTranslation" (
    id integer NOT NULL,
    language_id integer NOT NULL,
    description text NOT NULL,
    post_id integer NOT NULL,
    title text NOT NULL
);


ALTER TABLE public."PostTranslation" OWNER TO "default";

--
-- Name: PostTranslation_id_seq; Type: SEQUENCE; Schema: public; Owner: default
--

CREATE SEQUENCE public."PostTranslation_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."PostTranslation_id_seq" OWNER TO "default";

--
-- Name: PostTranslation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: default
--

ALTER SEQUENCE public."PostTranslation_id_seq" OWNED BY public."PostTranslation".id;


--
-- Name: Post_id_seq; Type: SEQUENCE; Schema: public; Owner: default
--

CREATE SEQUENCE public."Post_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Post_id_seq" OWNER TO "default";

--
-- Name: Post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: default
--

ALTER SEQUENCE public."Post_id_seq" OWNED BY public."Post".id;


--
-- Name: Region; Type: TABLE; Schema: public; Owner: default
--

CREATE TABLE public."Region" (
    id integer NOT NULL,
    country_id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public."Region" OWNER TO "default";

--
-- Name: Region_id_seq; Type: SEQUENCE; Schema: public; Owner: default
--

CREATE SEQUENCE public."Region_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Region_id_seq" OWNER TO "default";

--
-- Name: Region_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: default
--

ALTER SEQUENCE public."Region_id_seq" OWNED BY public."Region".id;


--
-- Name: Section; Type: TABLE; Schema: public; Owner: default
--

CREATE TABLE public."Section" (
    id integer NOT NULL,
    name text NOT NULL,
    description text
);


ALTER TABLE public."Section" OWNER TO "default";

--
-- Name: Section_id_seq; Type: SEQUENCE; Schema: public; Owner: default
--

CREATE SEQUENCE public."Section_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Section_id_seq" OWNER TO "default";

--
-- Name: Section_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: default
--

ALTER SEQUENCE public."Section_id_seq" OWNED BY public."Section".id;


--
-- Name: TollRoad; Type: TABLE; Schema: public; Owner: default
--

CREATE TABLE public."TollRoad" (
    id integer NOT NULL,
    country_id integer NOT NULL,
    toll_type text NOT NULL,
    coordinates text,
    name text NOT NULL,
    description text NOT NULL,
    cost numeric(65,30) NOT NULL
);


ALTER TABLE public."TollRoad" OWNER TO "default";

--
-- Name: TollRoad_id_seq; Type: SEQUENCE; Schema: public; Owner: default
--

CREATE SEQUENCE public."TollRoad_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."TollRoad_id_seq" OWNER TO "default";

--
-- Name: TollRoad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: default
--

ALTER SEQUENCE public."TollRoad_id_seq" OWNED BY public."TollRoad".id;


--
-- Name: User; Type: TABLE; Schema: public; Owner: default
--

CREATE TABLE public."User" (
    id integer NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    middle_name text,
    email text NOT NULL,
    car_number text,
    photo text,
    birthday timestamp(3) without time zone,
    gender text,
    role public."Role" DEFAULT 'USER'::public."Role" NOT NULL,
    password text NOT NULL,
    "accessToken" text,
    "refreshToken" text
);


ALTER TABLE public."User" OWNER TO "default";

--
-- Name: UserOrder; Type: TABLE; Schema: public; Owner: default
--

CREATE TABLE public."UserOrder" (
    id integer NOT NULL,
    user_id integer NOT NULL,
    purchase_date timestamp(3) without time zone NOT NULL,
    operation_type text NOT NULL,
    amount numeric(65,30) NOT NULL,
    car_number text NOT NULL
);


ALTER TABLE public."UserOrder" OWNER TO "default";

--
-- Name: UserOrder_id_seq; Type: SEQUENCE; Schema: public; Owner: default
--

CREATE SEQUENCE public."UserOrder_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."UserOrder_id_seq" OWNER TO "default";

--
-- Name: UserOrder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: default
--

ALTER SEQUENCE public."UserOrder_id_seq" OWNED BY public."UserOrder".id;


--
-- Name: User_id_seq; Type: SEQUENCE; Schema: public; Owner: default
--

CREATE SEQUENCE public."User_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."User_id_seq" OWNER TO "default";

--
-- Name: User_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: default
--

ALTER SEQUENCE public."User_id_seq" OWNED BY public."User".id;


--
-- Name: VehicleType; Type: TABLE; Schema: public; Owner: default
--

CREATE TABLE public."VehicleType" (
    id integer NOT NULL,
    toll_road_id integer NOT NULL,
    type text NOT NULL,
    description text NOT NULL,
    cost numeric(65,30) NOT NULL
);


ALTER TABLE public."VehicleType" OWNER TO "default";

--
-- Name: VehicleType_id_seq; Type: SEQUENCE; Schema: public; Owner: default
--

CREATE SEQUENCE public."VehicleType_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."VehicleType_id_seq" OWNER TO "default";

--
-- Name: VehicleType_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: default
--

ALTER SEQUENCE public."VehicleType_id_seq" OWNED BY public."VehicleType".id;


--
-- Name: VingetteOption; Type: TABLE; Schema: public; Owner: default
--

CREATE TABLE public."VingetteOption" (
    id integer NOT NULL,
    operation_type text NOT NULL,
    period text NOT NULL,
    description text NOT NULL,
    link text,
    country_id integer NOT NULL,
    vehicle_type_id integer NOT NULL,
    toll_road_id integer NOT NULL
);


ALTER TABLE public."VingetteOption" OWNER TO "default";

--
-- Name: VingetteOption_id_seq; Type: SEQUENCE; Schema: public; Owner: default
--

CREATE SEQUENCE public."VingetteOption_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."VingetteOption_id_seq" OWNER TO "default";

--
-- Name: VingetteOption_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: default
--

ALTER SEQUENCE public."VingetteOption_id_seq" OWNED BY public."VingetteOption".id;


--
-- Name: City id; Type: DEFAULT; Schema: public; Owner: default
--

ALTER TABLE ONLY public."City" ALTER COLUMN id SET DEFAULT nextval('public."City_id_seq"'::regclass);


--
-- Name: Country id; Type: DEFAULT; Schema: public; Owner: default
--

ALTER TABLE ONLY public."Country" ALTER COLUMN id SET DEFAULT nextval('public."Country_id_seq"'::regclass);


--
-- Name: Image id; Type: DEFAULT; Schema: public; Owner: default
--

ALTER TABLE ONLY public."Image" ALTER COLUMN id SET DEFAULT nextval('public."Image_id_seq"'::regclass);


--
-- Name: Language id; Type: DEFAULT; Schema: public; Owner: default
--

ALTER TABLE ONLY public."Language" ALTER COLUMN id SET DEFAULT nextval('public."Language_id_seq"'::regclass);


--
-- Name: Post id; Type: DEFAULT; Schema: public; Owner: default
--

ALTER TABLE ONLY public."Post" ALTER COLUMN id SET DEFAULT nextval('public."Post_id_seq"'::regclass);


--
-- Name: PostTranslation id; Type: DEFAULT; Schema: public; Owner: default
--

ALTER TABLE ONLY public."PostTranslation" ALTER COLUMN id SET DEFAULT nextval('public."PostTranslation_id_seq"'::regclass);


--
-- Name: Region id; Type: DEFAULT; Schema: public; Owner: default
--

ALTER TABLE ONLY public."Region" ALTER COLUMN id SET DEFAULT nextval('public."Region_id_seq"'::regclass);


--
-- Name: Section id; Type: DEFAULT; Schema: public; Owner: default
--

ALTER TABLE ONLY public."Section" ALTER COLUMN id SET DEFAULT nextval('public."Section_id_seq"'::regclass);


--
-- Name: TollRoad id; Type: DEFAULT; Schema: public; Owner: default
--

ALTER TABLE ONLY public."TollRoad" ALTER COLUMN id SET DEFAULT nextval('public."TollRoad_id_seq"'::regclass);


--
-- Name: User id; Type: DEFAULT; Schema: public; Owner: default
--

ALTER TABLE ONLY public."User" ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);


--
-- Name: UserOrder id; Type: DEFAULT; Schema: public; Owner: default
--

ALTER TABLE ONLY public."UserOrder" ALTER COLUMN id SET DEFAULT nextval('public."UserOrder_id_seq"'::regclass);


--
-- Name: VehicleType id; Type: DEFAULT; Schema: public; Owner: default
--

ALTER TABLE ONLY public."VehicleType" ALTER COLUMN id SET DEFAULT nextval('public."VehicleType_id_seq"'::regclass);


--
-- Name: VingetteOption id; Type: DEFAULT; Schema: public; Owner: default
--

ALTER TABLE ONLY public."VingetteOption" ALTER COLUMN id SET DEFAULT nextval('public."VingetteOption_id_seq"'::regclass);


--
-- Data for Name: City; Type: TABLE DATA; Schema: public; Owner: default
--

COPY public."City" (id, region_id, name) FROM stdin;
\.


--
-- Data for Name: Country; Type: TABLE DATA; Schema: public; Owner: default
--

COPY public."Country" (id, name, has_toll_roads, capital, currency, currency_name, currency_symbol, emoji, "emojiU", flag, "geoData", iso2, iso3, latitude, longitude, nationality, native, numeric_code, phone_code, region, region_id, subregion, subregion_id, timezones, tld, translations) FROM stdin;
1	Afghanistan	f	Kabul	AFN	Afghan afghani	؋	🇦🇫	U+1F1E6 U+1F1EB	\N	\N	AF	AFG	33	65	Afghan	افغانستان	004	93	Asia	3	Southern Asia	14	[{"tzName": "Afghanistan Time", "zoneName": "Asia/Kabul", "gmtOffset": 16200, "abbreviation": "AFT", "gmtOffsetName": "UTC+04:30"}]	.af	{"de": "Afghanistan", "es": "Afganistán", "fa": "افغانستان", "fr": "Afghanistan", "hr": "Afganistan", "it": "Afghanistan", "ja": "アフガニスタン", "ko": "아프가니스탄", "nl": "Afghanistan", "pl": "Afganistan", "pt": "Afeganistão", "ru": "Афганистан", "tr": "Afganistan", "uk": "Афганістан", "pt-BR": "Afeganistão", "zh-CN": "阿富汗"}
2	Aland Islands	f	Mariehamn	EUR	Euro	€	🇦🇽	U+1F1E6 U+1F1FD	\N	\N	AX	ALA	60.116667	19.9	Aland Island	Åland	248	358	Europe	4	Northern Europe	18	[{"tzName": "Eastern European Time", "zoneName": "Europe/Mariehamn", "gmtOffset": 7200, "abbreviation": "EET", "gmtOffsetName": "UTC+02:00"}]	.ax	{"de": "Åland", "es": "Alandia", "fa": "جزایر الند", "fr": "Åland", "hr": "Ålandski otoci", "it": "Isole Aland", "ja": "オーランド諸島", "ko": "올란드 제도", "nl": "Ålandeilanden", "pl": "Wyspy Alandzkie", "pt": "Ilhas de Aland", "ru": "Аландские острова", "tr": "Åland Adalari", "uk": "Аландські острови", "pt-BR": "Ilhas de Aland", "zh-CN": "奥兰群岛"}
3	Albania	f	Tirana	ALL	Albanian lek	Lek	🇦🇱	U+1F1E6 U+1F1F1	\N	\N	AL	ALB	41	20	Albanian 	Shqipëria	008	355	Europe	4	Southern Europe	16	[{"tzName": "Central European Time", "zoneName": "Europe/Tirane", "gmtOffset": 3600, "abbreviation": "CET", "gmtOffsetName": "UTC+01:00"}]	.al	{"de": "Albanien", "es": "Albania", "fa": "آلبانی", "fr": "Albanie", "hr": "Albanija", "it": "Albania", "ja": "アルバニア", "ko": "알바니아", "nl": "Albanië", "pl": "Albania", "pt": "Albânia", "ru": "Албания", "tr": "Arnavutluk", "uk": "Албанія", "pt-BR": "Albânia", "zh-CN": "阿尔巴尼亚"}
4	Algeria	f	Algiers	DZD	Algerian dinar	دج	🇩🇿	U+1F1E9 U+1F1FF	\N	\N	DZ	DZA	28	3	Algerian	الجزائر	012	213	Africa	1	Northern Africa	1	[{"tzName": "Central European Time", "zoneName": "Africa/Algiers", "gmtOffset": 3600, "abbreviation": "CET", "gmtOffsetName": "UTC+01:00"}]	.dz	{"de": "Algerien", "es": "Argelia", "fa": "الجزایر", "fr": "Algérie", "hr": "Alžir", "it": "Algeria", "ja": "アルジェリア", "ko": "알제리", "nl": "Algerije", "pl": "Algieria", "pt": "Argélia", "ru": "Алжир", "tr": "Cezayir", "uk": "Алжир", "pt-BR": "Argélia", "zh-CN": "阿尔及利亚"}
5	American Samoa	f	Pago Pago	USD	US Dollar	$	🇦🇸	U+1F1E6 U+1F1F8	\N	\N	AS	ASM	-14.33333333	-170	American Samoan	American Samoa	016	1	Oceania	5	Polynesia	22	[{"tzName": "Samoa Standard Time", "zoneName": "Pacific/Pago_Pago", "gmtOffset": -39600, "abbreviation": "SST", "gmtOffsetName": "UTC-11:00"}]	.as	{"de": "Amerikanisch-Samoa", "es": "Samoa Americana", "fa": "ساموآی آمریکا", "fr": "Samoa américaines", "hr": "Američka Samoa", "it": "Samoa Americane", "ja": "アメリカ領サモア", "ko": "아메리칸사모아", "nl": "Amerikaans Samoa", "pl": "Samoa Amerykańskie", "pt": "Samoa Americana", "ru": "Американское Самоа", "tr": "Amerikan Samoasi", "uk": "Американське Самоа", "pt-BR": "Samoa Americana", "zh-CN": "美属萨摩亚"}
6	Andorra	f	Andorra la Vella	EUR	Euro	€	🇦🇩	U+1F1E6 U+1F1E9	\N	\N	AD	AND	42.5	1.5	Andorran	Andorra	020	376	Europe	4	Southern Europe	16	[{"tzName": "Central European Time", "zoneName": "Europe/Andorra", "gmtOffset": 3600, "abbreviation": "CET", "gmtOffsetName": "UTC+01:00"}]	.ad	{"de": "Andorra", "es": "Andorra", "fa": "آندورا", "fr": "Andorre", "hr": "Andora", "it": "Andorra", "ja": "アンドラ", "ko": "안도라", "nl": "Andorra", "pl": "Andora", "pt": "Andorra", "ru": "Андорра", "tr": "Andorra", "uk": "Андорра", "pt-BR": "Andorra", "zh-CN": "安道尔"}
7	Angola	f	Luanda	AOA	Angolan kwanza	Kz	🇦🇴	U+1F1E6 U+1F1F4	\N	\N	AO	AGO	-12.5	18.5	Angolan	Angola	024	244	Africa	1	Middle Africa	2	[{"tzName": "West Africa Time", "zoneName": "Africa/Luanda", "gmtOffset": 3600, "abbreviation": "WAT", "gmtOffsetName": "UTC+01:00"}]	.ao	{"de": "Angola", "es": "Angola", "fa": "آنگولا", "fr": "Angola", "hr": "Angola", "it": "Angola", "ja": "アンゴラ", "ko": "앙골라", "nl": "Angola", "pl": "Angola", "pt": "Angola", "ru": "Ангола", "tr": "Angola", "uk": "Ангола", "pt-BR": "Angola", "zh-CN": "安哥拉"}
8	Anguilla	f	The Valley	XCD	East Caribbean dollar	$	🇦🇮	U+1F1E6 U+1F1EE	\N	\N	AI	AIA	18.25	-63.16666666	Anguillan	Anguilla	660	1	Americas	2	Caribbean	7	[{"tzName": "Atlantic Standard Time", "zoneName": "America/Anguilla", "gmtOffset": -14400, "abbreviation": "AST", "gmtOffsetName": "UTC-04:00"}]	.ai	{"de": "Anguilla", "es": "Anguilla", "fa": "آنگویلا", "fr": "Anguilla", "hr": "Angvila", "it": "Anguilla", "ja": "アンギラ", "ko": "앵귈라", "nl": "Anguilla", "pl": "Anguilla", "pt": "Anguila", "ru": "Ангилья", "tr": "Anguilla", "uk": "Ангілья", "pt-BR": "Anguila", "zh-CN": "安圭拉"}
9	Antarctica	f		AAD	Antarctican dollar	$	🇦🇶	U+1F1E6 U+1F1F6	\N	\N	AQ	ATA	-74.65	4.48	Antarctic	Antarctica	010	672	Polar	6		\N	[{"tzName": "Australian Western Standard Time", "zoneName": "Antarctica/Casey", "gmtOffset": 39600, "abbreviation": "AWST", "gmtOffsetName": "UTC+11:00"}, {"tzName": "Davis Time", "zoneName": "Antarctica/Davis", "gmtOffset": 25200, "abbreviation": "DAVT", "gmtOffsetName": "UTC+07:00"}, {"tzName": "Dumont d'Urville Time", "zoneName": "Antarctica/DumontDUrville", "gmtOffset": 36000, "abbreviation": "DDUT", "gmtOffsetName": "UTC+10:00"}, {"tzName": "Mawson Station Time", "zoneName": "Antarctica/Mawson", "gmtOffset": 18000, "abbreviation": "MAWT", "gmtOffsetName": "UTC+05:00"}, {"tzName": "New Zealand Daylight Time", "zoneName": "Antarctica/McMurdo", "gmtOffset": 46800, "abbreviation": "NZDT", "gmtOffsetName": "UTC+13:00"}, {"tzName": "Chile Summer Time", "zoneName": "Antarctica/Palmer", "gmtOffset": -10800, "abbreviation": "CLST", "gmtOffsetName": "UTC-03:00"}, {"tzName": "Rothera Research Station Time", "zoneName": "Antarctica/Rothera", "gmtOffset": -10800, "abbreviation": "ROTT", "gmtOffsetName": "UTC-03:00"}, {"tzName": "Showa Station Time", "zoneName": "Antarctica/Syowa", "gmtOffset": 10800, "abbreviation": "SYOT", "gmtOffsetName": "UTC+03:00"}, {"tzName": "Greenwich Mean Time", "zoneName": "Antarctica/Troll", "gmtOffset": 0, "abbreviation": "GMT", "gmtOffsetName": "UTC±00"}, {"tzName": "Vostok Station Time", "zoneName": "Antarctica/Vostok", "gmtOffset": 21600, "abbreviation": "VOST", "gmtOffsetName": "UTC+06:00"}]	.aq	{"de": "Antarktika", "es": "Antártida", "fa": "جنوبگان", "fr": "Antarctique", "hr": "Antarktika", "it": "Antartide", "ja": "南極大陸", "ko": "남극", "nl": "Antarctica", "pl": "Antarktyda", "pt": "Antárctida", "ru": "Антарктида", "tr": "Antartika", "uk": "Антарктида", "pt-BR": "Antártida", "zh-CN": "南极洲"}
10	Antigua and Barbuda	f	St. John's	XCD	Eastern Caribbean dollar	$	🇦🇬	U+1F1E6 U+1F1EC	\N	\N	AG	ATG	17.05	-61.8	Antiguan or Barbudan	Antigua and Barbuda	028	1	Americas	2	Caribbean	7	[{"tzName": "Atlantic Standard Time", "zoneName": "America/Antigua", "gmtOffset": -14400, "abbreviation": "AST", "gmtOffsetName": "UTC-04:00"}]	.ag	{"de": "Antigua und Barbuda", "es": "Antigua y Barbuda", "fa": "آنتیگوا و باربودا", "fr": "Antigua-et-Barbuda", "hr": "Antigva i Barbuda", "it": "Antigua e Barbuda", "ja": "アンティグア・バーブーダ", "ko": "앤티가 바부다", "nl": "Antigua en Barbuda", "pl": "Antigua i Barbuda", "pt": "Antígua e Barbuda", "ru": "Антигуа и Барбуда", "tr": "Antigua Ve Barbuda", "uk": "Антигуа і Барбуда", "pt-BR": "Antígua e Barbuda", "zh-CN": "安提瓜和巴布达"}
11	Argentina	f	Buenos Aires	ARS	Argentine peso	$	🇦🇷	U+1F1E6 U+1F1F7	\N	\N	AR	ARG	-34	-64	Argentine	Argentina	032	54	Americas	2	South America	8	[{"tzName": "Argentina Time", "zoneName": "America/Argentina/Buenos_Aires", "gmtOffset": -10800, "abbreviation": "ART", "gmtOffsetName": "UTC-03:00"}, {"tzName": "Argentina Time", "zoneName": "America/Argentina/Catamarca", "gmtOffset": -10800, "abbreviation": "ART", "gmtOffsetName": "UTC-03:00"}, {"tzName": "Argentina Time", "zoneName": "America/Argentina/Cordoba", "gmtOffset": -10800, "abbreviation": "ART", "gmtOffsetName": "UTC-03:00"}, {"tzName": "Argentina Time", "zoneName": "America/Argentina/Jujuy", "gmtOffset": -10800, "abbreviation": "ART", "gmtOffsetName": "UTC-03:00"}, {"tzName": "Argentina Time", "zoneName": "America/Argentina/La_Rioja", "gmtOffset": -10800, "abbreviation": "ART", "gmtOffsetName": "UTC-03:00"}, {"tzName": "Argentina Time", "zoneName": "America/Argentina/Mendoza", "gmtOffset": -10800, "abbreviation": "ART", "gmtOffsetName": "UTC-03:00"}, {"tzName": "Argentina Time", "zoneName": "America/Argentina/Rio_Gallegos", "gmtOffset": -10800, "abbreviation": "ART", "gmtOffsetName": "UTC-03:00"}, {"tzName": "Argentina Time", "zoneName": "America/Argentina/Salta", "gmtOffset": -10800, "abbreviation": "ART", "gmtOffsetName": "UTC-03:00"}, {"tzName": "Argentina Time", "zoneName": "America/Argentina/San_Juan", "gmtOffset": -10800, "abbreviation": "ART", "gmtOffsetName": "UTC-03:00"}, {"tzName": "Argentina Time", "zoneName": "America/Argentina/San_Luis", "gmtOffset": -10800, "abbreviation": "ART", "gmtOffsetName": "UTC-03:00"}, {"tzName": "Argentina Time", "zoneName": "America/Argentina/Tucuman", "gmtOffset": -10800, "abbreviation": "ART", "gmtOffsetName": "UTC-03:00"}, {"tzName": "Argentina Time", "zoneName": "America/Argentina/Ushuaia", "gmtOffset": -10800, "abbreviation": "ART", "gmtOffsetName": "UTC-03:00"}]	.ar	{"de": "Argentinien", "es": "Argentina", "fa": "آرژانتین", "fr": "Argentine", "hr": "Argentina", "it": "Argentina", "ja": "アルゼンチン", "ko": "아르헨티나", "nl": "Argentinië", "pl": "Argentyna", "pt": "Argentina", "ru": "Аргентина", "tr": "Arjantin", "uk": "Аргентина", "pt-BR": "Argentina", "zh-CN": "阿根廷"}
12	Armenia	f	Yerevan	AMD	Armenian dram	֏	🇦🇲	U+1F1E6 U+1F1F2	\N	\N	AM	ARM	40	45	Armenian	Հայաստան	051	374	Asia	3	Western Asia	11	[{"tzName": "Armenia Time", "zoneName": "Asia/Yerevan", "gmtOffset": 14400, "abbreviation": "AMT", "gmtOffsetName": "UTC+04:00"}]	.am	{"de": "Armenien", "es": "Armenia", "fa": "ارمنستان", "fr": "Arménie", "hr": "Armenija", "it": "Armenia", "ja": "アルメニア", "ko": "아르메니아", "nl": "Armenië", "pl": "Armenia", "pt": "Arménia", "ru": "Армения", "tr": "Ermenistan", "uk": "Вірменія", "pt-BR": "Armênia", "zh-CN": "亚美尼亚"}
13	Aruba	f	Oranjestad	AWG	Aruban florin	ƒ	🇦🇼	U+1F1E6 U+1F1FC	\N	\N	AW	ABW	12.5	-69.96666666	Aruban	Aruba	533	297	Americas	2	Caribbean	7	[{"tzName": "Atlantic Standard Time", "zoneName": "America/Aruba", "gmtOffset": -14400, "abbreviation": "AST", "gmtOffsetName": "UTC-04:00"}]	.aw	{"de": "Aruba", "es": "Aruba", "fa": "آروبا", "fr": "Aruba", "hr": "Aruba", "it": "Aruba", "ja": "アルバ", "ko": "아루바", "nl": "Aruba", "pl": "Aruba", "pt": "Aruba", "ru": "Аруба", "tr": "Aruba", "uk": "Аруба", "pt-BR": "Aruba", "zh-CN": "阿鲁巴"}
14	Australia	f	Canberra	AUD	Australian dollar	$	🇦🇺	U+1F1E6 U+1F1FA	\N	\N	AU	AUS	-27	133	Australian	Australia	036	61	Oceania	5	Australia and New Zealand	19	[{"tzName": "Macquarie Island Station Time", "zoneName": "Antarctica/Macquarie", "gmtOffset": 39600, "abbreviation": "MIST", "gmtOffsetName": "UTC+11:00"}, {"tzName": "Australian Central Daylight Saving Time", "zoneName": "Australia/Adelaide", "gmtOffset": 37800, "abbreviation": "ACDT", "gmtOffsetName": "UTC+10:30"}, {"tzName": "Australian Eastern Standard Time", "zoneName": "Australia/Brisbane", "gmtOffset": 36000, "abbreviation": "AEST", "gmtOffsetName": "UTC+10:00"}, {"tzName": "Australian Central Daylight Saving Time", "zoneName": "Australia/Broken_Hill", "gmtOffset": 37800, "abbreviation": "ACDT", "gmtOffsetName": "UTC+10:30"}, {"tzName": "Australian Eastern Daylight Saving Time", "zoneName": "Australia/Currie", "gmtOffset": 39600, "abbreviation": "AEDT", "gmtOffsetName": "UTC+11:00"}, {"tzName": "Australian Central Standard Time", "zoneName": "Australia/Darwin", "gmtOffset": 34200, "abbreviation": "ACST", "gmtOffsetName": "UTC+09:30"}, {"tzName": "Australian Central Western Standard Time (Unofficial)", "zoneName": "Australia/Eucla", "gmtOffset": 31500, "abbreviation": "ACWST", "gmtOffsetName": "UTC+08:45"}, {"tzName": "Australian Eastern Daylight Saving Time", "zoneName": "Australia/Hobart", "gmtOffset": 39600, "abbreviation": "AEDT", "gmtOffsetName": "UTC+11:00"}, {"tzName": "Australian Eastern Standard Time", "zoneName": "Australia/Lindeman", "gmtOffset": 36000, "abbreviation": "AEST", "gmtOffsetName": "UTC+10:00"}, {"tzName": "Lord Howe Summer Time", "zoneName": "Australia/Lord_Howe", "gmtOffset": 39600, "abbreviation": "LHST", "gmtOffsetName": "UTC+11:00"}, {"tzName": "Australian Eastern Daylight Saving Time", "zoneName": "Australia/Melbourne", "gmtOffset": 39600, "abbreviation": "AEDT", "gmtOffsetName": "UTC+11:00"}, {"tzName": "Australian Western Standard Time", "zoneName": "Australia/Perth", "gmtOffset": 28800, "abbreviation": "AWST", "gmtOffsetName": "UTC+08:00"}, {"tzName": "Australian Eastern Daylight Saving Time", "zoneName": "Australia/Sydney", "gmtOffset": 39600, "abbreviation": "AEDT", "gmtOffsetName": "UTC+11:00"}]	.au	{"de": "Australien", "es": "Australia", "fa": "استرالیا", "fr": "Australie", "hr": "Australija", "it": "Australia", "ja": "オーストラリア", "ko": "호주", "nl": "Australië", "pl": "Australia", "pt": "Austrália", "ru": "Австралия", "tr": "Avustralya", "uk": "Австралія", "pt-BR": "Austrália", "zh-CN": "澳大利亚"}
15	Austria	f	Vienna	EUR	Euro	€	🇦🇹	U+1F1E6 U+1F1F9	\N	\N	AT	AUT	47.33333333	13.33333333	Austrian	Österreich	040	43	Europe	4	Western Europe	17	[{"tzName": "Central European Time", "zoneName": "Europe/Vienna", "gmtOffset": 3600, "abbreviation": "CET", "gmtOffsetName": "UTC+01:00"}]	.at	{"de": "Österreich", "es": "Austria", "fa": "اتریش", "fr": "Autriche", "hr": "Austrija", "it": "Austria", "ja": "オーストリア", "ko": "오스트리아", "nl": "Oostenrijk", "pl": "Austria", "pt": "áustria", "ru": "Австрия", "tr": "Avusturya", "uk": "Австрія", "pt-BR": "áustria", "zh-CN": "奥地利"}
16	Azerbaijan	f	Baku	AZN	Azerbaijani manat	m	🇦🇿	U+1F1E6 U+1F1FF	\N	\N	AZ	AZE	40.5	47.5	Azerbaijani, Azeri	Azərbaycan	031	994	Asia	3	Western Asia	11	[{"tzName": "Azerbaijan Time", "zoneName": "Asia/Baku", "gmtOffset": 14400, "abbreviation": "AZT", "gmtOffsetName": "UTC+04:00"}]	.az	{"de": "Aserbaidschan", "es": "Azerbaiyán", "fa": "آذربایجان", "fr": "Azerbaïdjan", "hr": "Azerbajdžan", "it": "Azerbaijan", "ja": "アゼルバイジャン", "ko": "아제르바이잔", "nl": "Azerbeidzjan", "pl": "Azerbejdżan", "pt": "Azerbaijão", "ru": "Азербайджан", "tr": "Azerbaycan", "uk": "Азербайджан", "pt-BR": "Azerbaijão", "zh-CN": "阿塞拜疆"}
18	Bahrain	f	Manama	BHD	Bahraini dinar	.د.ب	🇧🇭	U+1F1E7 U+1F1ED	\N	\N	BH	BHR	26	50.55	Bahraini	‏البحرين	048	973	Asia	3	Western Asia	11	[{"tzName": "Arabia Standard Time", "zoneName": "Asia/Bahrain", "gmtOffset": 10800, "abbreviation": "AST", "gmtOffsetName": "UTC+03:00"}]	.bh	{"de": "Bahrain", "es": "Bahrein", "fa": "بحرین", "fr": "Bahreïn", "hr": "Bahrein", "it": "Bahrein", "ja": "バーレーン", "ko": "바레인", "nl": "Bahrein", "pl": "Bahrajn", "pt": "Barém", "ru": "Бахрейн", "tr": "Bahreyn", "uk": "Бахрейн", "pt-BR": "Bahrein", "zh-CN": "巴林"}
19	Bangladesh	f	Dhaka	BDT	Bangladeshi taka	৳	🇧🇩	U+1F1E7 U+1F1E9	\N	\N	BD	BGD	24	90	Bangladeshi	Bangladesh	050	880	Asia	3	Southern Asia	14	[{"tzName": "Bangladesh Standard Time", "zoneName": "Asia/Dhaka", "gmtOffset": 21600, "abbreviation": "BDT", "gmtOffsetName": "UTC+06:00"}]	.bd	{"de": "Bangladesch", "es": "Bangladesh", "fa": "بنگلادش", "fr": "Bangladesh", "hr": "Bangladeš", "it": "Bangladesh", "ja": "バングラデシュ", "ko": "방글라데시", "nl": "Bangladesh", "pl": "Bangladesz", "pt": "Bangladeche", "ru": "Бангладеш", "tr": "Bangladeş", "uk": "Бангладеш", "pt-BR": "Bangladesh", "zh-CN": "孟加拉"}
20	Barbados	f	Bridgetown	BBD	Barbadian dollar	Bds$	🇧🇧	U+1F1E7 U+1F1E7	\N	\N	BB	BRB	13.16666666	-59.53333333	Barbadian	Barbados	052	1	Americas	2	Caribbean	7	[{"tzName": "Atlantic Standard Time", "zoneName": "America/Barbados", "gmtOffset": -14400, "abbreviation": "AST", "gmtOffsetName": "UTC-04:00"}]	.bb	{"de": "Barbados", "es": "Barbados", "fa": "باربادوس", "fr": "Barbade", "hr": "Barbados", "it": "Barbados", "ja": "バルバドス", "ko": "바베이도스", "nl": "Barbados", "pl": "Barbados", "pt": "Barbados", "ru": "Барбадос", "tr": "Barbados", "uk": "Барбадос", "pt-BR": "Barbados", "zh-CN": "巴巴多斯"}
21	Belarus	f	Minsk	BYN	Belarusian ruble	Br	🇧🇾	U+1F1E7 U+1F1FE	\N	\N	BY	BLR	53	28	Belarusian	Белару́сь	112	375	Europe	4	Eastern Europe	15	[{"tzName": "Moscow Time", "zoneName": "Europe/Minsk", "gmtOffset": 10800, "abbreviation": "MSK", "gmtOffsetName": "UTC+03:00"}]	.by	{"de": "Weißrussland", "es": "Bielorrusia", "fa": "بلاروس", "fr": "Biélorussie", "hr": "Bjelorusija", "it": "Bielorussia", "ja": "ベラルーシ", "ko": "벨라루스", "nl": "Wit-Rusland", "pl": "Białoruś", "pt": "Bielorrússia", "ru": "Беларусь", "tr": "Belarus", "uk": "Білорусь", "pt-BR": "Bielorrússia", "zh-CN": "白俄罗斯"}
22	Belgium	f	Brussels	EUR	Euro	€	🇧🇪	U+1F1E7 U+1F1EA	\N	\N	BE	BEL	50.83333333	4	Belgian	België	056	32	Europe	4	Western Europe	17	[{"tzName": "Central European Time", "zoneName": "Europe/Brussels", "gmtOffset": 3600, "abbreviation": "CET", "gmtOffsetName": "UTC+01:00"}]	.be	{"de": "Belgien", "es": "Bélgica", "fa": "بلژیک", "fr": "Belgique", "hr": "Belgija", "it": "Belgio", "ja": "ベルギー", "ko": "벨기에", "nl": "België", "pl": "Belgia", "pt": "Bélgica", "ru": "Бельгия", "tr": "Belçika", "uk": "Бельгія", "pt-BR": "Bélgica", "zh-CN": "比利时"}
23	Belize	f	Belmopan	BZD	Belize dollar	$	🇧🇿	U+1F1E7 U+1F1FF	\N	\N	BZ	BLZ	17.25	-88.75	Belizean	Belize	084	501	Americas	2	Central America	9	[{"tzName": "Central Standard Time (North America)", "zoneName": "America/Belize", "gmtOffset": -21600, "abbreviation": "CST", "gmtOffsetName": "UTC-06:00"}]	.bz	{"de": "Belize", "es": "Belice", "fa": "بلیز", "fr": "Belize", "hr": "Belize", "it": "Belize", "ja": "ベリーズ", "ko": "벨리즈", "nl": "Belize", "pl": "Belize", "pt": "Belize", "ru": "Белиз", "tr": "Belize", "uk": "Беліз", "pt-BR": "Belize", "zh-CN": "伯利兹"}
24	Benin	f	Porto-Novo	XOF	West African CFA franc	CFA	🇧🇯	U+1F1E7 U+1F1EF	\N	\N	BJ	BEN	9.5	2.25	Beninese, Beninois	Bénin	204	229	Africa	1	Western Africa	3	[{"tzName": "West Africa Time", "zoneName": "Africa/Porto-Novo", "gmtOffset": 3600, "abbreviation": "WAT", "gmtOffsetName": "UTC+01:00"}]	.bj	{"de": "Benin", "es": "Benín", "fa": "بنین", "fr": "Bénin", "hr": "Benin", "it": "Benin", "ja": "ベナン", "ko": "베냉", "nl": "Benin", "pl": "Benin", "pt": "Benim", "ru": "Бенин", "tr": "Benin", "uk": "Бенін", "pt-BR": "Benin", "zh-CN": "贝宁"}
25	Bermuda	f	Hamilton	BMD	Bermudian dollar	$	🇧🇲	U+1F1E7 U+1F1F2	\N	\N	BM	BMU	32.33333333	-64.75	Bermudian, Bermudan	Bermuda	060	1	Americas	2	Northern America	6	[{"tzName": "Atlantic Standard Time", "zoneName": "Atlantic/Bermuda", "gmtOffset": -14400, "abbreviation": "AST", "gmtOffsetName": "UTC-04:00"}]	.bm	{"de": "Bermuda", "es": "Bermudas", "fa": "برمودا", "fr": "Bermudes", "hr": "Bermudi", "it": "Bermuda", "ja": "バミューダ", "ko": "버뮤다", "nl": "Bermuda", "pl": "Bermudy", "pt": "Bermudas", "ru": "Бермуды", "tr": "Bermuda", "uk": "Бермудські острови", "pt-BR": "Bermudas", "zh-CN": "百慕大"}
26	Bhutan	f	Thimphu	BTN	Bhutanese ngultrum	Nu.	🇧🇹	U+1F1E7 U+1F1F9	\N	\N	BT	BTN	27.5	90.5	Bhutanese	ʼbrug-yul	064	975	Asia	3	Southern Asia	14	[{"tzName": "Bhutan Time", "zoneName": "Asia/Thimphu", "gmtOffset": 21600, "abbreviation": "BTT", "gmtOffsetName": "UTC+06:00"}]	.bt	{"de": "Bhutan", "es": "Bután", "fa": "بوتان", "fr": "Bhoutan", "hr": "Butan", "it": "Bhutan", "ja": "ブータン", "ko": "부탄", "nl": "Bhutan", "pl": "Bhutan", "pt": "Butão", "ru": "Бутан", "tr": "Butan", "uk": "Бутан", "pt-BR": "Butão", "zh-CN": "不丹"}
27	Bolivia	f	Sucre	BOB	Bolivian boliviano	Bs.	🇧🇴	U+1F1E7 U+1F1F4	\N	\N	BO	BOL	-17	-65	Bolivian	Bolivia	068	591	Americas	2	South America	8	[{"tzName": "Bolivia Time", "zoneName": "America/La_Paz", "gmtOffset": -14400, "abbreviation": "BOT", "gmtOffsetName": "UTC-04:00"}]	.bo	{"de": "Bolivien", "es": "Bolivia", "fa": "بولیوی", "fr": "Bolivie", "hr": "Bolivija", "it": "Bolivia", "ja": "ボリビア多民族国", "ko": "볼리비아", "nl": "Bolivia", "pl": "Boliwia", "pt": "Bolívia", "ru": "Боливия", "tr": "Bolivya", "uk": "Болівія", "pt-BR": "Bolívia", "zh-CN": "玻利维亚"}
155	Bonaire, Sint Eustatius and Saba	f	Kralendijk	USD	United States dollar	$	🇧🇶	U+1F1E7 U+1F1F6	\N	\N	BQ	BES	12.15	-68.266667	Bonaire	Caribisch Nederland	535	599	Americas	2	Caribbean	7	[{"tzName": "Atlantic Standard Time", "zoneName": "America/Anguilla", "gmtOffset": -14400, "abbreviation": "AST", "gmtOffsetName": "UTC-04:00"}]	.an	{"de": "Bonaire, Sint Eustatius und Saba", "fa": "بونیر", "fr": "Bonaire, Saint-Eustache et Saba", "it": "Bonaire, Saint-Eustache e Saba", "ko": "보네르 섬", "pl": "Bonaire, Sint Eustatius i Saba", "pt": "Bonaire", "ru": "Бонайре, Синт-Эстатиус и Саба", "tr": "Karayip Hollandasi", "uk": "Бонайре, Сент-Естатіус і Саба", "pt-BR": "Bonaire", "zh-CN": "博内尔岛、圣尤斯特歇斯和萨巴岛"}
28	Bosnia and Herzegovina	f	Sarajevo	BAM	Bosnia and Herzegovina convertible mark	KM	🇧🇦	U+1F1E7 U+1F1E6	\N	\N	BA	BIH	44	18	Bosnian or Herzegovinian	Bosna i Hercegovina	070	387	Europe	4	Southern Europe	16	[{"tzName": "Central European Time", "zoneName": "Europe/Sarajevo", "gmtOffset": 3600, "abbreviation": "CET", "gmtOffsetName": "UTC+01:00"}]	.ba	{"de": "Bosnien und Herzegowina", "es": "Bosnia y Herzegovina", "fa": "بوسنی و هرزگوین", "fr": "Bosnie-Herzégovine", "hr": "Bosna i Hercegovina", "it": "Bosnia ed Erzegovina", "ja": "ボスニア・ヘルツェゴビナ", "ko": "보스니아 헤르체고비나", "nl": "Bosnië en Herzegovina", "pl": "Bośnia i Hercegowina", "pt": "Bósnia e Herzegovina", "ru": "Босния и Герцеговина", "tr": "Bosna Hersek", "uk": "Боснія і Герцеговина", "pt-BR": "Bósnia e Herzegovina", "zh-CN": "波斯尼亚和黑塞哥维那"}
29	Botswana	f	Gaborone	BWP	Botswana pula	P	🇧🇼	U+1F1E7 U+1F1FC	\N	\N	BW	BWA	-22	24	Motswana, Botswanan	Botswana	072	267	Africa	1	Southern Africa	5	[{"tzName": "Central Africa Time", "zoneName": "Africa/Gaborone", "gmtOffset": 7200, "abbreviation": "CAT", "gmtOffsetName": "UTC+02:00"}]	.bw	{"de": "Botswana", "es": "Botswana", "fa": "بوتسوانا", "fr": "Botswana", "hr": "Bocvana", "it": "Botswana", "ja": "ボツワナ", "ko": "보츠와나", "nl": "Botswana", "pl": "Botswana", "pt": "Botsuana", "ru": "Ботсвана", "tr": "Botsvana", "uk": "Ботсвана", "pt-BR": "Botsuana", "zh-CN": "博茨瓦纳"}
30	Bouvet Island	f		NOK	Norwegian Krone	ko	🇧🇻	U+1F1E7 U+1F1FB	\N	\N	BV	BVT	-54.43333333	3.4	Bouvet Island	Bouvetøya	074	0055		\N		\N	[{"tzName": "Central European Time", "zoneName": "Europe/Oslo", "gmtOffset": 3600, "abbreviation": "CET", "gmtOffsetName": "UTC+01:00"}]	.bv	{"de": "Bouvetinsel", "es": "Isla Bouvet", "fa": "جزیره بووه", "fr": "Île Bouvet", "hr": "Otok Bouvet", "it": "Isola Bouvet", "ja": "ブーベ島", "ko": "부벳 섬", "nl": "Bouveteiland", "pl": "Wyspa Bouveta", "pt": "Ilha Bouvet", "ru": "Остров Буве", "tr": "Bouvet Adasi", "uk": "Острів Буве", "pt-BR": "Ilha Bouvet", "zh-CN": "布维岛"}
40	Cape Verde	f	Praia	CVE	Cape Verdean escudo	$	🇨🇻	U+1F1E8 U+1F1FB	\N	\N	CV	CPV	16	-24	Verdean	Cabo Verde	132	238	Africa	1	Western Africa	3	[{"tzName": "Cape Verde Time", "zoneName": "Atlantic/Cape_Verde", "gmtOffset": -3600, "abbreviation": "CVT", "gmtOffsetName": "UTC-01:00"}]	.cv	{"de": "Kap Verde", "es": "Cabo Verde", "fa": "کیپ ورد", "fr": "Cap Vert", "hr": "Zelenortska Republika", "it": "Capo Verde", "ja": "カーボベルデ", "ko": "카보베르데", "nl": "Kaapverdië", "pl": "Republika Zielonego Przylądka", "pt": "Cabo Verde", "ru": "Кабо-Верде", "tr": "Cabo Verde", "uk": "Кабо-Верде", "pt-BR": "Cabo Verde", "zh-CN": "佛得角"}
31	Brazil	f	Brasilia	BRL	Brazilian real	R$	🇧🇷	U+1F1E7 U+1F1F7	\N	\N	BR	BRA	-10	-55	Brazilian	Brasil	076	55	Americas	2	South America	8	[{"tzName": "Brasília Time", "zoneName": "America/Araguaina", "gmtOffset": -10800, "abbreviation": "BRT", "gmtOffsetName": "UTC-03:00"}, {"tzName": "Brasília Time", "zoneName": "America/Bahia", "gmtOffset": -10800, "abbreviation": "BRT", "gmtOffsetName": "UTC-03:00"}, {"tzName": "Brasília Time", "zoneName": "America/Belem", "gmtOffset": -10800, "abbreviation": "BRT", "gmtOffsetName": "UTC-03:00"}, {"tzName": "Amazon Time (Brazil)[3", "zoneName": "America/Boa_Vista", "gmtOffset": -14400, "abbreviation": "AMT", "gmtOffsetName": "UTC-04:00"}, {"tzName": "Amazon Time (Brazil)[3", "zoneName": "America/Campo_Grande", "gmtOffset": -14400, "abbreviation": "AMT", "gmtOffsetName": "UTC-04:00"}, {"tzName": "Brasilia Time", "zoneName": "America/Cuiaba", "gmtOffset": -14400, "abbreviation": "BRT", "gmtOffsetName": "UTC-04:00"}, {"tzName": "Acre Time", "zoneName": "America/Eirunepe", "gmtOffset": -18000, "abbreviation": "ACT", "gmtOffsetName": "UTC-05:00"}, {"tzName": "Brasília Time", "zoneName": "America/Fortaleza", "gmtOffset": -10800, "abbreviation": "BRT", "gmtOffsetName": "UTC-03:00"}, {"tzName": "Brasília Time", "zoneName": "America/Maceio", "gmtOffset": -10800, "abbreviation": "BRT", "gmtOffsetName": "UTC-03:00"}, {"tzName": "Amazon Time (Brazil)", "zoneName": "America/Manaus", "gmtOffset": -14400, "abbreviation": "AMT", "gmtOffsetName": "UTC-04:00"}, {"tzName": "Fernando de Noronha Time", "zoneName": "America/Noronha", "gmtOffset": -7200, "abbreviation": "FNT", "gmtOffsetName": "UTC-02:00"}, {"tzName": "Amazon Time (Brazil)[3", "zoneName": "America/Porto_Velho", "gmtOffset": -14400, "abbreviation": "AMT", "gmtOffsetName": "UTC-04:00"}, {"tzName": "Brasília Time", "zoneName": "America/Recife", "gmtOffset": -10800, "abbreviation": "BRT", "gmtOffsetName": "UTC-03:00"}, {"tzName": "Acre Time", "zoneName": "America/Rio_Branco", "gmtOffset": -18000, "abbreviation": "ACT", "gmtOffsetName": "UTC-05:00"}, {"tzName": "Brasília Time", "zoneName": "America/Santarem", "gmtOffset": -10800, "abbreviation": "BRT", "gmtOffsetName": "UTC-03:00"}, {"tzName": "Brasília Time", "zoneName": "America/Sao_Paulo", "gmtOffset": -10800, "abbreviation": "BRT", "gmtOffsetName": "UTC-03:00"}]	.br	{"de": "Brasilien", "es": "Brasil", "fa": "برزیل", "fr": "Brésil", "hr": "Brazil", "it": "Brasile", "ja": "ブラジル", "ko": "브라질", "nl": "Brazilië", "pl": "Brazylia", "pt": "Brasil", "ru": "Бразилия", "tr": "Brezilya", "uk": "Бразилія", "pt-BR": "Brasil", "zh-CN": "巴西"}
32	British Indian Ocean Territory	f	Diego Garcia	USD	United States dollar	$	🇮🇴	U+1F1EE U+1F1F4	\N	\N	IO	IOT	-6	71.5	BIOT	British Indian Ocean Territory	086	246	Africa	1	Eastern Africa	4	[{"tzName": "Indian Ocean Time", "zoneName": "Indian/Chagos", "gmtOffset": 21600, "abbreviation": "IOT", "gmtOffsetName": "UTC+06:00"}]	.io	{"de": "Britisches Territorium im Indischen Ozean", "es": "Territorio Británico del Océano Índico", "fa": "قلمرو بریتانیا در اقیانوس هند", "fr": "Territoire britannique de l'océan Indien", "hr": "Britanski Indijskooceanski teritorij", "it": "Territorio britannico dell'oceano indiano", "ja": "イギリス領インド洋地域", "ko": "영국령 인도양 지역", "nl": "Britse Gebieden in de Indische Oceaan", "pl": "Brytyjskie Terytorium Oceanu Indyjskiego", "pt": "Território Britânico do Oceano Índico", "ru": "Британская территория в Индийском океане", "tr": "Britanya Hint Okyanusu Topraklari", "uk": "Британська територія в Індійському океані", "pt-BR": "Território Britânico do Oceano íÍdico", "zh-CN": "英属印度洋领地"}
33	Brunei	f	Bandar Seri Begawan	BND	Brunei dollar	B$	🇧🇳	U+1F1E7 U+1F1F3	\N	\N	BN	BRN	4.5	114.66666666	Bruneian	Negara Brunei Darussalam	096	673	Asia	3	South-Eastern Asia	13	[{"tzName": "Brunei Darussalam Time", "zoneName": "Asia/Brunei", "gmtOffset": 28800, "abbreviation": "BNT", "gmtOffsetName": "UTC+08:00"}]	.bn	{"de": "Brunei", "es": "Brunei", "fa": "برونئی", "fr": "Brunei", "hr": "Brunej", "it": "Brunei", "ja": "ブルネイ・ダルサラーム", "ko": "브루나이", "nl": "Brunei", "pl": "Brunei", "pt": "Brunei", "ru": "Бруней", "tr": "Brunei", "uk": "Бруней", "pt-BR": "Brunei", "zh-CN": "文莱"}
34	Bulgaria	f	Sofia	BGN	Bulgarian lev	Лв.	🇧🇬	U+1F1E7 U+1F1EC	\N	\N	BG	BGR	43	25	Bulgarian	България	100	359	Europe	4	Eastern Europe	15	[{"tzName": "Eastern European Time", "zoneName": "Europe/Sofia", "gmtOffset": 7200, "abbreviation": "EET", "gmtOffsetName": "UTC+02:00"}]	.bg	{"de": "Bulgarien", "es": "Bulgaria", "fa": "بلغارستان", "fr": "Bulgarie", "hr": "Bugarska", "it": "Bulgaria", "ja": "ブルガリア", "ko": "불가리아", "nl": "Bulgarije", "pl": "Bułgaria", "pt": "Bulgária", "ru": "Болгария", "tr": "Bulgaristan", "uk": "Болгарія", "pt-BR": "Bulgária", "zh-CN": "保加利亚"}
35	Burkina Faso	f	Ouagadougou	XOF	West African CFA franc	CFA	🇧🇫	U+1F1E7 U+1F1EB	\N	\N	BF	BFA	13	-2	Burkinabe	Burkina Faso	854	226	Africa	1	Western Africa	3	[{"tzName": "Greenwich Mean Time", "zoneName": "Africa/Ouagadougou", "gmtOffset": 0, "abbreviation": "GMT", "gmtOffsetName": "UTC±00"}]	.bf	{"de": "Burkina Faso", "es": "Burkina Faso", "fa": "بورکینافاسو", "fr": "Burkina Faso", "hr": "Burkina Faso", "it": "Burkina Faso", "ja": "ブルキナファソ", "ko": "부르키나 파소", "nl": "Burkina Faso", "pl": "Burkina Faso", "pt": "Burquina Faso", "ru": "Буркина-Фасо", "tr": "Burkina Faso", "uk": "Буркіна-Фасо", "pt-BR": "Burkina Faso", "zh-CN": "布基纳法索"}
36	Burundi	f	Bujumbura	BIF	Burundian franc	FBu	🇧🇮	U+1F1E7 U+1F1EE	\N	\N	BI	BDI	-3.5	30	Burundian	Burundi	108	257	Africa	1	Eastern Africa	4	[{"tzName": "Central Africa Time", "zoneName": "Africa/Bujumbura", "gmtOffset": 7200, "abbreviation": "CAT", "gmtOffsetName": "UTC+02:00"}]	.bi	{"de": "Burundi", "es": "Burundi", "fa": "بوروندی", "fr": "Burundi", "hr": "Burundi", "it": "Burundi", "ja": "ブルンジ", "ko": "부룬디", "nl": "Burundi", "pl": "Burundi", "pt": "Burúndi", "ru": "Бурунди", "tr": "Burundi", "uk": "Бурунді", "pt-BR": "Burundi", "zh-CN": "布隆迪"}
37	Cambodia	f	Phnom Penh	KHR	Cambodian riel	KHR	🇰🇭	U+1F1F0 U+1F1ED	\N	\N	KH	KHM	13	105	Cambodian	Kâmpŭchéa	116	855	Asia	3	South-Eastern Asia	13	[{"tzName": "Indochina Time", "zoneName": "Asia/Phnom_Penh", "gmtOffset": 25200, "abbreviation": "ICT", "gmtOffsetName": "UTC+07:00"}]	.kh	{"de": "Kambodscha", "es": "Camboya", "fa": "کامبوج", "fr": "Cambodge", "hr": "Kambodža", "it": "Cambogia", "ja": "カンボジア", "ko": "캄보디아", "nl": "Cambodja", "pl": "Kambodża", "pt": "Camboja", "ru": "Камбоджа", "tr": "Kamboçya", "uk": "Камбоджа", "pt-BR": "Camboja", "zh-CN": "柬埔寨"}
38	Cameroon	f	Yaounde	XAF	Central African CFA franc	FCFA	🇨🇲	U+1F1E8 U+1F1F2	\N	\N	CM	CMR	6	12	Cameroonian	Cameroon	120	237	Africa	1	Middle Africa	2	[{"tzName": "West Africa Time", "zoneName": "Africa/Douala", "gmtOffset": 3600, "abbreviation": "WAT", "gmtOffsetName": "UTC+01:00"}]	.cm	{"de": "Kamerun", "es": "Camerún", "fa": "کامرون", "fr": "Cameroun", "hr": "Kamerun", "it": "Camerun", "ja": "カメルーン", "ko": "카메룬", "nl": "Kameroen", "pl": "Kamerun", "pt": "Camarões", "ru": "Камерун", "tr": "Kamerun", "uk": "Камерун", "pt-BR": "Camarões", "zh-CN": "喀麦隆"}
39	Canada	f	Ottawa	CAD	Canadian dollar	$	🇨🇦	U+1F1E8 U+1F1E6	\N	\N	CA	CAN	60	-95	Canadian	Canada	124	1	Americas	2	Northern America	6	[{"tzName": "Eastern Standard Time (North America)", "zoneName": "America/Atikokan", "gmtOffset": -18000, "abbreviation": "EST", "gmtOffsetName": "UTC-05:00"}, {"tzName": "Atlantic Standard Time", "zoneName": "America/Blanc-Sablon", "gmtOffset": -14400, "abbreviation": "AST", "gmtOffsetName": "UTC-04:00"}, {"tzName": "Mountain Standard Time (North America)", "zoneName": "America/Cambridge_Bay", "gmtOffset": -25200, "abbreviation": "MST", "gmtOffsetName": "UTC-07:00"}, {"tzName": "Mountain Standard Time (North America)", "zoneName": "America/Creston", "gmtOffset": -25200, "abbreviation": "MST", "gmtOffsetName": "UTC-07:00"}, {"tzName": "Mountain Standard Time (North America)", "zoneName": "America/Dawson", "gmtOffset": -25200, "abbreviation": "MST", "gmtOffsetName": "UTC-07:00"}, {"tzName": "Mountain Standard Time (North America)", "zoneName": "America/Dawson_Creek", "gmtOffset": -25200, "abbreviation": "MST", "gmtOffsetName": "UTC-07:00"}, {"tzName": "Mountain Standard Time (North America)", "zoneName": "America/Edmonton", "gmtOffset": -25200, "abbreviation": "MST", "gmtOffsetName": "UTC-07:00"}, {"tzName": "Mountain Standard Time (North America)", "zoneName": "America/Fort_Nelson", "gmtOffset": -25200, "abbreviation": "MST", "gmtOffsetName": "UTC-07:00"}, {"tzName": "Atlantic Standard Time", "zoneName": "America/Glace_Bay", "gmtOffset": -14400, "abbreviation": "AST", "gmtOffsetName": "UTC-04:00"}, {"tzName": "Atlantic Standard Time", "zoneName": "America/Goose_Bay", "gmtOffset": -14400, "abbreviation": "AST", "gmtOffsetName": "UTC-04:00"}, {"tzName": "Atlantic Standard Time", "zoneName": "America/Halifax", "gmtOffset": -14400, "abbreviation": "AST", "gmtOffsetName": "UTC-04:00"}, {"tzName": "Mountain Standard Time (North America", "zoneName": "America/Inuvik", "gmtOffset": -25200, "abbreviation": "MST", "gmtOffsetName": "UTC-07:00"}, {"tzName": "Eastern Standard Time (North America", "zoneName": "America/Iqaluit", "gmtOffset": -18000, "abbreviation": "EST", "gmtOffsetName": "UTC-05:00"}, {"tzName": "Atlantic Standard Time", "zoneName": "America/Moncton", "gmtOffset": -14400, "abbreviation": "AST", "gmtOffsetName": "UTC-04:00"}, {"tzName": "Eastern Standard Time (North America", "zoneName": "America/Nipigon", "gmtOffset": -18000, "abbreviation": "EST", "gmtOffsetName": "UTC-05:00"}, {"tzName": "Eastern Standard Time (North America", "zoneName": "America/Pangnirtung", "gmtOffset": -18000, "abbreviation": "EST", "gmtOffsetName": "UTC-05:00"}, {"tzName": "Central Standard Time (North America", "zoneName": "America/Rainy_River", "gmtOffset": -21600, "abbreviation": "CST", "gmtOffsetName": "UTC-06:00"}, {"tzName": "Central Standard Time (North America", "zoneName": "America/Rankin_Inlet", "gmtOffset": -21600, "abbreviation": "CST", "gmtOffsetName": "UTC-06:00"}, {"tzName": "Central Standard Time (North America", "zoneName": "America/Regina", "gmtOffset": -21600, "abbreviation": "CST", "gmtOffsetName": "UTC-06:00"}, {"tzName": "Central Standard Time (North America", "zoneName": "America/Resolute", "gmtOffset": -21600, "abbreviation": "CST", "gmtOffsetName": "UTC-06:00"}, {"tzName": "Newfoundland Standard Time", "zoneName": "America/St_Johns", "gmtOffset": -12600, "abbreviation": "NST", "gmtOffsetName": "UTC-03:30"}, {"tzName": "Central Standard Time (North America", "zoneName": "America/Swift_Current", "gmtOffset": -21600, "abbreviation": "CST", "gmtOffsetName": "UTC-06:00"}, {"tzName": "Eastern Standard Time (North America", "zoneName": "America/Thunder_Bay", "gmtOffset": -18000, "abbreviation": "EST", "gmtOffsetName": "UTC-05:00"}, {"tzName": "Eastern Standard Time (North America", "zoneName": "America/Toronto", "gmtOffset": -18000, "abbreviation": "EST", "gmtOffsetName": "UTC-05:00"}, {"tzName": "Pacific Standard Time (North America", "zoneName": "America/Vancouver", "gmtOffset": -28800, "abbreviation": "PST", "gmtOffsetName": "UTC-08:00"}, {"tzName": "Mountain Standard Time (North America", "zoneName": "America/Whitehorse", "gmtOffset": -25200, "abbreviation": "MST", "gmtOffsetName": "UTC-07:00"}, {"tzName": "Central Standard Time (North America", "zoneName": "America/Winnipeg", "gmtOffset": -21600, "abbreviation": "CST", "gmtOffsetName": "UTC-06:00"}, {"tzName": "Mountain Standard Time (North America", "zoneName": "America/Yellowknife", "gmtOffset": -25200, "abbreviation": "MST", "gmtOffsetName": "UTC-07:00"}]	.ca	{"de": "Kanada", "es": "Canadá", "fa": "کانادا", "fr": "Canada", "hr": "Kanada", "it": "Canada", "ja": "カナダ", "ko": "캐나다", "nl": "Canada", "pl": "Kanada", "pt": "Canadá", "ru": "Канада", "tr": "Kanada", "uk": "Канада", "pt-BR": "Canadá", "zh-CN": "加拿大"}
41	Cayman Islands	f	George Town	KYD	Cayman Islands dollar	$	🇰🇾	U+1F1F0 U+1F1FE	\N	\N	KY	CYM	19.5	-80.5	Caymanian	Cayman Islands	136	1	Americas	2	Caribbean	7	[{"tzName": "Eastern Standard Time (North America", "zoneName": "America/Cayman", "gmtOffset": -18000, "abbreviation": "EST", "gmtOffsetName": "UTC-05:00"}]	.ky	{"de": "Kaimaninseln", "es": "Islas Caimán", "fa": "جزایر کیمن", "fr": "Îles Caïmans", "hr": "Kajmanski otoci", "it": "Isole Cayman", "ja": "ケイマン諸島", "ko": "케이먼 제도", "nl": "Caymaneilanden", "pl": "Kajmany", "pt": "Ilhas Caimão", "ru": "Каймановы острова", "tr": "Cayman Adalari", "uk": "Кайманові острови", "pt-BR": "Ilhas Cayman", "zh-CN": "开曼群岛"}
42	Central African Republic	f	Bangui	XAF	Central African CFA franc	FCFA	🇨🇫	U+1F1E8 U+1F1EB	\N	\N	CF	CAF	7	21	Central African	Ködörösêse tî Bêafrîka	140	236	Africa	1	Middle Africa	2	[{"tzName": "West Africa Time", "zoneName": "Africa/Bangui", "gmtOffset": 3600, "abbreviation": "WAT", "gmtOffsetName": "UTC+01:00"}]	.cf	{"de": "Zentralafrikanische Republik", "es": "República Centroafricana", "fa": "جمهوری آفریقای مرکزی", "fr": "République centrafricaine", "hr": "Srednjoafrička Republika", "it": "Repubblica Centrafricana", "ja": "中央アフリカ共和国", "ko": "중앙아프리카 공화국", "nl": "Centraal-Afrikaanse Republiek", "pl": "Republika Środkowoafrykańska", "pt": "República Centro-Africana", "ru": "Центральноафриканская Республика", "tr": "Orta Afrika Cumhuriyeti", "uk": "Центральноафриканська Республіка", "pt-BR": "República Centro-Africana", "zh-CN": "中非"}
43	Chad	f	N'Djamena	XAF	Central African CFA franc	FCFA	🇹🇩	U+1F1F9 U+1F1E9	\N	\N	TD	TCD	15	19	Chadian	Tchad	148	235	Africa	1	Middle Africa	2	[{"tzName": "West Africa Time", "zoneName": "Africa/Ndjamena", "gmtOffset": 3600, "abbreviation": "WAT", "gmtOffsetName": "UTC+01:00"}]	.td	{"de": "Tschad", "es": "Chad", "fa": "چاد", "fr": "Tchad", "hr": "Čad", "it": "Ciad", "ja": "チャド", "ko": "차드", "nl": "Tsjaad", "pl": "Czad", "pt": "Chade", "ru": "Чад", "tr": "Çad", "uk": "Чад.", "pt-BR": "Chade", "zh-CN": "乍得"}
44	Chile	f	Santiago	CLP	Chilean peso	$	🇨🇱	U+1F1E8 U+1F1F1	\N	\N	CL	CHL	-30	-71	Chilean	Chile	152	56	Americas	2	South America	8	[{"tzName": "Chile Summer Time", "zoneName": "America/Punta_Arenas", "gmtOffset": -10800, "abbreviation": "CLST", "gmtOffsetName": "UTC-03:00"}, {"tzName": "Chile Summer Time", "zoneName": "America/Santiago", "gmtOffset": -10800, "abbreviation": "CLST", "gmtOffsetName": "UTC-03:00"}, {"tzName": "Easter Island Summer Time", "zoneName": "Pacific/Easter", "gmtOffset": -18000, "abbreviation": "EASST", "gmtOffsetName": "UTC-05:00"}]	.cl	{"de": "Chile", "es": "Chile", "fa": "شیلی", "fr": "Chili", "hr": "Čile", "it": "Cile", "ja": "チリ", "ko": "칠리", "nl": "Chili", "pl": "Chile", "pt": "Chile", "ru": "Чили", "tr": "Şili", "uk": "Чилі", "pt-BR": "Chile", "zh-CN": "智利"}
45	China	f	Beijing	CNY	Chinese yuan	¥	🇨🇳	U+1F1E8 U+1F1F3	\N	\N	CN	CHN	35	105	Chinese	中国	156	86	Asia	3	Eastern Asia	12	[{"tzName": "China Standard Time", "zoneName": "Asia/Shanghai", "gmtOffset": 28800, "abbreviation": "CST", "gmtOffsetName": "UTC+08:00"}, {"tzName": "China Standard Time", "zoneName": "Asia/Urumqi", "gmtOffset": 21600, "abbreviation": "XJT", "gmtOffsetName": "UTC+06:00"}]	.cn	{"de": "China", "es": "China", "fa": "چین", "fr": "Chine", "hr": "Kina", "it": "Cina", "ja": "中国", "ko": "중국", "nl": "China", "pl": "Chiny", "pt": "China", "ru": "Китай", "tr": "Çin", "uk": "Китай", "pt-BR": "China", "zh-CN": "中国"}
46	Christmas Island	f	Flying Fish Cove	AUD	Australian dollar	$	🇨🇽	U+1F1E8 U+1F1FD	\N	\N	CX	CXR	-10.5	105.66666666	Christmas Island	Christmas Island	162	61	Oceania	5	Australia and New Zealand	19	[{"tzName": "Christmas Island Time", "zoneName": "Indian/Christmas", "gmtOffset": 25200, "abbreviation": "CXT", "gmtOffsetName": "UTC+07:00"}]	.cx	{"de": "Weihnachtsinsel", "es": "Isla de Navidad", "fa": "جزیره کریسمس", "fr": "Île Christmas", "hr": "Božićni otok", "it": "Isola di Natale", "ja": "クリスマス島", "ko": "크리스마스 섬", "nl": "Christmaseiland", "pl": "Wyspa Bożego Narodzenia", "pt": "Ilha do Natal", "ru": "Остров Рождества", "tr": "Christmas Adasi", "uk": "Острів Різдва", "pt-BR": "Ilha Christmas", "zh-CN": "圣诞岛"}
47	Cocos (Keeling) Islands	f	West Island	AUD	Australian dollar	$	🇨🇨	U+1F1E8 U+1F1E8	\N	\N	CC	CCK	-12.5	96.83333333	Cocos Island	Cocos (Keeling) Islands	166	61	Oceania	5	Australia and New Zealand	19	[{"tzName": "Cocos Islands Time", "zoneName": "Indian/Cocos", "gmtOffset": 23400, "abbreviation": "CCT", "gmtOffsetName": "UTC+06:30"}]	.cc	{"de": "Kokosinseln", "es": "Islas Cocos o Islas Keeling", "fa": "جزایر کوکوس", "fr": "Îles Cocos", "hr": "Kokosovi Otoci", "it": "Isole Cocos e Keeling", "ja": "ココス（キーリング）諸島", "ko": "코코스 제도", "nl": "Cocoseilanden", "pl": "Wyspy Kokosowe (Keelinga)", "pt": "Ilhas dos Cocos", "ru": "Кокосовые (Килинг) острова", "tr": "Cocos Adalari", "uk": "Кокосові (Кілінг) острови", "pt-BR": "Ilhas Cocos", "zh-CN": "科科斯（基林）群岛"}
48	Colombia	f	Bogotá	COP	Colombian peso	$	🇨🇴	U+1F1E8 U+1F1F4	\N	\N	CO	COL	4	-72	Colombian	Colombia	170	57	Americas	2	South America	8	[{"tzName": "Colombia Time", "zoneName": "America/Bogota", "gmtOffset": -18000, "abbreviation": "COT", "gmtOffsetName": "UTC-05:00"}]	.co	{"de": "Kolumbien", "es": "Colombia", "fa": "کلمبیا", "fr": "Colombie", "hr": "Kolumbija", "it": "Colombia", "ja": "コロンビア", "ko": "콜롬비아", "nl": "Colombia", "pl": "Kolumbia", "pt": "Colômbia", "ru": "Колумбия", "tr": "Kolombiya", "uk": "Колумбія", "pt-BR": "Colômbia", "zh-CN": "哥伦比亚"}
49	Comoros	f	Moroni	KMF	Comorian franc	CF	🇰🇲	U+1F1F0 U+1F1F2	\N	\N	KM	COM	-12.16666666	44.25	Comoran, Comorian	Komori	174	269	Africa	1	Eastern Africa	4	[{"tzName": "East Africa Time", "zoneName": "Indian/Comoro", "gmtOffset": 10800, "abbreviation": "EAT", "gmtOffsetName": "UTC+03:00"}]	.km	{"de": "Union der Komoren", "es": "Comoras", "fa": "کومور", "fr": "Comores", "hr": "Komori", "it": "Comore", "ja": "コモロ", "ko": "코모로", "nl": "Comoren", "pl": "Komory", "pt": "Comores", "ru": "Коморские острова", "tr": "Komorlar", "uk": "Коморські острови", "pt-BR": "Comores", "zh-CN": "科摩罗"}
50	Congo	f	Brazzaville	XAF	Central African CFA franc	FC	🇨🇬	U+1F1E8 U+1F1EC	\N	\N	CG	COG	-1	15	Congolese	République du Congo	178	242	Africa	1	Middle Africa	2	[{"tzName": "West Africa Time", "zoneName": "Africa/Brazzaville", "gmtOffset": 3600, "abbreviation": "WAT", "gmtOffsetName": "UTC+01:00"}]	.cg	{"de": "Kongo", "es": "Congo", "fa": "کنگو", "fr": "Congo", "hr": "Kongo", "it": "Congo", "ja": "コンゴ共和国", "ko": "콩고", "nl": "Congo [Republiek]", "pl": "Kongo", "pt": "Congo", "ru": "Конго", "tr": "Kongo", "uk": "Конго", "pt-BR": "Congo", "zh-CN": "刚果"}
52	Cook Islands	f	Avarua	NZD	Cook Islands dollar	$	🇨🇰	U+1F1E8 U+1F1F0	\N	\N	CK	COK	-21.23333333	-159.76666666	Cook Island	Cook Islands	184	682	Oceania	5	Polynesia	22	[{"tzName": "Cook Island Time", "zoneName": "Pacific/Rarotonga", "gmtOffset": -36000, "abbreviation": "CKT", "gmtOffsetName": "UTC-10:00"}]	.ck	{"de": "Cookinseln", "es": "Islas Cook", "fa": "جزایر کوک", "fr": "Îles Cook", "hr": "Cookovo Otočje", "it": "Isole Cook", "ja": "クック諸島", "ko": "쿡 제도", "nl": "Cookeilanden", "pl": "Wyspy Cooka", "pt": "Ilhas Cook", "ru": "Острова Кука", "tr": "Cook Adalari", "uk": "Острови Кука", "pt-BR": "Ilhas Cook", "zh-CN": "库克群岛"}
53	Costa Rica	f	San Jose	CRC	Costa Rican colón	₡	🇨🇷	U+1F1E8 U+1F1F7	\N	\N	CR	CRI	10	-84	Costa Rican	Costa Rica	188	506	Americas	2	Central America	9	[{"tzName": "Central Standard Time (North America", "zoneName": "America/Costa_Rica", "gmtOffset": -21600, "abbreviation": "CST", "gmtOffsetName": "UTC-06:00"}]	.cr	{"de": "Costa Rica", "es": "Costa Rica", "fa": "کاستاریکا", "fr": "Costa Rica", "hr": "Kostarika", "it": "Costa Rica", "ja": "コスタリカ", "ko": "코스타리카", "nl": "Costa Rica", "pl": "Kostaryka", "pt": "Costa Rica", "ru": "Коста-Рика", "tr": "Kosta Rika", "uk": "Коста-Ріка", "pt-BR": "Costa Rica", "zh-CN": "哥斯达黎加"}
54	Cote D'Ivoire (Ivory Coast)	f	Yamoussoukro	XOF	West African CFA franc	CFA	🇨🇮	U+1F1E8 U+1F1EE	\N	\N	CI	CIV	8	-5	Ivorian	\N	384	225	Africa	1	Western Africa	3	[{"tzName": "Greenwich Mean Time", "zoneName": "Africa/Abidjan", "gmtOffset": 0, "abbreviation": "GMT", "gmtOffsetName": "UTC±00"}]	.ci	{"de": "Elfenbeinküste", "es": "Costa de Marfil", "fa": "ساحل عاج", "fr": "Côte d'Ivoire", "hr": "Obala Bjelokosti", "it": "Costa D'Avorio", "ja": "コートジボワール", "ko": "코트디부아르", "nl": "Ivoorkust", "pl": "Cote D'Ivoire (Wybrzeże Kości Słoniowej)", "pt": "Costa do Marfim", "ru": "Кот-д'Ивуар (Берег Слоновой Кости)", "tr": "Kotdivuar", "uk": "Кот-д'Івуар (Берег Слонової Кістки)", "pt-BR": "Costa do Marfim", "zh-CN": "科特迪瓦"}
55	Croatia	f	Zagreb	EUR	Euro	€	🇭🇷	U+1F1ED U+1F1F7	\N	\N	HR	HRV	45.16666666	15.5	Croatian	Hrvatska	191	385	Europe	4	Southern Europe	16	[{"tzName": "Central European Time", "zoneName": "Europe/Zagreb", "gmtOffset": 3600, "abbreviation": "CET", "gmtOffsetName": "UTC+01:00"}]	.hr	{"de": "Kroatien", "es": "Croacia", "fa": "کرواسی", "fr": "Croatie", "hr": "Hrvatska", "it": "Croazia", "ja": "クロアチア", "ko": "크로아티아", "nl": "Kroatië", "pl": "Chorwacja", "pt": "Croácia", "ru": "Хорватия", "tr": "Hirvatistan", "uk": "Хорватія", "pt-BR": "Croácia", "zh-CN": "克罗地亚"}
56	Cuba	f	Havana	CUP	Cuban peso	$	🇨🇺	U+1F1E8 U+1F1FA	\N	\N	CU	CUB	21.5	-80	Cuban	Cuba	192	53	Americas	2	Caribbean	7	[{"tzName": "Cuba Standard Time", "zoneName": "America/Havana", "gmtOffset": -18000, "abbreviation": "CST", "gmtOffsetName": "UTC-05:00"}]	.cu	{"de": "Kuba", "es": "Cuba", "fa": "کوبا", "fr": "Cuba", "hr": "Kuba", "it": "Cuba", "ja": "キューバ", "ko": "쿠바", "nl": "Cuba", "pl": "Kuba", "pt": "Cuba", "ru": "Куба", "tr": "Küba", "uk": "Куба", "pt-BR": "Cuba", "zh-CN": "古巴"}
249	Curaçao	f	Willemstad	ANG	Netherlands Antillean guilder	ƒ	🇨🇼	U+1F1E8 U+1F1FC	\N	\N	CW	CUW	12.116667	-68.933333	Curacaoan	Curaçao	531	599	Americas	2	Caribbean	7	[{"tzName": "Atlantic Standard Time", "zoneName": "America/Curacao", "gmtOffset": -14400, "abbreviation": "AST", "gmtOffsetName": "UTC-04:00"}]	.cw	{"de": "Curaçao", "fa": "کوراسائو", "fr": "Curaçao", "it": "Curaçao", "ko": "퀴라소", "nl": "Curaçao", "pl": "Curaçao", "pt": "Curaçao", "ru": "Кюрасао", "tr": "Curaçao", "uk": "Кюрасао", "pt-BR": "Curaçao", "zh-CN": "库拉索"}
57	Cyprus	f	Nicosia	EUR	Euro	€	🇨🇾	U+1F1E8 U+1F1FE	\N	\N	CY	CYP	35	33	Cypriot	Κύπρος	196	357	Europe	4	Southern Europe	16	[{"tzName": "Eastern European Time", "zoneName": "Asia/Famagusta", "gmtOffset": 7200, "abbreviation": "EET", "gmtOffsetName": "UTC+02:00"}, {"tzName": "Eastern European Time", "zoneName": "Asia/Nicosia", "gmtOffset": 7200, "abbreviation": "EET", "gmtOffsetName": "UTC+02:00"}]	.cy	{"de": "Zypern", "es": "Chipre", "fa": "قبرس", "fr": "Chypre", "hr": "Cipar", "it": "Cipro", "ja": "キプロス", "ko": "키프로스", "nl": "Cyprus", "pl": "Cypr", "pt": "Chipre", "ru": "Кипр", "tr": "Kuzey Kıbrıs Türk Cumhuriyeti", "uk": "Кіпр", "pt-BR": "Chipre", "zh-CN": "塞浦路斯"}
58	Czech Republic	f	Prague	CZK	Czech koruna	Kč	🇨🇿	U+1F1E8 U+1F1FF	\N	\N	CZ	CZE	49.75	15.5	Czech	Česká republika	203	420	Europe	4	Eastern Europe	15	[{"tzName": "Central European Time", "zoneName": "Europe/Prague", "gmtOffset": 3600, "abbreviation": "CET", "gmtOffsetName": "UTC+01:00"}]	.cz	{"de": "Tschechische Republik", "es": "República Checa", "fa": "جمهوری چک", "fr": "République tchèque", "hr": "Češka", "it": "Repubblica Ceca", "ja": "チェコ", "ko": "체코", "nl": "Tsjechië", "pl": "Republika Czeska", "pt": "República Checa", "ru": "Чешская Республика", "tr": "Çekya", "uk": "Чеська Республіка", "pt-BR": "República Tcheca", "zh-CN": "捷克"}
51	Democratic Republic of the Congo	f	Kinshasa	CDF	Congolese Franc	FC	🇨🇩	U+1F1E8 U+1F1E9	\N	\N	CD	COD	0	25	Congolese	République démocratique du Congo	180	243	Africa	1	Middle Africa	2	[{"tzName": "West Africa Time", "zoneName": "Africa/Kinshasa", "gmtOffset": 3600, "abbreviation": "WAT", "gmtOffsetName": "UTC+01:00"}, {"tzName": "Central Africa Time", "zoneName": "Africa/Lubumbashi", "gmtOffset": 7200, "abbreviation": "CAT", "gmtOffsetName": "UTC+02:00"}]	.cd	{"de": "Kongo (Dem. Rep.)", "es": "Congo (Rep. Dem.)", "fa": "جمهوری کنگو", "fr": "Congo (Rép. dém.)", "hr": "Kongo, Demokratska Republika", "it": "Congo (Rep. Dem.)", "ja": "コンゴ民主共和国", "ko": "콩고 민주 공화국", "nl": "Congo [DRC]", "pl": "Demokratyczna Republika Konga", "pt": "RD Congo", "ru": "Демократическая Республика Конго", "tr": "Kongo Demokratik Cumhuriyeti", "uk": "Демократична Республіка Конго", "pt-BR": "RD Congo", "zh-CN": "刚果（金）"}
59	Denmark	f	Copenhagen	DKK	Danish krone	Kr.	🇩🇰	U+1F1E9 U+1F1F0	\N	\N	DK	DNK	56	10	Danish	Danmark	208	45	Europe	4	Northern Europe	18	[{"tzName": "Central European Time", "zoneName": "Europe/Copenhagen", "gmtOffset": 3600, "abbreviation": "CET", "gmtOffsetName": "UTC+01:00"}]	.dk	{"de": "Dänemark", "es": "Dinamarca", "fa": "دانمارک", "fr": "Danemark", "hr": "Danska", "it": "Danimarca", "ja": "デンマーク", "ko": "덴마크", "nl": "Denemarken", "pl": "Dania", "pt": "Dinamarca", "ru": "Дания", "tr": "Danimarka", "uk": "Данія", "pt-BR": "Dinamarca", "zh-CN": "丹麦"}
60	Djibouti	f	Djibouti	DJF	Djiboutian franc	Fdj	🇩🇯	U+1F1E9 U+1F1EF	\N	\N	DJ	DJI	11.5	43	Djiboutian	Djibouti	262	253	Africa	1	Eastern Africa	4	[{"tzName": "East Africa Time", "zoneName": "Africa/Djibouti", "gmtOffset": 10800, "abbreviation": "EAT", "gmtOffsetName": "UTC+03:00"}]	.dj	{"de": "Dschibuti", "es": "Yibuti", "fa": "جیبوتی", "fr": "Djibouti", "hr": "Džibuti", "it": "Gibuti", "ja": "ジブチ", "ko": "지부티", "nl": "Djibouti", "pl": "Dżibuti", "pt": "Djibuti", "ru": "Джибути", "tr": "Cibuti", "uk": "Джибуті", "pt-BR": "Djibuti", "zh-CN": "吉布提"}
61	Dominica	f	Roseau	XCD	Eastern Caribbean dollar	$	🇩🇲	U+1F1E9 U+1F1F2	\N	\N	DM	DMA	15.41666666	-61.33333333	Dominican	Dominica	212	1	Americas	2	Caribbean	7	[{"tzName": "Atlantic Standard Time", "zoneName": "America/Dominica", "gmtOffset": -14400, "abbreviation": "AST", "gmtOffsetName": "UTC-04:00"}]	.dm	{"de": "Dominica", "es": "Dominica", "fa": "دومینیکا", "fr": "Dominique", "hr": "Dominika", "it": "Dominica", "ja": "ドミニカ国", "ko": "도미니카 연방", "nl": "Dominica", "pl": "Dominika", "pt": "Dominica", "ru": "Доминика", "tr": "Dominika", "uk": "Домініка", "pt-BR": "Dominica", "zh-CN": "多米尼加"}
62	Dominican Republic	f	Santo Domingo	DOP	Dominican peso	$	🇩🇴	U+1F1E9 U+1F1F4	\N	\N	DO	DOM	19	-70.66666666	Dominican	República Dominicana	214	1	Americas	2	Caribbean	7	[{"tzName": "Atlantic Standard Time", "zoneName": "America/Santo_Domingo", "gmtOffset": -14400, "abbreviation": "AST", "gmtOffsetName": "UTC-04:00"}]	.do	{"de": "Dominikanische Republik", "es": "República Dominicana", "fa": "جمهوری دومینیکن", "fr": "République dominicaine", "hr": "Dominikanska Republika", "it": "Repubblica Dominicana", "ja": "ドミニカ共和国", "ko": "도미니카 공화국", "nl": "Dominicaanse Republiek", "pl": "Republika Dominikańska", "pt": "República Dominicana", "ru": "Доминиканская Республика", "tr": "Dominik Cumhuriyeti", "uk": "Домініканська Республіка", "pt-BR": "República Dominicana", "zh-CN": "多明尼加共和国"}
64	Ecuador	f	Quito	USD	United States dollar	$	🇪🇨	U+1F1EA U+1F1E8	\N	\N	EC	ECU	-2	-77.5	Ecuadorian	Ecuador	218	593	Americas	2	South America	8	[{"tzName": "Ecuador Time", "zoneName": "America/Guayaquil", "gmtOffset": -18000, "abbreviation": "ECT", "gmtOffsetName": "UTC-05:00"}, {"tzName": "Galápagos Time", "zoneName": "Pacific/Galapagos", "gmtOffset": -21600, "abbreviation": "GALT", "gmtOffsetName": "UTC-06:00"}]	.ec	{"de": "Ecuador", "es": "Ecuador", "fa": "اکوادور", "fr": "Équateur", "hr": "Ekvador", "it": "Ecuador", "ja": "エクアドル", "ko": "에콰도르", "nl": "Ecuador", "pl": "Ekwador", "pt": "Equador", "ru": "Эквадор", "tr": "Ekvator", "uk": "Еквадор", "pt-BR": "Equador", "zh-CN": "厄瓜多尔"}
65	Egypt	f	Cairo	EGP	Egyptian pound	ج.م	🇪🇬	U+1F1EA U+1F1EC	\N	\N	EG	EGY	27	30	Egyptian	مصر‎	818	20	Africa	1	Northern Africa	1	[{"tzName": "Eastern European Time", "zoneName": "Africa/Cairo", "gmtOffset": 7200, "abbreviation": "EET", "gmtOffsetName": "UTC+02:00"}]	.eg	{"de": "Ägypten", "es": "Egipto", "fa": "مصر", "fr": "Égypte", "hr": "Egipat", "it": "Egitto", "ja": "エジプト", "ko": "이집트", "nl": "Egypte", "pl": "Egipt", "pt": "Egipto", "ru": "Египет", "tr": "Mısır", "uk": "Єгипет", "pt-BR": "Egito", "zh-CN": "埃及"}
66	El Salvador	f	San Salvador	USD	United States dollar	$	🇸🇻	U+1F1F8 U+1F1FB	\N	\N	SV	SLV	13.83333333	-88.91666666	Salvadoran	El Salvador	222	503	Americas	2	Central America	9	[{"tzName": "Central Standard Time (North America", "zoneName": "America/El_Salvador", "gmtOffset": -21600, "abbreviation": "CST", "gmtOffsetName": "UTC-06:00"}]	.sv	{"de": "El Salvador", "es": "El Salvador", "fa": "السالوادور", "fr": "Salvador", "hr": "Salvador", "it": "El Salvador", "ja": "エルサルバドル", "ko": "엘살바도르", "nl": "El Salvador", "pl": "Salwador", "pt": "El Salvador", "ru": "Сальвадор", "tr": "El Salvador", "uk": "Сальвадор", "pt-BR": "El Salvador", "zh-CN": "萨尔瓦多"}
67	Equatorial Guinea	f	Malabo	XAF	Central African CFA franc	FCFA	🇬🇶	U+1F1EC U+1F1F6	\N	\N	GQ	GNQ	2	10	Equatorial Guinean, Equatoguinean	Guinea Ecuatorial	226	240	Africa	1	Middle Africa	2	[{"tzName": "West Africa Time", "zoneName": "Africa/Malabo", "gmtOffset": 3600, "abbreviation": "WAT", "gmtOffsetName": "UTC+01:00"}]	.gq	{"de": "Äquatorial-Guinea", "es": "Guinea Ecuatorial", "fa": "گینه استوایی", "fr": "Guinée-Équatoriale", "hr": "Ekvatorijalna Gvineja", "it": "Guinea Equatoriale", "ja": "赤道ギニア", "ko": "적도 기니", "nl": "Equatoriaal-Guinea", "pl": "Gwinea Równikowa", "pt": "Guiné Equatorial", "ru": "Экваториальная Гвинея", "tr": "Ekvator Ginesi", "uk": "Екваторіальна Гвінея", "pt-BR": "Guiné Equatorial", "zh-CN": "赤道几内亚"}
68	Eritrea	f	Asmara	ERN	Eritrean nakfa	Nfk	🇪🇷	U+1F1EA U+1F1F7	\N	\N	ER	ERI	15	39	Eritrean	ኤርትራ	232	291	Africa	1	Eastern Africa	4	[{"tzName": "East Africa Time", "zoneName": "Africa/Asmara", "gmtOffset": 10800, "abbreviation": "EAT", "gmtOffsetName": "UTC+03:00"}]	.er	{"de": "Eritrea", "es": "Eritrea", "fa": "اریتره", "fr": "Érythrée", "hr": "Eritreja", "it": "Eritrea", "ja": "エリトリア", "ko": "에리트레아", "nl": "Eritrea", "pl": "Erytrea", "pt": "Eritreia", "ru": "Эритрея", "tr": "Eritre", "uk": "Еритрея", "pt-BR": "Eritreia", "zh-CN": "厄立特里亚"}
69	Estonia	f	Tallinn	EUR	Euro	€	🇪🇪	U+1F1EA U+1F1EA	\N	\N	EE	EST	59	26	Estonian	Eesti	233	372	Europe	4	Northern Europe	18	[{"tzName": "Eastern European Time", "zoneName": "Europe/Tallinn", "gmtOffset": 7200, "abbreviation": "EET", "gmtOffsetName": "UTC+02:00"}]	.ee	{"de": "Estland", "es": "Estonia", "fa": "استونی", "fr": "Estonie", "hr": "Estonija", "it": "Estonia", "ja": "エストニア", "ko": "에스토니아", "nl": "Estland", "pl": "Estonia", "pt": "Estónia", "ru": "Эстония", "tr": "Estonya", "uk": "Естонія", "pt-BR": "Estônia", "zh-CN": "爱沙尼亚"}
212	Eswatini	f	Mbabane	SZL	Lilangeni	E	🇸🇿	U+1F1F8 U+1F1FF	\N	\N	SZ	SWZ	-26.5	31.5	Swazi	Swaziland	748	268	Africa	1	Southern Africa	5	[{"tzName": "South African Standard Time", "zoneName": "Africa/Mbabane", "gmtOffset": 7200, "abbreviation": "SAST", "gmtOffsetName": "UTC+02:00"}]	.sz	{"de": "Swasiland", "es": "Suazilandia", "fa": "سوازیلند", "fr": "Swaziland", "hr": "Svazi", "it": "Swaziland", "ja": "スワジランド", "ko": "에스와티니", "nl": "Swaziland", "pl": "Eswatini", "pt": "Suazilândia", "ru": "Эсватини", "tr": "Esvatini", "uk": "Есватіні", "pt-BR": "Suazilândia", "zh-CN": "斯威士兰"}
70	Ethiopia	f	Addis Ababa	ETB	Ethiopian birr	Nkf	🇪🇹	U+1F1EA U+1F1F9	\N	\N	ET	ETH	8	38	Ethiopian	ኢትዮጵያ	231	251	Africa	1	Eastern Africa	4	[{"tzName": "East Africa Time", "zoneName": "Africa/Addis_Ababa", "gmtOffset": 10800, "abbreviation": "EAT", "gmtOffsetName": "UTC+03:00"}]	.et	{"de": "Äthiopien", "es": "Etiopía", "fa": "اتیوپی", "fr": "Éthiopie", "hr": "Etiopija", "it": "Etiopia", "ja": "エチオピア", "ko": "에티오피아", "nl": "Ethiopië", "pl": "Etiopia", "pt": "Etiópia", "ru": "Эфиопия", "tr": "Etiyopya", "uk": "Ефіопія", "pt-BR": "Etiópia", "zh-CN": "埃塞俄比亚"}
71	Falkland Islands	f	Stanley	FKP	Falkland Islands pound	£	🇫🇰	U+1F1EB U+1F1F0	\N	\N	FK	FLK	-51.75	-59	Falkland Island	Falkland Islands	238	500	Americas	2	South America	8	[{"tzName": "Falkland Islands Summer Time", "zoneName": "Atlantic/Stanley", "gmtOffset": -10800, "abbreviation": "FKST", "gmtOffsetName": "UTC-03:00"}]	.fk	{"de": "Falklandinseln", "es": "Islas Malvinas", "fa": "جزایر فالکلند", "fr": "Îles Malouines", "hr": "Falklandski Otoci", "it": "Isole Falkland o Isole Malvine", "ja": "フォークランド（マルビナス）諸島", "ko": "포클랜드 제도", "nl": "Falklandeilanden [Islas Malvinas]", "pl": "Falklandy", "pt": "Ilhas Falkland", "ru": "Фолклендские острова", "tr": "Falkland Adalari", "uk": "Фолклендські острови", "pt-BR": "Ilhas Malvinas", "zh-CN": "福克兰群岛"}
72	Faroe Islands	f	Torshavn	DKK	Danish krone	Kr.	🇫🇴	U+1F1EB U+1F1F4	\N	\N	FO	FRO	62	-7	Faroese	Føroyar	234	298	Europe	4	Northern Europe	18	[{"tzName": "Western European Time", "zoneName": "Atlantic/Faroe", "gmtOffset": 0, "abbreviation": "WET", "gmtOffsetName": "UTC±00"}]	.fo	{"de": "Färöer-Inseln", "es": "Islas Faroe", "fa": "جزایر فارو", "fr": "Îles Féroé", "hr": "Farski Otoci", "it": "Isole Far Oer", "ja": "フェロー諸島", "ko": "페로 제도", "nl": "Faeröer", "pl": "Wyspy Owcze", "pt": "Ilhas Faroé", "ru": "Фарерские острова", "tr": "Faroe Adalari", "uk": "Фарерські острови", "pt-BR": "Ilhas Faroé", "zh-CN": "法罗群岛"}
73	Fiji Islands	f	Suva	FJD	Fijian dollar	FJ$	🇫🇯	U+1F1EB U+1F1EF	\N	\N	FJ	FJI	-18	175	Fijian	Fiji	242	679	Oceania	5	Melanesia	20	[{"tzName": "Fiji Time", "zoneName": "Pacific/Fiji", "gmtOffset": 43200, "abbreviation": "FJT", "gmtOffsetName": "UTC+12:00"}]	.fj	{"de": "Fidschi", "es": "Fiyi", "fa": "فیجی", "fr": "Fidji", "hr": "Fiđi", "it": "Figi", "ja": "フィジー", "ko": "피지", "nl": "Fiji", "pl": "Wyspy Fidżi", "pt": "Fiji", "ru": "Острова Фиджи", "tr": "Fiji", "uk": "Острови Фіджі", "pt-BR": "Fiji", "zh-CN": "斐济"}
74	Finland	f	Helsinki	EUR	Euro	€	🇫🇮	U+1F1EB U+1F1EE	\N	\N	FI	FIN	64	26	Finnish	Suomi	246	358	Europe	4	Northern Europe	18	[{"tzName": "Eastern European Time", "zoneName": "Europe/Helsinki", "gmtOffset": 7200, "abbreviation": "EET", "gmtOffsetName": "UTC+02:00"}]	.fi	{"de": "Finnland", "es": "Finlandia", "fa": "فنلاند", "fr": "Finlande", "hr": "Finska", "it": "Finlandia", "ja": "フィンランド", "ko": "핀란드", "nl": "Finland", "pl": "Finlandia", "pt": "Finlândia", "ru": "Финляндия", "tr": "Finlandiya", "uk": "Фінляндія", "pt-BR": "Finlândia", "zh-CN": "芬兰"}
75	France	f	Paris	EUR	Euro	€	🇫🇷	U+1F1EB U+1F1F7	\N	\N	FR	FRA	46	2	French	France	250	33	Europe	4	Western Europe	17	[{"tzName": "Central European Time", "zoneName": "Europe/Paris", "gmtOffset": 3600, "abbreviation": "CET", "gmtOffsetName": "UTC+01:00"}]	.fr	{"de": "Frankreich", "es": "Francia", "fa": "فرانسه", "fr": "France", "hr": "Francuska", "it": "Francia", "ja": "フランス", "ko": "프랑스", "nl": "Frankrijk", "pl": "Francja", "pt": "França", "ru": "Франция", "tr": "Fransa", "uk": "Франція", "pt-BR": "França", "zh-CN": "法国"}
76	French Guiana	f	Cayenne	EUR	Euro	€	🇬🇫	U+1F1EC U+1F1EB	\N	\N	GF	GUF	4	-53	French Guianese	Guyane française	254	594	Americas	2	South America	8	[{"tzName": "French Guiana Time", "zoneName": "America/Cayenne", "gmtOffset": -10800, "abbreviation": "GFT", "gmtOffsetName": "UTC-03:00"}]	.gf	{"de": "Französisch Guyana", "es": "Guayana Francesa", "fa": "گویان فرانسه", "fr": "Guayane", "hr": "Francuska Gvajana", "it": "Guyana francese", "ja": "フランス領ギアナ", "ko": "프랑스령 기아나", "nl": "Frans-Guyana", "pl": "Gujana Francuska", "pt": "Guiana Francesa", "ru": "Французская Гвиана", "tr": "Fransiz Guyanasi", "uk": "Французька Гвіана", "pt-BR": "Guiana Francesa", "zh-CN": "法属圭亚那"}
77	French Polynesia	f	Papeete	XPF	CFP franc	₣	🇵🇫	U+1F1F5 U+1F1EB	\N	\N	PF	PYF	-15	-140	French Polynesia	Polynésie française	258	689	Oceania	5	Polynesia	22	[{"tzName": "Gambier Islands Time", "zoneName": "Pacific/Gambier", "gmtOffset": -32400, "abbreviation": "GAMT", "gmtOffsetName": "UTC-09:00"}, {"tzName": "Marquesas Islands Time", "zoneName": "Pacific/Marquesas", "gmtOffset": -34200, "abbreviation": "MART", "gmtOffsetName": "UTC-09:30"}, {"tzName": "Tahiti Time", "zoneName": "Pacific/Tahiti", "gmtOffset": -36000, "abbreviation": "TAHT", "gmtOffsetName": "UTC-10:00"}]	.pf	{"de": "Französisch-Polynesien", "es": "Polinesia Francesa", "fa": "پلی‌نزی فرانسه", "fr": "Polynésie française", "hr": "Francuska Polinezija", "it": "Polinesia Francese", "ja": "フランス領ポリネシア", "ko": "프랑스령 폴리네시아", "nl": "Frans-Polynesië", "pl": "Polinezja Francuska", "pt": "Polinésia Francesa", "ru": "Французская Полинезия", "tr": "Fransiz Polinezyasi", "uk": "Французька Полінезія", "pt-BR": "Polinésia Francesa", "zh-CN": "法属波利尼西亚"}
78	French Southern Territories	f	Port-aux-Francais	EUR	Euro	€	🇹🇫	U+1F1F9 U+1F1EB	\N	\N	TF	ATF	-49.25	69.167	French Southern Territories	Territoire des Terres australes et antarctiques fr	260	262	Africa	1	Southern Africa	5	[{"tzName": "French Southern and Antarctic Time", "zoneName": "Indian/Kerguelen", "gmtOffset": 18000, "abbreviation": "TFT", "gmtOffsetName": "UTC+05:00"}]	.tf	{"de": "Französische Süd- und Antarktisgebiete", "es": "Tierras Australes y Antárticas Francesas", "fa": "سرزمین‌های جنوبی و جنوبگانی فرانسه", "fr": "Terres australes et antarctiques françaises", "hr": "Francuski južni i antarktički teritoriji", "it": "Territori Francesi del Sud", "ja": "フランス領南方・南極地域", "ko": "프랑스령 남방 및 남극", "nl": "Franse Gebieden in de zuidelijke Indische Oceaan", "pl": "Francuskie terytoria południowe", "pt": "Terras Austrais e Antárticas Francesas", "ru": "Французские южные территории", "tr": "Fransiz Güney Topraklari", "uk": "Французькі південні території", "pt-BR": "Terras Austrais e Antárticas Francesas", "zh-CN": "法属南部领地"}
79	Gabon	f	Libreville	XAF	Central African CFA franc	FCFA	🇬🇦	U+1F1EC U+1F1E6	\N	\N	GA	GAB	-1	11.75	Gabonese	Gabon	266	241	Africa	1	Middle Africa	2	[{"tzName": "West Africa Time", "zoneName": "Africa/Libreville", "gmtOffset": 3600, "abbreviation": "WAT", "gmtOffsetName": "UTC+01:00"}]	.ga	{"de": "Gabun", "es": "Gabón", "fa": "گابن", "fr": "Gabon", "hr": "Gabon", "it": "Gabon", "ja": "ガボン", "ko": "가봉", "nl": "Gabon", "pl": "Gabon", "pt": "Gabão", "ru": "Габон", "tr": "Gabon", "uk": "Габон", "pt-BR": "Gabão", "zh-CN": "加蓬"}
81	Georgia	f	Tbilisi	GEL	Georgian lari	ლ	🇬🇪	U+1F1EC U+1F1EA	\N	\N	GE	GEO	42	43.5	Georgian	საქართველო	268	995	Asia	3	Western Asia	11	[{"tzName": "Georgia Standard Time", "zoneName": "Asia/Tbilisi", "gmtOffset": 14400, "abbreviation": "GET", "gmtOffsetName": "UTC+04:00"}]	.ge	{"de": "Georgien", "es": "Georgia", "fa": "گرجستان", "fr": "Géorgie", "hr": "Gruzija", "it": "Georgia", "ja": "グルジア", "ko": "조지아", "nl": "Georgië", "pl": "Gruzja", "pt": "Geórgia", "ru": "Джорджия", "tr": "Gürcistan", "uk": "Грузія", "pt-BR": "Geórgia", "zh-CN": "格鲁吉亚"}
82	Germany	f	Berlin	EUR	Euro	€	🇩🇪	U+1F1E9 U+1F1EA	\N	\N	DE	DEU	51	9	German	Deutschland	276	49	Europe	4	Western Europe	17	[{"tzName": "Central European Time", "zoneName": "Europe/Berlin", "gmtOffset": 3600, "abbreviation": "CET", "gmtOffsetName": "UTC+01:00"}, {"tzName": "Central European Time", "zoneName": "Europe/Busingen", "gmtOffset": 3600, "abbreviation": "CET", "gmtOffsetName": "UTC+01:00"}]	.de	{"de": "Deutschland", "es": "Alemania", "fa": "آلمان", "fr": "Allemagne", "hr": "Njemačka", "it": "Germania", "ja": "ドイツ", "ko": "독일", "nl": "Duitsland", "pl": "Niemcy", "pt": "Alemanha", "ru": "Германия", "tr": "Almanya", "uk": "Німеччина", "pt-BR": "Alemanha", "zh-CN": "德国"}
83	Ghana	f	Accra	GHS	Ghanaian cedi	GH₵	🇬🇭	U+1F1EC U+1F1ED	\N	\N	GH	GHA	8	-2	Ghanaian	Ghana	288	233	Africa	1	Western Africa	3	[{"tzName": "Greenwich Mean Time", "zoneName": "Africa/Accra", "gmtOffset": 0, "abbreviation": "GMT", "gmtOffsetName": "UTC±00"}]	.gh	{"de": "Ghana", "es": "Ghana", "fa": "غنا", "fr": "Ghana", "hr": "Gana", "it": "Ghana", "ja": "ガーナ", "ko": "가나", "nl": "Ghana", "pl": "Ghana", "pt": "Gana", "ru": "Гана", "tr": "Gana", "uk": "Гана", "pt-BR": "Gana", "zh-CN": "加纳"}
84	Gibraltar	f	Gibraltar	GIP	Gibraltar pound	£	🇬🇮	U+1F1EC U+1F1EE	\N	\N	GI	GIB	36.13333333	-5.35	Gibraltar	Gibraltar	292	350	Europe	4	Southern Europe	16	[{"tzName": "Central European Time", "zoneName": "Europe/Gibraltar", "gmtOffset": 3600, "abbreviation": "CET", "gmtOffsetName": "UTC+01:00"}]	.gi	{"de": "Gibraltar", "es": "Gibraltar", "fa": "جبل‌طارق", "fr": "Gibraltar", "hr": "Gibraltar", "it": "Gibilterra", "ja": "ジブラルタル", "ko": "지브롤터", "nl": "Gibraltar", "pl": "Gibraltar", "pt": "Gibraltar", "ru": "Гибралтар", "tr": "Cebelitarik", "uk": "Гібралтар", "pt-BR": "Gibraltar", "zh-CN": "直布罗陀"}
85	Greece	f	Athens	EUR	Euro	€	🇬🇷	U+1F1EC U+1F1F7	\N	\N	GR	GRC	39	22	Greek, Hellenic	Ελλάδα	300	30	Europe	4	Southern Europe	16	[{"tzName": "Eastern European Time", "zoneName": "Europe/Athens", "gmtOffset": 7200, "abbreviation": "EET", "gmtOffsetName": "UTC+02:00"}]	.gr	{"de": "Griechenland", "es": "Grecia", "fa": "یونان", "fr": "Grèce", "hr": "Grčka", "it": "Grecia", "ja": "ギリシャ", "ko": "그리스", "nl": "Griekenland", "pl": "Grecja", "pt": "Grécia", "ru": "Греция", "tr": "Yunanistan", "uk": "Греція", "pt-BR": "Grécia", "zh-CN": "希腊"}
86	Greenland	f	Nuuk	DKK	Danish krone	Kr.	🇬🇱	U+1F1EC U+1F1F1	\N	\N	GL	GRL	72	-40	Greenlandic	Kalaallit Nunaat	304	299	Americas	2	Northern America	6	[{"tzName": "Greenwich Mean Time", "zoneName": "America/Danmarkshavn", "gmtOffset": 0, "abbreviation": "GMT", "gmtOffsetName": "UTC±00"}, {"tzName": "West Greenland Time", "zoneName": "America/Nuuk", "gmtOffset": -10800, "abbreviation": "WGT", "gmtOffsetName": "UTC-03:00"}, {"tzName": "Eastern Greenland Time", "zoneName": "America/Scoresbysund", "gmtOffset": -3600, "abbreviation": "EGT", "gmtOffsetName": "UTC-01:00"}, {"tzName": "Atlantic Standard Time", "zoneName": "America/Thule", "gmtOffset": -14400, "abbreviation": "AST", "gmtOffsetName": "UTC-04:00"}]	.gl	{"de": "Grönland", "es": "Groenlandia", "fa": "گرینلند", "fr": "Groenland", "hr": "Grenland", "it": "Groenlandia", "ja": "グリーンランド", "ko": "그린란드", "nl": "Groenland", "pl": "Grenlandia", "pt": "Gronelândia", "ru": "Гренландия", "tr": "Grönland", "uk": "Гренландія", "pt-BR": "Groelândia", "zh-CN": "格陵兰岛"}
87	Grenada	f	St. George's	XCD	Eastern Caribbean dollar	$	🇬🇩	U+1F1EC U+1F1E9	\N	\N	GD	GRD	12.11666666	-61.66666666	Grenadian	Grenada	308	1	Americas	2	Caribbean	7	[{"tzName": "Atlantic Standard Time", "zoneName": "America/Grenada", "gmtOffset": -14400, "abbreviation": "AST", "gmtOffsetName": "UTC-04:00"}]	.gd	{"de": "Grenada", "es": "Grenada", "fa": "گرنادا", "fr": "Grenade", "hr": "Grenada", "it": "Grenada", "ja": "グレナダ", "ko": "그레나다", "nl": "Grenada", "pl": "Grenada", "pt": "Granada", "ru": "Гренада", "tr": "Grenada", "uk": "Гренада", "pt-BR": "Granada", "zh-CN": "格林纳达"}
88	Guadeloupe	f	Basse-Terre	EUR	Euro	€	🇬🇵	U+1F1EC U+1F1F5	\N	\N	GP	GLP	16.25	-61.583333	Guadeloupe	Guadeloupe	312	590	Americas	2	Caribbean	7	[{"tzName": "Atlantic Standard Time", "zoneName": "America/Guadeloupe", "gmtOffset": -14400, "abbreviation": "AST", "gmtOffsetName": "UTC-04:00"}]	.gp	{"de": "Guadeloupe", "es": "Guadalupe", "fa": "جزیره گوادلوپ", "fr": "Guadeloupe", "hr": "Gvadalupa", "it": "Guadeloupa", "ja": "グアドループ", "ko": "과들루프", "nl": "Guadeloupe", "pl": "Gwadelupa", "pt": "Guadalupe", "ru": "Гваделупа", "tr": "Guadeloupe", "uk": "Гваделупа", "pt-BR": "Guadalupe", "zh-CN": "瓜德罗普岛"}
89	Guam	f	Hagatna	USD	US Dollar	$	🇬🇺	U+1F1EC U+1F1FA	\N	\N	GU	GUM	13.46666666	144.78333333	Guamanian, Guambat	Guam	316	1	Oceania	5	Micronesia	21	[{"tzName": "Chamorro Standard Time", "zoneName": "Pacific/Guam", "gmtOffset": 36000, "abbreviation": "CHST", "gmtOffsetName": "UTC+10:00"}]	.gu	{"de": "Guam", "es": "Guam", "fa": "گوام", "fr": "Guam", "hr": "Guam", "it": "Guam", "ja": "グアム", "ko": "괌", "nl": "Guam", "pl": "Guam", "pt": "Guame", "ru": "Гуам", "tr": "Guam", "uk": "Гуам", "pt-BR": "Guam", "zh-CN": "关岛"}
90	Guatemala	f	Guatemala City	GTQ	Guatemalan quetzal	Q	🇬🇹	U+1F1EC U+1F1F9	\N	\N	GT	GTM	15.5	-90.25	Guatemalan	Guatemala	320	502	Americas	2	Central America	9	[{"tzName": "Central Standard Time (North America", "zoneName": "America/Guatemala", "gmtOffset": -21600, "abbreviation": "CST", "gmtOffsetName": "UTC-06:00"}]	.gt	{"de": "Guatemala", "es": "Guatemala", "fa": "گواتمالا", "fr": "Guatemala", "hr": "Gvatemala", "it": "Guatemala", "ja": "グアテマラ", "ko": "과테말라", "nl": "Guatemala", "pl": "Gwatemala", "pt": "Guatemala", "ru": "Гватемала", "tr": "Guatemala", "uk": "Гватемала", "pt-BR": "Guatemala", "zh-CN": "危地马拉"}
91	Guernsey and Alderney	f	St Peter Port	GBP	British pound	£	🇬🇬	U+1F1EC U+1F1EC	\N	\N	GG	GGY	49.46666666	-2.58333333	Channel Island	Guernsey	831	44	Europe	4	Northern Europe	18	[{"tzName": "Greenwich Mean Time", "zoneName": "Europe/Guernsey", "gmtOffset": 0, "abbreviation": "GMT", "gmtOffsetName": "UTC±00"}]	.gg	{"de": "Guernsey", "es": "Guernsey", "fa": "گرنزی", "fr": "Guernesey", "hr": "Guernsey", "it": "Guernsey", "ja": "ガーンジー", "ko": "건지, 올더니", "nl": "Guernsey", "pl": "Guernsey i Alderney", "pt": "Guernsey", "ru": "Гернси и Олдерни", "tr": "Alderney", "uk": "Гернсі та Олдерні", "pt-BR": "Guernsey", "zh-CN": "根西岛"}
92	Guinea	f	Conakry	GNF	Guinean franc	FG	🇬🇳	U+1F1EC U+1F1F3	\N	\N	GN	GIN	11	-10	Guinean	Guinée	324	224	Africa	1	Western Africa	3	[{"tzName": "Greenwich Mean Time", "zoneName": "Africa/Conakry", "gmtOffset": 0, "abbreviation": "GMT", "gmtOffsetName": "UTC±00"}]	.gn	{"de": "Guinea", "es": "Guinea", "fa": "گینه", "fr": "Guinée", "hr": "Gvineja", "it": "Guinea", "ja": "ギニア", "ko": "기니", "nl": "Guinee", "pl": "Gwinea", "pt": "Guiné", "ru": "Гвинея", "tr": "Gine", "uk": "Гвінея", "pt-BR": "Guiné", "zh-CN": "几内亚"}
93	Guinea-Bissau	f	Bissau	XOF	West African CFA franc	CFA	🇬🇼	U+1F1EC U+1F1FC	\N	\N	GW	GNB	12	-15	Bissau-Guinean	Guiné-Bissau	624	245	Africa	1	Western Africa	3	[{"tzName": "Greenwich Mean Time", "zoneName": "Africa/Bissau", "gmtOffset": 0, "abbreviation": "GMT", "gmtOffsetName": "UTC±00"}]	.gw	{"de": "Guinea-Bissau", "es": "Guinea-Bisáu", "fa": "گینه بیسائو", "fr": "Guinée-Bissau", "hr": "Gvineja Bisau", "it": "Guinea-Bissau", "ja": "ギニアビサウ", "ko": "기니비사우", "nl": "Guinee-Bissau", "pl": "Gwinea Bissau", "pt": "Guiné-Bissau", "ru": "Гвинея-Бисау", "tr": "Gine-bissau", "uk": "Гвінея-Бісау", "pt-BR": "Guiné-Bissau", "zh-CN": "几内亚比绍"}
94	Guyana	f	Georgetown	GYD	Guyanese dollar	$	🇬🇾	U+1F1EC U+1F1FE	\N	\N	GY	GUY	5	-59	Guyanese	Guyana	328	592	Americas	2	South America	8	[{"tzName": "Guyana Time", "zoneName": "America/Guyana", "gmtOffset": -14400, "abbreviation": "GYT", "gmtOffsetName": "UTC-04:00"}]	.gy	{"de": "Guyana", "es": "Guyana", "fa": "گویان", "fr": "Guyane", "hr": "Gvajana", "it": "Guyana", "ja": "ガイアナ", "ko": "가이아나", "nl": "Guyana", "pl": "Gujana", "pt": "Guiana", "ru": "Гайана", "tr": "Guyana", "uk": "Гайана", "pt-BR": "Guiana", "zh-CN": "圭亚那"}
95	Haiti	f	Port-au-Prince	HTG	Haitian gourde	G	🇭🇹	U+1F1ED U+1F1F9	\N	\N	HT	HTI	19	-72.41666666	Haitian	Haïti	332	509	Americas	2	Caribbean	7	[{"tzName": "Eastern Standard Time (North America", "zoneName": "America/Port-au-Prince", "gmtOffset": -18000, "abbreviation": "EST", "gmtOffsetName": "UTC-05:00"}]	.ht	{"de": "Haiti", "es": "Haiti", "fa": "هائیتی", "fr": "Haïti", "hr": "Haiti", "it": "Haiti", "ja": "ハイチ", "ko": "아이티", "nl": "Haïti", "pl": "Haiti", "pt": "Haiti", "ru": "Гаити", "tr": "Haiti", "uk": "Гаїті", "pt-BR": "Haiti", "zh-CN": "海地"}
96	Heard Island and McDonald Islands	f		AUD	Australian dollar	$	🇭🇲	U+1F1ED U+1F1F2	\N	\N	HM	HMD	-53.1	72.51666666	Heard Island or McDonald Islands	Heard Island and McDonald Islands	334	672		\N		\N	[{"tzName": "French Southern and Antarctic Time", "zoneName": "Indian/Kerguelen", "gmtOffset": 18000, "abbreviation": "TFT", "gmtOffsetName": "UTC+05:00"}]	.hm	{"de": "Heard und die McDonaldinseln", "es": "Islas Heard y McDonald", "fa": "جزیره هرد و جزایر مک‌دونالد", "fr": "Îles Heard-et-MacDonald", "hr": "Otok Heard i otočje McDonald", "it": "Isole Heard e McDonald", "ja": "ハード島とマクドナルド諸島", "ko": "허드 맥도날드 제도", "nl": "Heard- en McDonaldeilanden", "pl": "Wyspa Heard i Wyspy McDonalda", "pt": "Ilha Heard e Ilhas McDonald", "ru": "Остров Херд и острова Макдональд", "tr": "Heard Adasi Ve Mcdonald Adalari", "uk": "Острів Херд та острови Макдональд", "pt-BR": "Ilha Heard e Ilhas McDonald", "zh-CN": "赫德·唐纳岛及麦唐纳岛"}
97	Honduras	f	Tegucigalpa	HNL	Honduran lempira	L	🇭🇳	U+1F1ED U+1F1F3	\N	\N	HN	HND	15	-86.5	Honduran	Honduras	340	504	Americas	2	Central America	9	[{"tzName": "Central Standard Time (North America", "zoneName": "America/Tegucigalpa", "gmtOffset": -21600, "abbreviation": "CST", "gmtOffsetName": "UTC-06:00"}]	.hn	{"de": "Honduras", "es": "Honduras", "fa": "هندوراس", "fr": "Honduras", "hr": "Honduras", "it": "Honduras", "ja": "ホンジュラス", "ko": "온두라스", "nl": "Honduras", "pl": "Honduras", "pt": "Honduras", "ru": "Гондурас", "tr": "Honduras", "uk": "Гондурас", "pt-BR": "Honduras", "zh-CN": "洪都拉斯"}
98	Hong Kong S.A.R.	f	Hong Kong	HKD	Hong Kong dollar	$	🇭🇰	U+1F1ED U+1F1F0	\N	\N	HK	HKG	22.25	114.16666666	Hong Kong, Hong Kongese	香港	344	852	Asia	3	Eastern Asia	12	[{"tzName": "Hong Kong Time", "zoneName": "Asia/Hong_Kong", "gmtOffset": 28800, "abbreviation": "HKT", "gmtOffsetName": "UTC+08:00"}]	.hk	{"de": "Hong Kong", "es": "Hong Kong", "fa": "هنگ‌کنگ", "fr": "Hong Kong", "hr": "Hong Kong", "it": "Hong Kong", "ja": "香港", "ko": "홍콩", "nl": "Hongkong", "pl": "Hongkong S.A.R.", "pt": "Hong Kong", "ru": "Гонконг С.А.Р.", "tr": "Hong Kong", "uk": "Гонконг САР.", "pt-BR": "Hong Kong", "zh-CN": "中国香港"}
99	Hungary	f	Budapest	HUF	Hungarian forint	Ft	🇭🇺	U+1F1ED U+1F1FA	\N	\N	HU	HUN	47	20	Hungarian, Magyar	Magyarország	348	36	Europe	4	Eastern Europe	15	[{"tzName": "Central European Time", "zoneName": "Europe/Budapest", "gmtOffset": 3600, "abbreviation": "CET", "gmtOffsetName": "UTC+01:00"}]	.hu	{"de": "Ungarn", "es": "Hungría", "fa": "مجارستان", "fr": "Hongrie", "hr": "Mađarska", "it": "Ungheria", "ja": "ハンガリー", "ko": "헝가리", "nl": "Hongarije", "pl": "Węgry", "pt": "Hungria", "ru": "Венгрия", "tr": "Macaristan", "uk": "Угорщина", "pt-BR": "Hungria", "zh-CN": "匈牙利"}
100	Iceland	f	Reykjavik	ISK	Icelandic króna	ko	🇮🇸	U+1F1EE U+1F1F8	\N	\N	IS	ISL	65	-18	Icelandic	Ísland	352	354	Europe	4	Northern Europe	18	[{"tzName": "Greenwich Mean Time", "zoneName": "Atlantic/Reykjavik", "gmtOffset": 0, "abbreviation": "GMT", "gmtOffsetName": "UTC±00"}]	.is	{"de": "Island", "es": "Islandia", "fa": "ایسلند", "fr": "Islande", "hr": "Island", "it": "Islanda", "ja": "アイスランド", "ko": "아이슬란드", "nl": "IJsland", "pl": "Islandia", "pt": "Islândia", "ru": "Исландия", "tr": "İzlanda", "uk": "Ісландія", "pt-BR": "Islândia", "zh-CN": "冰岛"}
101	India	f	New Delhi	INR	Indian rupee	₹	🇮🇳	U+1F1EE U+1F1F3	\N	\N	IN	IND	20	77	Indian	भारत	356	91	Asia	3	Southern Asia	14	[{"tzName": "Indian Standard Time", "zoneName": "Asia/Kolkata", "gmtOffset": 19800, "abbreviation": "IST", "gmtOffsetName": "UTC+05:30"}]	.in	{"de": "Indien", "es": "India", "fa": "هند", "fr": "Inde", "hr": "Indija", "it": "India", "ja": "インド", "ko": "인도", "nl": "India", "pl": "Indie", "pt": "Índia", "ru": "Индия", "tr": "Hindistan", "uk": "Індія", "pt-BR": "Índia", "zh-CN": "印度"}
102	Indonesia	f	Jakarta	IDR	Indonesian rupiah	Rp	🇮🇩	U+1F1EE U+1F1E9	\N	\N	ID	IDN	-5	120	Indonesian	Indonesia	360	62	Asia	3	South-Eastern Asia	13	[{"tzName": "Western Indonesian Time", "zoneName": "Asia/Jakarta", "gmtOffset": 25200, "abbreviation": "WIB", "gmtOffsetName": "UTC+07:00"}, {"tzName": "Eastern Indonesian Time", "zoneName": "Asia/Jayapura", "gmtOffset": 32400, "abbreviation": "WIT", "gmtOffsetName": "UTC+09:00"}, {"tzName": "Central Indonesia Time", "zoneName": "Asia/Makassar", "gmtOffset": 28800, "abbreviation": "WITA", "gmtOffsetName": "UTC+08:00"}, {"tzName": "Western Indonesian Time", "zoneName": "Asia/Pontianak", "gmtOffset": 25200, "abbreviation": "WIB", "gmtOffsetName": "UTC+07:00"}]	.id	{"de": "Indonesien", "es": "Indonesia", "fa": "اندونزی", "fr": "Indonésie", "hr": "Indonezija", "it": "Indonesia", "ja": "インドネシア", "ko": "인도네시아", "nl": "Indonesië", "pl": "Indonezja", "pt": "Indonésia", "ru": "Индонезия", "tr": "Endonezya", "uk": "Індонезія", "pt-BR": "Indonésia", "zh-CN": "印度尼西亚"}
103	Iran	f	Tehran	IRR	Iranian rial	﷼	🇮🇷	U+1F1EE U+1F1F7	\N	\N	IR	IRN	32	53	Iranian, Persian	ایران	364	98	Asia	3	Southern Asia	14	[{"tzName": "Iran Daylight Time", "zoneName": "Asia/Tehran", "gmtOffset": 12600, "abbreviation": "IRDT", "gmtOffsetName": "UTC+03:30"}]	.ir	{"de": "Iran", "es": "Iran", "fa": "ایران", "fr": "Iran", "hr": "Iran", "ja": "イラン・イスラム共和国", "ko": "이란", "nl": "Iran", "pl": "Iran", "pt": "Irão", "ru": "Иран", "tr": "İran", "uk": "Іран", "pt-BR": "Irã", "zh-CN": "伊朗"}
104	Iraq	f	Baghdad	IQD	Iraqi dinar	د.ع	🇮🇶	U+1F1EE U+1F1F6	\N	\N	IQ	IRQ	33	44	Iraqi	العراق	368	964	Asia	3	Western Asia	11	[{"tzName": "Arabia Standard Time", "zoneName": "Asia/Baghdad", "gmtOffset": 10800, "abbreviation": "AST", "gmtOffsetName": "UTC+03:00"}]	.iq	{"de": "Irak", "es": "Irak", "fa": "عراق", "fr": "Irak", "hr": "Irak", "it": "Iraq", "ja": "イラク", "ko": "이라크", "nl": "Irak", "pl": "Irak", "pt": "Iraque", "ru": "Ирак", "tr": "Irak", "uk": "Ірак", "pt-BR": "Iraque", "zh-CN": "伊拉克"}
105	Ireland	f	Dublin	EUR	Euro	€	🇮🇪	U+1F1EE U+1F1EA	\N	\N	IE	IRL	53	-8	Irish	Éire	372	353	Europe	4	Northern Europe	18	[{"tzName": "Greenwich Mean Time", "zoneName": "Europe/Dublin", "gmtOffset": 0, "abbreviation": "GMT", "gmtOffsetName": "UTC±00"}]	.ie	{"de": "Irland", "es": "Irlanda", "fa": "ایرلند", "fr": "Irlande", "hr": "Irska", "it": "Irlanda", "ja": "アイルランド", "ko": "아일랜드", "nl": "Ierland", "pl": "Irlandia", "pt": "Irlanda", "ru": "Ирландия", "tr": "İrlanda", "uk": "Ірландія", "pt-BR": "Irlanda", "zh-CN": "爱尔兰"}
106	Israel	f	Jerusalem	ILS	Israeli new shekel	₪	🇮🇱	U+1F1EE U+1F1F1	\N	\N	IL	ISR	31.5	34.75	Israeli	יִשְׂרָאֵל	376	972	Asia	3	Western Asia	11	[{"tzName": "Israel Standard Time", "zoneName": "Asia/Jerusalem", "gmtOffset": 7200, "abbreviation": "IST", "gmtOffsetName": "UTC+02:00"}]	.il	{"de": "Israel", "es": "Israel", "fa": "اسرائیل", "fr": "Israël", "hr": "Izrael", "it": "Israele", "ja": "イスラエル", "ko": "이스라엘", "nl": "Israël", "pl": "Izrael", "pt": "Israel", "ru": "Израиль", "tr": "İsrail", "uk": "Ізраїль", "pt-BR": "Israel", "zh-CN": "以色列"}
107	Italy	f	Rome	EUR	Euro	€	🇮🇹	U+1F1EE U+1F1F9	\N	\N	IT	ITA	42.83333333	12.83333333	Italian	Italia	380	39	Europe	4	Southern Europe	16	[{"tzName": "Central European Time", "zoneName": "Europe/Rome", "gmtOffset": 3600, "abbreviation": "CET", "gmtOffsetName": "UTC+01:00"}]	.it	{"de": "Italien", "es": "Italia", "fa": "ایتالیا", "fr": "Italie", "hr": "Italija", "it": "Italia", "ja": "イタリア", "ko": "이탈리아", "nl": "Italië", "pl": "Włochy", "pt": "Itália", "ru": "Италия", "tr": "İtalya", "uk": "Італія", "pt-BR": "Itália", "zh-CN": "意大利"}
108	Jamaica	f	Kingston	JMD	Jamaican dollar	J$	🇯🇲	U+1F1EF U+1F1F2	\N	\N	JM	JAM	18.25	-77.5	Jamaican	Jamaica	388	1	Americas	2	Caribbean	7	[{"tzName": "Eastern Standard Time (North America", "zoneName": "America/Jamaica", "gmtOffset": -18000, "abbreviation": "EST", "gmtOffsetName": "UTC-05:00"}]	.jm	{"de": "Jamaika", "es": "Jamaica", "fa": "جامائیکا", "fr": "Jamaïque", "hr": "Jamajka", "it": "Giamaica", "ja": "ジャマイカ", "ko": "자메이카", "nl": "Jamaica", "pl": "Jamajka", "pt": "Jamaica", "ru": "Ямайка", "tr": "Jamaika", "uk": "Ямайка", "pt-BR": "Jamaica", "zh-CN": "牙买加"}
109	Japan	f	Tokyo	JPY	Japanese yen	¥	🇯🇵	U+1F1EF U+1F1F5	\N	\N	JP	JPN	36	138	Japanese	日本	392	81	Asia	3	Eastern Asia	12	[{"tzName": "Japan Standard Time", "zoneName": "Asia/Tokyo", "gmtOffset": 32400, "abbreviation": "JST", "gmtOffsetName": "UTC+09:00"}]	.jp	{"de": "Japan", "es": "Japón", "fa": "ژاپن", "fr": "Japon", "hr": "Japan", "it": "Giappone", "ja": "日本", "ko": "일본", "nl": "Japan", "pl": "Japonia", "pt": "Japão", "ru": "Япония", "tr": "Japonya", "uk": "Японія", "pt-BR": "Japão", "zh-CN": "日本"}
110	Jersey	f	Saint Helier	GBP	British pound	£	🇯🇪	U+1F1EF U+1F1EA	\N	\N	JE	JEY	49.25	-2.16666666	Channel Island	Jersey	832	44	Europe	4	Northern Europe	18	[{"tzName": "Greenwich Mean Time", "zoneName": "Europe/Jersey", "gmtOffset": 0, "abbreviation": "GMT", "gmtOffsetName": "UTC±00"}]	.je	{"de": "Jersey", "es": "Jersey", "fa": "جرزی", "fr": "Jersey", "hr": "Jersey", "it": "Isola di Jersey", "ja": "ジャージー", "ko": "저지 섬", "nl": "Jersey", "pl": "Jersey", "pt": "Jersey", "ru": "Джерси", "tr": "Jersey", "uk": "Джерсі", "pt-BR": "Jersey", "zh-CN": "泽西岛"}
111	Jordan	f	Amman	JOD	Jordanian dinar	ا.د	🇯🇴	U+1F1EF U+1F1F4	\N	\N	JO	JOR	31	36	Jordanian	الأردن	400	962	Asia	3	Western Asia	11	[{"tzName": "Eastern European Time", "zoneName": "Asia/Amman", "gmtOffset": 7200, "abbreviation": "EET", "gmtOffsetName": "UTC+02:00"}]	.jo	{"de": "Jordanien", "es": "Jordania", "fa": "اردن", "fr": "Jordanie", "hr": "Jordan", "it": "Giordania", "ja": "ヨルダン", "ko": "요르단", "nl": "Jordanië", "pl": "Jordan", "pt": "Jordânia", "ru": "Джордан", "tr": "Ürdün", "uk": "Йорданія", "pt-BR": "Jordânia", "zh-CN": "约旦"}
123	Liberia	f	Monrovia	LRD	Liberian dollar	$	🇱🇷	U+1F1F1 U+1F1F7	\N	\N	LR	LBR	6.5	-9.5	Liberian	Liberia	430	231	Africa	1	Western Africa	3	[{"tzName": "Greenwich Mean Time", "zoneName": "Africa/Monrovia", "gmtOffset": 0, "abbreviation": "GMT", "gmtOffsetName": "UTC±00"}]	.lr	{"de": "Liberia", "es": "Liberia", "fa": "لیبریا", "fr": "Liberia", "hr": "Liberija", "it": "Liberia", "ja": "リベリア", "ko": "라이베리아", "nl": "Liberia", "pl": "Liberia", "pt": "Libéria", "ru": "Либерия", "tr": "Liberya", "uk": "Ліберія", "pt-BR": "Libéria", "zh-CN": "利比里亚"}
112	Kazakhstan	f	Astana	KZT	Kazakhstani tenge	лв	🇰🇿	U+1F1F0 U+1F1FF	\N	\N	KZ	KAZ	48	68	Kazakhstani, Kazakh	Қазақстан	398	7	Asia	3	Central Asia	10	[{"tzName": "Alma-Ata Time[1", "zoneName": "Asia/Almaty", "gmtOffset": 21600, "abbreviation": "ALMT", "gmtOffsetName": "UTC+06:00"}, {"tzName": "Aqtobe Time", "zoneName": "Asia/Aqtau", "gmtOffset": 18000, "abbreviation": "AQTT", "gmtOffsetName": "UTC+05:00"}, {"tzName": "Aqtobe Time", "zoneName": "Asia/Aqtobe", "gmtOffset": 18000, "abbreviation": "AQTT", "gmtOffsetName": "UTC+05:00"}, {"tzName": "Moscow Daylight Time+1", "zoneName": "Asia/Atyrau", "gmtOffset": 18000, "abbreviation": "MSD+1", "gmtOffsetName": "UTC+05:00"}, {"tzName": "Oral Time", "zoneName": "Asia/Oral", "gmtOffset": 18000, "abbreviation": "ORAT", "gmtOffsetName": "UTC+05:00"}, {"tzName": "Qyzylorda Summer Time", "zoneName": "Asia/Qostanay", "gmtOffset": 21600, "abbreviation": "QYZST", "gmtOffsetName": "UTC+06:00"}, {"tzName": "Qyzylorda Summer Time", "zoneName": "Asia/Qyzylorda", "gmtOffset": 18000, "abbreviation": "QYZT", "gmtOffsetName": "UTC+05:00"}]	.kz	{"de": "Kasachstan", "es": "Kazajistán", "fa": "قزاقستان", "fr": "Kazakhstan", "hr": "Kazahstan", "it": "Kazakistan", "ja": "カザフスタン", "ko": "카자흐스탄", "nl": "Kazachstan", "pl": "Kazachstan", "pt": "Cazaquistão", "ru": "Казахстан", "tr": "Kazakistan", "uk": "Казахстан", "pt-BR": "Cazaquistão", "zh-CN": "哈萨克斯坦"}
113	Kenya	f	Nairobi	KES	Kenyan shilling	KSh	🇰🇪	U+1F1F0 U+1F1EA	\N	\N	KE	KEN	1	38	Kenyan	Kenya	404	254	Africa	1	Eastern Africa	4	[{"tzName": "East Africa Time", "zoneName": "Africa/Nairobi", "gmtOffset": 10800, "abbreviation": "EAT", "gmtOffsetName": "UTC+03:00"}]	.ke	{"de": "Kenia", "es": "Kenia", "fa": "کنیا", "fr": "Kenya", "hr": "Kenija", "it": "Kenya", "ja": "ケニア", "ko": "케냐", "nl": "Kenia", "pl": "Kenia", "pt": "Quénia", "ru": "Кения", "tr": "Kenya", "uk": "Кенія", "pt-BR": "Quênia", "zh-CN": "肯尼亚"}
114	Kiribati	f	Tarawa	AUD	Australian dollar	$	🇰🇮	U+1F1F0 U+1F1EE	\N	\N	KI	KIR	1.41666666	173	I-Kiribati	Kiribati	296	686	Oceania	5	Micronesia	21	[{"tzName": "Phoenix Island Time", "zoneName": "Pacific/Enderbury", "gmtOffset": 46800, "abbreviation": "PHOT", "gmtOffsetName": "UTC+13:00"}, {"tzName": "Line Islands Time", "zoneName": "Pacific/Kiritimati", "gmtOffset": 50400, "abbreviation": "LINT", "gmtOffsetName": "UTC+14:00"}, {"tzName": "Gilbert Island Time", "zoneName": "Pacific/Tarawa", "gmtOffset": 43200, "abbreviation": "GILT", "gmtOffsetName": "UTC+12:00"}]	.ki	{"de": "Kiribati", "es": "Kiribati", "fa": "کیریباتی", "fr": "Kiribati", "hr": "Kiribati", "it": "Kiribati", "ja": "キリバス", "ko": "키리바시", "nl": "Kiribati", "pl": "Kiribati", "pt": "Quiribáti", "ru": "Кирибати", "tr": "Kiribati", "uk": "Кірібаті", "pt-BR": "Kiribati", "zh-CN": "基里巴斯"}
248	Kosovo	f	Pristina	EUR	Euro	€	🇽🇰	U+1F1FD U+1F1F0	\N	\N	XK	XKX	42.5612909	20.3403035	Kosovar, Kosovan	Republika e Kosovës	926	383	Europe	4	Eastern Europe	15	[{"tzName": "Central European Time", "zoneName": "Europe/Belgrade", "gmtOffset": 3600, "abbreviation": "CET", "gmtOffsetName": "UTC+01:00"}]	.xk	{"ko": "코소보", "pl": "Kosowo", "ru": "Косово", "tr": "Kosova", "uk": "Косово", "zh-CN": "科索沃"}
117	Kuwait	f	Kuwait City	KWD	Kuwaiti dinar	ك.د	🇰🇼	U+1F1F0 U+1F1FC	\N	\N	KW	KWT	29.5	45.75	Kuwaiti	الكويت	414	965	Asia	3	Western Asia	11	[{"tzName": "Arabia Standard Time", "zoneName": "Asia/Kuwait", "gmtOffset": 10800, "abbreviation": "AST", "gmtOffsetName": "UTC+03:00"}]	.kw	{"de": "Kuwait", "es": "Kuwait", "fa": "کویت", "fr": "Koweït", "hr": "Kuvajt", "it": "Kuwait", "ja": "クウェート", "ko": "쿠웨이트", "nl": "Koeweit", "pl": "Kuwejt", "pt": "Kuwait", "ru": "Кувейт", "tr": "Kuveyt", "uk": "Кувейт", "pt-BR": "Kuwait", "zh-CN": "科威特"}
118	Kyrgyzstan	f	Bishkek	KGS	Kyrgyzstani som	лв	🇰🇬	U+1F1F0 U+1F1EC	\N	\N	KG	KGZ	41	75	Kyrgyzstani, Kyrgyz, Kirgiz, Kirghiz	Кыргызстан	417	996	Asia	3	Central Asia	10	[{"tzName": "Kyrgyzstan Time", "zoneName": "Asia/Bishkek", "gmtOffset": 21600, "abbreviation": "KGT", "gmtOffsetName": "UTC+06:00"}]	.kg	{"de": "Kirgisistan", "es": "Kirguizistán", "fa": "قرقیزستان", "fr": "Kirghizistan", "hr": "Kirgistan", "it": "Kirghizistan", "ja": "キルギス", "ko": "키르기스스탄", "nl": "Kirgizië", "pl": "Kirgistan", "pt": "Quirguizistão", "ru": "Кыргызстан", "tr": "Kirgizistan", "uk": "Киргизстан", "pt-BR": "Quirguistão", "zh-CN": "吉尔吉斯斯坦"}
119	Laos	f	Vientiane	LAK	Lao kip	₭	🇱🇦	U+1F1F1 U+1F1E6	\N	\N	LA	LAO	18	105	Lao, Laotian	ສປປລາວ	418	856	Asia	3	South-Eastern Asia	13	[{"tzName": "Indochina Time", "zoneName": "Asia/Vientiane", "gmtOffset": 25200, "abbreviation": "ICT", "gmtOffsetName": "UTC+07:00"}]	.la	{"de": "Laos", "es": "Laos", "fa": "لائوس", "fr": "Laos", "hr": "Laos", "it": "Laos", "ja": "ラオス人民民主共和国", "ko": "라오스", "nl": "Laos", "pl": "Laos", "pt": "Laos", "ru": "Лаос", "tr": "Laos", "uk": "Лаос", "pt-BR": "Laos", "zh-CN": "寮人民民主共和国"}
120	Latvia	f	Riga	EUR	Euro	€	🇱🇻	U+1F1F1 U+1F1FB	\N	\N	LV	LVA	57	25	Latvian	Latvija	428	371	Europe	4	Northern Europe	18	[{"tzName": "Eastern European Time", "zoneName": "Europe/Riga", "gmtOffset": 7200, "abbreviation": "EET", "gmtOffsetName": "UTC+02:00"}]	.lv	{"de": "Lettland", "es": "Letonia", "fa": "لتونی", "fr": "Lettonie", "hr": "Latvija", "it": "Lettonia", "ja": "ラトビア", "ko": "라트비아", "nl": "Letland", "pl": "Łotwa", "pt": "Letónia", "ru": "Латвия", "tr": "Letonya", "uk": "Латвія", "pt-BR": "Letônia", "zh-CN": "拉脱维亚"}
121	Lebanon	f	Beirut	LBP	Lebanese pound	£	🇱🇧	U+1F1F1 U+1F1E7	\N	\N	LB	LBN	33.83333333	35.83333333	Lebanese	لبنان	422	961	Asia	3	Western Asia	11	[{"tzName": "Eastern European Time", "zoneName": "Asia/Beirut", "gmtOffset": 7200, "abbreviation": "EET", "gmtOffsetName": "UTC+02:00"}]	.lb	{"de": "Libanon", "es": "Líbano", "fa": "لبنان", "fr": "Liban", "hr": "Libanon", "it": "Libano", "ja": "レバノン", "ko": "레바논", "nl": "Libanon", "pl": "Liban", "pt": "Líbano", "ru": "Ливан", "tr": "Lübnan", "uk": "Ліван", "pt-BR": "Líbano", "zh-CN": "黎巴嫩"}
122	Lesotho	f	Maseru	LSL	Lesotho loti	L	🇱🇸	U+1F1F1 U+1F1F8	\N	\N	LS	LSO	-29.5	28.5	Basotho	Lesotho	426	266	Africa	1	Southern Africa	5	[{"tzName": "South African Standard Time", "zoneName": "Africa/Maseru", "gmtOffset": 7200, "abbreviation": "SAST", "gmtOffsetName": "UTC+02:00"}]	.ls	{"de": "Lesotho", "es": "Lesotho", "fa": "لسوتو", "fr": "Lesotho", "hr": "Lesoto", "it": "Lesotho", "ja": "レソト", "ko": "레소토", "nl": "Lesotho", "pl": "Lesotho", "pt": "Lesoto", "ru": "Лесото", "tr": "Lesotho", "uk": "Лесото", "pt-BR": "Lesoto", "zh-CN": "莱索托"}
124	Libya	f	Tripolis	LYD	Libyan dinar	د.ل	🇱🇾	U+1F1F1 U+1F1FE	\N	\N	LY	LBY	25	17	Libyan	‏ليبيا	434	218	Africa	1	Northern Africa	1	[{"tzName": "Eastern European Time", "zoneName": "Africa/Tripoli", "gmtOffset": 7200, "abbreviation": "EET", "gmtOffsetName": "UTC+02:00"}]	.ly	{"de": "Libyen", "es": "Libia", "fa": "لیبی", "fr": "Libye", "hr": "Libija", "it": "Libia", "ja": "リビア", "ko": "리비아", "nl": "Libië", "pl": "Libia", "pt": "Líbia", "ru": "Ливия", "tr": "Libya", "uk": "Лівія", "pt-BR": "Líbia", "zh-CN": "利比亚"}
125	Liechtenstein	f	Vaduz	CHF	Swiss franc	CHf	🇱🇮	U+1F1F1 U+1F1EE	\N	\N	LI	LIE	47.26666666	9.53333333	Liechtenstein	Liechtenstein	438	423	Europe	4	Western Europe	17	[{"tzName": "Central European Time", "zoneName": "Europe/Vaduz", "gmtOffset": 3600, "abbreviation": "CET", "gmtOffsetName": "UTC+01:00"}]	.li	{"de": "Liechtenstein", "es": "Liechtenstein", "fa": "لیختن‌اشتاین", "fr": "Liechtenstein", "hr": "Lihtenštajn", "it": "Liechtenstein", "ja": "リヒテンシュタイン", "ko": "리히텐슈타인", "nl": "Liechtenstein", "pl": "Liechtenstein", "pt": "Listenstaine", "ru": "Лихтенштейн", "tr": "Lihtenştayn", "uk": "Ліхтенштейн", "pt-BR": "Liechtenstein", "zh-CN": "列支敦士登"}
126	Lithuania	f	Vilnius	EUR	Euro	€	🇱🇹	U+1F1F1 U+1F1F9	\N	\N	LT	LTU	56	24	Lithuanian	Lietuva	440	370	Europe	4	Northern Europe	18	[{"tzName": "Eastern European Time", "zoneName": "Europe/Vilnius", "gmtOffset": 7200, "abbreviation": "EET", "gmtOffsetName": "UTC+02:00"}]	.lt	{"de": "Litauen", "es": "Lituania", "fa": "لیتوانی", "fr": "Lituanie", "hr": "Litva", "it": "Lituania", "ja": "リトアニア", "ko": "리투아니아", "nl": "Litouwen", "pl": "Litwa", "pt": "Lituânia", "ru": "Литва", "tr": "Litvanya", "uk": "Литва", "pt-BR": "Lituânia", "zh-CN": "立陶宛"}
127	Luxembourg	f	Luxembourg	EUR	Euro	€	🇱🇺	U+1F1F1 U+1F1FA	\N	\N	LU	LUX	49.75	6.16666666	Luxembourg, Luxembourgish	Luxembourg	442	352	Europe	4	Western Europe	17	[{"tzName": "Central European Time", "zoneName": "Europe/Luxembourg", "gmtOffset": 3600, "abbreviation": "CET", "gmtOffsetName": "UTC+01:00"}]	.lu	{"de": "Luxemburg", "es": "Luxemburgo", "fa": "لوکزامبورگ", "fr": "Luxembourg", "hr": "Luksemburg", "it": "Lussemburgo", "ja": "ルクセンブルク", "ko": "룩셈부르크", "nl": "Luxemburg", "pl": "Luksemburg", "pt": "Luxemburgo", "ru": "Люксембург", "tr": "Lüksemburg", "uk": "Люксембург", "pt-BR": "Luxemburgo", "zh-CN": "卢森堡"}
128	Macau S.A.R.	f	Macao	MOP	Macanese pataca	$	🇲🇴	U+1F1F2 U+1F1F4	\N	\N	MO	MAC	22.16666666	113.55	Macanese, Chinese	澳門	446	853	Asia	3	Eastern Asia	12	[{"tzName": "China Standard Time", "zoneName": "Asia/Macau", "gmtOffset": 28800, "abbreviation": "CST", "gmtOffsetName": "UTC+08:00"}]	.mo	{"de": "Macao", "es": "Macao", "fa": "مکائو", "fr": "Macao", "hr": "Makao", "it": "Macao", "ja": "マカオ", "ko": "마카오", "nl": "Macao", "pl": "Macau S.A.R.", "pt": "Macau", "ru": "Макао С.А.Р.", "tr": "Makao", "uk": "САР Макао.", "pt-BR": "Macau", "zh-CN": "中国澳门"}
130	Madagascar	f	Antananarivo	MGA	Malagasy ariary	Ar	🇲🇬	U+1F1F2 U+1F1EC	\N	\N	MG	MDG	-20	47	Malagasy	Madagasikara	450	261	Africa	1	Eastern Africa	4	[{"tzName": "East Africa Time", "zoneName": "Indian/Antananarivo", "gmtOffset": 10800, "abbreviation": "EAT", "gmtOffsetName": "UTC+03:00"}]	.mg	{"de": "Madagaskar", "es": "Madagascar", "fa": "ماداگاسکار", "fr": "Madagascar", "hr": "Madagaskar", "it": "Madagascar", "ja": "マダガスカル", "ko": "마다가스카르", "nl": "Madagaskar", "pl": "Madagaskar", "pt": "Madagáscar", "ru": "Мадагаскар", "tr": "Madagaskar", "uk": "Мадагаскар", "pt-BR": "Madagascar", "zh-CN": "马达加斯加"}
131	Malawi	f	Lilongwe	MWK	Malawian kwacha	MK	🇲🇼	U+1F1F2 U+1F1FC	\N	\N	MW	MWI	-13.5	34	Malawian	Malawi	454	265	Africa	1	Eastern Africa	4	[{"tzName": "Central Africa Time", "zoneName": "Africa/Blantyre", "gmtOffset": 7200, "abbreviation": "CAT", "gmtOffsetName": "UTC+02:00"}]	.mw	{"de": "Malawi", "es": "Malawi", "fa": "مالاوی", "fr": "Malawi", "hr": "Malavi", "it": "Malawi", "ja": "マラウイ", "ko": "말라위", "nl": "Malawi", "pl": "Malawi", "pt": "Malávi", "ru": "Малави", "tr": "Malavi", "uk": "Малаві", "pt-BR": "Malawi", "zh-CN": "马拉维"}
132	Malaysia	f	Kuala Lumpur	MYR	Malaysian ringgit	RM	🇲🇾	U+1F1F2 U+1F1FE	\N	\N	MY	MYS	2.5	112.5	Malaysian	Malaysia	458	60	Asia	3	South-Eastern Asia	13	[{"tzName": "Malaysia Time", "zoneName": "Asia/Kuala_Lumpur", "gmtOffset": 28800, "abbreviation": "MYT", "gmtOffsetName": "UTC+08:00"}, {"tzName": "Malaysia Time", "zoneName": "Asia/Kuching", "gmtOffset": 28800, "abbreviation": "MYT", "gmtOffsetName": "UTC+08:00"}]	.my	{"de": "Malaysia", "es": "Malasia", "fa": "مالزی", "fr": "Malaisie", "hr": "Malezija", "it": "Malesia", "ja": "マレーシア", "ko": "말레이시아", "nl": "Maleisië", "pl": "Malezja", "pt": "Malásia", "ru": "Малайзия", "tr": "Malezya", "uk": "Малайзія", "pt-BR": "Malásia", "zh-CN": "马来西亚"}
133	Maldives	f	Male	MVR	Maldivian rufiyaa	Rf	🇲🇻	U+1F1F2 U+1F1FB	\N	\N	MV	MDV	3.25	73	Maldivian	Maldives	462	960	Asia	3	Southern Asia	14	[{"tzName": "Maldives Time", "zoneName": "Indian/Maldives", "gmtOffset": 18000, "abbreviation": "MVT", "gmtOffsetName": "UTC+05:00"}]	.mv	{"de": "Malediven", "es": "Maldivas", "fa": "مالدیو", "fr": "Maldives", "hr": "Maldivi", "it": "Maldive", "ja": "モルディブ", "ko": "몰디브", "nl": "Maldiven", "pl": "Malediwy", "pt": "Maldivas", "ru": "Мальдивы", "tr": "Maldivler", "uk": "Мальдіви", "pt-BR": "Maldivas", "zh-CN": "马尔代夫"}
134	Mali	f	Bamako	XOF	West African CFA franc	CFA	🇲🇱	U+1F1F2 U+1F1F1	\N	\N	ML	MLI	17	-4	Malian, Malinese	Mali	466	223	Africa	1	Western Africa	3	[{"tzName": "Greenwich Mean Time", "zoneName": "Africa/Bamako", "gmtOffset": 0, "abbreviation": "GMT", "gmtOffsetName": "UTC±00"}]	.ml	{"de": "Mali", "es": "Mali", "fa": "مالی", "fr": "Mali", "hr": "Mali", "it": "Mali", "ja": "マリ", "ko": "말리", "nl": "Mali", "pl": "Mali", "pt": "Mali", "ru": "Мали", "tr": "Mali", "uk": "Малі", "pt-BR": "Mali", "zh-CN": "马里"}
135	Malta	f	Valletta	EUR	Euro	€	🇲🇹	U+1F1F2 U+1F1F9	\N	\N	MT	MLT	35.83333333	14.58333333	Maltese	Malta	470	356	Europe	4	Southern Europe	16	[{"tzName": "Central European Time", "zoneName": "Europe/Malta", "gmtOffset": 3600, "abbreviation": "CET", "gmtOffsetName": "UTC+01:00"}]	.mt	{"de": "Malta", "es": "Malta", "fa": "مالت", "fr": "Malte", "hr": "Malta", "it": "Malta", "ja": "マルタ", "ko": "몰타", "nl": "Malta", "pl": "Malta", "pt": "Malta", "ru": "Мальта", "tr": "Malta", "uk": "Мальта", "pt-BR": "Malta", "zh-CN": "马耳他"}
136	Man (Isle of)	f	Douglas, Isle of Man	GBP	British pound	£	🇮🇲	U+1F1EE U+1F1F2	\N	\N	IM	IMN	54.25	-4.5	Manx	Isle of Man	833	44	Europe	4	Northern Europe	18	[{"tzName": "Greenwich Mean Time", "zoneName": "Europe/Isle_of_Man", "gmtOffset": 0, "abbreviation": "GMT", "gmtOffsetName": "UTC±00"}]	.im	{"de": "Insel Man", "es": "Isla de Man", "fa": "جزیره من", "fr": "Île de Man", "hr": "Otok Man", "it": "Isola di Man", "ja": "マン島", "ko": "맨 섬", "nl": "Isle of Man", "pl": "Man (Wyspa)", "pt": "Ilha de Man", "ru": "Мэн (остров)", "tr": "Man Adasi", "uk": "Мен (острів Мен)", "pt-BR": "Ilha de Man", "zh-CN": "马恩岛"}
137	Marshall Islands	f	Majuro	USD	United States dollar	$	🇲🇭	U+1F1F2 U+1F1ED	\N	\N	MH	MHL	9	168	Marshallese	M̧ajeļ	584	692	Oceania	5	Micronesia	21	[{"tzName": "Marshall Islands Time", "zoneName": "Pacific/Kwajalein", "gmtOffset": 43200, "abbreviation": "MHT", "gmtOffsetName": "UTC+12:00"}, {"tzName": "Marshall Islands Time", "zoneName": "Pacific/Majuro", "gmtOffset": 43200, "abbreviation": "MHT", "gmtOffsetName": "UTC+12:00"}]	.mh	{"de": "Marshallinseln", "es": "Islas Marshall", "fa": "جزایر مارشال", "fr": "Îles Marshall", "hr": "Maršalovi Otoci", "it": "Isole Marshall", "ja": "マーシャル諸島", "ko": "마셜 제도", "nl": "Marshalleilanden", "pl": "Wyspy Marshalla", "pt": "Ilhas Marshall", "ru": "Маршалловы острова", "tr": "Marşal Adalari", "uk": "Маршаллові острови", "pt-BR": "Ilhas Marshall", "zh-CN": "马绍尔群岛"}
138	Martinique	f	Fort-de-France	EUR	Euro	€	🇲🇶	U+1F1F2 U+1F1F6	\N	\N	MQ	MTQ	14.666667	-61	Martiniquais, Martinican	Martinique	474	596	Americas	2	Caribbean	7	[{"tzName": "Atlantic Standard Time", "zoneName": "America/Martinique", "gmtOffset": -14400, "abbreviation": "AST", "gmtOffsetName": "UTC-04:00"}]	.mq	{"de": "Martinique", "es": "Martinica", "fa": "مونتسرات", "fr": "Martinique", "hr": "Martinique", "it": "Martinica", "ja": "マルティニーク", "ko": "마르티니크", "nl": "Martinique", "pl": "Martynika", "pt": "Martinica", "ru": "Мартиника", "tr": "Martinik", "uk": "Мартініка", "pt-BR": "Martinica", "zh-CN": "马提尼克岛"}
139	Mauritania	f	Nouakchott	MRO	Mauritanian ouguiya	MRU	🇲🇷	U+1F1F2 U+1F1F7	\N	\N	MR	MRT	20	-12	Mauritanian	موريتانيا	478	222	Africa	1	Western Africa	3	[{"tzName": "Greenwich Mean Time", "zoneName": "Africa/Nouakchott", "gmtOffset": 0, "abbreviation": "GMT", "gmtOffsetName": "UTC±00"}]	.mr	{"de": "Mauretanien", "es": "Mauritania", "fa": "موریتانی", "fr": "Mauritanie", "hr": "Mauritanija", "it": "Mauritania", "ja": "モーリタニア", "ko": "모리타니", "nl": "Mauritanië", "pl": "Mauretania", "pt": "Mauritânia", "ru": "Мавритания", "tr": "Moritanya", "uk": "Мавританія", "pt-BR": "Mauritânia", "zh-CN": "毛里塔尼亚"}
140	Mauritius	f	Port Louis	MUR	Mauritian rupee	₨	🇲🇺	U+1F1F2 U+1F1FA	\N	\N	MU	MUS	-20.28333333	57.55	Mauritian	Maurice	480	230	Africa	1	Eastern Africa	4	[{"tzName": "Mauritius Time", "zoneName": "Indian/Mauritius", "gmtOffset": 14400, "abbreviation": "MUT", "gmtOffsetName": "UTC+04:00"}]	.mu	{"de": "Mauritius", "es": "Mauricio", "fa": "موریس", "fr": "Île Maurice", "hr": "Mauricijus", "it": "Mauritius", "ja": "モーリシャス", "ko": "모리셔스", "nl": "Mauritius", "pl": "Mauritius", "pt": "Maurícia", "ru": "Маврикий", "tr": "Morityus", "uk": "Маврикій", "pt-BR": "Maurício", "zh-CN": "毛里求斯"}
141	Mayotte	f	Mamoudzou	EUR	Euro	€	🇾🇹	U+1F1FE U+1F1F9	\N	\N	YT	MYT	-12.83333333	45.16666666	Mahoran	Mayotte	175	262	Africa	1	Eastern Africa	4	[{"tzName": "East Africa Time", "zoneName": "Indian/Mayotte", "gmtOffset": 10800, "abbreviation": "EAT", "gmtOffsetName": "UTC+03:00"}]	.yt	{"de": "Mayotte", "es": "Mayotte", "fa": "مایوت", "fr": "Mayotte", "hr": "Mayotte", "it": "Mayotte", "ja": "マヨット", "ko": "마요트", "nl": "Mayotte", "pl": "Majotta", "pt": "Mayotte", "ru": "Майотта", "tr": "Mayotte", "uk": "Майотта", "pt-BR": "Mayotte", "zh-CN": "马约特"}
142	Mexico	f	Ciudad de México	MXN	Mexican peso	$	🇲🇽	U+1F1F2 U+1F1FD	\N	\N	MX	MEX	23	-102	Mexican	México	484	52	Americas	2	Central America	9	[{"tzName": "Central Standard Time (North America", "zoneName": "America/Bahia_Banderas", "gmtOffset": -21600, "abbreviation": "CST", "gmtOffsetName": "UTC-06:00"}, {"tzName": "Eastern Standard Time (North America", "zoneName": "America/Cancun", "gmtOffset": -18000, "abbreviation": "EST", "gmtOffsetName": "UTC-05:00"}, {"tzName": "Mountain Standard Time (North America", "zoneName": "America/Chihuahua", "gmtOffset": -25200, "abbreviation": "MST", "gmtOffsetName": "UTC-07:00"}, {"tzName": "Mountain Standard Time (North America", "zoneName": "America/Hermosillo", "gmtOffset": -25200, "abbreviation": "MST", "gmtOffsetName": "UTC-07:00"}, {"tzName": "Central Standard Time (North America", "zoneName": "America/Matamoros", "gmtOffset": -21600, "abbreviation": "CST", "gmtOffsetName": "UTC-06:00"}, {"tzName": "Mountain Standard Time (North America", "zoneName": "America/Mazatlan", "gmtOffset": -25200, "abbreviation": "MST", "gmtOffsetName": "UTC-07:00"}, {"tzName": "Central Standard Time (North America", "zoneName": "America/Merida", "gmtOffset": -21600, "abbreviation": "CST", "gmtOffsetName": "UTC-06:00"}, {"tzName": "Central Standard Time (North America", "zoneName": "America/Mexico_City", "gmtOffset": -21600, "abbreviation": "CST", "gmtOffsetName": "UTC-06:00"}, {"tzName": "Central Standard Time (North America", "zoneName": "America/Monterrey", "gmtOffset": -21600, "abbreviation": "CST", "gmtOffsetName": "UTC-06:00"}, {"tzName": "Mountain Standard Time (North America", "zoneName": "America/Ojinaga", "gmtOffset": -25200, "abbreviation": "MST", "gmtOffsetName": "UTC-07:00"}, {"tzName": "Pacific Standard Time (North America", "zoneName": "America/Tijuana", "gmtOffset": -28800, "abbreviation": "PST", "gmtOffsetName": "UTC-08:00"}]	.mx	{"de": "Mexiko", "es": "México", "fa": "مکزیک", "fr": "Mexique", "hr": "Meksiko", "it": "Messico", "ja": "メキシコ", "ko": "멕시코", "nl": "Mexico", "pl": "Meksyk", "pt": "México", "ru": "Мексика", "tr": "Meksika", "uk": "Мексика", "pt-BR": "México", "zh-CN": "墨西哥"}
143	Micronesia	f	Palikir	USD	United States dollar	$	🇫🇲	U+1F1EB U+1F1F2	\N	\N	FM	FSM	6.91666666	158.25	Micronesian	Micronesia	583	691	Oceania	5	Micronesia	21	[{"tzName": "Chuuk Time", "zoneName": "Pacific/Chuuk", "gmtOffset": 36000, "abbreviation": "CHUT", "gmtOffsetName": "UTC+10:00"}, {"tzName": "Kosrae Time", "zoneName": "Pacific/Kosrae", "gmtOffset": 39600, "abbreviation": "KOST", "gmtOffsetName": "UTC+11:00"}, {"tzName": "Pohnpei Standard Time", "zoneName": "Pacific/Pohnpei", "gmtOffset": 39600, "abbreviation": "PONT", "gmtOffsetName": "UTC+11:00"}]	.fm	{"de": "Mikronesien", "es": "Micronesia", "fa": "ایالات فدرال میکرونزی", "fr": "Micronésie", "hr": "Mikronezija", "it": "Micronesia", "ja": "ミクロネシア連邦", "ko": "미크로네시아 연방", "nl": "Micronesië", "pl": "Mikronezja", "pt": "Micronésia", "ru": "Микронезия", "tr": "Mikronezya", "uk": "Мікронезія", "pt-BR": "Micronésia", "zh-CN": "密克罗尼西亚"}
144	Moldova	f	Chisinau	MDL	Moldovan leu	L	🇲🇩	U+1F1F2 U+1F1E9	\N	\N	MD	MDA	47	29	Moldovan	Moldova	498	373	Europe	4	Eastern Europe	15	[{"tzName": "Eastern European Time", "zoneName": "Europe/Chisinau", "gmtOffset": 7200, "abbreviation": "EET", "gmtOffsetName": "UTC+02:00"}]	.md	{"de": "Moldawie", "es": "Moldavia", "fa": "مولداوی", "fr": "Moldavie", "hr": "Moldova", "it": "Moldavia", "ja": "モルドバ共和国", "ko": "몰도바", "nl": "Moldavië", "pl": "Mołdawia", "pt": "Moldávia", "ru": "Молдова", "tr": "Moldova", "uk": "Молдова", "pt-BR": "Moldávia", "zh-CN": "摩尔多瓦"}
145	Monaco	f	Monaco	EUR	Euro	€	🇲🇨	U+1F1F2 U+1F1E8	\N	\N	MC	MCO	43.73333333	7.4	Monegasque, Monacan	Monaco	492	377	Europe	4	Western Europe	17	[{"tzName": "Central European Time", "zoneName": "Europe/Monaco", "gmtOffset": 3600, "abbreviation": "CET", "gmtOffsetName": "UTC+01:00"}]	.mc	{"de": "Monaco", "es": "Mónaco", "fa": "موناکو", "fr": "Monaco", "hr": "Monako", "it": "Principato di Monaco", "ja": "モナコ", "ko": "모나코", "nl": "Monaco", "pl": "Monako", "pt": "Mónaco", "ru": "Монако", "tr": "Monako", "uk": "Монако", "pt-BR": "Mônaco", "zh-CN": "摩纳哥"}
146	Mongolia	f	Ulan Bator	MNT	Mongolian tögrög	₮	🇲🇳	U+1F1F2 U+1F1F3	\N	\N	MN	MNG	46	105	Mongolian	Монгол улс	496	976	Asia	3	Eastern Asia	12	[{"tzName": "Choibalsan Standard Time", "zoneName": "Asia/Choibalsan", "gmtOffset": 28800, "abbreviation": "CHOT", "gmtOffsetName": "UTC+08:00"}, {"tzName": "Hovd Time", "zoneName": "Asia/Hovd", "gmtOffset": 25200, "abbreviation": "HOVT", "gmtOffsetName": "UTC+07:00"}, {"tzName": "Ulaanbaatar Standard Time", "zoneName": "Asia/Ulaanbaatar", "gmtOffset": 28800, "abbreviation": "ULAT", "gmtOffsetName": "UTC+08:00"}]	.mn	{"de": "Mongolei", "es": "Mongolia", "fa": "مغولستان", "fr": "Mongolie", "hr": "Mongolija", "it": "Mongolia", "ja": "モンゴル", "ko": "몽골", "nl": "Mongolië", "pl": "Mongolia", "pt": "Mongólia", "ru": "Монголия", "tr": "Moğolistan", "uk": "Монголія", "pt-BR": "Mongólia", "zh-CN": "蒙古"}
147	Montenegro	f	Podgorica	EUR	Euro	€	🇲🇪	U+1F1F2 U+1F1EA	\N	\N	ME	MNE	42.5	19.3	Montenegrin	Црна Гора	499	382	Europe	4	Southern Europe	16	[{"tzName": "Central European Time", "zoneName": "Europe/Podgorica", "gmtOffset": 3600, "abbreviation": "CET", "gmtOffsetName": "UTC+01:00"}]	.me	{"de": "Montenegro", "es": "Montenegro", "fa": "مونته‌نگرو", "fr": "Monténégro", "hr": "Crna Gora", "it": "Montenegro", "ja": "モンテネグロ", "ko": "몬테네그로", "nl": "Montenegro", "pl": "Czarnogóra", "pt": "Montenegro", "ru": "Черногория", "tr": "Karadağ", "uk": "Чорногорія", "pt-BR": "Montenegro", "zh-CN": "黑山"}
148	Montserrat	f	Plymouth	XCD	Eastern Caribbean dollar	$	🇲🇸	U+1F1F2 U+1F1F8	\N	\N	MS	MSR	16.75	-62.2	Montserratian	Montserrat	500	1	Americas	2	Caribbean	7	[{"tzName": "Atlantic Standard Time", "zoneName": "America/Montserrat", "gmtOffset": -14400, "abbreviation": "AST", "gmtOffsetName": "UTC-04:00"}]	.ms	{"de": "Montserrat", "es": "Montserrat", "fa": "مایوت", "fr": "Montserrat", "hr": "Montserrat", "it": "Montserrat", "ja": "モントセラト", "ko": "몬트세랫", "nl": "Montserrat", "pl": "Montserrat", "pt": "Monserrate", "ru": "Монтсеррат", "tr": "Montserrat", "uk": "Монтсеррат", "pt-BR": "Montserrat", "zh-CN": "蒙特塞拉特"}
149	Morocco	f	Rabat	MAD	Moroccan dirham	DH	🇲🇦	U+1F1F2 U+1F1E6	\N	\N	MA	MAR	32	-5	Moroccan	المغرب	504	212	Africa	1	Northern Africa	1	[{"tzName": "Western European Summer Time", "zoneName": "Africa/Casablanca", "gmtOffset": 3600, "abbreviation": "WEST", "gmtOffsetName": "UTC+01:00"}]	.ma	{"de": "Marokko", "es": "Marruecos", "fa": "مراکش", "fr": "Maroc", "hr": "Maroko", "it": "Marocco", "ja": "モロッコ", "ko": "모로코", "nl": "Marokko", "pl": "Maroko", "pt": "Marrocos", "ru": "Марокко", "tr": "Fas", "uk": "Марокко", "pt-BR": "Marrocos", "zh-CN": "摩洛哥"}
150	Mozambique	f	Maputo	MZN	Mozambican metical	MT	🇲🇿	U+1F1F2 U+1F1FF	\N	\N	MZ	MOZ	-18.25	35	Mozambican	Moçambique	508	258	Africa	1	Eastern Africa	4	[{"tzName": "Central Africa Time", "zoneName": "Africa/Maputo", "gmtOffset": 7200, "abbreviation": "CAT", "gmtOffsetName": "UTC+02:00"}]	.mz	{"de": "Mosambik", "es": "Mozambique", "fa": "موزامبیک", "fr": "Mozambique", "hr": "Mozambik", "it": "Mozambico", "ja": "モザンビーク", "ko": "모잠비크", "nl": "Mozambique", "pl": "Mozambik", "pt": "Moçambique", "ru": "Мозамбик", "tr": "Mozambik", "uk": "Мозамбік", "pt-BR": "Moçambique", "zh-CN": "莫桑比克"}
151	Myanmar	f	Nay Pyi Taw	MMK	Burmese kyat	K	🇲🇲	U+1F1F2 U+1F1F2	\N	\N	MM	MMR	22	98	Burmese	မြန်မာ	104	95	Asia	3	South-Eastern Asia	13	[{"tzName": "Myanmar Standard Time", "zoneName": "Asia/Yangon", "gmtOffset": 23400, "abbreviation": "MMT", "gmtOffsetName": "UTC+06:30"}]	.mm	{"de": "Myanmar", "es": "Myanmar", "fa": "میانمار", "fr": "Myanmar", "hr": "Mijanmar", "it": "Birmania", "ja": "ミャンマー", "ko": "미얀마", "nl": "Myanmar", "pl": "Birma", "pt": "Myanmar", "ru": "Мьянма", "tr": "Myanmar", "uk": "М'янма", "pt-BR": "Myanmar", "zh-CN": "缅甸"}
152	Namibia	f	Windhoek	NAD	Namibian dollar	$	🇳🇦	U+1F1F3 U+1F1E6	\N	\N	NA	NAM	-22	17	Namibian	Namibia	516	264	Africa	1	Southern Africa	5	[{"tzName": "West Africa Summer Time", "zoneName": "Africa/Windhoek", "gmtOffset": 7200, "abbreviation": "WAST", "gmtOffsetName": "UTC+02:00"}]	.na	{"de": "Namibia", "es": "Namibia", "fa": "نامیبیا", "fr": "Namibie", "hr": "Namibija", "it": "Namibia", "ja": "ナミビア", "ko": "나미비아", "nl": "Namibië", "pl": "Namibia", "pt": "Namíbia", "ru": "Намибия", "tr": "Namibya", "uk": "Намібія", "pt-BR": "Namíbia", "zh-CN": "纳米比亚"}
153	Nauru	f	Yaren	AUD	Australian dollar	$	🇳🇷	U+1F1F3 U+1F1F7	\N	\N	NR	NRU	-0.53333333	166.91666666	Nauruan	Nauru	520	674	Oceania	5	Micronesia	21	[{"tzName": "Nauru Time", "zoneName": "Pacific/Nauru", "gmtOffset": 43200, "abbreviation": "NRT", "gmtOffsetName": "UTC+12:00"}]	.nr	{"de": "Nauru", "es": "Nauru", "fa": "نائورو", "fr": "Nauru", "hr": "Nauru", "it": "Nauru", "ja": "ナウル", "ko": "나우루", "nl": "Nauru", "pl": "Nauru", "pt": "Nauru", "ru": "Науру", "tr": "Nauru", "uk": "Науру", "pt-BR": "Nauru", "zh-CN": "瑙鲁"}
154	Nepal	f	Kathmandu	NPR	Nepalese rupee	₨	🇳🇵	U+1F1F3 U+1F1F5	\N	\N	NP	NPL	28	84	Nepali, Nepalese	नपल	524	977	Asia	3	Southern Asia	14	[{"tzName": "Nepal Time", "zoneName": "Asia/Kathmandu", "gmtOffset": 20700, "abbreviation": "NPT", "gmtOffsetName": "UTC+05:45"}]	.np	{"de": "Népal", "es": "Nepal", "fa": "نپال", "fr": "Népal", "hr": "Nepal", "it": "Nepal", "ja": "ネパール", "ko": "네팔", "nl": "Nepal", "pl": "Nepal", "pt": "Nepal", "ru": "Непал", "tr": "Nepal", "uk": "Непал", "pt-BR": "Nepal", "zh-CN": "尼泊尔"}
156	Netherlands	f	Amsterdam	EUR	Euro	€	🇳🇱	U+1F1F3 U+1F1F1	\N	\N	NL	NLD	52.5	5.75	Dutch, Netherlandic	Nederland	528	31	Europe	4	Western Europe	17	[{"tzName": "Central European Time", "zoneName": "Europe/Amsterdam", "gmtOffset": 3600, "abbreviation": "CET", "gmtOffsetName": "UTC+01:00"}]	.nl	{"de": "Niederlande", "es": "Países Bajos", "fa": "پادشاهی هلند", "fr": "Pays-Bas", "hr": "Nizozemska", "it": "Paesi Bassi", "ja": "オランダ", "ko": "네덜란드 ", "nl": "Nederland", "pl": "Holandia", "pt": "Países Baixos", "ru": "Нидерланды", "tr": "Hollanda", "uk": "Нідерланди", "pt-BR": "Holanda", "zh-CN": "荷兰"}
157	New Caledonia	f	Noumea	XPF	CFP franc	₣	🇳🇨	U+1F1F3 U+1F1E8	\N	\N	NC	NCL	-21.5	165.5	New Caledonian	Nouvelle-Calédonie	540	687	Oceania	5	Melanesia	20	[{"tzName": "New Caledonia Time", "zoneName": "Pacific/Noumea", "gmtOffset": 39600, "abbreviation": "NCT", "gmtOffsetName": "UTC+11:00"}]	.nc	{"de": "Neukaledonien", "es": "Nueva Caledonia", "fa": "کالدونیای جدید", "fr": "Nouvelle-Calédonie", "hr": "Nova Kaledonija", "it": "Nuova Caledonia", "ja": "ニューカレドニア", "ko": "누벨칼레도니", "nl": "Nieuw-Caledonië", "pl": "Nowa Kaledonia", "pt": "Nova Caledónia", "ru": "Новая Каледония", "tr": "Yeni Kaledonya", "uk": "Нова Каледонія", "pt-BR": "Nova Caledônia", "zh-CN": "新喀里多尼亚"}
158	New Zealand	f	Wellington	NZD	New Zealand dollar	$	🇳🇿	U+1F1F3 U+1F1FF	\N	\N	NZ	NZL	-41	174	New Zealand, NZ	New Zealand	554	64	Oceania	5	Australia and New Zealand	19	[{"tzName": "New Zealand Daylight Time", "zoneName": "Pacific/Auckland", "gmtOffset": 46800, "abbreviation": "NZDT", "gmtOffsetName": "UTC+13:00"}, {"tzName": "Chatham Standard Time", "zoneName": "Pacific/Chatham", "gmtOffset": 49500, "abbreviation": "CHAST", "gmtOffsetName": "UTC+13:45"}]	.nz	{"de": "Neuseeland", "es": "Nueva Zelanda", "fa": "نیوزیلند", "fr": "Nouvelle-Zélande", "hr": "Novi Zeland", "it": "Nuova Zelanda", "ja": "ニュージーランド", "ko": "뉴질랜드", "nl": "Nieuw-Zeeland", "pl": "Nowa Zelandia", "pt": "Nova Zelândia", "ru": "Новая Зеландия", "tr": "Yeni Zelanda", "uk": "Нова Зеландія", "pt-BR": "Nova Zelândia", "zh-CN": "新西兰"}
159	Nicaragua	f	Managua	NIO	Nicaraguan córdoba	C$	🇳🇮	U+1F1F3 U+1F1EE	\N	\N	NI	NIC	13	-85	Nicaraguan	Nicaragua	558	505	Americas	2	Central America	9	[{"tzName": "Central Standard Time (North America", "zoneName": "America/Managua", "gmtOffset": -21600, "abbreviation": "CST", "gmtOffsetName": "UTC-06:00"}]	.ni	{"de": "Nicaragua", "es": "Nicaragua", "fa": "نیکاراگوئه", "fr": "Nicaragua", "hr": "Nikaragva", "it": "Nicaragua", "ja": "ニカラグア", "ko": "니카라과", "nl": "Nicaragua", "pl": "Nikaragua", "pt": "Nicarágua", "ru": "Никарагуа", "tr": "Nikaragua", "uk": "Нікарагуа", "pt-BR": "Nicarágua", "zh-CN": "尼加拉瓜"}
160	Niger	f	Niamey	XOF	West African CFA franc	CFA	🇳🇪	U+1F1F3 U+1F1EA	\N	\N	NE	NER	16	8	Nigerien	Niger	562	227	Africa	1	Western Africa	3	[{"tzName": "West Africa Time", "zoneName": "Africa/Niamey", "gmtOffset": 3600, "abbreviation": "WAT", "gmtOffsetName": "UTC+01:00"}]	.ne	{"de": "Niger", "es": "Níger", "fa": "نیجر", "fr": "Niger", "hr": "Niger", "it": "Niger", "ja": "ニジェール", "ko": "니제르", "nl": "Niger", "pl": "Niger", "pt": "Níger", "ru": "Нигер", "tr": "Nijer", "uk": "Нігер", "pt-BR": "Níger", "zh-CN": "尼日尔"}
161	Nigeria	f	Abuja	NGN	Nigerian naira	₦	🇳🇬	U+1F1F3 U+1F1EC	\N	\N	NG	NGA	10	8	Nigerian	Nigeria	566	234	Africa	1	Western Africa	3	[{"tzName": "West Africa Time", "zoneName": "Africa/Lagos", "gmtOffset": 3600, "abbreviation": "WAT", "gmtOffsetName": "UTC+01:00"}]	.ng	{"de": "Nigeria", "es": "Nigeria", "fa": "نیجریه", "fr": "Nigéria", "hr": "Nigerija", "it": "Nigeria", "ja": "ナイジェリア", "ko": "나이지리아", "nl": "Nigeria", "pl": "Nigeria", "pt": "Nigéria", "ru": "Нигерия", "tr": "Nijerya", "uk": "Нігерія", "pt-BR": "Nigéria", "zh-CN": "尼日利亚"}
162	Niue	f	Alofi	NZD	New Zealand dollar	$	🇳🇺	U+1F1F3 U+1F1FA	\N	\N	NU	NIU	-19.03333333	-169.86666666	Niuean	Niuē	570	683	Oceania	5	Polynesia	22	[{"tzName": "Niue Time", "zoneName": "Pacific/Niue", "gmtOffset": -39600, "abbreviation": "NUT", "gmtOffsetName": "UTC-11:00"}]	.nu	{"de": "Niue", "es": "Niue", "fa": "نیووی", "fr": "Niue", "hr": "Niue", "it": "Niue", "ja": "ニウエ", "ko": "니우에", "nl": "Niue", "pl": "Niue", "pt": "Niue", "ru": "Ниуэ", "tr": "Niue", "uk": "Ніуе", "pt-BR": "Niue", "zh-CN": "纽埃"}
163	Norfolk Island	f	Kingston	AUD	Australian dollar	$	🇳🇫	U+1F1F3 U+1F1EB	\N	\N	NF	NFK	-29.03333333	167.95	Norfolk Island	Norfolk Island	574	672	Oceania	5	Australia and New Zealand	19	[{"tzName": "Norfolk Time", "zoneName": "Pacific/Norfolk", "gmtOffset": 43200, "abbreviation": "NFT", "gmtOffsetName": "UTC+12:00"}]	.nf	{"de": "Norfolkinsel", "es": "Isla de Norfolk", "fa": "جزیره نورفک", "fr": "Île de Norfolk", "hr": "Otok Norfolk", "it": "Isola Norfolk", "ja": "ノーフォーク島", "ko": "노퍽 섬", "nl": "Norfolkeiland", "pl": "Wyspa Norfolk", "pt": "Ilha Norfolk", "ru": "Остров Норфолк", "tr": "Norfolk Adasi", "uk": "Острів Норфолк", "pt-BR": "Ilha Norfolk", "zh-CN": "诺福克岛"}
115	North Korea	f	Pyongyang	KPW	North Korean Won	₩	🇰🇵	U+1F1F0 U+1F1F5	\N	\N	KP	PRK	40	127	North Korean	북한	408	850	Asia	3	Eastern Asia	12	[{"tzName": "Korea Standard Time", "zoneName": "Asia/Pyongyang", "gmtOffset": 32400, "abbreviation": "KST", "gmtOffsetName": "UTC+09:00"}]	.kp	{"de": "Nordkorea", "es": "Corea del Norte", "fa": "کره جنوبی", "fr": "Corée du Nord", "hr": "Sjeverna Koreja", "it": "Corea del Nord", "ja": "朝鮮民主主義人民共和国", "ko": "조선민주주의인민공화국", "nl": "Noord-Korea", "pl": "Korea Północna", "pt": "Coreia do Norte", "ru": "Северная Корея", "tr": "Kuzey Kore", "uk": "Північна Корея", "pt-BR": "Coreia do Norte", "zh-CN": "朝鲜"}
129	North Macedonia	f	Skopje	MKD	Denar	ден	🇲🇰	U+1F1F2 U+1F1F0	\N	\N	MK	MKD	41.83333333	22	Macedonian	Северна Македонија	807	389	Europe	4	Southern Europe	16	[{"tzName": "Central European Time", "zoneName": "Europe/Skopje", "gmtOffset": 3600, "abbreviation": "CET", "gmtOffsetName": "UTC+01:00"}]	.mk	{"de": "Nordmazedonien", "es": "Macedonia del Norte", "fa": "ﻢﻗﺩﻮﻨﯿﻫ ﺶﻣﺎﻠﯾ", "fr": "Macédoine du Nord", "hr": "Sjeverna Makedonija", "it": "Macedonia del Nord", "ja": "北マケドニア", "ko": "북마케도니아", "nl": "Noord-Macedonië", "pl": "Macedonia Północna", "pt": "Macedónia do Norte", "ru": "Северная Македония", "tr": "Kuzey Makedonya", "uk": "Північна Македонія", "pt-BR": "Macedônia do Norte", "zh-CN": "北馬其頓"}
164	Northern Mariana Islands	f	Saipan	USD	United States dollar	$	🇲🇵	U+1F1F2 U+1F1F5	\N	\N	MP	MNP	15.2	145.75	Northern Marianan	Northern Mariana Islands	580	1	Oceania	5	Micronesia	21	[{"tzName": "Chamorro Standard Time", "zoneName": "Pacific/Saipan", "gmtOffset": 36000, "abbreviation": "ChST", "gmtOffsetName": "UTC+10:00"}]	.mp	{"de": "Nördliche Marianen", "es": "Islas Marianas del Norte", "fa": "جزایر ماریانای شمالی", "fr": "Îles Mariannes du Nord", "hr": "Sjevernomarijanski otoci", "it": "Isole Marianne Settentrionali", "ja": "北マリアナ諸島", "ko": "북마리아나 제도", "nl": "Noordelijke Marianeneilanden", "pl": "Mariany Północne", "pt": "Ilhas Marianas", "ru": "Северные Марианские острова", "tr": "Kuzey Mariana Adalari", "uk": "Північні Маріанські острови", "pt-BR": "Ilhas Marianas", "zh-CN": "北马里亚纳群岛"}
165	Norway	f	Oslo	NOK	Norwegian krone	ko	🇳🇴	U+1F1F3 U+1F1F4	\N	\N	NO	NOR	62	10	Norwegian	Norge	578	47	Europe	4	Northern Europe	18	[{"tzName": "Central European Time", "zoneName": "Europe/Oslo", "gmtOffset": 3600, "abbreviation": "CET", "gmtOffsetName": "UTC+01:00"}]	.no	{"de": "Norwegen", "es": "Noruega", "fa": "نروژ", "fr": "Norvège", "hr": "Norveška", "it": "Norvegia", "ja": "ノルウェー", "ko": "노르웨이", "nl": "Noorwegen", "pl": "Norwegia", "pt": "Noruega", "ru": "Норвегия", "tr": "Norveç", "uk": "Норвегія", "pt-BR": "Noruega", "zh-CN": "挪威"}
166	Oman	f	Muscat	OMR	Omani rial	.ع.ر	🇴🇲	U+1F1F4 U+1F1F2	\N	\N	OM	OMN	21	57	Omani	عمان	512	968	Asia	3	Western Asia	11	[{"tzName": "Gulf Standard Time", "zoneName": "Asia/Muscat", "gmtOffset": 14400, "abbreviation": "GST", "gmtOffsetName": "UTC+04:00"}]	.om	{"de": "Oman", "es": "Omán", "fa": "عمان", "fr": "Oman", "hr": "Oman", "it": "oman", "ja": "オマーン", "ko": "오만", "nl": "Oman", "pl": "Oman", "pt": "Omã", "ru": "Оман", "tr": "Umman", "uk": "Оман", "pt-BR": "Omã", "zh-CN": "阿曼"}
167	Pakistan	f	Islamabad	PKR	Pakistani rupee	₨	🇵🇰	U+1F1F5 U+1F1F0	\N	\N	PK	PAK	30	70	Pakistani	Pakistan	586	92	Asia	3	Southern Asia	14	[{"tzName": "Pakistan Standard Time", "zoneName": "Asia/Karachi", "gmtOffset": 18000, "abbreviation": "PKT", "gmtOffsetName": "UTC+05:00"}]	.pk	{"de": "Pakistan", "es": "Pakistán", "fa": "پاکستان", "fr": "Pakistan", "hr": "Pakistan", "it": "Pakistan", "ja": "パキスタン", "ko": "파키스탄", "nl": "Pakistan", "pl": "Pakistan", "pt": "Paquistão", "ru": "Пакистан", "tr": "Pakistan", "uk": "Пакистан", "pt-BR": "Paquistão", "zh-CN": "巴基斯坦"}
168	Palau	f	Melekeok	USD	United States dollar	$	🇵🇼	U+1F1F5 U+1F1FC	\N	\N	PW	PLW	7.5	134.5	Palauan	Palau	585	680	Oceania	5	Micronesia	21	[{"tzName": "Palau Time", "zoneName": "Pacific/Palau", "gmtOffset": 32400, "abbreviation": "PWT", "gmtOffsetName": "UTC+09:00"}]	.pw	{"de": "Palau", "es": "Palau", "fa": "پالائو", "fr": "Palaos", "hr": "Palau", "it": "Palau", "ja": "パラオ", "ko": "팔라우", "nl": "Palau", "pl": "Palau", "pt": "Palau", "ru": "Палау", "tr": "Palau", "uk": "Палау", "pt-BR": "Palau", "zh-CN": "帕劳"}
169	Palestinian Territory Occupied	f	East Jerusalem	ILS	Israeli new shekel	₪	🇵🇸	U+1F1F5 U+1F1F8	\N	\N	PS	PSE	31.9	35.2	Palestinian	فلسطين	275	970	Asia	3	Western Asia	11	[{"tzName": "Eastern European Time", "zoneName": "Asia/Gaza", "gmtOffset": 7200, "abbreviation": "EET", "gmtOffsetName": "UTC+02:00"}, {"tzName": "Eastern European Time", "zoneName": "Asia/Hebron", "gmtOffset": 7200, "abbreviation": "EET", "gmtOffsetName": "UTC+02:00"}]	.ps	{"de": "Palästina", "es": "Palestina", "fa": "فلسطین", "fr": "Palestine", "hr": "Palestina", "it": "Palestina", "ja": "パレスチナ", "ko": "팔레스타인 영토", "nl": "Palestijnse gebieden", "pl": "Okupowane terytorium palestyńskie", "pt": "Palestina", "ru": "Оккупированная палестинская территория", "tr": "Filistin", "uk": "Окупована палестинська територія", "pt-BR": "Palestina", "zh-CN": "巴勒斯坦"}
170	Panama	f	Panama City	PAB	Panamanian balboa	B/.	🇵🇦	U+1F1F5 U+1F1E6	\N	\N	PA	PAN	9	-80	Panamanian	Panamá	591	507	Americas	2	Central America	9	[{"tzName": "Eastern Standard Time (North America", "zoneName": "America/Panama", "gmtOffset": -18000, "abbreviation": "EST", "gmtOffsetName": "UTC-05:00"}]	.pa	{"de": "Panama", "es": "Panamá", "fa": "پاناما", "fr": "Panama", "hr": "Panama", "it": "Panama", "ja": "パナマ", "ko": "파나마", "nl": "Panama", "pl": "Panama", "pt": "Panamá", "ru": "Панама", "tr": "Panama", "uk": "Панама", "pt-BR": "Panamá", "zh-CN": "巴拿马"}
171	Papua New Guinea	f	Port Moresby	PGK	Papua New Guinean kina	K	🇵🇬	U+1F1F5 U+1F1EC	\N	\N	PG	PNG	-6	147	Papua New Guinean, Papuan	Papua Niugini	598	675	Oceania	5	Melanesia	20	[{"tzName": "Bougainville Standard Time[6", "zoneName": "Pacific/Bougainville", "gmtOffset": 39600, "abbreviation": "BST", "gmtOffsetName": "UTC+11:00"}, {"tzName": "Papua New Guinea Time", "zoneName": "Pacific/Port_Moresby", "gmtOffset": 36000, "abbreviation": "PGT", "gmtOffsetName": "UTC+10:00"}]	.pg	{"de": "Papua-Neuguinea", "es": "Papúa Nueva Guinea", "fa": "پاپوآ گینه نو", "fr": "Papouasie-Nouvelle-Guinée", "hr": "Papua Nova Gvineja", "it": "Papua Nuova Guinea", "ja": "パプアニューギニア", "ko": "파푸아뉴기니", "nl": "Papoea-Nieuw-Guinea", "pl": "Papua-Nowa Gwinea", "pt": "Papua Nova Guiné", "ru": "Папуа - Новая Гвинея", "tr": "Papua Yeni Gine", "uk": "Папуа-Нова Гвінея", "pt-BR": "Papua Nova Guiné", "zh-CN": "巴布亚新几内亚"}
172	Paraguay	f	Asuncion	PYG	Paraguayan guarani	₲	🇵🇾	U+1F1F5 U+1F1FE	\N	\N	PY	PRY	-23	-58	Paraguayan	Paraguay	600	595	Americas	2	South America	8	[{"tzName": "Paraguay Summer Time", "zoneName": "America/Asuncion", "gmtOffset": -10800, "abbreviation": "PYST", "gmtOffsetName": "UTC-03:00"}]	.py	{"de": "Paraguay", "es": "Paraguay", "fa": "پاراگوئه", "fr": "Paraguay", "hr": "Paragvaj", "it": "Paraguay", "ja": "パラグアイ", "ko": "파라과이", "nl": "Paraguay", "pl": "Paragwaj", "pt": "Paraguai", "ru": "Парагвай", "tr": "Paraguay", "uk": "Парагвай", "pt-BR": "Paraguai", "zh-CN": "巴拉圭"}
173	Peru	f	Lima	PEN	Peruvian sol	S/.	🇵🇪	U+1F1F5 U+1F1EA	\N	\N	PE	PER	-10	-76	Peruvian	Perú	604	51	Americas	2	South America	8	[{"tzName": "Peru Time", "zoneName": "America/Lima", "gmtOffset": -18000, "abbreviation": "PET", "gmtOffsetName": "UTC-05:00"}]	.pe	{"de": "Peru", "es": "Perú", "fa": "پرو", "fr": "Pérou", "hr": "Peru", "it": "Perù", "ja": "ペルー", "ko": "페루", "nl": "Peru", "pl": "Peru", "pt": "Peru", "ru": "Перу", "tr": "Peru", "uk": "Перу", "pt-BR": "Peru", "zh-CN": "秘鲁"}
174	Philippines	f	Manila	PHP	Philippine peso	₱	🇵🇭	U+1F1F5 U+1F1ED	\N	\N	PH	PHL	13	122	Philippine, Filipino	Pilipinas	608	63	Asia	3	South-Eastern Asia	13	[{"tzName": "Philippine Time", "zoneName": "Asia/Manila", "gmtOffset": 28800, "abbreviation": "PHT", "gmtOffsetName": "UTC+08:00"}]	.ph	{"de": "Philippinen", "es": "Filipinas", "fa": "جزایر الندفیلیپین", "fr": "Philippines", "hr": "Filipini", "it": "Filippine", "ja": "フィリピン", "ko": "필리핀", "nl": "Filipijnen", "pl": "Filipiny", "pt": "Filipinas", "ru": "Филиппины", "tr": "Filipinler", "uk": "Філіппіни", "pt-BR": "Filipinas", "zh-CN": "菲律宾"}
175	Pitcairn Island	f	Adamstown	NZD	New Zealand dollar	$	🇵🇳	U+1F1F5 U+1F1F3	\N	\N	PN	PCN	-25.06666666	-130.1	Pitcairn Island	Pitcairn Islands	612	870	Oceania	5	Polynesia	22	[{"tzName": "Pacific Standard Time (North America", "zoneName": "Pacific/Pitcairn", "gmtOffset": -28800, "abbreviation": "PST", "gmtOffsetName": "UTC-08:00"}]	.pn	{"de": "Pitcairn", "es": "Islas Pitcairn", "fa": "پیتکرن", "fr": "Îles Pitcairn", "hr": "Pitcairnovo otočje", "it": "Isole Pitcairn", "ja": "ピトケアン", "ko": "핏케언 제도", "nl": "Pitcairneilanden", "pl": "Wyspa Pitcairn", "pt": "Ilhas Picárnia", "ru": "Остров Питкэрн", "tr": "Pitcairn Adalari", "uk": "Острів Піткерн", "pt-BR": "Ilhas Pitcairn", "zh-CN": "皮特凯恩群岛"}
176	Poland	f	Warsaw	PLN	Polish złoty	zł	🇵🇱	U+1F1F5 U+1F1F1	\N	\N	PL	POL	52	20	Polish	Polska	616	48	Europe	4	Eastern Europe	15	[{"tzName": "Central European Time", "zoneName": "Europe/Warsaw", "gmtOffset": 3600, "abbreviation": "CET", "gmtOffsetName": "UTC+01:00"}]	.pl	{"de": "Polen", "es": "Polonia", "fa": "لهستان", "fr": "Pologne", "hr": "Poljska", "it": "Polonia", "ja": "ポーランド", "ko": "폴란드", "nl": "Polen", "pl": "Polska", "pt": "Polónia", "ru": "Польша", "tr": "Polonya", "uk": "Польща", "pt-BR": "Polônia", "zh-CN": "波兰"}
177	Portugal	f	Lisbon	EUR	Euro	€	🇵🇹	U+1F1F5 U+1F1F9	\N	\N	PT	PRT	39.5	-8	Portuguese	Portugal	620	351	Europe	4	Southern Europe	16	[{"tzName": "Azores Standard Time", "zoneName": "Atlantic/Azores", "gmtOffset": -3600, "abbreviation": "AZOT", "gmtOffsetName": "UTC-01:00"}, {"tzName": "Western European Time", "zoneName": "Atlantic/Madeira", "gmtOffset": 0, "abbreviation": "WET", "gmtOffsetName": "UTC±00"}, {"tzName": "Western European Time", "zoneName": "Europe/Lisbon", "gmtOffset": 0, "abbreviation": "WET", "gmtOffsetName": "UTC±00"}]	.pt	{"de": "Portugal", "es": "Portugal", "fa": "پرتغال", "fr": "Portugal", "hr": "Portugal", "it": "Portogallo", "ja": "ポルトガル", "ko": "포르투갈", "nl": "Portugal", "pl": "Portugalia", "pt": "Portugal", "ru": "Португалия", "tr": "Portekiz", "uk": "Португалія", "pt-BR": "Portugal", "zh-CN": "葡萄牙"}
178	Puerto Rico	f	San Juan	USD	United States dollar	$	🇵🇷	U+1F1F5 U+1F1F7	\N	\N	PR	PRI	18.25	-66.5	Puerto Rican	Puerto Rico	630	1	Americas	2	Caribbean	7	[{"tzName": "Atlantic Standard Time", "zoneName": "America/Puerto_Rico", "gmtOffset": -14400, "abbreviation": "AST", "gmtOffsetName": "UTC-04:00"}]	.pr	{"de": "Puerto Rico", "es": "Puerto Rico", "fa": "پورتو ریکو", "fr": "Porto Rico", "hr": "Portoriko", "it": "Porto Rico", "ja": "プエルトリコ", "ko": "푸에르토리코", "nl": "Puerto Rico", "pl": "Portoryko", "pt": "Porto Rico", "ru": "Пуэрто-Рико", "tr": "Porto Riko", "uk": "Пуерто-Ріко", "pt-BR": "Porto Rico", "zh-CN": "波多黎各"}
179	Qatar	f	Doha	QAR	Qatari riyal	ق.ر	🇶🇦	U+1F1F6 U+1F1E6	\N	\N	QA	QAT	25.5	51.25	Qatari	قطر	634	974	Asia	3	Western Asia	11	[{"tzName": "Arabia Standard Time", "zoneName": "Asia/Qatar", "gmtOffset": 10800, "abbreviation": "AST", "gmtOffsetName": "UTC+03:00"}]	.qa	{"de": "Katar", "es": "Catar", "fa": "قطر", "fr": "Qatar", "hr": "Katar", "it": "Qatar", "ja": "カタール", "ko": "카타르", "nl": "Qatar", "pl": "Katar", "pt": "Catar", "ru": "Катар", "tr": "Katar", "uk": "Катар", "pt-BR": "Catar", "zh-CN": "卡塔尔"}
180	Reunion	f	Saint-Denis	EUR	Euro	€	🇷🇪	U+1F1F7 U+1F1EA	\N	\N	RE	REU	-21.15	55.5	Reunionese, Reunionnais	La Réunion	638	262	Africa	1	Eastern Africa	4	[{"tzName": "Réunion Time", "zoneName": "Indian/Reunion", "gmtOffset": 14400, "abbreviation": "RET", "gmtOffsetName": "UTC+04:00"}]	.re	{"de": "Réunion", "es": "Reunión", "fa": "رئونیون", "fr": "Réunion", "hr": "Réunion", "it": "Riunione", "ja": "レユニオン", "ko": "레위니옹", "nl": "Réunion", "pl": "Reunion", "pt": "Reunião", "ru": "Воссоединение", "tr": "Réunion", "uk": "Возз'єднання", "pt-BR": "Reunião", "zh-CN": "留尼汪岛"}
181	Romania	f	Bucharest	RON	Romanian leu	lei	🇷🇴	U+1F1F7 U+1F1F4	\N	\N	RO	ROU	46	25	Romanian	România	642	40	Europe	4	Eastern Europe	15	[{"tzName": "Eastern European Time", "zoneName": "Europe/Bucharest", "gmtOffset": 7200, "abbreviation": "EET", "gmtOffsetName": "UTC+02:00"}]	.ro	{"de": "Rumänien", "es": "Rumania", "fa": "رومانی", "fr": "Roumanie", "hr": "Rumunjska", "it": "Romania", "ja": "ルーマニア", "ko": "루마니아", "nl": "Roemenië", "pl": "Rumunia", "pt": "Roménia", "ru": "Румыния", "tr": "Romanya", "uk": "Румунія", "pt-BR": "Romênia", "zh-CN": "罗马尼亚"}
182	Russia	f	Moscow	RUB	Russian ruble	₽	🇷🇺	U+1F1F7 U+1F1FA	\N	\N	RU	RUS	60	100	Russian	Россия	643	7	Europe	4	Eastern Europe	15	[{"tzName": "Anadyr Time[4", "zoneName": "Asia/Anadyr", "gmtOffset": 43200, "abbreviation": "ANAT", "gmtOffsetName": "UTC+12:00"}, {"tzName": "Krasnoyarsk Time", "zoneName": "Asia/Barnaul", "gmtOffset": 25200, "abbreviation": "KRAT", "gmtOffsetName": "UTC+07:00"}, {"tzName": "Yakutsk Time", "zoneName": "Asia/Chita", "gmtOffset": 32400, "abbreviation": "YAKT", "gmtOffsetName": "UTC+09:00"}, {"tzName": "Irkutsk Time", "zoneName": "Asia/Irkutsk", "gmtOffset": 28800, "abbreviation": "IRKT", "gmtOffsetName": "UTC+08:00"}, {"tzName": "Kamchatka Time", "zoneName": "Asia/Kamchatka", "gmtOffset": 43200, "abbreviation": "PETT", "gmtOffsetName": "UTC+12:00"}, {"tzName": "Yakutsk Time", "zoneName": "Asia/Khandyga", "gmtOffset": 32400, "abbreviation": "YAKT", "gmtOffsetName": "UTC+09:00"}, {"tzName": "Krasnoyarsk Time", "zoneName": "Asia/Krasnoyarsk", "gmtOffset": 25200, "abbreviation": "KRAT", "gmtOffsetName": "UTC+07:00"}, {"tzName": "Magadan Time", "zoneName": "Asia/Magadan", "gmtOffset": 39600, "abbreviation": "MAGT", "gmtOffsetName": "UTC+11:00"}, {"tzName": "Krasnoyarsk Time", "zoneName": "Asia/Novokuznetsk", "gmtOffset": 25200, "abbreviation": "KRAT", "gmtOffsetName": "UTC+07:00"}, {"tzName": "Novosibirsk Time", "zoneName": "Asia/Novosibirsk", "gmtOffset": 25200, "abbreviation": "NOVT", "gmtOffsetName": "UTC+07:00"}, {"tzName": "Omsk Time", "zoneName": "Asia/Omsk", "gmtOffset": 21600, "abbreviation": "OMST", "gmtOffsetName": "UTC+06:00"}, {"tzName": "Sakhalin Island Time", "zoneName": "Asia/Sakhalin", "gmtOffset": 39600, "abbreviation": "SAKT", "gmtOffsetName": "UTC+11:00"}, {"tzName": "Srednekolymsk Time", "zoneName": "Asia/Srednekolymsk", "gmtOffset": 39600, "abbreviation": "SRET", "gmtOffsetName": "UTC+11:00"}, {"tzName": "Moscow Daylight Time+3", "zoneName": "Asia/Tomsk", "gmtOffset": 25200, "abbreviation": "MSD+3", "gmtOffsetName": "UTC+07:00"}, {"tzName": "Vladivostok Time", "zoneName": "Asia/Ust-Nera", "gmtOffset": 36000, "abbreviation": "VLAT", "gmtOffsetName": "UTC+10:00"}, {"tzName": "Vladivostok Time", "zoneName": "Asia/Vladivostok", "gmtOffset": 36000, "abbreviation": "VLAT", "gmtOffsetName": "UTC+10:00"}, {"tzName": "Yakutsk Time", "zoneName": "Asia/Yakutsk", "gmtOffset": 32400, "abbreviation": "YAKT", "gmtOffsetName": "UTC+09:00"}, {"tzName": "Yekaterinburg Time", "zoneName": "Asia/Yekaterinburg", "gmtOffset": 18000, "abbreviation": "YEKT", "gmtOffsetName": "UTC+05:00"}, {"tzName": "Samara Time", "zoneName": "Europe/Astrakhan", "gmtOffset": 14400, "abbreviation": "SAMT", "gmtOffsetName": "UTC+04:00"}, {"tzName": "Eastern European Time", "zoneName": "Europe/Kaliningrad", "gmtOffset": 7200, "abbreviation": "EET", "gmtOffsetName": "UTC+02:00"}, {"tzName": "Moscow Time", "zoneName": "Europe/Kirov", "gmtOffset": 10800, "abbreviation": "MSK", "gmtOffsetName": "UTC+03:00"}, {"tzName": "Moscow Time", "zoneName": "Europe/Moscow", "gmtOffset": 10800, "abbreviation": "MSK", "gmtOffsetName": "UTC+03:00"}, {"tzName": "Samara Time", "zoneName": "Europe/Samara", "gmtOffset": 14400, "abbreviation": "SAMT", "gmtOffsetName": "UTC+04:00"}, {"tzName": "Moscow Daylight Time+4", "zoneName": "Europe/Saratov", "gmtOffset": 14400, "abbreviation": "MSD", "gmtOffsetName": "UTC+04:00"}, {"tzName": "Samara Time", "zoneName": "Europe/Ulyanovsk", "gmtOffset": 14400, "abbreviation": "SAMT", "gmtOffsetName": "UTC+04:00"}, {"tzName": "Moscow Standard Time", "zoneName": "Europe/Volgograd", "gmtOffset": 14400, "abbreviation": "MSK", "gmtOffsetName": "UTC+04:00"}]	.ru	{"de": "Russland", "es": "Rusia", "fa": "روسیه", "fr": "Russie", "hr": "Rusija", "it": "Russia", "ja": "ロシア連邦", "ko": "러시아", "nl": "Rusland", "pl": "Rosja", "pt": "Rússia", "ru": "Россия", "tr": "Rusya", "uk": "Росія", "pt-BR": "Rússia", "zh-CN": "俄罗斯联邦"}
183	Rwanda	f	Kigali	RWF	Rwandan franc	FRw	🇷🇼	U+1F1F7 U+1F1FC	\N	\N	RW	RWA	-2	30	Rwandan	Rwanda	646	250	Africa	1	Eastern Africa	4	[{"tzName": "Central Africa Time", "zoneName": "Africa/Kigali", "gmtOffset": 7200, "abbreviation": "CAT", "gmtOffsetName": "UTC+02:00"}]	.rw	{"de": "Ruanda", "es": "Ruanda", "fa": "رواندا", "fr": "Rwanda", "hr": "Ruanda", "it": "Ruanda", "ja": "ルワンダ", "ko": "르완다", "nl": "Rwanda", "pl": "Rwanda", "pt": "Ruanda", "ru": "Руанда", "tr": "Ruanda", "uk": "Руанда", "pt-BR": "Ruanda", "zh-CN": "卢旺达"}
184	Saint Helena	f	Jamestown	SHP	Saint Helena pound	£	🇸🇭	U+1F1F8 U+1F1ED	\N	\N	SH	SHN	-15.95	-5.7	Saint Helenian	Saint Helena	654	290	Africa	1	Western Africa	3	[{"tzName": "Greenwich Mean Time", "zoneName": "Atlantic/St_Helena", "gmtOffset": 0, "abbreviation": "GMT", "gmtOffsetName": "UTC±00"}]	.sh	{"de": "Sankt Helena", "es": "Santa Helena", "fa": "سنت هلنا، اسنشن و تریستان دا کونا", "fr": "Sainte-Hélène", "hr": "Sveta Helena", "it": "Sant'Elena", "ja": "セントヘレナ・アセンションおよびトリスタンダクーニャ", "ko": "세인트헬레나", "nl": "Sint-Helena", "pl": "Święta Helena", "pt": "Santa Helena", "ru": "Святая Елена", "tr": "Saint Helena", "uk": "Свята Єлена", "pt-BR": "Santa Helena", "zh-CN": "圣赫勒拿"}
203	Somalia	f	Mogadishu	SOS	Somali shilling	Sh.so.	🇸🇴	U+1F1F8 U+1F1F4	\N	\N	SO	SOM	10	49	Somali, Somalian	Soomaaliya	706	252	Africa	1	Eastern Africa	4	[{"tzName": "East Africa Time", "zoneName": "Africa/Mogadishu", "gmtOffset": 10800, "abbreviation": "EAT", "gmtOffsetName": "UTC+03:00"}]	.so	{"de": "Somalia", "es": "Somalia", "fa": "سومالی", "fr": "Somalie", "hr": "Somalija", "it": "Somalia", "ja": "ソマリア", "ko": "소말리아", "nl": "Somalië", "pl": "Somalia", "pt": "Somália", "ru": "Сомали", "tr": "Somali", "uk": "Сомалі", "pt-BR": "Somália", "zh-CN": "索马里"}
185	Saint Kitts and Nevis	f	Basseterre	XCD	Eastern Caribbean dollar	$	🇰🇳	U+1F1F0 U+1F1F3	\N	\N	KN	KNA	17.33333333	-62.75	Kittitian or Nevisian	Saint Kitts and Nevis	659	1	Americas	2	Caribbean	7	[{"tzName": "Atlantic Standard Time", "zoneName": "America/St_Kitts", "gmtOffset": -14400, "abbreviation": "AST", "gmtOffsetName": "UTC-04:00"}]	.kn	{"de": "St. Kitts und Nevis", "es": "San Cristóbal y Nieves", "fa": "سنت کیتس و نویس", "fr": "Saint-Christophe-et-Niévès", "hr": "Sveti Kristof i Nevis", "it": "Saint Kitts e Nevis", "ja": "セントクリストファー・ネイビス", "ko": "세인트키츠 네비스", "nl": "Saint Kitts en Nevis", "pl": "Saint Kitts i Nevis", "pt": "São Cristóvão e Neves", "ru": "Сент-Китс и Невис", "tr": "Saint Kitts Ve Nevis", "uk": "Сент-Кітс і Невіс", "pt-BR": "São Cristóvão e Neves", "zh-CN": "圣基茨和尼维斯"}
186	Saint Lucia	f	Castries	XCD	Eastern Caribbean dollar	$	🇱🇨	U+1F1F1 U+1F1E8	\N	\N	LC	LCA	13.88333333	-60.96666666	Saint Lucian	Saint Lucia	662	1	Americas	2	Caribbean	7	[{"tzName": "Atlantic Standard Time", "zoneName": "America/St_Lucia", "gmtOffset": -14400, "abbreviation": "AST", "gmtOffsetName": "UTC-04:00"}]	.lc	{"de": "Saint Lucia", "es": "Santa Lucía", "fa": "سنت لوسیا", "fr": "Saint-Lucie", "hr": "Sveta Lucija", "it": "Santa Lucia", "ja": "セントルシア", "ko": "세인트루시아", "nl": "Saint Lucia", "pl": "Saint Lucia", "pt": "Santa Lúcia", "ru": "Сент-Люсия", "tr": "Saint Lucia", "uk": "Сент-Люсія", "pt-BR": "Santa Lúcia", "zh-CN": "圣卢西亚"}
187	Saint Pierre and Miquelon	f	Saint-Pierre	EUR	Euro	€	🇵🇲	U+1F1F5 U+1F1F2	\N	\N	PM	SPM	46.83333333	-56.33333333	Saint-Pierrais or Miquelonnais	Saint-Pierre-et-Miquelon	666	508	Americas	2	Northern America	6	[{"tzName": "Pierre & Miquelon Daylight Time", "zoneName": "America/Miquelon", "gmtOffset": -10800, "abbreviation": "PMDT", "gmtOffsetName": "UTC-03:00"}]	.pm	{"de": "Saint-Pierre und Miquelon", "es": "San Pedro y Miquelón", "fa": "سن پیر و میکلن", "fr": "Saint-Pierre-et-Miquelon", "hr": "Sveti Petar i Mikelon", "it": "Saint-Pierre e Miquelon", "ja": "サンピエール島・ミクロン島", "ko": "생피에르 미클롱", "nl": "Saint Pierre en Miquelon", "pl": "Saint-Pierre i Miquelon", "pt": "São Pedro e Miquelon", "ru": "Сен-Пьер и Микелон", "tr": "Saint Pierre Ve Miquelon", "uk": "Сен-П'єр і Мікелон", "pt-BR": "Saint-Pierre e Miquelon", "zh-CN": "圣皮埃尔和密克隆"}
188	Saint Vincent and the Grenadines	f	Kingstown	XCD	Eastern Caribbean dollar	$	🇻🇨	U+1F1FB U+1F1E8	\N	\N	VC	VCT	13.25	-61.2	Saint Vincentian, Vincentian	Saint Vincent and the Grenadines	670	1	Americas	2	Caribbean	7	[{"tzName": "Atlantic Standard Time", "zoneName": "America/St_Vincent", "gmtOffset": -14400, "abbreviation": "AST", "gmtOffsetName": "UTC-04:00"}]	.vc	{"de": "Saint Vincent und die Grenadinen", "es": "San Vicente y Granadinas", "fa": "سنت وینسنت و گرنادین‌ها", "fr": "Saint-Vincent-et-les-Grenadines", "hr": "Sveti Vincent i Grenadini", "it": "Saint Vincent e Grenadine", "ja": "セントビンセントおよびグレナディーン諸島", "ko": "세인트빈센트 그레나딘", "nl": "Saint Vincent en de Grenadines", "pl": "Saint Vincent i Grenadyny", "pt": "São Vicente e Granadinas", "ru": "Сент-Винсент и Гренадины", "tr": "Saint Vincent Ve Grenadinler", "uk": "Сент-Вінсент і Гренадини", "pt-BR": "São Vicente e Granadinas", "zh-CN": "圣文森特和格林纳丁斯"}
189	Saint-Barthelemy	f	Gustavia	EUR	Euro	€	🇧🇱	U+1F1E7 U+1F1F1	\N	\N	BL	BLM	18.5	-63.41666666	Barthelemois	Saint-Barthélemy	652	590	Americas	2	Caribbean	7	[{"tzName": "Atlantic Standard Time", "zoneName": "America/St_Barthelemy", "gmtOffset": -14400, "abbreviation": "AST", "gmtOffsetName": "UTC-04:00"}]	.bl	{"de": "Saint-Barthélemy", "es": "San Bartolomé", "fa": "سن-بارتلمی", "fr": "Saint-Barthélemy", "hr": "Saint Barthélemy", "it": "Antille Francesi", "ja": "サン・バルテルミー", "ko": "생바르텔레미", "nl": "Saint Barthélemy", "pl": "Saint-Barthelemy", "pt": "São Bartolomeu", "ru": "Сен-Бартелеми", "tr": "Saint Barthélemy", "uk": "Сен-Бартелемі", "pt-BR": "São Bartolomeu", "zh-CN": "圣巴泰勒米"}
190	Saint-Martin (French part)	f	Marigot	EUR	Euro	€	🇲🇫	U+1F1F2 U+1F1EB	\N	\N	MF	MAF	18.08333333	-63.95	Saint-Martinoise	Saint-Martin	663	590	Americas	2	Caribbean	7	[{"tzName": "Atlantic Standard Time", "zoneName": "America/Marigot", "gmtOffset": -14400, "abbreviation": "AST", "gmtOffsetName": "UTC-04:00"}]	.mf	{"de": "Saint Martin", "es": "Saint Martin", "fa": "سینت مارتن", "fr": "Saint-Martin", "hr": "Sveti Martin", "it": "Saint Martin", "ja": "サン・マルタン（フランス領）", "ko": "세인트마틴 섬", "nl": "Saint-Martin", "pl": "Saint-Martin (część francuska)", "pt": "Ilha São Martinho", "ru": "Сен-Мартен (французская часть)", "tr": "Saint Martin", "uk": "Сен-Мартен (французька частина)", "pt-BR": "Saint Martin", "zh-CN": "密克罗尼西亚"}
191	Samoa	f	Apia	WST	Samoan tālā	SAT	🇼🇸	U+1F1FC U+1F1F8	\N	\N	WS	WSM	-13.58333333	-172.33333333	Samoan	Samoa	882	685	Oceania	5	Polynesia	22	[{"tzName": "West Samoa Time", "zoneName": "Pacific/Apia", "gmtOffset": 50400, "abbreviation": "WST", "gmtOffsetName": "UTC+14:00"}]	.ws	{"de": "Samoa", "es": "Samoa", "fa": "ساموآ", "fr": "Samoa", "hr": "Samoa", "it": "Samoa", "ja": "サモア", "ko": "사모아", "nl": "Samoa", "pl": "Samoa", "pt": "Samoa", "ru": "Самоа", "tr": "Samoa", "uk": "Самоа", "pt-BR": "Samoa", "zh-CN": "萨摩亚"}
192	San Marino	f	San Marino	EUR	Euro	€	🇸🇲	U+1F1F8 U+1F1F2	\N	\N	SM	SMR	43.76666666	12.41666666	Sammarinese	San Marino	674	378	Europe	4	Southern Europe	16	[{"tzName": "Central European Time", "zoneName": "Europe/San_Marino", "gmtOffset": 3600, "abbreviation": "CET", "gmtOffsetName": "UTC+01:00"}]	.sm	{"de": "San Marino", "es": "San Marino", "fa": "سان مارینو", "fr": "Saint-Marin", "hr": "San Marino", "it": "San Marino", "ja": "サンマリノ", "ko": "산마리노", "nl": "San Marino", "pl": "San Marino", "pt": "São Marinho", "ru": "Сан-Марино", "tr": "San Marino", "uk": "Сан-Марино", "pt-BR": "San Marino", "zh-CN": "圣马力诺"}
193	Sao Tome and Principe	f	Sao Tome	STD	Dobra	Db	🇸🇹	U+1F1F8 U+1F1F9	\N	\N	ST	STP	1	7	Sao Tomean	São Tomé e Príncipe	678	239	Africa	1	Middle Africa	2	[{"tzName": "Greenwich Mean Time", "zoneName": "Africa/Sao_Tome", "gmtOffset": 0, "abbreviation": "GMT", "gmtOffsetName": "UTC±00"}]	.st	{"de": "São Tomé und Príncipe", "es": "Santo Tomé y Príncipe", "fa": "کواترو دو فرویرو", "fr": "Sao Tomé-et-Principe", "hr": "Sveti Toma i Princip", "it": "São Tomé e Príncipe", "ja": "サントメ・プリンシペ", "ko": "상투메 프린시페", "nl": "Sao Tomé en Principe", "pl": "Wyspy Świętego Tomasza i Książęca", "pt": "São Tomé e Príncipe", "ru": "Сан-Томе и Принсипи", "tr": "Sao Tome Ve Prinsipe", "uk": "Сан-Томе і Принсіпі", "pt-BR": "São Tomé e Príncipe", "zh-CN": "圣多美和普林西比"}
194	Saudi Arabia	f	Riyadh	SAR	Saudi riyal	﷼	🇸🇦	U+1F1F8 U+1F1E6	\N	\N	SA	SAU	25	45	Saudi, Saudi Arabian	المملكة العربية السعودية	682	966	Asia	3	Western Asia	11	[{"tzName": "Arabia Standard Time", "zoneName": "Asia/Riyadh", "gmtOffset": 10800, "abbreviation": "AST", "gmtOffsetName": "UTC+03:00"}]	.sa	{"de": "Saudi-Arabien", "es": "Arabia Saudí", "fa": "عربستان سعودی", "fr": "Arabie Saoudite", "hr": "Saudijska Arabija", "it": "Arabia Saudita", "ja": "サウジアラビア", "ko": "사우디아라비아", "nl": "Saoedi-Arabië", "pl": "Arabia Saudyjska", "pt": "Arábia Saudita", "ru": "Саудовская Аравия", "tr": "Suudi Arabistan", "uk": "Саудівська Аравія", "pt-BR": "Arábia Saudita", "zh-CN": "沙特阿拉伯"}
195	Senegal	f	Dakar	XOF	West African CFA franc	CFA	🇸🇳	U+1F1F8 U+1F1F3	\N	\N	SN	SEN	14	-14	Senegalese	Sénégal	686	221	Africa	1	Western Africa	3	[{"tzName": "Greenwich Mean Time", "zoneName": "Africa/Dakar", "gmtOffset": 0, "abbreviation": "GMT", "gmtOffsetName": "UTC±00"}]	.sn	{"de": "Senegal", "es": "Senegal", "fa": "سنگال", "fr": "Sénégal", "hr": "Senegal", "it": "Senegal", "ja": "セネガル", "ko": "세네갈", "nl": "Senegal", "pl": "Senegal", "pt": "Senegal", "ru": "Сенегал", "tr": "Senegal", "uk": "Сенегал", "pt-BR": "Senegal", "zh-CN": "塞内加尔"}
196	Serbia	f	Belgrade	RSD	Serbian dinar	din	🇷🇸	U+1F1F7 U+1F1F8	\N	\N	RS	SRB	44	21	Serbian	Србија	688	381	Europe	4	Southern Europe	16	[{"tzName": "Central European Time", "zoneName": "Europe/Belgrade", "gmtOffset": 3600, "abbreviation": "CET", "gmtOffsetName": "UTC+01:00"}]	.rs	{"de": "Serbien", "es": "Serbia", "fa": "صربستان", "fr": "Serbie", "hr": "Srbija", "it": "Serbia", "ja": "セルビア", "ko": "세르비아", "nl": "Servië", "pl": "Serbia", "pt": "Sérvia", "ru": "Сербия", "tr": "Sirbistan", "uk": "Сербія", "pt-BR": "Sérvia", "zh-CN": "塞尔维亚"}
197	Seychelles	f	Victoria	SCR	Seychellois rupee	SRe	🇸🇨	U+1F1F8 U+1F1E8	\N	\N	SC	SYC	-4.58333333	55.66666666	Seychellois	Seychelles	690	248	Africa	1	Eastern Africa	4	[{"tzName": "Seychelles Time", "zoneName": "Indian/Mahe", "gmtOffset": 14400, "abbreviation": "SCT", "gmtOffsetName": "UTC+04:00"}]	.sc	{"de": "Seychellen", "es": "Seychelles", "fa": "سیشل", "fr": "Seychelles", "hr": "Sejšeli", "it": "Seychelles", "ja": "セーシェル", "ko": "세이셸", "nl": "Seychellen", "pl": "Seszele", "pt": "Seicheles", "ru": "Сейшельские острова", "tr": "Seyşeller", "uk": "Сейшельські острови", "pt-BR": "Seicheles", "zh-CN": "塞舌尔"}
198	Sierra Leone	f	Freetown	SLL	Sierra Leonean leone	Le	🇸🇱	U+1F1F8 U+1F1F1	\N	\N	SL	SLE	8.5	-11.5	Sierra Leonean	Sierra Leone	694	232	Africa	1	Western Africa	3	[{"tzName": "Greenwich Mean Time", "zoneName": "Africa/Freetown", "gmtOffset": 0, "abbreviation": "GMT", "gmtOffsetName": "UTC±00"}]	.sl	{"de": "Sierra Leone", "es": "Sierra Leone", "fa": "سیرالئون", "fr": "Sierra Leone", "hr": "Sijera Leone", "it": "Sierra Leone", "ja": "シエラレオネ", "ko": "시에라리온", "nl": "Sierra Leone", "pl": "Sierra Leone", "pt": "Serra Leoa", "ru": "Сьерра-Леоне", "tr": "Sierra Leone", "uk": "Сьєрра-Леоне", "pt-BR": "Serra Leoa", "zh-CN": "塞拉利昂"}
199	Singapore	f	Singapur	SGD	Singapore dollar	$	🇸🇬	U+1F1F8 U+1F1EC	\N	\N	SG	SGP	1.36666666	103.8	Singaporean	Singapore	702	65	Asia	3	South-Eastern Asia	13	[{"tzName": "Singapore Time", "zoneName": "Asia/Singapore", "gmtOffset": 28800, "abbreviation": "SGT", "gmtOffsetName": "UTC+08:00"}]	.sg	{"de": "Singapur", "es": "Singapur", "fa": "سنگاپور", "fr": "Singapour", "hr": "Singapur", "it": "Singapore", "ja": "シンガポール", "ko": "싱가포르", "nl": "Singapore", "pl": "Singapur", "pt": "Singapura", "ru": "Сингапур", "tr": "Singapur", "uk": "Сінгапур", "pt-BR": "Singapura", "zh-CN": "新加坡"}
250	Sint Maarten (Dutch part)	f	Philipsburg	ANG	Netherlands Antillean guilder	ƒ	🇸🇽	U+1F1F8 U+1F1FD	\N	\N	SX	SXM	18.033333	-63.05	Sint Maarten	Sint Maarten	534	1721	Americas	2	Caribbean	7	[{"tzName": "Atlantic Standard Time", "zoneName": "America/Anguilla", "gmtOffset": -14400, "abbreviation": "AST", "gmtOffsetName": "UTC-04:00"}]	.sx	{"de": "Sint Maarten (niederl. Teil)", "fa": "سینت مارتن", "fr": "Saint Martin (partie néerlandaise)", "it": "Saint Martin (parte olandese)", "ko": "신트마르턴", "nl": "Sint Maarten", "pl": "Sint Maarten (część niderlandzka)", "pt": "São Martinho", "ru": "Синт-Мартен (голландская часть)", "tr": "Sint Maarten", "uk": "Сінт-Мартен (голландська частина)", "pt-BR": "Sint Maarten", "zh-CN": "圣马丁岛（荷兰部分）"}
200	Slovakia	f	Bratislava	EUR	Euro	€	🇸🇰	U+1F1F8 U+1F1F0	\N	\N	SK	SVK	48.66666666	19.5	Slovak	Slovensko	703	421	Europe	4	Eastern Europe	15	[{"tzName": "Central European Time", "zoneName": "Europe/Bratislava", "gmtOffset": 3600, "abbreviation": "CET", "gmtOffsetName": "UTC+01:00"}]	.sk	{"de": "Slowakei", "es": "República Eslovaca", "fa": "اسلواکی", "fr": "Slovaquie", "hr": "Slovačka", "it": "Slovacchia", "ja": "スロバキア", "ko": "슬로바키아", "nl": "Slowakije", "pl": "Słowacja", "pt": "Eslováquia", "ru": "Словакия", "tr": "Slovakya", "uk": "Словаччина", "pt-BR": "Eslováquia", "zh-CN": "斯洛伐克"}
201	Slovenia	f	Ljubljana	EUR	Euro	€	🇸🇮	U+1F1F8 U+1F1EE	\N	\N	SI	SVN	46.11666666	14.81666666	Slovenian, Slovene	Slovenija	705	386	Europe	4	Southern Europe	16	[{"tzName": "Central European Time", "zoneName": "Europe/Ljubljana", "gmtOffset": 3600, "abbreviation": "CET", "gmtOffsetName": "UTC+01:00"}]	.si	{"de": "Slowenien", "es": "Eslovenia", "fa": "اسلوونی", "fr": "Slovénie", "hr": "Slovenija", "it": "Slovenia", "ja": "スロベニア", "ko": "슬로베니아", "nl": "Slovenië", "pl": "Słowenia", "pt": "Eslovénia", "ru": "Словения", "tr": "Slovenya", "uk": "Словенія", "pt-BR": "Eslovênia", "zh-CN": "斯洛文尼亚"}
202	Solomon Islands	f	Honiara	SBD	Solomon Islands dollar	Si$	🇸🇧	U+1F1F8 U+1F1E7	\N	\N	SB	SLB	-8	159	Solomon Island	Solomon Islands	090	677	Oceania	5	Melanesia	20	[{"tzName": "Solomon Islands Time", "zoneName": "Pacific/Guadalcanal", "gmtOffset": 39600, "abbreviation": "SBT", "gmtOffsetName": "UTC+11:00"}]	.sb	{"de": "Salomonen", "es": "Islas Salomón", "fa": "جزایر سلیمان", "fr": "Îles Salomon", "hr": "Solomonski Otoci", "it": "Isole Salomone", "ja": "ソロモン諸島", "ko": "솔로몬 제도", "nl": "Salomonseilanden", "pl": "Wyspy Salomona", "pt": "Ilhas Salomão", "ru": "Соломоновы острова", "tr": "Solomon Adalari", "uk": "Соломонові острови", "pt-BR": "Ilhas Salomão", "zh-CN": "所罗门群岛"}
204	South Africa	f	Pretoria	ZAR	South African rand	R	🇿🇦	U+1F1FF U+1F1E6	\N	\N	ZA	ZAF	-29	24	South African	South Africa	710	27	Africa	1	Southern Africa	5	[{"tzName": "South African Standard Time", "zoneName": "Africa/Johannesburg", "gmtOffset": 7200, "abbreviation": "SAST", "gmtOffsetName": "UTC+02:00"}]	.za	{"de": "Republik Südafrika", "es": "República de Sudáfrica", "fa": "آفریقای جنوبی", "fr": "Afrique du Sud", "hr": "Južnoafrička Republika", "it": "Sud Africa", "ja": "南アフリカ", "ko": "남아프리카 공화국", "nl": "Zuid-Afrika", "pl": "Republika Południowej Afryki", "pt": "República Sul-Africana", "ru": "Южная Африка", "tr": "Güney Afrika Cumhuriyeti", "uk": "Південна Африка", "pt-BR": "República Sul-Africana", "zh-CN": "南非"}
205	South Georgia	f	Grytviken	GBP	British pound	£	🇬🇸	U+1F1EC U+1F1F8	\N	\N	GS	SGS	-54.5	-37	South Georgia or South Sandwich Islands	South Georgia	239	500	Americas	2	South America	8	[{"tzName": "South Georgia and the South Sandwich Islands Time", "zoneName": "Atlantic/South_Georgia", "gmtOffset": -7200, "abbreviation": "GST", "gmtOffsetName": "UTC-02:00"}]	.gs	{"de": "Südgeorgien und die Südlichen Sandwichinseln", "es": "Islas Georgias del Sur y Sandwich del Sur", "fa": "جزایر جورجیای جنوبی و ساندویچ جنوبی", "fr": "Géorgie du Sud-et-les Îles Sandwich du Sud", "hr": "Južna Georgija i otočje Južni Sandwich", "it": "Georgia del Sud e Isole Sandwich Meridionali", "ja": "サウスジョージア・サウスサンドウィッチ諸島", "ko": "사우스조지아", "nl": "Zuid-Georgia en Zuidelijke Sandwicheilanden", "pl": "Południowa Georgia", "pt": "Ilhas Geórgia do Sul e Sanduíche do Sul", "ru": "Южная Джорджия", "tr": "Güney Georgia", "uk": "Південна Джорджія", "pt-BR": "Ilhas Geórgias do Sul e Sandwich do Sul", "zh-CN": "南乔治亚"}
116	South Korea	f	Seoul	KRW	Won	₩	🇰🇷	U+1F1F0 U+1F1F7	\N	\N	KR	KOR	37	127.5	South Korean	대한민국	410	82	Asia	3	Eastern Asia	12	[{"tzName": "Korea Standard Time", "zoneName": "Asia/Seoul", "gmtOffset": 32400, "abbreviation": "KST", "gmtOffsetName": "UTC+09:00"}]	.kr	{"de": "Südkorea", "es": "Corea del Sur", "fa": "کره شمالی", "fr": "Corée du Sud", "hr": "Južna Koreja", "it": "Corea del Sud", "ja": "大韓民国", "ko": "대한민국", "nl": "Zuid-Korea", "pl": "Korea Południowa", "pt": "Coreia do Sul", "ru": "Южная Корея", "tr": "Güney Kore", "uk": "Південна Корея", "pt-BR": "Coreia do Sul", "zh-CN": "韩国"}
206	South Sudan	f	Juba	SSP	South Sudanese pound	£	🇸🇸	U+1F1F8 U+1F1F8	\N	\N	SS	SSD	7	30	South Sudanese	South Sudan	728	211	Africa	1	Middle Africa	2	[{"tzName": "East Africa Time", "zoneName": "Africa/Juba", "gmtOffset": 10800, "abbreviation": "EAT", "gmtOffsetName": "UTC+03:00"}]	.ss	{"de": "Südsudan", "es": "Sudán del Sur", "fa": "سودان جنوبی", "fr": "Soudan du Sud", "hr": "Južni Sudan", "it": "Sudan del sud", "ja": "南スーダン", "ko": "남수단", "nl": "Zuid-Soedan", "pl": "Sudan Południowy", "pt": "Sudão do Sul", "ru": "Южный Судан", "tr": "Güney Sudan", "uk": "Південний Судан", "pt-BR": "Sudão do Sul", "zh-CN": "南苏丹"}
207	Spain	f	Madrid	EUR	Euro	€	🇪🇸	U+1F1EA U+1F1F8	\N	\N	ES	ESP	40	-4	Spanish	España	724	34	Europe	4	Southern Europe	16	[{"tzName": "Central European Time", "zoneName": "Africa/Ceuta", "gmtOffset": 3600, "abbreviation": "CET", "gmtOffsetName": "UTC+01:00"}, {"tzName": "Western European Time", "zoneName": "Atlantic/Canary", "gmtOffset": 0, "abbreviation": "WET", "gmtOffsetName": "UTC±00"}, {"tzName": "Central European Time", "zoneName": "Europe/Madrid", "gmtOffset": 3600, "abbreviation": "CET", "gmtOffsetName": "UTC+01:00"}]	.es	{"de": "Spanien", "es": "España", "fa": "اسپانیا", "fr": "Espagne", "hr": "Španjolska", "it": "Spagna", "ja": "スペイン", "ko": "스페인", "nl": "Spanje", "pl": "Hiszpania", "pt": "Espanha", "ru": "Испания", "tr": "İspanya", "uk": "Іспанія", "pt-BR": "Espanha", "zh-CN": "西班牙"}
208	Sri Lanka	f	Colombo	LKR	Sri Lankan rupee	Rs	🇱🇰	U+1F1F1 U+1F1F0	\N	\N	LK	LKA	7	81	Sri Lankan	śrī laṃkāva	144	94	Asia	3	Southern Asia	14	[{"tzName": "Indian Standard Time", "zoneName": "Asia/Colombo", "gmtOffset": 19800, "abbreviation": "IST", "gmtOffsetName": "UTC+05:30"}]	.lk	{"de": "Sri Lanka", "es": "Sri Lanka", "fa": "سری‌لانکا", "fr": "Sri Lanka", "hr": "Šri Lanka", "it": "Sri Lanka", "ja": "スリランカ", "ko": "스리랑카", "nl": "Sri Lanka", "pl": "Sri Lanka", "pt": "Sri Lanka", "ru": "Шри-Ланка", "tr": "Sri Lanka", "uk": "Шрі-Ланка", "pt-BR": "Sri Lanka", "zh-CN": "斯里兰卡"}
209	Sudan	f	Khartoum	SDG	Sudanese pound	.س.ج	🇸🇩	U+1F1F8 U+1F1E9	\N	\N	SD	SDN	15	30	Sudanese	السودان	729	249	Africa	1	Northern Africa	1	[{"tzName": "Eastern African Time", "zoneName": "Africa/Khartoum", "gmtOffset": 7200, "abbreviation": "EAT", "gmtOffsetName": "UTC+02:00"}]	.sd	{"de": "Sudan", "es": "Sudán", "fa": "سودان", "fr": "Soudan", "hr": "Sudan", "it": "Sudan", "ja": "スーダン", "ko": "수단", "nl": "Soedan", "pl": "Sudan", "pt": "Sudão", "ru": "Судан", "tr": "Sudan", "uk": "Судан", "pt-BR": "Sudão", "zh-CN": "苏丹"}
210	Suriname	f	Paramaribo	SRD	Surinamese dollar	$	🇸🇷	U+1F1F8 U+1F1F7	\N	\N	SR	SUR	4	-56	Surinamese	Suriname	740	597	Americas	2	South America	8	[{"tzName": "Suriname Time", "zoneName": "America/Paramaribo", "gmtOffset": -10800, "abbreviation": "SRT", "gmtOffsetName": "UTC-03:00"}]	.sr	{"de": "Suriname", "es": "Surinam", "fa": "سورینام", "fr": "Surinam", "hr": "Surinam", "it": "Suriname", "ja": "スリナム", "ko": "수리남", "nl": "Suriname", "pl": "Surinam", "pt": "Suriname", "ru": "Суринам", "tr": "Surinam", "uk": "Суринам", "pt-BR": "Suriname", "zh-CN": "苏里南"}
211	Svalbard and Jan Mayen Islands	f	Longyearbyen	NOK	Norwegian Krone	ko	🇸🇯	U+1F1F8 U+1F1EF	\N	\N	SJ	SJM	78	20	Svalbard	Svalbard og Jan Mayen	744	47	Europe	4	Northern Europe	18	[{"tzName": "Central European Time", "zoneName": "Arctic/Longyearbyen", "gmtOffset": 3600, "abbreviation": "CET", "gmtOffsetName": "UTC+01:00"}]	.sj	{"de": "Svalbard und Jan Mayen", "es": "Islas Svalbard y Jan Mayen", "fa": "سوالبارد و یان ماین", "fr": "Svalbard et Jan Mayen", "hr": "Svalbard i Jan Mayen", "it": "Svalbard e Jan Mayen", "ja": "スヴァールバル諸島およびヤンマイエン島", "ko": "스발바르 얀마옌 제도", "nl": "Svalbard en Jan Mayen", "pl": "Wyspy Svalbard i Jan Mayen", "pt": "Svalbard", "ru": "Шпицберген и острова Ян-Майен", "tr": "Svalbard Ve Jan Mayen", "uk": "Шпіцберген та острови Ян-Майєн", "pt-BR": "Svalbard", "zh-CN": "斯瓦尔巴和扬马延群岛"}
213	Sweden	f	Stockholm	SEK	Swedish krona	ko	🇸🇪	U+1F1F8 U+1F1EA	\N	\N	SE	SWE	62	15	Swedish	Sverige	752	46	Europe	4	Northern Europe	18	[{"tzName": "Central European Time", "zoneName": "Europe/Stockholm", "gmtOffset": 3600, "abbreviation": "CET", "gmtOffsetName": "UTC+01:00"}]	.se	{"de": "Schweden", "es": "Suecia", "fa": "سوئد", "fr": "Suède", "hr": "Švedska", "it": "Svezia", "ja": "スウェーデン", "ko": "스웨덴", "nl": "Zweden", "pl": "Szwecja", "pt": "Suécia", "ru": "Швеция", "tr": "İsveç", "uk": "Швеція", "pt-BR": "Suécia", "zh-CN": "瑞典"}
214	Switzerland	f	Bern	CHF	Swiss franc	CHf	🇨🇭	U+1F1E8 U+1F1ED	\N	\N	CH	CHE	47	8	Swiss	Schweiz	756	41	Europe	4	Western Europe	17	[{"tzName": "Central European Time", "zoneName": "Europe/Zurich", "gmtOffset": 3600, "abbreviation": "CET", "gmtOffsetName": "UTC+01:00"}]	.ch	{"de": "Schweiz", "es": "Suiza", "fa": "سوئیس", "fr": "Suisse", "hr": "Švicarska", "it": "Svizzera", "ja": "スイス", "ko": "스위스", "nl": "Zwitserland", "pl": "Szwajcaria", "pt": "Suíça", "ru": "Швейцария", "tr": "İsviçre", "uk": "Швейцарія", "pt-BR": "Suíça", "zh-CN": "瑞士"}
215	Syria	f	Damascus	SYP	Syrian pound	LS	🇸🇾	U+1F1F8 U+1F1FE	\N	\N	SY	SYR	35	38	Syrian	سوريا	760	963	Asia	3	Western Asia	11	[{"tzName": "Eastern European Time", "zoneName": "Asia/Damascus", "gmtOffset": 7200, "abbreviation": "EET", "gmtOffsetName": "UTC+02:00"}]	.sy	{"de": "Syrien", "es": "Siria", "fa": "سوریه", "fr": "Syrie", "hr": "Sirija", "it": "Siria", "ja": "シリア・アラブ共和国", "ko": "시리아", "nl": "Syrië", "pl": "Syria", "pt": "Síria", "ru": "Сирия", "tr": "Suriye", "uk": "Сирія", "pt-BR": "Síria", "zh-CN": "叙利亚"}
216	Taiwan	f	Taipei	TWD	New Taiwan dollar	$	🇹🇼	U+1F1F9 U+1F1FC	\N	\N	TW	TWN	23.5	121	Chinese, Taiwanese	臺灣	158	886	Asia	3	Eastern Asia	12	[{"tzName": "China Standard Time", "zoneName": "Asia/Taipei", "gmtOffset": 28800, "abbreviation": "CST", "gmtOffsetName": "UTC+08:00"}]	.tw	{"de": "Taiwan", "es": "Taiwán", "fa": "تایوان", "fr": "Taïwan", "hr": "Tajvan", "it": "Taiwan", "ja": "台湾（中華民国）", "ko": "대만", "nl": "Taiwan", "pl": "Tajwan", "pt": "Taiwan", "ru": "Тайвань", "tr": "Tayvan", "uk": "Тайвань", "pt-BR": "Taiwan", "zh-CN": "中国台湾"}
217	Tajikistan	f	Dushanbe	TJS	Tajikistani somoni	SM	🇹🇯	U+1F1F9 U+1F1EF	\N	\N	TJ	TJK	39	71	Tajikistani	Тоҷикистон	762	992	Asia	3	Central Asia	10	[{"tzName": "Tajikistan Time", "zoneName": "Asia/Dushanbe", "gmtOffset": 18000, "abbreviation": "TJT", "gmtOffsetName": "UTC+05:00"}]	.tj	{"de": "Tadschikistan", "es": "Tayikistán", "fa": "تاجیکستان", "fr": "Tadjikistan", "hr": "Tađikistan", "it": "Tagikistan", "ja": "タジキスタン", "ko": "타지키스탄", "nl": "Tadzjikistan", "pl": "Tadżykistan", "pt": "Tajiquistão", "ru": "Таджикистан", "tr": "Tacikistan", "uk": "Таджикистан", "pt-BR": "Tajiquistão", "zh-CN": "塔吉克斯坦"}
218	Tanzania	f	Dodoma	TZS	Tanzanian shilling	TSh	🇹🇿	U+1F1F9 U+1F1FF	\N	\N	TZ	TZA	-6	35	Tanzanian	Tanzania	834	255	Africa	1	Eastern Africa	4	[{"tzName": "East Africa Time", "zoneName": "Africa/Dar_es_Salaam", "gmtOffset": 10800, "abbreviation": "EAT", "gmtOffsetName": "UTC+03:00"}]	.tz	{"de": "Tansania", "es": "Tanzania", "fa": "تانزانیا", "fr": "Tanzanie", "hr": "Tanzanija", "it": "Tanzania", "ja": "タンザニア", "ko": "탄자니아", "nl": "Tanzania", "pl": "Tanzania", "pt": "Tanzânia", "ru": "Танзания", "tr": "Tanzanya", "uk": "Танзанія", "pt-BR": "Tanzânia", "zh-CN": "坦桑尼亚"}
219	Thailand	f	Bangkok	THB	Thai baht	฿	🇹🇭	U+1F1F9 U+1F1ED	\N	\N	TH	THA	15	100	Thai	ประเทศไทย	764	66	Asia	3	South-Eastern Asia	13	[{"tzName": "Indochina Time", "zoneName": "Asia/Bangkok", "gmtOffset": 25200, "abbreviation": "ICT", "gmtOffsetName": "UTC+07:00"}]	.th	{"de": "Thailand", "es": "Tailandia", "fa": "تایلند", "fr": "Thaïlande", "hr": "Tajland", "it": "Tailandia", "ja": "タイ", "ko": "태국", "nl": "Thailand", "pl": "Tajlandia", "pt": "Tailândia", "ru": "Таиланд", "tr": "Tayland", "uk": "Таїланд", "pt-BR": "Tailândia", "zh-CN": "泰国"}
17	The Bahamas	f	Nassau	BSD	Bahamian dollar	B$	🇧🇸	U+1F1E7 U+1F1F8	\N	\N	BS	BHS	24.25	-76	Bahamian	Bahamas	044	1	Americas	2	Caribbean	7	[{"tzName": "Eastern Standard Time (North America)", "zoneName": "America/Nassau", "gmtOffset": -18000, "abbreviation": "EST", "gmtOffsetName": "UTC-05:00"}]	.bs	{"de": "Bahamas", "es": "Bahamas", "fa": "باهاما", "fr": "Bahamas", "hr": "Bahami", "it": "Bahamas", "ja": "バハマ", "ko": "바하마", "nl": "Bahama’s", "pl": "Bahamy", "pt": "Baamas", "ru": "Багамы", "tr": "Bahamalar", "uk": "Багамські острови", "pt-BR": "Bahamas", "zh-CN": "巴哈马"}
80	The Gambia 	f	Banjul	GMD	Gambian dalasi	D	🇬🇲	U+1F1EC U+1F1F2	\N	\N	GM	GMB	13.46666666	-16.56666666	Gambian	Gambia	270	220	Africa	1	Western Africa	3	[{"tzName": "Greenwich Mean Time", "zoneName": "Africa/Banjul", "gmtOffset": 0, "abbreviation": "GMT", "gmtOffsetName": "UTC±00"}]	.gm	{"de": "Gambia", "es": "Gambia", "fa": "گامبیا", "fr": "Gambie", "hr": "Gambija", "it": "Gambia", "ja": "ガンビア", "ko": "감비아", "nl": "Gambia", "pl": "Gambia The", "pt": "Gâmbia", "ru": "Гамбия", "tr": "Gambiya", "uk": "Гамбія The", "pt-BR": "Gâmbia", "zh-CN": "冈比亚"}
63	Timor-Leste	f	Dili	USD	United States dollar	$	🇹🇱	U+1F1F9 U+1F1F1	\N	\N	TL	TLS	-8.83333333	125.91666666	Timorese	Timor-Leste	626	670	Asia	3	South-Eastern Asia	13	[{"tzName": "Timor Leste Time", "zoneName": "Asia/Dili", "gmtOffset": 32400, "abbreviation": "TLT", "gmtOffsetName": "UTC+09:00"}]	.tl	{"de": "Timor-Leste", "es": "Timor Oriental", "fa": "تیمور شرقی", "fr": "Timor oriental", "hr": "Istočni Timor", "it": "Timor Est", "ja": "東ティモール", "ko": "동티모르", "nl": "Oost-Timor", "pl": "Timor Wschodni", "pt": "Timor Leste", "ru": "Тимор-Лешти", "tr": "Doğu Timor", "uk": "Тимор-Лешті", "pt-BR": "Timor Leste", "zh-CN": "东帝汶"}
220	Togo	f	Lome	XOF	West African CFA franc	CFA	🇹🇬	U+1F1F9 U+1F1EC	\N	\N	TG	TGO	8	1.16666666	Togolese	Togo	768	228	Africa	1	Western Africa	3	[{"tzName": "Greenwich Mean Time", "zoneName": "Africa/Lome", "gmtOffset": 0, "abbreviation": "GMT", "gmtOffsetName": "UTC±00"}]	.tg	{"de": "Togo", "es": "Togo", "fa": "توگو", "fr": "Togo", "hr": "Togo", "it": "Togo", "ja": "トーゴ", "ko": "토고", "nl": "Togo", "pl": "Togo", "pt": "Togo", "ru": "Того", "tr": "Togo", "uk": "Того", "pt-BR": "Togo", "zh-CN": "多哥"}
221	Tokelau	f		NZD	New Zealand dollar	$	🇹🇰	U+1F1F9 U+1F1F0	\N	\N	TK	TKL	-9	-172	Tokelauan	Tokelau	772	690	Oceania	5	Polynesia	22	[{"tzName": "Tokelau Time", "zoneName": "Pacific/Fakaofo", "gmtOffset": 46800, "abbreviation": "TKT", "gmtOffsetName": "UTC+13:00"}]	.tk	{"de": "Tokelau", "es": "Islas Tokelau", "fa": "توکلائو", "fr": "Tokelau", "hr": "Tokelau", "it": "Isole Tokelau", "ja": "トケラウ", "ko": "토켈라우", "nl": "Tokelau", "pl": "Tokelau", "pt": "Toquelau", "ru": "Токелау", "tr": "Tokelau", "uk": "Токелау", "pt-BR": "Tokelau", "zh-CN": "托克劳"}
222	Tonga	f	Nuku'alofa	TOP	Tongan paʻanga	$	🇹🇴	U+1F1F9 U+1F1F4	\N	\N	TO	TON	-20	-175	Tongan	Tonga	776	676	Oceania	5	Polynesia	22	[{"tzName": "Tonga Time", "zoneName": "Pacific/Tongatapu", "gmtOffset": 46800, "abbreviation": "TOT", "gmtOffsetName": "UTC+13:00"}]	.to	{"de": "Tonga", "es": "Tonga", "fa": "تونگا", "fr": "Tonga", "hr": "Tonga", "it": "Tonga", "ja": "トンガ", "ko": "통가", "nl": "Tonga", "pl": "Tonga", "pt": "Tonga", "ru": "Тонга", "tr": "Tonga", "uk": "Тонга", "pt-BR": "Tonga", "zh-CN": "汤加"}
223	Trinidad and Tobago	f	Port of Spain	TTD	Trinidad and Tobago dollar	$	🇹🇹	U+1F1F9 U+1F1F9	\N	\N	TT	TTO	11	-61	Trinidadian or Tobagonian	Trinidad and Tobago	780	1	Americas	2	Caribbean	7	[{"tzName": "Atlantic Standard Time", "zoneName": "America/Port_of_Spain", "gmtOffset": -14400, "abbreviation": "AST", "gmtOffsetName": "UTC-04:00"}]	.tt	{"de": "Trinidad und Tobago", "es": "Trinidad y Tobago", "fa": "ترینیداد و توباگو", "fr": "Trinité et Tobago", "hr": "Trinidad i Tobago", "it": "Trinidad e Tobago", "ja": "トリニダード・トバゴ", "ko": "트리니다드 토바고", "nl": "Trinidad en Tobago", "pl": "Trynidad i Tobago", "pt": "Trindade e Tobago", "ru": "Тринидад и Тобаго", "tr": "Trinidad Ve Tobago", "uk": "Тринідад і Тобаго", "pt-BR": "Trinidad e Tobago", "zh-CN": "特立尼达和多巴哥"}
224	Tunisia	f	Tunis	TND	Tunisian dinar	ت.د	🇹🇳	U+1F1F9 U+1F1F3	\N	\N	TN	TUN	34	9	Tunisian	تونس	788	216	Africa	1	Northern Africa	1	[{"tzName": "Central European Time", "zoneName": "Africa/Tunis", "gmtOffset": 3600, "abbreviation": "CET", "gmtOffsetName": "UTC+01:00"}]	.tn	{"de": "Tunesien", "es": "Túnez", "fa": "تونس", "fr": "Tunisie", "hr": "Tunis", "it": "Tunisia", "ja": "チュニジア", "ko": "튀니지", "nl": "Tunesië", "pl": "Tunezja", "pt": "Tunísia", "ru": "Тунис", "tr": "Tunus", "uk": "Туніс", "pt-BR": "Tunísia", "zh-CN": "突尼斯"}
225	Turkey	f	Ankara	TRY	Turkish lira	₺	🇹🇷	U+1F1F9 U+1F1F7	\N	\N	TR	TUR	39	35	Turkish	Türkiye	792	90	Asia	3	Western Asia	11	[{"tzName": "Eastern European Time", "zoneName": "Europe/Istanbul", "gmtOffset": 10800, "abbreviation": "EET", "gmtOffsetName": "UTC+03:00"}]	.tr	{"de": "Türkei", "es": "Turquía", "fa": "ترکیه", "fr": "Turquie", "hr": "Turska", "it": "Turchia", "ja": "トルコ", "ko": "터키", "nl": "Turkije", "pl": "Turcja", "pt": "Turquia", "ru": "Турция", "tr": "Türkiye", "uk": "Туреччина", "pt-BR": "Turquia", "zh-CN": "土耳其"}
226	Turkmenistan	f	Ashgabat	TMT	Turkmenistan manat	T	🇹🇲	U+1F1F9 U+1F1F2	\N	\N	TM	TKM	40	60	Turkmen	Türkmenistan	795	993	Asia	3	Central Asia	10	[{"tzName": "Turkmenistan Time", "zoneName": "Asia/Ashgabat", "gmtOffset": 18000, "abbreviation": "TMT", "gmtOffsetName": "UTC+05:00"}]	.tm	{"de": "Turkmenistan", "es": "Turkmenistán", "fa": "ترکمنستان", "fr": "Turkménistan", "hr": "Turkmenistan", "it": "Turkmenistan", "ja": "トルクメニスタン", "ko": "투르크메니스탄", "nl": "Turkmenistan", "pl": "Turkmenistan", "pt": "Turquemenistão", "ru": "Туркменистан", "tr": "Türkmenistan", "uk": "Туркменістан", "pt-BR": "Turcomenistão", "zh-CN": "土库曼斯坦"}
227	Turks and Caicos Islands	f	Cockburn Town	USD	United States dollar	$	🇹🇨	U+1F1F9 U+1F1E8	\N	\N	TC	TCA	21.75	-71.58333333	Turks and Caicos Island	Turks and Caicos Islands	796	1	Americas	2	Caribbean	7	[{"tzName": "Eastern Standard Time (North America", "zoneName": "America/Grand_Turk", "gmtOffset": -18000, "abbreviation": "EST", "gmtOffsetName": "UTC-05:00"}]	.tc	{"de": "Turks- und Caicosinseln", "es": "Islas Turks y Caicos", "fa": "جزایر تورکس و کایکوس", "fr": "Îles Turques-et-Caïques", "hr": "Otoci Turks i Caicos", "it": "Isole Turks e Caicos", "ja": "タークス・カイコス諸島", "ko": "터크스 케이커스 제도", "nl": "Turks- en Caicoseilanden", "pl": "Wyspy Turks i Caicos", "pt": "Ilhas Turcas e Caicos", "ru": "Острова Теркс и Кайкос", "tr": "Turks Ve Caicos Adalari", "uk": "Острови Теркс і Кайкос", "pt-BR": "Ilhas Turcas e Caicos", "zh-CN": "特克斯和凯科斯群岛"}
228	Tuvalu	f	Funafuti	AUD	Australian dollar	$	🇹🇻	U+1F1F9 U+1F1FB	\N	\N	TV	TUV	-8	178	Tuvaluan	Tuvalu	798	688	Oceania	5	Polynesia	22	[{"tzName": "Tuvalu Time", "zoneName": "Pacific/Funafuti", "gmtOffset": 43200, "abbreviation": "TVT", "gmtOffsetName": "UTC+12:00"}]	.tv	{"de": "Tuvalu", "es": "Tuvalu", "fa": "تووالو", "fr": "Tuvalu", "hr": "Tuvalu", "it": "Tuvalu", "ja": "ツバル", "ko": "투발루", "nl": "Tuvalu", "pl": "Tuvalu", "pt": "Tuvalu", "ru": "Тувалу", "tr": "Tuvalu", "uk": "Тувалу", "pt-BR": "Tuvalu", "zh-CN": "图瓦卢"}
229	Uganda	f	Kampala	UGX	Ugandan shilling	USh	🇺🇬	U+1F1FA U+1F1EC	\N	\N	UG	UGA	1	32	Ugandan	Uganda	800	256	Africa	1	Eastern Africa	4	[{"tzName": "East Africa Time", "zoneName": "Africa/Kampala", "gmtOffset": 10800, "abbreviation": "EAT", "gmtOffsetName": "UTC+03:00"}]	.ug	{"de": "Uganda", "es": "Uganda", "fa": "اوگاندا", "fr": "Uganda", "hr": "Uganda", "it": "Uganda", "ja": "ウガンダ", "ko": "우간다", "nl": "Oeganda", "pl": "Uganda", "pt": "Uganda", "ru": "Уганда", "tr": "Uganda", "uk": "Уганда", "pt-BR": "Uganda", "zh-CN": "乌干达"}
230	Ukraine	f	Kyiv	UAH	Ukrainian hryvnia	₴	🇺🇦	U+1F1FA U+1F1E6	\N	\N	UA	UKR	49	32	Ukrainian	Україна	804	380	Europe	4	Eastern Europe	15	[{"tzName": "Eastern European Time", "zoneName": "Europe/Kiev", "gmtOffset": 7200, "abbreviation": "EET", "gmtOffsetName": "UTC+02:00"}, {"tzName": "Moscow Time", "zoneName": "Europe/Simferopol", "gmtOffset": 10800, "abbreviation": "MSK", "gmtOffsetName": "UTC+03:00"}, {"tzName": "Eastern European Time", "zoneName": "Europe/Uzhgorod", "gmtOffset": 7200, "abbreviation": "EET", "gmtOffsetName": "UTC+02:00"}, {"tzName": "Eastern European Time", "zoneName": "Europe/Zaporozhye", "gmtOffset": 7200, "abbreviation": "EET", "gmtOffsetName": "UTC+02:00"}]	.ua	{"de": "Ukraine", "es": "Ucrania", "fa": "وکراین", "fr": "Ukraine", "hr": "Ukrajina", "it": "Ucraina", "ja": "ウクライナ", "ko": "우크라이나", "nl": "Oekraïne", "pl": "Ukraina", "pt": "Ucrânia", "ru": "Украина", "tr": "Ukrayna", "uk": "Україна", "pt-BR": "Ucrânia", "zh-CN": "乌克兰"}
231	United Arab Emirates	f	Abu Dhabi	AED	United Arab Emirates dirham	إ.د	🇦🇪	U+1F1E6 U+1F1EA	\N	\N	AE	ARE	24	54	Emirati, Emirian, Emiri	دولة الإمارات العربية المتحدة	784	971	Asia	3	Western Asia	11	[{"tzName": "Gulf Standard Time", "zoneName": "Asia/Dubai", "gmtOffset": 14400, "abbreviation": "GST", "gmtOffsetName": "UTC+04:00"}]	.ae	{"de": "Vereinigte Arabische Emirate", "es": "Emiratos Árabes Unidos", "fa": "امارات متحده عربی", "fr": "Émirats arabes unis", "hr": "Ujedinjeni Arapski Emirati", "it": "Emirati Arabi Uniti", "ja": "アラブ首長国連邦", "ko": "아랍에미리트", "nl": "Verenigde Arabische Emiraten", "pl": "Zjednoczone Emiraty Arabskie", "pt": "Emirados árabes Unidos", "ru": "Объединенные Арабские Эмираты", "tr": "Birleşik Arap Emirlikleri", "uk": "Об'єднані Арабські Емірати", "pt-BR": "Emirados árabes Unidos", "zh-CN": "阿拉伯联合酋长国"}
232	United Kingdom	f	London	GBP	British pound	£	🇬🇧	U+1F1EC U+1F1E7	\N	\N	GB	GBR	54	-2	British, UK	United Kingdom	826	44	Europe	4	Northern Europe	18	[{"tzName": "Greenwich Mean Time", "zoneName": "Europe/London", "gmtOffset": 0, "abbreviation": "GMT", "gmtOffsetName": "UTC±00"}]	.uk	{"de": "Vereinigtes Königreich", "es": "Reino Unido", "fa": "بریتانیای کبیر و ایرلند شمالی", "fr": "Royaume-Uni", "hr": "Ujedinjeno Kraljevstvo", "it": "Regno Unito", "ja": "イギリス", "ko": "영국", "nl": "Verenigd Koninkrijk", "pl": "Wielka Brytania", "pt": "Reino Unido", "ru": "Великобритания", "tr": "Birleşik Krallik", "uk": "Сполучене Королівство", "pt-BR": "Reino Unido", "zh-CN": "英国"}
233	United States	f	Washington	USD	United States dollar	$	🇺🇸	U+1F1FA U+1F1F8	\N	\N	US	USA	38	-97	American	United States	840	1	Americas	2	Northern America	6	[{"tzName": "Hawaii–Aleutian Standard Time", "zoneName": "America/Adak", "gmtOffset": -36000, "abbreviation": "HST", "gmtOffsetName": "UTC-10:00"}, {"tzName": "Alaska Standard Time", "zoneName": "America/Anchorage", "gmtOffset": -32400, "abbreviation": "AKST", "gmtOffsetName": "UTC-09:00"}, {"tzName": "Mountain Standard Time (North America", "zoneName": "America/Boise", "gmtOffset": -25200, "abbreviation": "MST", "gmtOffsetName": "UTC-07:00"}, {"tzName": "Central Standard Time (North America", "zoneName": "America/Chicago", "gmtOffset": -21600, "abbreviation": "CST", "gmtOffsetName": "UTC-06:00"}, {"tzName": "Mountain Standard Time (North America", "zoneName": "America/Denver", "gmtOffset": -25200, "abbreviation": "MST", "gmtOffsetName": "UTC-07:00"}, {"tzName": "Eastern Standard Time (North America", "zoneName": "America/Detroit", "gmtOffset": -18000, "abbreviation": "EST", "gmtOffsetName": "UTC-05:00"}, {"tzName": "Eastern Standard Time (North America", "zoneName": "America/Indiana/Indianapolis", "gmtOffset": -18000, "abbreviation": "EST", "gmtOffsetName": "UTC-05:00"}, {"tzName": "Central Standard Time (North America", "zoneName": "America/Indiana/Knox", "gmtOffset": -21600, "abbreviation": "CST", "gmtOffsetName": "UTC-06:00"}, {"tzName": "Eastern Standard Time (North America", "zoneName": "America/Indiana/Marengo", "gmtOffset": -18000, "abbreviation": "EST", "gmtOffsetName": "UTC-05:00"}, {"tzName": "Eastern Standard Time (North America", "zoneName": "America/Indiana/Petersburg", "gmtOffset": -18000, "abbreviation": "EST", "gmtOffsetName": "UTC-05:00"}, {"tzName": "Central Standard Time (North America", "zoneName": "America/Indiana/Tell_City", "gmtOffset": -21600, "abbreviation": "CST", "gmtOffsetName": "UTC-06:00"}, {"tzName": "Eastern Standard Time (North America", "zoneName": "America/Indiana/Vevay", "gmtOffset": -18000, "abbreviation": "EST", "gmtOffsetName": "UTC-05:00"}, {"tzName": "Eastern Standard Time (North America", "zoneName": "America/Indiana/Vincennes", "gmtOffset": -18000, "abbreviation": "EST", "gmtOffsetName": "UTC-05:00"}, {"tzName": "Eastern Standard Time (North America", "zoneName": "America/Indiana/Winamac", "gmtOffset": -18000, "abbreviation": "EST", "gmtOffsetName": "UTC-05:00"}, {"tzName": "Alaska Standard Time", "zoneName": "America/Juneau", "gmtOffset": -32400, "abbreviation": "AKST", "gmtOffsetName": "UTC-09:00"}, {"tzName": "Eastern Standard Time (North America", "zoneName": "America/Kentucky/Louisville", "gmtOffset": -18000, "abbreviation": "EST", "gmtOffsetName": "UTC-05:00"}, {"tzName": "Eastern Standard Time (North America", "zoneName": "America/Kentucky/Monticello", "gmtOffset": -18000, "abbreviation": "EST", "gmtOffsetName": "UTC-05:00"}, {"tzName": "Pacific Standard Time (North America", "zoneName": "America/Los_Angeles", "gmtOffset": -28800, "abbreviation": "PST", "gmtOffsetName": "UTC-08:00"}, {"tzName": "Central Standard Time (North America", "zoneName": "America/Menominee", "gmtOffset": -21600, "abbreviation": "CST", "gmtOffsetName": "UTC-06:00"}, {"tzName": "Alaska Standard Time", "zoneName": "America/Metlakatla", "gmtOffset": -32400, "abbreviation": "AKST", "gmtOffsetName": "UTC-09:00"}, {"tzName": "Eastern Standard Time (North America", "zoneName": "America/New_York", "gmtOffset": -18000, "abbreviation": "EST", "gmtOffsetName": "UTC-05:00"}, {"tzName": "Alaska Standard Time", "zoneName": "America/Nome", "gmtOffset": -32400, "abbreviation": "AKST", "gmtOffsetName": "UTC-09:00"}, {"tzName": "Central Standard Time (North America", "zoneName": "America/North_Dakota/Beulah", "gmtOffset": -21600, "abbreviation": "CST", "gmtOffsetName": "UTC-06:00"}, {"tzName": "Central Standard Time (North America", "zoneName": "America/North_Dakota/Center", "gmtOffset": -21600, "abbreviation": "CST", "gmtOffsetName": "UTC-06:00"}, {"tzName": "Central Standard Time (North America", "zoneName": "America/North_Dakota/New_Salem", "gmtOffset": -21600, "abbreviation": "CST", "gmtOffsetName": "UTC-06:00"}, {"tzName": "Mountain Standard Time (North America", "zoneName": "America/Phoenix", "gmtOffset": -25200, "abbreviation": "MST", "gmtOffsetName": "UTC-07:00"}, {"tzName": "Alaska Standard Time", "zoneName": "America/Sitka", "gmtOffset": -32400, "abbreviation": "AKST", "gmtOffsetName": "UTC-09:00"}, {"tzName": "Alaska Standard Time", "zoneName": "America/Yakutat", "gmtOffset": -32400, "abbreviation": "AKST", "gmtOffsetName": "UTC-09:00"}, {"tzName": "Hawaii–Aleutian Standard Time", "zoneName": "Pacific/Honolulu", "gmtOffset": -36000, "abbreviation": "HST", "gmtOffsetName": "UTC-10:00"}]	.us	{"de": "Vereinigte Staaten von Amerika", "es": "Estados Unidos", "fa": "ایالات متحده آمریکا", "fr": "États-Unis", "hr": "Sjedinjene Američke Države", "it": "Stati Uniti D'America", "ja": "アメリカ合衆国", "ko": "미국", "nl": "Verenigde Staten", "pl": "Stany Zjednoczone", "pt": "Estados Unidos", "ru": "Соединенные Штаты", "tr": "Amerika", "uk": "Сполучені Штати", "pt-BR": "Estados Unidos", "zh-CN": "美国"}
234	United States Minor Outlying Islands	f		USD	United States dollar	$	🇺🇲	U+1F1FA U+1F1F2	\N	\N	UM	UMI	0	0	American	United States Minor Outlying Islands	581	1	Americas	2	Northern America	6	[{"tzName": "Samoa Standard Time", "zoneName": "Pacific/Midway", "gmtOffset": -39600, "abbreviation": "SST", "gmtOffsetName": "UTC-11:00"}, {"tzName": "Wake Island Time", "zoneName": "Pacific/Wake", "gmtOffset": 43200, "abbreviation": "WAKT", "gmtOffsetName": "UTC+12:00"}]	.us	{"de": "Kleinere Inselbesitzungen der Vereinigten Staaten", "es": "Islas Ultramarinas Menores de Estados Unidos", "fa": "جزایر کوچک حاشیه‌ای ایالات متحده آمریکا", "fr": "Îles mineures éloignées des États-Unis", "hr": "Mali udaljeni otoci SAD-a", "it": "Isole minori esterne degli Stati Uniti d'America", "ja": "合衆国領有小離島", "ko": "미국령 군소 제도", "nl": "Kleine afgelegen eilanden van de Verenigde Staten", "pl": "Mniejsze Wyspy Zewnętrzne Stanów Zjednoczonych", "pt": "Ilhas Menores Distantes dos Estados Unidos", "ru": "Малые отдаленные острова Соединенных Штатов", "tr": "Abd Küçük Harici Adalari", "uk": "Малі віддалені острови Сполучених Штатів", "pt-BR": "Ilhas Menores Distantes dos Estados Unidos", "zh-CN": "美国本土外小岛屿"}
235	Uruguay	f	Montevideo	UYU	Uruguayan peso	$	🇺🇾	U+1F1FA U+1F1FE	\N	\N	UY	URY	-33	-56	Uruguayan	Uruguay	858	598	Americas	2	South America	8	[{"tzName": "Uruguay Standard Time", "zoneName": "America/Montevideo", "gmtOffset": -10800, "abbreviation": "UYT", "gmtOffsetName": "UTC-03:00"}]	.uy	{"de": "Uruguay", "es": "Uruguay", "fa": "اروگوئه", "fr": "Uruguay", "hr": "Urugvaj", "it": "Uruguay", "ja": "ウルグアイ", "ko": "우루과이", "nl": "Uruguay", "pl": "Urugwaj", "pt": "Uruguai", "ru": "Уругвай", "tr": "Uruguay", "uk": "Уругвай", "pt-BR": "Uruguai", "zh-CN": "乌拉圭"}
236	Uzbekistan	f	Tashkent	UZS	Uzbekistani soʻm	лв	🇺🇿	U+1F1FA U+1F1FF	\N	\N	UZ	UZB	41	64	Uzbekistani, Uzbek	O‘zbekiston	860	998	Asia	3	Central Asia	10	[{"tzName": "Uzbekistan Time", "zoneName": "Asia/Samarkand", "gmtOffset": 18000, "abbreviation": "UZT", "gmtOffsetName": "UTC+05:00"}, {"tzName": "Uzbekistan Time", "zoneName": "Asia/Tashkent", "gmtOffset": 18000, "abbreviation": "UZT", "gmtOffsetName": "UTC+05:00"}]	.uz	{"de": "Usbekistan", "es": "Uzbekistán", "fa": "ازبکستان", "fr": "Ouzbékistan", "hr": "Uzbekistan", "it": "Uzbekistan", "ja": "ウズベキスタン", "ko": "우즈베키스탄", "nl": "Oezbekistan", "pl": "Uzbekistan", "pt": "Usbequistão", "ru": "Узбекистан", "tr": "Özbekistan", "uk": "Узбекистан", "pt-BR": "Uzbequistão", "zh-CN": "乌兹别克斯坦"}
237	Vanuatu	f	Port Vila	VUV	Vanuatu vatu	VT	🇻🇺	U+1F1FB U+1F1FA	\N	\N	VU	VUT	-16	167	Ni-Vanuatu, Vanuatuan	Vanuatu	548	678	Oceania	5	Melanesia	20	[{"tzName": "Vanuatu Time", "zoneName": "Pacific/Efate", "gmtOffset": 39600, "abbreviation": "VUT", "gmtOffsetName": "UTC+11:00"}]	.vu	{"de": "Vanuatu", "es": "Vanuatu", "fa": "وانواتو", "fr": "Vanuatu", "hr": "Vanuatu", "it": "Vanuatu", "ja": "バヌアツ", "ko": "바누아투", "nl": "Vanuatu", "pl": "Vanuatu", "pt": "Vanuatu", "ru": "Вануату", "tr": "Vanuatu", "uk": "Вануату", "pt-BR": "Vanuatu", "zh-CN": "瓦努阿图"}
238	Vatican City State (Holy See)	f	Vatican City	EUR	Euro	€	🇻🇦	U+1F1FB U+1F1E6	\N	\N	VA	VAT	41.9	12.45	Vatican	Vaticano	336	379	Europe	4	Southern Europe	16	[{"tzName": "Central European Time", "zoneName": "Europe/Vatican", "gmtOffset": 3600, "abbreviation": "CET", "gmtOffsetName": "UTC+01:00"}]	.va	{"de": "Heiliger Stuhl", "es": "Santa Sede", "fa": "سریر مقدس", "fr": "voir Saint", "hr": "Sveta Stolica", "it": "Santa Sede", "ja": "聖座", "ko": "바티칸 시국", "nl": "Heilige Stoel", "pl": "Państwo Watykańskie (Stolica Apostolska)", "pt": "Vaticano", "ru": "Город-государство Ватикан (Святой Престол)", "tr": "Vatikan", "uk": "Держава-місто Ватикан (Святий Престол)", "pt-BR": "Vaticano", "zh-CN": "梵蒂冈"}
239	Venezuela	f	Caracas	VES	Bolívar	Bs	🇻🇪	U+1F1FB U+1F1EA	\N	\N	VE	VEN	8	-66	Venezuelan	Venezuela	862	58	Americas	2	South America	8	[{"tzName": "Venezuelan Standard Time", "zoneName": "America/Caracas", "gmtOffset": -14400, "abbreviation": "VET", "gmtOffsetName": "UTC-04:00"}]	.ve	{"de": "Venezuela", "es": "Venezuela", "fa": "ونزوئلا", "fr": "Venezuela", "hr": "Venezuela", "it": "Venezuela", "ja": "ベネズエラ・ボリバル共和国", "ko": "베네수엘라", "nl": "Venezuela", "pl": "Wenezuela", "pt": "Venezuela", "ru": "Венесуэла", "tr": "Venezuela", "uk": "Венесуела", "pt-BR": "Venezuela", "zh-CN": "委内瑞拉"}
240	Vietnam	f	Hanoi	VND	Vietnamese đồng	₫	🇻🇳	U+1F1FB U+1F1F3	\N	\N	VN	VNM	16.16666666	107.83333333	Vietnamese	Việt Nam	704	84	Asia	3	South-Eastern Asia	13	[{"tzName": "Indochina Time", "zoneName": "Asia/Ho_Chi_Minh", "gmtOffset": 25200, "abbreviation": "ICT", "gmtOffsetName": "UTC+07:00"}]	.vn	{"de": "Vietnam", "es": "Vietnam", "fa": "ویتنام", "fr": "Viêt Nam", "hr": "Vijetnam", "it": "Vietnam", "ja": "ベトナム", "ko": "베트남", "nl": "Vietnam", "pl": "Wietnam", "pt": "Vietname", "ru": "Вьетнам", "tr": "Vietnam", "uk": "В'єтнам", "pt-BR": "Vietnã", "zh-CN": "越南"}
241	Virgin Islands (British)	f	Road Town	USD	United States dollar	$	🇻🇬	U+1F1FB U+1F1EC	\N	\N	VG	VGB	18.431383	-64.62305	British Virgin Island	British Virgin Islands	092	1	Americas	2	Caribbean	7	[{"tzName": "Atlantic Standard Time", "zoneName": "America/Tortola", "gmtOffset": -14400, "abbreviation": "AST", "gmtOffsetName": "UTC-04:00"}]	.vg	{"de": "Britische Jungferninseln", "es": "Islas Vírgenes del Reino Unido", "fa": "جزایر ویرجین بریتانیا", "fr": "Îles Vierges britanniques", "hr": "Britanski Djevičanski Otoci", "it": "Isole Vergini Britanniche", "ja": "イギリス領ヴァージン諸島", "ko": "영국령 버진아일랜드", "nl": "Britse Maagdeneilanden", "pl": "Wyspy Dziewicze (Brytyjskie)", "pt": "Ilhas Virgens Britânicas", "ru": "Виргинские острова (Британские)", "tr": "Britanya Virjin Adalari", "uk": "Віргінські острови (Британські)", "pt-BR": "Ilhas Virgens Britânicas", "zh-CN": "圣文森特和格林纳丁斯"}
242	Virgin Islands (US)	f	Charlotte Amalie	USD	United States dollar	$	🇻🇮	U+1F1FB U+1F1EE	\N	\N	VI	VIR	18.34	-64.93	U.S. Virgin Island	United States Virgin Islands	850	1	Americas	2	Caribbean	7	[{"tzName": "Atlantic Standard Time", "zoneName": "America/St_Thomas", "gmtOffset": -14400, "abbreviation": "AST", "gmtOffsetName": "UTC-04:00"}]	.vi	{"de": "Amerikanische Jungferninseln", "es": "Islas Vírgenes de los Estados Unidos", "fa": "جزایر ویرجین آمریکا", "fr": "Îles Vierges des États-Unis", "it": "Isole Vergini americane", "ja": "アメリカ領ヴァージン諸島", "ko": "미국령 버진아일랜드", "nl": "Verenigde Staten Maagdeneilanden", "pl": "Wyspy Dziewicze (USA)", "pt": "Ilhas Virgens Americanas", "ru": "Виргинские острова (США)", "tr": "Abd Virjin Adalari", "uk": "Віргінські острови (США)", "pt-BR": "Ilhas Virgens Americanas", "zh-CN": "维尔京群岛（美国）"}
243	Wallis and Futuna Islands	f	Mata Utu	XPF	CFP franc	₣	🇼🇫	U+1F1FC U+1F1EB	\N	\N	WF	WLF	-13.3	-176.2	Wallis and Futuna, Wallisian or Futunan	Wallis et Futuna	876	681	Oceania	5	Polynesia	22	[{"tzName": "Wallis & Futuna Time", "zoneName": "Pacific/Wallis", "gmtOffset": 43200, "abbreviation": "WFT", "gmtOffsetName": "UTC+12:00"}]	.wf	{"de": "Wallis und Futuna", "es": "Wallis y Futuna", "fa": "والیس و فوتونا", "fr": "Wallis-et-Futuna", "hr": "Wallis i Fortuna", "it": "Wallis e Futuna", "ja": "ウォリス・フツナ", "ko": "왈리스 푸투나", "nl": "Wallis en Futuna", "pl": "Wyspy Wallis i Futuna", "pt": "Wallis e Futuna", "ru": "Острова Уоллис и Футуна", "tr": "Wallis Ve Futuna", "uk": "Острови Уолліс і Футуна", "pt-BR": "Wallis e Futuna", "zh-CN": "瓦利斯群岛和富图纳群岛"}
244	Western Sahara	f	El-Aaiun	MAD	Moroccan Dirham	MAD	🇪🇭	U+1F1EA U+1F1ED	\N	\N	EH	ESH	24.5	-13	Sahrawi, Sahrawian, Sahraouian	الصحراء الغربية	732	212	Africa	1	Northern Africa	1	[{"tzName": "Western European Summer Time", "zoneName": "Africa/El_Aaiun", "gmtOffset": 3600, "abbreviation": "WEST", "gmtOffsetName": "UTC+01:00"}]	.eh	{"de": "Westsahara", "es": "Sahara Occidental", "fa": "جمهوری دموکراتیک عربی صحرا", "fr": "Sahara Occidental", "hr": "Zapadna Sahara", "it": "Sahara Occidentale", "ja": "西サハラ", "ko": "서사하라", "nl": "Westelijke Sahara", "pl": "Sahara Zachodnia", "pt": "Saara Ocidental", "ru": "Западная Сахара", "tr": "Bati Sahra", "uk": "Західна Сахара", "pt-BR": "Saara Ocidental", "zh-CN": "西撒哈拉"}
245	Yemen	f	Sanaa	YER	Yemeni rial	﷼	🇾🇪	U+1F1FE U+1F1EA	\N	\N	YE	YEM	15	48	Yemeni	اليَمَن	887	967	Asia	3	Western Asia	11	[{"tzName": "Arabia Standard Time", "zoneName": "Asia/Aden", "gmtOffset": 10800, "abbreviation": "AST", "gmtOffsetName": "UTC+03:00"}]	.ye	{"de": "Jemen", "es": "Yemen", "fa": "یمن", "fr": "Yémen", "hr": "Jemen", "it": "Yemen", "ja": "イエメン", "ko": "예멘", "nl": "Jemen", "pl": "Jemen", "pt": "Iémen", "ru": "Йемен", "tr": "Yemen", "uk": "Ємен", "pt-BR": "Iêmen", "zh-CN": "也门"}
246	Zambia	f	Lusaka	ZMW	Zambian kwacha	ZK	🇿🇲	U+1F1FF U+1F1F2	\N	\N	ZM	ZMB	-15	30	Zambian	Zambia	894	260	Africa	1	Southern Africa	5	[{"tzName": "Central Africa Time", "zoneName": "Africa/Lusaka", "gmtOffset": 7200, "abbreviation": "CAT", "gmtOffsetName": "UTC+02:00"}]	.zm	{"de": "Sambia", "es": "Zambia", "fa": "زامبیا", "fr": "Zambie", "hr": "Zambija", "it": "Zambia", "ja": "ザンビア", "ko": "잠비아", "nl": "Zambia", "pl": "Zambia", "pt": "Zâmbia", "ru": "Замбия", "tr": "Zambiya", "uk": "Замбія", "pt-BR": "Zâmbia", "zh-CN": "赞比亚"}
247	Zimbabwe	f	Harare	ZWL	Zimbabwe Dollar	$	🇿🇼	U+1F1FF U+1F1FC	\N	\N	ZW	ZWE	-20	30	Zimbabwean	Zimbabwe	716	263	Africa	1	Eastern Africa	4	[{"tzName": "Central Africa Time", "zoneName": "Africa/Harare", "gmtOffset": 7200, "abbreviation": "CAT", "gmtOffsetName": "UTC+02:00"}]	.zw	{"de": "Simbabwe", "es": "Zimbabue", "fa": "زیمباوه", "fr": "Zimbabwe", "hr": "Zimbabve", "it": "Zimbabwe", "ja": "ジンバブエ", "ko": "짐바브웨", "nl": "Zimbabwe", "pl": "Zimbabwe", "pt": "Zimbabué", "ru": "Зимбабве", "tr": "Zimbabve", "uk": "Зімбабве", "pt-BR": "Zimbabwe", "zh-CN": "津巴布韦"}
\.


--
-- Data for Name: Image; Type: TABLE DATA; Schema: public; Owner: default
--

COPY public."Image" (id, url, country_id, post_id) FROM stdin;
26	https://example.com/image4.jpg	\N	10
27	https://example.com/image5.jpg	\N	10
28	https://example.com/image4.jpg	\N	12
29	https://example.com/image5.jpg	\N	12
30	https://example10.com/image5.jpg	\N	13
31	https://example10.com/image4.jpg	\N	13
32	https://example11.com/image5.jpg	11	14
33	https://example11.com/image4.jpg	11	14
4	https://example.com/image2.jpg	7	2
3	https://example225.com/image1.jpg	7	2
23	https://update2-example.com/image4.jpg	8	3
7	https://example.com/image3.jpg	14	4
8	https://example.com/image4.jpg	14	4
9	https://example.com/image4.jpg	14	5
10	https://example.com/image5.jpg	14	5
11	https://example.com/image5.jpg	14	6
12	https://example.com/image4.jpg	14	6
24	https://example.com/image4.jpg	14	7
25	https://example.com/image5.jpg	14	7
\.


--
-- Data for Name: Language; Type: TABLE DATA; Schema: public; Owner: default
--

COPY public."Language" (id, code, name) FROM stdin;
1	en	English
2	fr	French
\.


--
-- Data for Name: Post; Type: TABLE DATA; Schema: public; Owner: default
--

COPY public."Post" (id, country_id, section_id) FROM stdin;
10	4	4
12	2	4
13	10	4
14	11	4
2	7	\N
3	8	1
4	14	1
5	14	1
6	14	1
7	14	1
\.


--
-- Data for Name: PostTranslation; Type: TABLE DATA; Schema: public; Owner: default
--

COPY public."PostTranslation" (id, language_id, description, post_id, title) FROM stdin;
2	1	This is a detailed description of the post content	2	Sample Post Title
4	1	This is a detailed description of the post content_2	4	Sample Post Title_2
5	1	This is a detailed description of the post content_2	5	Sample Post Title_2
6	1	This is a detailed description of the post content_2	6	Sample Post Title_2
11	1	This is a detailed description of the post content_2	7	Sample Post Title_2
12	2	France This is a detailed description of the post content_2	7	France Post Title_2
10	1	France discrittion1	3	France title1
13	1	This is a detailed description of the post content_2	10	Sample Post Title_2
14	1	France This is a detailed description of the post content_2	10	France Post Title_2
15	1	This is a detailed description of the post content_2	12	Sample Post Title_2
16	1	France This is a detailed description of the post content_2	12	France Post Title_2
17	1	France This is a detailed description of the post content_10	13	France Post Title_10
18	1	This is a detailed description of the post content_10	13	Sample Post Title_10
19	1	This is a detailed description of the post content_11	14	Sample Post Title_11
20	1	France This is a detailed description of the post content_11	14	France Post Title_11
\.


--
-- Data for Name: Region; Type: TABLE DATA; Schema: public; Owner: default
--

COPY public."Region" (id, country_id, name) FROM stdin;
\.


--
-- Data for Name: Section; Type: TABLE DATA; Schema: public; Owner: default
--

COPY public."Section" (id, name, description) FROM stdin;
1	section_zone	\N
4	section_toll-road	\N
5	section_toll-roads	\N
\.


--
-- Data for Name: TollRoad; Type: TABLE DATA; Schema: public; Owner: default
--

COPY public."TollRoad" (id, country_id, toll_type, coordinates, name, description, cost) FROM stdin;
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: default
--

COPY public."User" (id, first_name, last_name, middle_name, email, car_number, photo, birthday, gender, role, password, "accessToken", "refreshToken") FROM stdin;
1	Svitlana2	SvtlanaLast2	\N	svitlana2@example.com	AB1234CD2	\N	2024-04-28 00:00:00	female	USER	$2b$10$bb9hz7L141/G95HjJ6b6BeYpNsakHgCEpRY0LLDPFQs9y28qFDX3e	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwicm9sZSI6IlVTRVIiLCJ0eXBlIjoiYWNjZXNzVG9rZW4iLCJpYXQiOjE3Mjk4ODg1ODQsImV4cCI6MTcyOTg5MTU4NH0.25dmUvZxmjsPIp1LyN1ZGIsINy7EGqiOUHlbawUfhns	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwicm9sZSI6IlVTRVIiLCJ0eXBlIjoicmVmcmVzaFRva2VuIiwiaWF0IjoxNzI5ODg4NTg0LCJleHAiOjE3Mjk5MjQ1ODR9.aSAx3-RxnhTfhWpOY9ltBDS6vOX4ikgvpCVQz0RjmTU
\.


--
-- Data for Name: UserOrder; Type: TABLE DATA; Schema: public; Owner: default
--

COPY public."UserOrder" (id, user_id, purchase_date, operation_type, amount, car_number) FROM stdin;
\.


--
-- Data for Name: VehicleType; Type: TABLE DATA; Schema: public; Owner: default
--

COPY public."VehicleType" (id, toll_road_id, type, description, cost) FROM stdin;
\.


--
-- Data for Name: VingetteOption; Type: TABLE DATA; Schema: public; Owner: default
--

COPY public."VingetteOption" (id, operation_type, period, description, link, country_id, vehicle_type_id, toll_road_id) FROM stdin;
\.


--
-- Name: City_id_seq; Type: SEQUENCE SET; Schema: public; Owner: default
--

SELECT pg_catalog.setval('public."City_id_seq"', 1, false);


--
-- Name: Country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: default
--

SELECT pg_catalog.setval('public."Country_id_seq"', 1, false);


--
-- Name: Image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: default
--

SELECT pg_catalog.setval('public."Image_id_seq"', 33, true);


--
-- Name: Language_id_seq; Type: SEQUENCE SET; Schema: public; Owner: default
--

SELECT pg_catalog.setval('public."Language_id_seq"', 2, true);


--
-- Name: PostTranslation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: default
--

SELECT pg_catalog.setval('public."PostTranslation_id_seq"', 20, true);


--
-- Name: Post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: default
--

SELECT pg_catalog.setval('public."Post_id_seq"', 14, true);


--
-- Name: Region_id_seq; Type: SEQUENCE SET; Schema: public; Owner: default
--

SELECT pg_catalog.setval('public."Region_id_seq"', 1, false);


--
-- Name: Section_id_seq; Type: SEQUENCE SET; Schema: public; Owner: default
--

SELECT pg_catalog.setval('public."Section_id_seq"', 5, true);


--
-- Name: TollRoad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: default
--

SELECT pg_catalog.setval('public."TollRoad_id_seq"', 1, false);


--
-- Name: UserOrder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: default
--

SELECT pg_catalog.setval('public."UserOrder_id_seq"', 1, false);


--
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: public; Owner: default
--

SELECT pg_catalog.setval('public."User_id_seq"', 1, true);


--
-- Name: VehicleType_id_seq; Type: SEQUENCE SET; Schema: public; Owner: default
--

SELECT pg_catalog.setval('public."VehicleType_id_seq"', 1, false);


--
-- Name: VingetteOption_id_seq; Type: SEQUENCE SET; Schema: public; Owner: default
--

SELECT pg_catalog.setval('public."VingetteOption_id_seq"', 1, false);


--
-- Name: City City_pkey; Type: CONSTRAINT; Schema: public; Owner: default
--

ALTER TABLE ONLY public."City"
    ADD CONSTRAINT "City_pkey" PRIMARY KEY (id);


--
-- Name: Country Country_pkey; Type: CONSTRAINT; Schema: public; Owner: default
--

ALTER TABLE ONLY public."Country"
    ADD CONSTRAINT "Country_pkey" PRIMARY KEY (id);


--
-- Name: Image Image_pkey; Type: CONSTRAINT; Schema: public; Owner: default
--

ALTER TABLE ONLY public."Image"
    ADD CONSTRAINT "Image_pkey" PRIMARY KEY (id);


--
-- Name: Language Language_pkey; Type: CONSTRAINT; Schema: public; Owner: default
--

ALTER TABLE ONLY public."Language"
    ADD CONSTRAINT "Language_pkey" PRIMARY KEY (id);


--
-- Name: PostTranslation PostTranslation_pkey; Type: CONSTRAINT; Schema: public; Owner: default
--

ALTER TABLE ONLY public."PostTranslation"
    ADD CONSTRAINT "PostTranslation_pkey" PRIMARY KEY (id);


--
-- Name: Post Post_pkey; Type: CONSTRAINT; Schema: public; Owner: default
--

ALTER TABLE ONLY public."Post"
    ADD CONSTRAINT "Post_pkey" PRIMARY KEY (id);


--
-- Name: Region Region_pkey; Type: CONSTRAINT; Schema: public; Owner: default
--

ALTER TABLE ONLY public."Region"
    ADD CONSTRAINT "Region_pkey" PRIMARY KEY (id);


--
-- Name: Section Section_pkey; Type: CONSTRAINT; Schema: public; Owner: default
--

ALTER TABLE ONLY public."Section"
    ADD CONSTRAINT "Section_pkey" PRIMARY KEY (id);


--
-- Name: TollRoad TollRoad_pkey; Type: CONSTRAINT; Schema: public; Owner: default
--

ALTER TABLE ONLY public."TollRoad"
    ADD CONSTRAINT "TollRoad_pkey" PRIMARY KEY (id);


--
-- Name: UserOrder UserOrder_pkey; Type: CONSTRAINT; Schema: public; Owner: default
--

ALTER TABLE ONLY public."UserOrder"
    ADD CONSTRAINT "UserOrder_pkey" PRIMARY KEY (id);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: default
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: VehicleType VehicleType_pkey; Type: CONSTRAINT; Schema: public; Owner: default
--

ALTER TABLE ONLY public."VehicleType"
    ADD CONSTRAINT "VehicleType_pkey" PRIMARY KEY (id);


--
-- Name: VingetteOption VingetteOption_pkey; Type: CONSTRAINT; Schema: public; Owner: default
--

ALTER TABLE ONLY public."VingetteOption"
    ADD CONSTRAINT "VingetteOption_pkey" PRIMARY KEY (id);


--
-- Name: Language_code_key; Type: INDEX; Schema: public; Owner: default
--

CREATE UNIQUE INDEX "Language_code_key" ON public."Language" USING btree (code);


--
-- Name: User_email_key; Type: INDEX; Schema: public; Owner: default
--

CREATE UNIQUE INDEX "User_email_key" ON public."User" USING btree (email);


--
-- Name: City City_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: default
--

ALTER TABLE ONLY public."City"
    ADD CONSTRAINT "City_region_id_fkey" FOREIGN KEY (region_id) REFERENCES public."Region"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Image Image_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: default
--

ALTER TABLE ONLY public."Image"
    ADD CONSTRAINT "Image_country_id_fkey" FOREIGN KEY (country_id) REFERENCES public."Country"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Image Image_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: default
--

ALTER TABLE ONLY public."Image"
    ADD CONSTRAINT "Image_post_id_fkey" FOREIGN KEY (post_id) REFERENCES public."Post"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: PostTranslation PostTranslation_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: default
--

ALTER TABLE ONLY public."PostTranslation"
    ADD CONSTRAINT "PostTranslation_language_id_fkey" FOREIGN KEY (language_id) REFERENCES public."Language"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: PostTranslation PostTranslation_post_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: default
--

ALTER TABLE ONLY public."PostTranslation"
    ADD CONSTRAINT "PostTranslation_post_id_fkey" FOREIGN KEY (post_id) REFERENCES public."Post"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Post Post_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: default
--

ALTER TABLE ONLY public."Post"
    ADD CONSTRAINT "Post_country_id_fkey" FOREIGN KEY (country_id) REFERENCES public."Country"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Post Post_section_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: default
--

ALTER TABLE ONLY public."Post"
    ADD CONSTRAINT "Post_section_id_fkey" FOREIGN KEY (section_id) REFERENCES public."Section"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Region Region_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: default
--

ALTER TABLE ONLY public."Region"
    ADD CONSTRAINT "Region_country_id_fkey" FOREIGN KEY (country_id) REFERENCES public."Country"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: TollRoad TollRoad_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: default
--

ALTER TABLE ONLY public."TollRoad"
    ADD CONSTRAINT "TollRoad_country_id_fkey" FOREIGN KEY (country_id) REFERENCES public."Country"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: UserOrder UserOrder_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: default
--

ALTER TABLE ONLY public."UserOrder"
    ADD CONSTRAINT "UserOrder_user_id_fkey" FOREIGN KEY (user_id) REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: VehicleType VehicleType_toll_road_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: default
--

ALTER TABLE ONLY public."VehicleType"
    ADD CONSTRAINT "VehicleType_toll_road_id_fkey" FOREIGN KEY (toll_road_id) REFERENCES public."TollRoad"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: VingetteOption VingetteOption_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: default
--

ALTER TABLE ONLY public."VingetteOption"
    ADD CONSTRAINT "VingetteOption_country_id_fkey" FOREIGN KEY (country_id) REFERENCES public."Country"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: VingetteOption VingetteOption_toll_road_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: default
--

ALTER TABLE ONLY public."VingetteOption"
    ADD CONSTRAINT "VingetteOption_toll_road_id_fkey" FOREIGN KEY (toll_road_id) REFERENCES public."TollRoad"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: VingetteOption VingetteOption_vehicle_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: default
--

ALTER TABLE ONLY public."VingetteOption"
    ADD CONSTRAINT "VingetteOption_vehicle_type_id_fkey" FOREIGN KEY (vehicle_type_id) REFERENCES public."VehicleType"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: default
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: cloud_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO neon_superuser WITH GRANT OPTION;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: cloud_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON TABLES TO neon_superuser WITH GRANT OPTION;


--
-- PostgreSQL database dump complete
--

