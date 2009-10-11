--
-- PostgreSQL database dump
--

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: comment; Type: TABLE; Schema: public; Owner: grails; Tablespace: 
--

CREATE TABLE comment (
    id bigint NOT NULL,
    version bigint NOT NULL,
    date_created timestamp without time zone NOT NULL,
    description character varying(255) NOT NULL,
    picture_id bigint NOT NULL,
    user_id bigint
);


ALTER TABLE public.comment OWNER TO grails;

--
-- Name: folder; Type: TABLE; Schema: public; Owner: grails; Tablespace: 
--

CREATE TABLE folder (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255) NOT NULL,
    date_created timestamp without time zone NOT NULL
);


ALTER TABLE public.folder OWNER TO grails;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: grails
--

CREATE SEQUENCE hibernate_sequence
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO grails;

--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: grails
--

SELECT pg_catalog.setval('hibernate_sequence', 126, true);


--
-- Name: news; Type: TABLE; Schema: public; Owner: grails; Tablespace: 
--

CREATE TABLE news (
    id bigint NOT NULL,
    version bigint NOT NULL,
    date_created timestamp without time zone NOT NULL,
    description character varying(255) NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.news OWNER TO grails;

--
-- Name: people; Type: TABLE; Schema: public; Owner: grails; Tablespace: 
--

CREATE TABLE people (
    id bigint NOT NULL,
    version bigint NOT NULL,
    email character varying(255) NOT NULL,
    nick character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    date_created timestamp without time zone
);


ALTER TABLE public.people OWNER TO grails;

--
-- Name: picture; Type: TABLE; Schema: public; Owner: grails; Tablespace: 
--

CREATE TABLE picture (
    id bigint NOT NULL,
    version bigint NOT NULL,
    caption character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    folder_id bigint NOT NULL,
    user_id bigint NOT NULL,
    date_created timestamp without time zone NOT NULL
);


ALTER TABLE public.picture OWNER TO grails;

--
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: grails
--

COPY comment (id, version, date_created, description, picture_id, user_id) FROM stdin;
1	2	2009-08-21 14:01:00	trochę porozrzucane te komentarze :)	43	1
2	2	2009-08-21 14:02:00	w następnej wersji będzie lepiej ...	44	1
3	1	2009-08-21 15:57:00	nie musisz być zalogowany, aby dodawać komentarze	43	1
6	1	2009-08-25 20:08:00	A to taki specjalny styropian (styrodur) do ocieplania funamentów	51	1
4	1	2009-08-25 13:50:00	Co to jest to różowe wokół rury -pianka?	51	\N
5	1	2009-08-25 13:51:00	Ten las stempli przypomina mi budowę naszego domu	53	\N
66	0	2009-08-31 16:37:06.896	Nareszcie widać ten zalany strop	65	\N
67	0	2009-09-01 15:08:51.491	troche balagan mamy od tylu:-)	61	4
89	0	2009-09-21 12:56:25.354	Widoki z okna będą piękne!	79	\N
101	0	2009-09-25 06:39:23.13	Ciekawe, że nikt wcześniej nie zauważył brakującego okna na klatce schodowej :)	93	1
102	0	2009-09-25 06:51:35.159	Mi go jakoś nie brakuje :-P	93	\N
111	0	2009-09-30 20:06:57.563	Czyżby już szambo to było?	109	\N
112	0	2009-09-30 20:24:20.323	Zobaczymy co wyjdzie :)	109	1
\.


--
-- Data for Name: folder; Type: TABLE DATA; Schema: public; Owner: grails
--

COPY folder (id, version, name, date_created) FROM stdin;
1	1	Przygotowania placu budowy	2009-08-21 14:01:00
2	0	Fundamenty	2009-08-21 14:02:00
3	1	Fundamenty część druga	2009-08-21 14:03:00
4	2	Niech się mury pną do góry :)	2009-08-21 14:04:00
5	2	Podlewka	2009-08-21 14:05:00
6	4	Strop nad parterem	2009-08-21 14:06:00
70	0	Kanalizacja deszczowa	2009-09-03 20:39:20.184
90	0	Jeszcze kilka zdjęć parteru	2009-09-23 17:25:28.425
103	0	Poddasze	2009-09-30 19:43:27.29
\.


--
-- Data for Name: news; Type: TABLE DATA; Schema: public; Owner: grails
--

COPY news (id, version, date_created, description, user_id) FROM stdin;
1	3	2009-07-27 07:26:00	Poziom 0 wyznaczony!	4
2	4	2009-07-29 07:26:00	Wykopane fundamenty - i przygotowane zbrojenie. Jutro - mamy nadzieję - dziury będą wypełnione betonem.	1
3	2	2009-07-30 15:55:00	Dzisiaj zalane ławy fundamentowe (poszło 22 kubiki betonu B20) od poniedziałku ruszają z murowaniem ścianek fundamentowych.	1
4	1	2009-08-01 20:46:00	Zdjęcia zalanych ław już dostępne	1
5	1	2009-08-14 12:39:00	Po dwóch tygodniach prawie skończone ściany parteru	1
6	1	2009-08-18 08:56:00	Wylana podlewka i rozprowadzona pod nią kanalizacja	1
7	3	2009-08-21 11:40:00	Szalowanie stropu zakończone. Dzisiaj ma się także rozpocząć zbrojenie płyty.	1
8	4	2009-08-24 19:49:00	Płyta zalana. Teraz czekamy 2 tygodnie, aż beton osiągnie pełną wytrzymałość. Zdjęcia dopiero jutro dzisiaj zdążyliśmy tylko polać płytę zanim się ściemniło.	1
75	2	2009-09-03 20:45:00	Rozpoczęto przygotowania kanalizacji deszczowej za domem. Reszta prac wstrzymana dopóki nie dostaniemy pierwszej transzy z banku :(	1
88	0	2009-09-19 20:37:51.653	Dodałem kilka nowych zdjęć zalanego stropu. Częściowo rozebrano już szalunki i przygotowano pustaki do murawania poddasza. Od poniedziałku ruszamy z dalszą budową.	1
113	0	2009-09-30 20:25:24.817	Wieniec pod więźbę już wylany. Szambo w trakcie budowy.	1
114	0	2009-09-30 20:26:00.76	Jutro mają podłączyć wodę z wodociągu i zainstalować licznik i zawory.	1
124	2	2009-10-03 10:20:00	Woda już podłączona i założony licznik. Wyrównany także teren przed domem - wreszcie porządek na działce.	1
126	0	2009-10-07 16:31:01.427	Licznik wody zaplombowany :)	1
\.


--
-- Data for Name: people; Type: TABLE DATA; Schema: public; Owner: grails
--

COPY people (id, version, email, nick, password, date_created) FROM stdin;
1	1	apena@wp.pl	Alek	aleczek123	\N
4	1	anna.luborak@gmail.com	Ania	aneczka123	\N
\.


--
-- Data for Name: picture; Type: TABLE DATA; Schema: public; Owner: grails
--

COPY picture (id, version, caption, filename, folder_id, user_id, date_created) FROM stdin;
76	2	Jedna z trzech już gotowych studzienek deszczówki	e9b1ddbe9da79fff8f6ec36da94ff91076.jpg	70	1	2009-09-19 20:26:00
105	3	Z drugiej strony (nad garażem) ścianka kolankowa tylko na jeden pustak	d701e03dbf2f93aca744aadf7f5eaf15105.jpg	103	1	2009-09-30 19:45:00
108	3	Tak wygląda ścianka kolankowa nad garażem	188d7d343214a2dc867884e8ea12df7d108.jpg	103	1	2009-09-30 19:46:00
106	3	A okna w klatce schodowej jak nie było tak nie ma :)	c2ae281ac4883ac0a79db716cea03500106.jpg	103	1	2009-09-30 19:47:00
110	3	No i widok od przodu - trochę pod słońce niestety	e833df4a2f66b0f46c05b89d372036de110.jpg	103	1	2009-09-30 19:48:00
107	3	A to gotowa już studnia na deszczówkę i odwodnienie działki	e8dd6963f4bc34345eba50feb79cf0eb107.jpg	103	1	2009-09-30 19:49:00
109	3	Ta wielka dziura - to będzie nasze szambo	864a8d2149c7f641e2c50a9607fb3bfb109.jpg	103	1	2009-09-30 19:50:00
125	1	Licznik już zaplombowany - mamy własną wodę :)	b3b2ed83b885d0078ba26940a2b24b9c125.jpg	103	1	2009-10-07 16:00:42.99
87	2	Widok z tyłu z zasypanymi studzienkami	199ac4d56c612f6f6c24c4d1948f706187.jpg	70	1	2009-09-19 20:35:00
78	2	Większość stępli już rozebrana	dc30e70aff00365543b941e4158433f378.jpg	6	1	2009-09-19 20:30:00
79	2	Widoczek z góry	d9eced5127da6c9010fdd3963b06c43c79.jpg	6	1	2009-09-19 20:30:00
80	2	Widok na "bramę" wjazdową :)	747b0c73fa9e9502abaadcb8d570f7e080.jpg	6	1	2009-09-19 20:31:00
81	2	Ten duży otwór to miejsce na schody i komin do kominka. A ten otwór na pierwszym planie to miejsce na komin do pieca gazowego.	6d7cc44d92c994ea91dd2a6fc9fa2f3681.jpg	6	1	2009-09-19 20:31:00
82	2	Wszystko gotowe do murowania	f63b7739b431eb69ca56eae7cbad23a682.jpg	6	1	2009-09-19 20:31:00
83	2	Okno w salonie	d91a4488c38b6328f81bf51aec71fdb283.jpg	6	1	2009-09-19 20:32:00
84	2	Balkonik nad tarasem	afa67740cd83d6806a0325e4143625a784.jpg	6	1	2009-09-19 20:32:00
85	2	Jeszcze widok na przód domu, garaż i okno w kuchni	e8f512cb13d42470ec13150956d4d80685.jpg	6	1	2009-09-19 20:32:00
86	2	Wykusz w jadalni	b09181db91642112fc607571cc2c557a86.jpg	6	1	2009-09-19 20:33:00
91	2	Nic nowego na budowie - tylko teren wyrównany przed domem	244e83be7e5db48da66029448d894ff091.jpg	90	1	2009-09-23 17:25:00
92	2	Z tyłu też już równiutko	8453a799e0036efe4facde7c60a0007e92.jpg	90	1	2009-09-23 17:26:00
93	2	I z bliska	70644dcd28b0bf539318fc0dcbd6ff5f93.jpg	90	1	2009-09-23 17:26:00
94	2	Balkon i wyjście na taras	14e80680dc15459895768865ebd7ff3e94.jpg	90	1	2009-09-23 17:26:00
104	2	Taką będziemy mieli ściankę kolankową	b0933a98c5f584c767bbdf3f24cc5a67104.jpg	103	1	2009-09-30 19:44:00
65	1	Zalany strop	7a725afa28691d94283a72600687546e65.jpg	6	1	2009-08-31 15:34:04.33
97	2	Po prawej stronie okno w kuchni	787baca4372c4bc602ee7250a5be646f97.jpg	90	1	2009-09-23 17:27:00
98	2	Widok na wejście do garażu	271e623b12f9dbd36230777df52e63df98.jpg	90	1	2009-09-23 17:27:00
3	1	I jeszcze jedna strona	10a790bdcc2323172ab599c6c987bbca3.jpg	1	1	2009-07-27 20:31:00
5	1	I jeszcze z innej strony	71bfd80b5ca1a6f61476b8f515570e7c5.jpg	1	1	2009-07-27 20:33:00
9	1	I z drugiej strony	66a081ec88b0beb94bde588a1936f3709.jpg	2	1	2009-07-27 20:37:00
11	1	i kolejna...	e2f49ff0acf057d5e28e597b53a2455d11.jpg	2	1	2009-07-29 19:24:00
12	1	i kolejna...	94dc354e4c10848e8eebac9a58588fd712.jpg	2	1	2009-07-29 19:25:00
13	3	i kolejna ...	ba2b8b733653b1b1cd24674097fd3ab913.jpg	2	1	2009-07-29 19:26:00
16	2	znowu dziury :) ale z innej strony	8beef13159a59c784bdafe6437da0c5f16.jpg	2	1	2009-07-29 19:29:00
28	2	I jeszcze widok od drugiej strony	7ee07a774de278e22e8f8541cce8cea728.jpg	3	1	2009-08-01 20:44:00
30	2	Ania w salonie - patrzy na kominek i schody :)	2d5a2b02deae5ffcbf330bd4b745a78030.jpg	4	1	2009-08-14 12:10:00
40	1	Widok na taras	0b7aa1d05b7deed895d1f65ef8785b0940.jpg	4	1	2009-08-14 12:18:00
2	2	Garaż i kawałek płotu z innej strony	638bf54d0a55e1d6b5549dea8b90a3b32.jpg	1	1	2009-07-27 20:30:00
4	2	Płot już jest gotowy	f302c6529aabf9a06fa04acfb9c4947c4.jpg	1	1	2009-07-27 20:33:00
6	2	Deski na szalunki już przywiezione	21e7cd797e341933bc029e75e2e1a8d16.jpg	1	1	2009-07-27 20:34:00
7	2	I nawet ułożone w stosik	bd5ee5f199111e82b5b57193e2b03c497.jpg	1	1	2009-07-27 20:34:00
8	2	Darnina już zdjęta prawie pod całym domem	ed560db3f7aaa4b86257c3227998269d8.jpg	2	1	2009-07-27 20:36:00
10	2	A tak wyglądają dziury z bliska	c9458671f73b6f2a63c3957a46125b5b10.jpg	2	1	2009-07-29 19:23:00
14	2	Pani na włościach :)	9344c4015459592b2d57e58766608c1d14.jpg	2	1	2009-07-29 19:28:00
15	3	Z przodu też jest :)	5243a2e8c6f5f95dc4d272c59c19b51715.jpg	2	1	2009-07-29 19:29:00
17	3	I jeszcze raz garaż i wiatrołap	9693150ba9f4974a757e7162220b979f17.jpg	2	1	2009-07-29 19:29:00
18	3	takie skrzyżowanie zbrojenia z nóżką ;P	86a86914e8034e1014dc0ee00d92008b18.jpg	2	1	2009-07-29 19:30:00
19	3	itd.... nie chce mi się już w kółko powtarzać :)	5b40b56827274444781aeced82314e7819.jpg	2	1	2009-07-29 19:30:00
20	3	Zbliżenie zbrojenia	e88fa35848e2eca4ebaa190aa7ac035a20.jpg	2	1	2009-07-29 19:31:00
21	3	Na pierwszym planie garaż.	d8791bad9ee183f67872908a8e14d72321.jpg	2	1	2009-07-29 19:34:00
22	3	Została kupka piasku - reszta wrzucona do dziur jako podsypka pod ławy.	238d796fb48c80a3915f1f155020735022.jpg	2	1	2009-07-29 19:35:00
23	3	Rzut oka na zalane ławy fundamentowe	f35f6e2ad2b6b76f461285ee450eb4b923.jpg	3	1	2009-08-01 20:42:00
24	4	... jak wyżej ale z drugiej strony	f2d4cfd60405cabaaa89c1a8fccddd8024.jpg	3	1	2009-08-01 20:43:00
25	5	... i jeszcze zbliżenie - widać, że nie chciało się wykonawcy dokładnie obudować ław szalunkiem	9e44c13927894a82b1ece33932a6aedf25.jpg	3	1	2009-08-01 20:43:00
26	5	... szkoda, może wyszłoby parę metrów betonu mniej	ec2aeddbd132582546171f425a91f00026.jpg	3	1	2009-08-01 20:44:00
27	3	Tutaj ładnie oszalowane ławy	d1de5dc0a750b644337df9be5d51c73727.jpg	3	1	2009-08-01 20:44:00
29	2	Wreszcie coś widać - ściana garażu na pierwszym planie	6d949476c620ce2188f5827ed8d2cbe929.jpg	4	1	2009-08-14 12:09:00
31	2	Wyjście na taraz z salonu	2949639d7f89b131b8eb438c8ace09e431.jpg	4	1	2009-08-14 12:11:00
32	2	Róg domu od strony największej skarpy - nie wygląda tak źle	89d94b3c4fe7d2d739142bbc6787658d32.jpg	4	1	2009-08-14 12:12:00
33	2	Wykusz jadalni oraz okno w salonie - dobrze, że Ania zauważyła że robotnikom pomyliły się wymiary	74ee6f86904caa41069075571da2c01833.jpg	4	1	2009-08-14 12:13:00
34	2	To samo "za małe" okno od strony salonu	65c28ab397c802c4aa7884283a8643de34.jpg	4	1	2009-08-14 12:14:00
35	2	Tu będzie nasza łazienka	370cd067e2124f5e71565b62175613df35.jpg	4	1	2009-08-14 12:14:00
36	2	A to podłoga w łazience	9b721d5fcf7e0d06b8ec258e783dd3aa36.jpg	4	1	2009-08-14 12:15:00
37	2	Rzut oka na całość	684d0314ebfe52a1d9edc3c2e5219af737.jpg	4	1	2009-08-14 12:17:00
38	2	I zbliżenie	1a828608c23e952fe03c2abe204cd5d638.jpg	4	1	2009-08-14 12:17:00
39	2	Jeszcze raz narożnik	4de7cf8d14c536e683871f04e469b2c639.jpg	4	1	2009-08-14 12:18:00
41	4	Ubijanie podsypki pod podlewką, widać też powiększone okno w salonie - zdjęcie od wykonawcy	b0e2148951d5775f14c1b92590ece0e741.jpg	5	1	2009-08-17 21:55:00
42	2	Wylewanie podlewki - zdjęcie od wykonawcy	fb41dbb219da69475273122945e2bb5942.jpg	5	1	2009-08-17 21:56:00
43	3	Fragment szalunków z widocznymi stęplami - zdjęcie od wykonawcy	5e9d10a373ea4039fcd2ad23b833332b43.jpg	6	1	2009-08-21 11:38:00
44	3	Z przodu widać balkon a po lewej stronie będzie klatka schodowa - zdjęcie od wykonawcy	e050509d315a5915a9818af2251ddf0f44.jpg	6	1	2009-08-21 11:39:00
45	4	Obmurowane wieńce nad garażcem - zdjęcie od wykonawcy	caf24e691b912bdc6246244c8177583b45.jpg	6	1	2009-08-21 11:39:00
46	3	I jeszcze zbliżenie na balkon - zdjęcie od wykonawcy	a04987d5d55bd5b80221007609a8d14546.jpg	6	1	2009-08-21 11:39:00
99	2	Strop	44a161360d681acb8cf1b6f965761f3399.jpg	90	1	2009-09-23 17:27:00
100	2	Strop z drugiej strony	9c7ad54976c354064427b5d9d90fcfcb100.jpg	90	1	2009-09-23 17:27:00
95	2	Od strony tarasu	991d99aada8b00c18456628a756bf14595.jpg	90	1	2009-09-23 17:26:00
47	2	Widok na cały domek - zdjęcie od wykonawcy	c43c68ed9455da72fc656e42cbc1e29747.jpg	6	1	2009-08-21 15:58:00
49	3	Jeszcze jeden widok na całość parteru	bf9040aa3c3d7e7c459779e99366135f49.jpg	6	1	2009-08-25 08:37:00
50	3	Jak wyżej ale od strony garażu	2bbfed9255e891574f2817b8bb32d0cd50.jpg	6	1	2009-08-25 08:37:00
51	3	Wylot kanalizacji - do podłączenia do szamba	1beae6db3fe59572cecad01c4421b50f51.jpg	6	1	2009-08-25 08:38:00
52	4	A tutaj rozprowadzona kanalizacja w łazience - jeszcze nie wiem co autor (wykonawca) miał na myśli robiąc dwie dziury :)	018ce86f042d53cc653d7d06f8f1364d52.jpg	6	1	2009-08-25 08:38:00
1	2	Garaż już stoi. Ogrodzenie w trakcie budowy.	6a60342515df0b39408fb79813f143de1.jpg	1	1	2009-07-27 07:27:00
53	3	Stemple podpierają szalunek.... z bliska wcale nie wyglądają tak licho	0ae0df80babdb0b7aee72cba288f833053.jpg	6	1	2009-08-25 08:38:00
54	3	Inne ujęcie lasu :)	3a21d5beadbdf8d98ca51df00570ba0554.jpg	6	1	2009-08-25 08:38:00
55	3	A to chyba w garażu	065fb0133667d18729fefc72d419eb9d55.jpg	6	1	2009-08-25 08:39:00
56	3	Krzywe nadproże drzwi garażowych	d4aab932a6fae649f351adc4ad2ccbd256.jpg	6	1	2009-08-25 08:39:00
57	3	To będzie nasza jadalnia	dbf64c629cb9a359fa87ab8af9d4917957.jpg	6	1	2009-08-25 08:39:00
58	3	Szalunek pod płytą	36a037ec6af2bd4e9ebca4e8a8a4e34e58.jpg	6	1	2009-08-25 08:39:00
59	3	Szalunek pod płytą cd.	085473aebfcafb8d170bce0540c42e9859.jpg	6	1	2009-08-25 08:39:00
60	4	Balkonik nad tarasem	d54d9695062f68744b978fd6232440ea60.jpg	6	1	2009-08-25 08:40:00
61	5	Widoczek od tyłu	35f1800ec9ecb5769433c75b86477eea61.jpg	6	1	2009-08-25 08:40:00
68	1	Jeszcze widok z bliska	2ea35b39b35e14678a32ec010248581168.jpg	6	1	2009-09-03 20:37:29.097
69	1	I jeszcze z drugiej strony	36e1ea4125d94f2652d43ba8476bae0169.jpg	6	1	2009-09-03 20:38:02.388
119	2	Tak wygląda na razie na poddaszu	db4e19754b8b08732b015f0a0c27f194119.jpg	103	1	2009-10-02 09:51:00
123	2	A to już widok na posprzątaną działkę	47b2a18f7f6772c012bedfd1e1e533a4123.jpg	103	1	2009-10-02 16:44:00
120	2	Woda podłączona - dziury jeszcze nie zakopane czekają na odbiór przez wodociągi	370a3e0d88d277772fda8269cf0799ee120.jpg	103	1	2009-10-02 09:50:00
71	2	Zakopana już prawie cała rura kanalizacyjna i wyrównany teren za domem	82615fa87a4ab026d0434c2a043a4aed71.jpg	70	1	2009-09-03 20:39:00
72	2	Odprowadzenie deszczówki	2281c80676f4239af31b53c2e05991c772.jpg	70	1	2009-09-03 20:40:00
73	2	Tam w rogu ma być studnia na deszczówkę	e0ec716f247b98e4555a86122aa5b5b473.jpg	70	1	2009-09-03 20:40:00
74	3	Tutaj ma być studnia z kręgów do której będzie się zbierać deszczówka	7f624e4b11f4f463f8da04bb5f820d1f74.jpg	70	1	2009-09-03 20:41:00
96	2	Tutaj będzie salon	050fd37f988c71e9de07e77ecd35b70496.jpg	90	1	2009-09-23 17:26:00
122	3	Wyrównywanie terenu koparką	840d549b1a9d11a832f9d2c3348d1f1d122.jpg	103	1	2009-10-02 09:53:00
121	2	67	e11d06f132f598c46e4a24ad08ecbc85121.jpg	103	1	2009-10-02 09:54:00
117	6	Szambo już podłączone.	80e0c4188ba243b1ba00e0c9f3f957c0117.jpg	103	1	2009-10-02 09:52:00
115	2	Widać już wejścia z balkonu do pokojów	76a17699c2281872ff912dbe04818b08115.jpg	103	1	2009-10-02 09:49:00
116	2	A z drugiej strony 'balkonik' w pokoju nad garażem	ee16627a02409db6a71a265392fe0622116.jpg	103	1	2009-10-02 09:49:00
118	2	Kawałek działki za domem	2426bf22e1ed0ce074fe3b20f93af6a1118.jpg	103	1	2009-10-02 09:55:00
\.


--
-- Name: comment_pkey; Type: CONSTRAINT; Schema: public; Owner: grails; Tablespace: 
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (id);


--
-- Name: folder_pkey; Type: CONSTRAINT; Schema: public; Owner: grails; Tablespace: 
--

ALTER TABLE ONLY folder
    ADD CONSTRAINT folder_pkey PRIMARY KEY (id);


--
-- Name: news_pkey; Type: CONSTRAINT; Schema: public; Owner: grails; Tablespace: 
--

ALTER TABLE ONLY news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);


--
-- Name: people_pkey; Type: CONSTRAINT; Schema: public; Owner: grails; Tablespace: 
--

ALTER TABLE ONLY people
    ADD CONSTRAINT people_pkey PRIMARY KEY (id);


--
-- Name: picture_pkey; Type: CONSTRAINT; Schema: public; Owner: grails; Tablespace: 
--

ALTER TABLE ONLY picture
    ADD CONSTRAINT picture_pkey PRIMARY KEY (id);


--
-- Name: fk338ad3f7634dfa; Type: FK CONSTRAINT; Schema: public; Owner: grails
--

ALTER TABLE ONLY news
    ADD CONSTRAINT fk338ad3f7634dfa FOREIGN KEY (user_id) REFERENCES people(id);


--
-- Name: fk38a5ee5fe38000da; Type: FK CONSTRAINT; Schema: public; Owner: grails
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT fk38a5ee5fe38000da FOREIGN KEY (picture_id) REFERENCES picture(id);


--
-- Name: fk38a5ee5ff7634dfa; Type: FK CONSTRAINT; Schema: public; Owner: grails
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT fk38a5ee5ff7634dfa FOREIGN KEY (user_id) REFERENCES people(id);


--
-- Name: fkdd905cfe9d32df1a; Type: FK CONSTRAINT; Schema: public; Owner: grails
--

ALTER TABLE ONLY picture
    ADD CONSTRAINT fkdd905cfe9d32df1a FOREIGN KEY (folder_id) REFERENCES folder(id);


--
-- Name: fkdd905cfef7634dfa; Type: FK CONSTRAINT; Schema: public; Owner: grails
--

ALTER TABLE ONLY picture
    ADD CONSTRAINT fkdd905cfef7634dfa FOREIGN KEY (user_id) REFERENCES people(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

