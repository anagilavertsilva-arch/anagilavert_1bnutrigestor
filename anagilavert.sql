--
-- PostgreSQL database dump
--

\restrict k655gWsrDVsBFezrJLsLIxp8r096C7j8VSlfAks8JNFd3V2NTHc6u3BwQzX6oe7

-- Dumped from database version 16.13 (Ubuntu 16.13-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.13 (Ubuntu 16.13-0ubuntu0.24.04.1)

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
-- Name: alunos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alunos (
    id integer NOT NULL,
    nome character varying(100) NOT NULL,
    serie character varying(10) NOT NULL
);


ALTER TABLE public.alunos OWNER TO postgres;

--
-- Name: alunos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.alunos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.alunos_id_seq OWNER TO postgres;

--
-- Name: alunos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alunos_id_seq OWNED BY public.alunos.id;


--
-- Name: cardapio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cardapio (
    id integer NOT NULL,
    data date NOT NULL,
    descricao character varying(200) NOT NULL,
    itens_utilizados text
);


ALTER TABLE public.cardapio OWNER TO postgres;

--
-- Name: cardapio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cardapio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cardapio_id_seq OWNER TO postgres;

--
-- Name: cardapio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cardapio_id_seq OWNED BY public.cardapio.id;


--
-- Name: desperdicio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.desperdicio (
    id_cardapio integer NOT NULL,
    dt_merenda timestamp without time zone NOT NULL,
    peso_descartado numeric(8,2) NOT NULL,
    item_mais_rejeitado character varying(100)
);


ALTER TABLE public.desperdicio OWNER TO postgres;

--
-- Name: estoque; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estoque (
    id integer NOT NULL,
    item character varying(100) NOT NULL,
    quantidade numeric(8,2) NOT NULL,
    validade date NOT NULL
);


ALTER TABLE public.estoque OWNER TO postgres;

--
-- Name: estoque_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estoque_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.estoque_id_seq OWNER TO postgres;

--
-- Name: estoque_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estoque_id_seq OWNED BY public.estoque.id;


--
-- Name: item_restricao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item_restricao (
    id_restricao integer NOT NULL,
    id_estoque integer NOT NULL
);


ALTER TABLE public.item_restricao OWNER TO postgres;

--
-- Name: merenda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.merenda (
    id_cardapio integer NOT NULL,
    dt_merenda timestamp without time zone NOT NULL,
    qtd_produzida numeric(8,2) NOT NULL
);


ALTER TABLE public.merenda OWNER TO postgres;

--
-- Name: participacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.participacao (
    id_aluno integer NOT NULL,
    id_cardapio integer NOT NULL,
    dt_merenda timestamp without time zone NOT NULL
);


ALTER TABLE public.participacao OWNER TO postgres;

--
-- Name: restricao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.restricao (
    id integer NOT NULL,
    descricao character varying(50) NOT NULL
);


ALTER TABLE public.restricao OWNER TO postgres;

--
-- Name: restricao_aluno; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.restricao_aluno (
    id_aluno integer NOT NULL,
    id_restricao integer NOT NULL
);


ALTER TABLE public.restricao_aluno OWNER TO postgres;

--
-- Name: restricao_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.restricao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.restricao_id_seq OWNER TO postgres;

--
-- Name: restricao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.restricao_id_seq OWNED BY public.restricao.id;


--
-- Name: alunos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alunos ALTER COLUMN id SET DEFAULT nextval('public.alunos_id_seq'::regclass);


--
-- Name: cardapio id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cardapio ALTER COLUMN id SET DEFAULT nextval('public.cardapio_id_seq'::regclass);


--
-- Name: estoque id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estoque ALTER COLUMN id SET DEFAULT nextval('public.estoque_id_seq'::regclass);


--
-- Name: restricao id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restricao ALTER COLUMN id SET DEFAULT nextval('public.restricao_id_seq'::regclass);


--
-- Data for Name: alunos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alunos (id, nome, serie) FROM stdin;
1	Aluno A	1B
2	Aluno B	1B
3	Aluno C	1B
4	Ana Clara Silva	6 ano A
5	Bruno Henrique Santos	6 ano A
6	Carla Mendes Oliveira	6 ano B
7	Daniel Costa Ribeiro	6 ano B
8	Eduarda Lima Martins	7 ano A
9	Felipe Gabriel Souza	7 ano A
10	Gabriela Fernandes Lima	7 ano B
11	Heitor Alves Pereira	7 ano B
12	Isabela Rocha Nascimento	8 ano A
13	Jo o Pedro Carvalho	8 ano A
14	Kauan Dias Barbosa	8 ano B
15	Lara Beatriz Castro	8 ano B
16	Lucas Gabriel Ara jo	9 ano A
17	Mariana Cardoso Freitas	9 ano A
18	Nicolas Moreira Machado	9 ano B
19	Olivia Monteiro Ramos	9 ano B
20	Paulo Roberto Teixeira	1 EM A
21	Rafaela Gomes Vieira	1 EM A
22	Samuel Victor Correia	1 EM B
23	Sofia Helena Duarte	1 EM B
24	Thiago Augusto Nunes	2 EM A
25	Valentina Soares Campos	2 EM A
26	Vinicius Eduardo Marques	2 EM B
27	Yasmin Alessandra Lopes	2 EM B
28	Arthur Guilherme Santana	3 EM A
29	Beatriz Vitoria Medeiros	3 EM A
30	Caio Felipe Andrade	3 EM B
31	David Lucca Silveira	3 EM B
32	Emma Carolina Farias	6 ano A
33	Enzo Gabriel Guimaraes	6 ano A
34	Fernanda Luisa Peixoto	6 ano B
35	Gabriel Vinicius Franco	6 ano B
36	Giovanna Maria Aguiar	7 ano A
37	Guilherme Henrique Fonseca	7 ano A
38	Igor Matheus Prado	7 ano B
39	Julia Eduarda Xavier	7 ano B
40	Leonardo Augusto Resende	8 ano A
41	Livia Maria Borges	8 ano A
42	Luiz Felipe Monteiro	8 ano B
43	Manuela Vitoria Assis	8 ano B
44	Matheus Henrique Bueno	9 ano A
45	Natalia Cristina Antunes	9 ano A
46	Pedro Henrique Camargo	9 ano B
47	Rebeca Sofia Sales	9 ano B
48	Rodrigo Emanuel Nogueira	1 EM A
49	Sarah Regina Pires	1 EM B
50	Vitor Hugo Barreto	2 EM A
51	Ana Clara Silva	6º ano A
52	Bruno Henrique Santos	6º ano A
53	Carla Mendes Oliveira	6º ano B
54	Daniel Costa Ribeiro	6º ano B
55	Eduarda Lima Martins	7º ano A
56	Felipe Gabriel Souza	7º ano A
57	Gabriela Fernandes Lima	7º ano B
58	Heitor Alves Pereira	7º ano B
59	Isabela Rocha Nascimento	8º ano A
60	João Pedro Carvalho	8º ano A
61	Kauan Dias Barbosa	8º ano B
62	Lara Beatriz Castro	8º ano B
63	Lucas Gabriel Araújo	9º ano A
64	Mariana Cardoso Freitas	9º ano A
65	Nicolas Moreira Machado	9º ano B
66	Olivia Monteiro Ramos	9º ano B
67	Paulo Roberto Teixeira	1 EM A
68	Rafaela Gomes Vieira	1 EM A
69	Samuel Victor Correia	1 EM B
70	Sofia Helena Duarte	1 EM B
71	Thiago Augusto Nunes	2 EM A
72	Valentina Soares Campos	2 EM A
73	Vinicius Eduardo Marques	2 EM B
74	Yasmin Alessandra Lopes	2 EM B
75	Arthur Guilherme Santana	3 EM A
76	Beatriz Vitoria Medeiros	3 EM A
77	Caio Felipe Andrade	3 EM B
78	David Lucca Silveira	3 EM B
79	Emma Carolina Farias	6º ano A
80	Enzo Gabriel Guimaraes	6º ano A
81	Fernanda Luisa Peixoto	6º ano B
82	Gabriel Vinicius Franco	6º ano B
83	Giovanna Maria Aguiar	7º ano A
84	Guilherme Henrique Fonseca	7º ano A
85	Igor Matheus Prado	7º ano B
86	Julia Eduarda Xavier	7º ano B
87	Leonardo Augusto Resende	8º ano A
88	Livia Maria Borges	8º ano A
89	Luiz Felipe Monteiro	8º ano B
90	Manuela Vitoria Assis	8º ano B
91	Matheus Henrique Bueno	9º ano A
92	Natalia Cristina Antunes	9º ano A
93	Pedro Henrique Camargo	9º ano B
94	Rebeca Sofia Sales	9º ano B
95	Rodrigo Emanuel Nogueira	1 EM A
96	Sarah Regina Pires	1 EM B
97	Vitor Hugo Barreto	2 EM A
98	Ana Clara Silva	6 ano A
99	Bruno Henrique Santos	6 ano A
100	Carla Mendes Oliveira	6 ano B
101	Daniel Costa Ribeiro	6 ano B
102	Eduarda Lima Martins	7 ano A
103	Felipe Gabriel Souza	7 ano A
104	Gabriela Fernandes Lima	7 ano B
105	Heitor Alves Pereira	7 ano B
106	Isabela Rocha Nascimento	8 ano A
107	João Pedro Carvalho	8 ano A
108	Kauan Dias Barbosa	8 ano B
109	Lara Beatriz Castro	8 ano B
110	Lucas Gabriel Araújo	9 ano A
111	Mariana Cardoso Freitas	9 ano A
112	Nicolas Moreira Machado	9 ano B
113	Olivia Monteiro Ramos	9 ano B
114	Paulo Roberto Teixeira	1 EM A
115	Rafaela Gomes Vieira	1 EM A
116	Samuel Victor Correia	1 EM B
117	Sofia Helena Duarte	1 EM B
118	Thiago Augusto Nunes	2 EM A
119	Valentina Soares Campos	2 EM A
120	Vinicius Eduardo Marques	2 EM B
121	Yasmin Alessandra Lopes	2 EM B
122	Arthur Guilherme Santana	3 EM A
123	Beatriz Vitoria Medeiros	3 EM A
124	Caio Felipe Andrade	3 EM B
125	David Lucca Silveira	3 EM B
126	Emma Carolina Farias	6 ano A
127	Enzo Gabriel Guimaraes	6 ano A
128	Fernanda Luisa Peixoto	6 ano B
129	Gabriel Vinicius Franco	6 ano B
130	Giovanna Maria Aguiar	7 ano A
131	Guilherme Henrique Fonseca	7 ano A
132	Igor Matheus Prado	7 ano B
133	Julia Eduarda Xavier	7 ano B
134	Leonardo Augusto Resende	8 ano A
135	Livia Maria Borges	8 ano A
136	Luiz Felipe Monteiro	8 ano B
137	Manuela Vitoria Assis	8 ano B
138	Matheus Henrique Bueno	9 ano A
139	Natalia Cristina Antunes	9 ano A
140	Pedro Henrique Camargo	9 ano B
141	Rebeca Sofia Sales	9 ano B
142	Rodrigo Emanuel Nogueira	1 EM A
143	Sarah Regina Pires	1 EM B
144	Vitor Hugo Barreto	2 EM A
145	Ana Clara Silva	6 ano A
146	Bruno Henrique Santos	6 ano A
147	Carla Mendes Oliveira	6 ano B
148	Daniel Costa Ribeiro	6 ano B
149	Eduarda Lima Martins	7 ano A
150	Felipe Gabriel Souza	7 ano A
151	Gabriela Fernandes Lima	7 ano B
152	Heitor Alves Pereira	7 ano B
153	Isabela Rocha Nascimento	8 ano A
154	João Pedro Carvalho	8 ano A
155	Kauan Dias Barbosa	8 ano B
156	Lara Beatriz Castro	8 ano B
157	Lucas Gabriel Araújo	9 ano A
158	Mariana Cardoso Freitas	9 ano A
159	Nicolas Moreira Machado	9 ano B
160	Olivia Monteiro Ramos	9 ano B
161	Paulo Roberto Teixeira	1 EM A
162	Rafaela Gomes Vieira	1 EM A
163	Samuel Victor Correia	1 EM B
164	Sofia Helena Duarte	1 EM B
165	Thiago Augusto Nunes	2 EM A
166	Valentina Soares Campos	2 EM A
167	Vinicius Eduardo Marques	2 EM B
168	Yasmin Alessandra Lopes	2 EM B
169	Arthur Guilherme Santana	3 EM A
170	Beatriz Vitoria Medeiros	3 EM A
171	Caio Felipe Andrade	3 EM B
172	David Lucca Silveira	3 EM B
173	Emma Carolina Farias	6 ano A
174	Enzo Gabriel Guimaraes	6 ano A
175	Fernanda Luisa Peixoto	6 ano B
176	Gabriel Vinicius Franco	6 ano B
177	Giovanna Maria Aguiar	7 ano A
178	Guilherme Henrique Fonseca	7 ano A
179	Igor Matheus Prado	7 ano B
180	Julia Eduarda Xavier	7 ano B
181	Leonardo Augusto Resende	8 ano A
182	Livia Maria Borges	8 ano A
183	Luiz Felipe Monteiro	8 ano B
184	Manuela Vitoria Assis	8 ano B
185	Matheus Henrique Bueno	9 ano A
186	Natalia Cristina Antunes	9 ano A
187	Pedro Henrique Camargo	9 ano B
188	Rebeca Sofia Sales	9 ano B
189	Rodrigo Emanuel Nogueira	1 EM A
190	Sarah Regina Pires	1 EM B
191	Vitor Hugo Barreto	2 EM A
192	Ana Clara Silva	6 ano A
193	Bruno Henrique Santos	6 ano A
194	Carla Mendes Oliveira	6 ano B
195	Daniel Costa Ribeiro	6 ano B
196	Eduarda Lima Martins	7 ano A
197	Felipe Gabriel Souza	7 ano A
198	Gabriela Fernandes Lima	7 ano B
199	Heitor Alves Pereira	7 ano B
200	Isabela Rocha Nascimento	8 ano A
201	João Pedro Carvalho	8 ano A
202	Kauan Dias Barbosa	8 ano B
203	Lara Beatriz Castro	8 ano B
204	Lucas Gabriel Araújo	9 ano A
205	Mariana Cardoso Freitas	9 ano A
206	Nicolas Moreira Machado	9 ano B
207	Olivia Monteiro Ramos	9 ano B
208	Paulo Roberto Teixeira	1 EM A
209	Rafaela Gomes Vieira	1 EM A
210	Samuel Victor Correia	1 EM B
211	Sofia Helena Duarte	1 EM B
212	Thiago Augusto Nunes	2 EM A
213	Valentina Soares Campos	2 EM A
214	Vinicius Eduardo Marques	2 EM B
215	Yasmin Alessandra Lopes	2 EM B
216	Arthur Guilherme Santana	3 EM A
217	Beatriz Vitoria Medeiros	3 EM A
218	Caio Felipe Andrade	3 EM B
219	David Lucca Silveira	3 EM B
220	Emma Carolina Farias	6 ano A
221	Enzo Gabriel Guimaraes	6 ano A
222	Fernanda Luisa Peixoto	6 ano B
223	Gabriel Vinicius Franco	6 ano B
224	Giovanna Maria Aguiar	7 ano A
225	Guilherme Henrique Fonseca	7 ano A
226	Igor Matheus Prado	7 ano B
227	Julia Eduarda Xavier	7 ano B
228	Leonardo Augusto Resende	8 ano A
229	Livia Maria Borges	8 ano A
230	Luiz Felipe Monteiro	8 ano B
231	Manuela Vitoria Assis	8 ano B
232	Matheus Henrique Bueno	9 ano A
233	Natalia Cristina Antunes	9 ano A
234	Pedro Henrique Camargo	9 ano B
235	Rebeca Sofia Sales	9 ano B
236	Rodrigo Emanuel Nogueira	1 EM A
237	Sarah Regina Pires	1 EM B
238	Vitor Hugo Barreto	2 EM A
\.


--
-- Data for Name: cardapio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cardapio (id, data, descricao, itens_utilizados) FROM stdin;
1	2026-06-29	arroz temperado	arroz e legumes
2	2026-06-30	macarrao	macarrao e carne moida
3	2026-07-01	arroz carreteiro	arroz e carne seca
4	2026-08-03	Arroz integral, feijão carioca, peito de frango grelhado e salada de alface com tomate.	Arroz Integral, Feijão Carioca, Peito de Frango Congelado, Alface Crespa, Tomate, Óleo de Soja, Sal Refinado
5	2026-08-04	Macarrão espaguete ao molho bolonhesa e banana de sobremesa.	Macarrão Espaguete, Carne Moída (Patinho), Extrato de Tomate, Cebola, Alho Descascado, Banana Prata
6	2026-08-05	Arroz, feijão preto, omelete com queijo e salada de repolho.	Arroz Integral, Feijão Preto, Ovos Brancos (Dúzias), Queijo Mussarela, Repolho Verde, Azeite de Oliva Extra Virgem
7	2026-08-06	Sopa de legumes com frango desfiado e pão de forma integral.	Batata Inglesa, Cenoura fresca, Chuchu, Peito de Frango Congelado, Pão de Forma Integral, Sal Refinado
8	2026-08-07	Galinhada caipira, salada de beterraba e suco de acerola.	Arroz Integral, Peito de Frango Congelado, Cebola, Alho Descascado, Beterraba, Polpa de Acerola, Açúcar Refinado
9	2026-08-10	Arroz, feijão carioca, carne moída ensopada com batata e maçã.	Arroz Integral, Feijão Carioca, Carne Moída (Patinho), Batata Inglesa, Maçã Gala
10	2026-08-11	Macarrão penne integral ao molho de tomate com atum e salada.	Macarrão Penne Integral, Atum em Conserva, Extrato de Tomate, Alface Crespa, Tomate
11	2026-08-12	Arroz, feijão preto, frango assado ao forno e purê de mandioca.	Arroz Integral, Feijão Preto, Peito de Frango Congelado, Farinha de Mandioca, Manteiga com Sal
12	2026-08-13	Risoto de frango com milho e ervilha e suco de caju.	Arroz Integral, Peito de Frango Congelado, Milho Verde em Conserva, Ervilha em Conserva, Suco de Caju Concentrado
13	2026-08-14	Cachorro quente escolar com suco de maracujá e melancia.	Pão Francês (kg), Salsicha para Cachorro Quente, Extrato de Tomate, Polpa de Maracujá, Melancia (kg)
14	2026-08-17	Arroz, feijão carioca, iscas de frango acebolado e salada de cenoura.	Arroz Integral, Feijão Carioca, Peito de Frango Congelado, Cebola, Cenoura fresca
15	2026-08-18	Carne moída com milho, arroz, feijão e laranja pera.	Carne Moída (Patinho), Milho Verde em Conserva, Arroz Integral, Feijão Carioca, Laranja Pera
16	2026-08-19	Sopa de feijão com macarrão e legumes.	Feijão Carioca, Macarrão Espaguete, Batata Inglesa, Cenoura fresca, Cebola
17	2026-08-20	Arroz, feijão preto, fricassê de frango e salada de alface.	Arroz Integral, Feijão Preto, Peito de Frango Congelado, Milho Verde em Conserva, Alface Crespa
18	2026-08-21	Mingau de aveia com banana e biscoito maria no lanche da manhã.	Leite Desnatado (Litros), Aveia em Flocos, Banana Prata, Biscoito Maria, Açúcar Refinado
19	2026-08-24	Arroz integral, feijão, ovos cozidos ao molho e salada de tomate.	Arroz Integral, Feijão Carioca, Ovos Brancos (Dúzias), Extrato de Tomate, Tomate
20	2026-08-03	Arroz integral, feijão carioca, peito de frango grelhado e salada de alface com tomate.	Arroz Integral, Feijão Carioca, Peito de Frango Congelado, Alface Crespa, Tomate, Óleo de Soja, Sal Refinado
21	2026-08-04	Macarrão espaguete ao molho bolonhesa e banana de sobremesa.	Macarrão Espaguete, Carne Moída (Patinho), Extrato de Tomate, Cebola, Alho Descascado, Banana Prata
22	2026-08-05	Arroz, feijão preto, omelete com queijo e salada de repolho.	Arroz Integral, Feijão Preto, Ovos Brancos (Dúzias), Queijo Mussarela, Repolho Verde, Azeite de Oliva Extra Virgem
23	2026-08-06	Sopa de legumes com frango desfiado e pão de forma integral.	Batata Inglesa, Cenoura fresca, Chuchu, Peito de Frango Congelado, Pão de Forma Integral, Sal Refinado
24	2026-08-07	Galinhada caipira, salada de beterraba e suco de acerola.	Arroz Integral, Peito de Frango Congelado, Cebola, Alho Descascado, Beterraba, Polpa de Acerola, Açúcar Refinado
25	2026-08-10	Arroz, feijão carioca, carne moída ensopada com batata e maçã.	Arroz Integral, Feijão Carioca, Carne Moída (Patinho), Batata Inglesa, Maçã Gala
26	2026-08-11	Macarrão penne integral ao molho de tomate com atum e salada.	Macarrão Penne Integral, Atum em Conserva, Extrato de Tomate, Alface Crespa, Tomate
27	2026-08-12	Arroz, feijão preto, frango assado ao forno e purê de mandioca.	Arroz Integral, Feijão Preto, Peito de Frango Congelado, Farinha de Mandioca, Manteiga com Sal
28	2026-08-13	Risoto de frango com milho e ervilha e suco de caju.	Arroz Integral, Peito de Frango Congelado, Milho Verde em Conserva, Ervilha em Conserva, Suco de Caju Concentrado
29	2026-08-14	Cachorro quente escolar com suco de maracujá e melancia.	Pão Francês (kg), Salsicha para Cachorro Quente, Extrato de Tomate, Polpa de Maracujá, Melancia (kg)
30	2026-08-17	Arroz, feijão carioca, iscas de frango acebolado e salada de cenoura.	Arroz Integral, Feijão Carioca, Peito de Frango Congelado, Cebola, Cenoura fresca
31	2026-08-18	Carne moída com milho, arroz, feijão e laranja pera.	Carne Moída (Patinho), Milho Verde em Conserva, Arroz Integral, Feijão Carioca, Laranja Pera
32	2026-08-19	Sopa de feijão com macarrão e legumes.	Feijão Carioca, Macarrão Espaguete, Batata Inglesa, Cenoura fresca, Cebola
33	2026-08-20	Arroz, feijão preto, fricassê de frango e salada de alface.	Arroz Integral, Feijão Preto, Peito de Frango Congelado, Milho Verde em Conserva, Alface Crespa
34	2026-08-21	Mingau de aveia com banana e biscoito maria no lanche da manhã.	Leite Desnatado (Litros), Aveia em Flocos, Banana Prata, Biscoito Maria, Açúcar Refinado
35	2026-08-24	Arroz integral, feijão, ovos cozidos ao molho e salada de tomate.	Arroz Integral, Feijão Carioca, Ovos Brancos (Dúzias), Extrato de Tomate, Tomate
36	2026-08-25	Macarrao ao alho e oleo com frango em cubos e salada de repolho.	Macarrao Espaguete, Alho Descascado, Azeite de Oliva Extra Virgem, Peito de Frango Congelado, Repolho Verde
37	2026-08-26	Escondidinho de carne moida com pure de batata e melao.	Carne Moida (Patinho), Batata Inglesa, Manteiga com Sal, Leite Desnatado (Litros), Melao Amarelo
38	2026-08-27	Arroz, feijao preto, peito de frango grelhado e abobora refogada.	Arroz Integral, Feijao Preto, Peito de Frango Congelado, Abobora Cabotia, Alho Descascado
39	2026-08-28	Pao com pate de atum, iogurte natural e maca.	Pao de Forma Integral, Atum em Conserva, Iogurte Natural, Maca Gala
40	2026-08-31	Arroz, feijao, estrogonofe de frango leve e salada verde.	Arroz Integral, Feijao Carioca, Peito de Frango Congelado, Extrato de Tomate, Alface Crespa
41	2026-09-01	Sopa de fuba com carne moida e couve refogada.	Farinha de Mandioca, Carne Moida (Patinho), Alho Descascado, Sal Refinado
42	2026-09-02	Arroz, feijao preto, omelete de vegetais e salada de beterraba.	Arroz Integral, Feijao Preto, Ovos Brancos (Duzias), Cenoura fresca, Beterraba
43	2026-09-03	Macarrao penne com molho branco e frango desfiado.	Macarrao Penne Integral, Leite Desnatado (Litros), Farinha de Trigo, Manteiga com Sal, Peito de Frango Congelado
44	2026-09-04	Vitamina de banana com aveia e biscoito cream cracker.	Leite Desnatado (Litros), Banana Prata, Aveia em Flocos, Biscoito Cream Cracker
45	2026-09-08	Arroz, feijao carioca, frango xadrez escolar e salada de pepino.	Arroz Integral, Feijao Carioca, Peito de Frango Congelado, Cebola, Tomate
46	2026-09-09	Arroz de forno com legumes, frango e queijo mussarela.	Arroz Integral, Peito de Frango Congelado, Milho Verde em Conserva, Ervilha em Conserva, Queijo Mussarela
47	2026-09-10	Sopa de mandioca com carne moida e cheiro verde.	Farinha de Mandioca, Carne Moida (Patinho), Cebola, Alho Descascado
48	2026-09-11	Lanche especial: pao frances com queijo quente e suco de acerola.	Pao Frances (kg), Queijo Mussarela, Manteiga com Sal, Polpa de Acerola, Acucar Refinado
49	2026-09-14	Arroz, feijao preto, carne moida refogada e salada de chuchu.	Arroz Integral, Feijao Preto, Carne Moida (Patinho), Chuchu, Azeite de Oliva Extra Virgem
50	2026-09-15	Macarrao espaguete ao molho de tomate com sardinha e salada.	Macarrao Espaguete, Sardinha em Conserva, Extrato de Tomate, Alface Crespa
51	2026-09-16	Arroz, feijao, frango ensopado com batata e maca.	Arroz Integral, Feijao Carioca, Peito de Frango Congelado, Batata Inglesa, Maca Gala
52	2026-09-17	Canja de galinha com arroz e legumes cortados em cubos.	Peito de Frango Congelado, Arroz Integral, Cenoura fresca, Batata Inglesa, Cebola
53	2026-09-18	Iogurte natural com banana picada e biscoito maria.	Iogurte Natural, Banana Prata, Biscoito Maria
54	2026-09-21	Arroz, feijao preto, peito de frango grelhado e pure de abobora.	Arroz Integral, Feijao Preto, Peito de Frango Congelado, Abobora Cabotia, Manteiga com Sal
55	2026-09-22	Arroz colorido com legumes, ovos cozidos e salada de tomate.	Arroz Integral, Cenoura fresca, Ervilha em Conserva, Ovos Brancos (Duzias), Tomate
56	2026-09-23	Sopa de legumes com carne moida e torradas de pao frances.	Batata Inglesa, Cenoura fresca, Chuchu, Carne Moida (Patinho), Pao Frances (kg)
57	2026-09-24	Macarrao penne integral ao molho suco com frango.	Macarrao Penne Integral, Leite Desnatado (Litros), Peito de Frango Congelado, Queijo Mussarela
58	2026-09-25	Bolo caseiro simples com suco de maracuja no lanche.	Farinha de Trigo, Ovos Brancos (Duzias), Acucar Refinado, Polpa de Maracuja
59	2026-09-28	Arroz, feijao carioca, carne moida acebolada e salada de repolho com cenoura.	Arroz Integral, Feijao Carioca, Carne Moida (Patinho), Cebola, Repolho Verde, Cenoura fresca
60	2026-09-29	Arroz, feijao preto, frango xadrez leve e banana de sobremesa.	Arroz Integral, Feijao Preto, Peito de Frango Congelado, Cebola, Banana Prata
61	2026-09-30	Sopa de canjiquinha com frango desfiado e legumes.	Peito de Frango Congelado, Cenoura fresca, Batata Inglesa, Sal Refinado
62	2026-10-01	Arroz integral, feijao, omelete de queijo.	Arroz Integral, Feijao Carioca, Ovos Brancos (Duzias), Queijo Mussarela
\.


--
-- Data for Name: desperdicio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.desperdicio (id_cardapio, dt_merenda, peso_descartado, item_mais_rejeitado) FROM stdin;
1	2025-06-23 11:00:00	5.20	salada
2	2025-06-24 11:00:00	8.10	macarrao
3	2025-06-25 11:00:00	4.90	\N
4	2025-06-26 11:00:00	6.30	legumes
5	2025-06-27 11:00:00	3.80	arroz integral
6	2025-06-30 11:00:00	7.50	salada de beterraba
7	2025-07-01 11:00:00	5.10	atum
8	2025-07-02 11:00:00	4.20	pure de mandioca
9	2025-07-03 11:00:00	3.90	ervilha
10	2025-07-04 11:00:00	9.40	salsicha
11	2025-07-07 11:00:00	5.80	salada de cenoura
12	2025-07-08 11:00:00	4.60	carne moida
13	2025-07-09 11:00:00	6.10	sopa de feijao
14	2025-07-10 11:00:00	3.50	fricasse
15	2025-07-11 11:00:00	2.90	mingau de aveia
16	2025-07-14 11:00:00	5.30	ovos cozidos
17	2025-07-15 11:00:00	4.70	repolho verde
18	2025-07-16 11:00:00	3.20	escondidinho
19	2025-07-17 11:00:00	6.80	abobora refogada
20	2025-07-18 11:00:00	2.10	\N
21	2025-07-21 11:00:00	5.50	estrogonofe
22	2025-07-22 11:00:00	6.00	couve refogada
23	2025-07-23 11:00:00	4.30	omelete
24	2025-07-24 11:00:00	5.90	molho branco
25	2025-07-25 11:00:00	3.10	vitamina de banana
26	2025-07-28 11:00:00	4.80	pepino
27	2025-07-29 11:00:00	3.70	arroz de forno
28	2025-07-30 11:00:00	6.40	sopa de mandioca
29	2025-07-31 11:00:00	2.50	\N
30	2025-08-01 11:00:00	5.00	chuchu
31	2025-08-04 11:00:00	4.40	sardinha
32	2025-08-05 11:00:00	5.60	frango ensopado
33	2025-08-06 11:00:00	6.20	canja de galinha
34	2025-08-07 11:00:00	1.80	\N
35	2025-08-08 11:00:00	4.10	pure de abobora
36	2025-08-11 11:00:00	3.60	arroz colorido
37	2025-08-12 11:00:00	5.70	torradas
38	2025-08-13 11:00:00	4.50	macarrao penne
39	2025-08-14 11:00:00	2.80	\N
40	2025-08-15 11:00:00	5.40	salada de repolho
41	2025-08-18 11:00:00	4.00	frango xadrez
42	2025-08-19 11:00:00	6.50	canjiquinha
43	2025-08-20 11:00:00	3.30	omelete de queijo
44	2025-08-21 11:00:00	2.70	\N
45	2025-08-22 11:00:00	4.90	abobora cozida
46	2025-08-25 11:00:00	5.20	macarrao a bolonhesa
47	2025-08-26 11:00:00	3.80	picadinho de carne
\.


--
-- Data for Name: estoque; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estoque (id, item, quantidade, validade) FROM stdin;
1	Arroz	5.00	2026-06-29
2	Feijão	1.00	2026-08-14
3	Farofa	1.00	2026-04-17
4	Arroz Integral	150.00	2026-10-15
5	Feijão Carioca	120.50	2026-09-30
6	Feijão Preto	80.00	2026-11-05
7	Peito de Frango Congelado	95.00	2026-08-20
8	Carne Moída (Patinho)	60.00	2026-08-15
9	Óleo de Soja	45.00	2027-02-10
10	Açúcar Refinado	70.00	2027-05-01
11	Sal Refinado	30.00	2028-01-01
12	Macarrão Espaguete	110.00	2026-12-18
13	Macarrão Penne Integral	50.00	2026-11-22
14	Leite Desnatado (Litros)	200.00	2026-09-10
15	Farinha de Trigo	65.00	2026-10-01
16	Farinha de Mandioca	40.00	2026-12-01
17	Polpa de Acerola	35.00	2026-11-15
18	Polpa de Maracujá	30.00	2026-11-20
19	Banana Prata	85.50	2026-08-05
20	Maçã Gala	90.00	2026-08-10
21	Laranja Pêra	120.00	2026-08-12
22	Cenoura Fresca	45.00	2026-08-08
23	Batata Inglesa	130.00	2026-08-18
24	Cebola	55.00	2026-08-25
25	Alho Descascado	15.00	2026-09-01
26	Tomate	65.00	2026-08-06
27	Alface Crespa	25.00	2026-08-02
28	Repolho Verde	30.00	2026-08-10
29	Ovos Brancos (dúzias)	40.00	2026-08-28
30	Queijo Mussarela	25.50	2026-08-30
31	Manteiga com Sal	18.00	2026-10-10
32	Iogurte Natural	80.00	2026-08-22
33	Aveia em Flocos	35.00	2027-01-15
34	Pão Francês (kg)	40.00	2026-07-28
35	Pão de Forma Integral	30.00	2026-08-04
36	Extrato de Tomate	50.00	2027-03-30
37	Milho Verde em Conserva	40.00	2027-06-15
38	Ervilha em Conserva	35.00	2027-06-15
39	Salsicha para Cachorro Quente	40.00	2026-09-05
40	Biscoito Cream Cracker	60.00	2026-12-01
41	Biscoito Maria	55.00	2026-12-05
42	Suco de Caju Concentrado	40.00	2027-01-20
43	Azeite de Oliva Extra Virgem	12.00	2027-08-10
44	Abóbora Cabotiá	35.00	2026-08-20
45	Chuchu	25.00	2026-08-08
46	Beterraba	40.00	2026-08-15
47	Melancia (kg)	75.00	2026-08-03
48	Melão Amarelo	40.00	2026-08-07
49	Atum em Conserva	45.00	2026-10-10
50	Sardinha em Conserva	50.00	2027-11-01
51	Arroz Integral	150.00	2026-10-15
52	Feijão Carioca	120.50	2026-09-30
53	Feijão Preto	80.00	2026-11-05
54	Peito de Frango Congelado	95.00	2026-08-20
55	Carne Moída (Patinho)	60.00	2026-08-15
56	Óleo de Soja	45.00	2027-02-10
57	Açúcar Refinado	70.00	2027-05-01
58	Sal Refinado	30.00	2028-01-01
59	Macarrão Espaguete	110.00	2026-12-18
60	Macarrão Penne Integral	50.00	2026-11-22
61	Leite Desnatado (Litros)	200.00	2026-09-10
62	Farinha de Trigo	65.00	2026-10-01
63	Farinha de Mandioca	40.00	2026-12-01
64	Polpa de Acerola	35.00	2026-11-15
65	Polpa de Maracujá	30.00	2026-11-20
66	Banana Prata	85.50	2026-08-05
67	Maçã Gala	90.00	2026-08-10
68	Laranja Pera	120.00	2026-08-12
69	Cenoura fresca	45.00	2026-08-08
70	Batata Inglesa	130.00	2026-08-18
71	Cebola	55.00	2026-08-25
72	Alho Descascado	15.00	2026-09-01
73	Tomate	65.00	2026-08-06
74	Alface Crespa	25.00	2026-08-02
75	Repolho Verde	30.00	2026-08-10
76	Ovos Brancos (Dúzias)	40.00	2026-08-28
77	Queijo Mussarela	25.50	2026-08-30
78	Manteiga com Sal	18.00	2026-10-10
79	Iogurte Natural	80.00	2026-08-22
80	Aveia em Flocos	35.00	2027-01-15
81	Pão Francês (kg)	40.00	2026-07-28
82	Pão de Forma Integral	30.00	2026-08-04
83	Extrato de Tomate	50.00	2027-03-30
84	Milho Verde em Conserva	40.00	2027-06-15
85	Ervilha em Conserva	35.00	2027-06-15
86	Salsicha para Cachorro Quente	40.00	2026-09-05
87	Biscoito Cream Cracker	60.00	2026-12-01
88	Biscoito Maria	55.00	2026-12-05
89	Suco de Caju Concentrado	40.00	2027-01-20
90	Azeite de Oliva Extra Virgem	12.00	2027-08-10
91	Abóbora Cabotiá	35.00	2026-08-20
92	Chuchu	25.00	2026-08-08
93	Beterraba	40.00	2026-08-15
94	Melancia (kg)	75.00	2026-08-03
95	Melão Amarelo	40.00	2026-08-07
96	Atum em Conserva	45.00	2027-10-10
97	Sardinha em Conserva	50.00	2027-11-01
98	Arroz Integral	150.00	2026-10-15
99	Feijão Carioca	120.50	2026-09-30
100	Feijão Preto	80.00	2026-11-05
101	Peito de Frango Congelado	95.00	2026-08-20
102	Carne Moída (Patinho)	60.00	2026-08-15
103	Óleo de Soja	45.00	2027-02-10
104	Açúcar Refinado	70.00	2027-05-01
105	Sal Refinado	30.00	2028-01-01
106	Macarrão Espaguete	110.00	2026-12-18
107	Macarrão Penne Integral	50.00	2026-11-22
108	Leite Desnatado (Litros)	200.00	2026-09-10
109	Farinha de Trigo	65.00	2026-10-01
110	Farinha de Mandioca	40.00	2026-12-01
111	Polpa de Acerola	35.00	2026-11-15
112	Polpa de Maracujá	30.00	2026-11-20
113	Banana Prata	85.50	2026-08-05
114	Maçã Gala	90.00	2026-08-10
115	Laranja Pera	120.00	2026-08-12
116	Cenoura fresca	45.00	2026-08-08
117	Batata Inglesa	130.00	2026-08-18
118	Cebola	55.00	2026-08-25
119	Alho Descascado	15.00	2026-09-01
120	Tomate	65.00	2026-08-06
121	Alface Crespa	25.00	2026-08-02
122	Repolho Verde	30.00	2026-08-10
123	Ovos Brancos (Dúzias)	40.00	2026-08-28
124	Queijo Mussarela	25.50	2026-08-30
125	Manteiga com Sal	18.00	2026-10-10
126	Iogurte Natural	80.00	2026-08-22
127	Aveia em Flocos	35.00	2027-01-15
128	Pão Francês (kg)	40.00	2026-07-28
129	Pão de Forma Integral	30.00	2026-08-04
130	Extrato de Tomate	50.00	2027-03-30
131	Milho Verde em Conserva	40.00	2027-06-15
132	Ervilha em Conserva	35.00	2027-06-15
133	Salsicha para Cachorro Quente	40.00	2026-09-05
134	Biscoito Cream Cracker	60.00	2026-12-01
135	Biscoito Maria	55.00	2026-12-05
136	Suco de Caju Concentrado	40.00	2027-01-20
137	Azeite de Oliva Extra Virgem	12.00	2027-08-10
138	Abóbora Cabotiá	35.00	2026-08-20
139	Chuchu	25.00	2026-08-08
140	Beterraba	40.00	2026-08-15
141	Melancia (kg)	75.00	2026-08-03
142	Melão Amarelo	40.00	2026-08-07
143	Atum em Conserva	45.00	2027-10-10
144	Sardinha em Conserva	50.00	2027-11-01
145	Arroz Integral	150.00	2026-10-15
146	Feijão Carioca	120.50	2026-09-30
147	Feijão Preto	80.00	2026-11-05
148	Peito de Frango Congelado	95.00	2026-08-20
149	Carne Moída (Patinho)	60.00	2026-08-15
150	Óleo de Soja	45.00	2027-02-10
151	Açúcar Refinado	70.00	2027-05-01
152	Sal Refinado	30.00	2028-01-01
153	Macarrão Espaguete	110.00	2026-12-18
154	Macarrão Penne Integral	50.00	2026-11-22
155	Leite Desnatado (Litros)	200.00	2026-09-10
156	Farinha de Trigo	65.00	2026-10-01
157	Farinha de Mandioca	40.00	2026-12-01
158	Polpa de Acerola	35.00	2026-11-15
159	Polpa de Maracujá	30.00	2026-11-20
160	Banana Prata	85.50	2026-08-05
161	Maçã Gala	90.00	2026-08-10
162	Laranja Pera	120.00	2026-08-12
163	Cenoura fresca	45.00	2026-08-08
164	Batata Inglesa	130.00	2026-08-18
165	Cebola	55.00	2026-08-25
166	Alho Descascado	15.00	2026-09-01
167	Tomate	65.00	2026-08-06
168	Alface Crespa	25.00	2026-08-02
169	Repolho Verde	30.00	2026-08-10
170	Ovos Brancos (Dúzias)	40.00	2026-08-28
171	Queijo Mussarela	25.50	2026-08-30
172	Manteiga com Sal	18.00	2026-10-10
173	Iogurte Natural	80.00	2026-08-22
174	Aveia em Flocos	35.00	2027-01-15
175	Pão Francês (kg)	40.00	2026-07-28
176	Pão de Forma Integral	30.00	2026-08-04
177	Extrato de Tomate	50.00	2027-03-30
178	Milho Verde em Conserva	40.00	2027-06-15
179	Ervilha em Conserva	35.00	2027-06-15
180	Salsicha para Cachorro Quente	40.00	2026-09-05
181	Biscoito Cream Cracker	60.00	2026-12-01
182	Biscoito Maria	55.00	2026-12-05
183	Suco de Caju Concentrado	40.00	2027-01-20
184	Azeite de Oliva Extra Virgem	12.00	2027-08-10
185	Abóbora Cabotiá	35.00	2026-08-20
186	Chuchu	25.00	2026-08-08
187	Beterraba	40.00	2026-08-15
188	Melancia (kg)	75.00	2026-08-03
189	Melão Amarelo	40.00	2026-08-07
190	Atum em Conserva	45.00	2027-10-10
191	Sardinha em Conserva	50.00	2027-11-01
192	Arroz Integral	150.00	2026-10-15
193	Feijão Carioca	120.50	2026-09-30
194	Feijão Preto	80.00	2026-11-05
195	Peito de Frango Congelado	95.00	2026-08-20
196	Carne Moída (Patinho)	60.00	2026-08-15
197	Óleo de Soja	45.00	2027-02-10
198	Açúcar Refinado	70.00	2027-05-01
199	Sal Refinado	30.00	2028-01-01
200	Macarrão Espaguete	110.00	2026-12-18
201	Macarrão Penne Integral	50.00	2026-11-22
202	Leite Desnatado (Litros)	200.00	2026-09-10
203	Farinha de Trigo	65.00	2026-10-01
204	Farinha de Mandioca	40.00	2026-12-01
205	Polpa de Acerola	35.00	2026-11-15
206	Polpa de Maracujá	30.00	2026-11-20
207	Banana Prata	85.50	2026-08-05
208	Maçã Gala	90.00	2026-08-10
209	Laranja Pera	120.00	2026-08-12
210	Cenoura fresca	45.00	2026-08-08
211	Batata Inglesa	130.00	2026-08-18
212	Cebola	55.00	2026-08-25
213	Alho Descascado	15.00	2026-09-01
214	Tomate	65.00	2026-08-06
215	Alface Crespa	25.00	2026-08-02
216	Repolho Verde	30.00	2026-08-10
217	Ovos Brancos (Dúzias)	40.00	2026-08-28
218	Queijo Mussarela	25.50	2026-08-30
219	Manteiga com Sal	18.00	2026-10-10
220	Iogurte Natural	80.00	2026-08-22
221	Aveia em Flocos	35.00	2027-01-15
222	Pão Francês (kg)	40.00	2026-07-28
223	Pão de Forma Integral	30.00	2026-08-04
224	Extrato de Tomate	50.00	2027-03-30
225	Milho Verde em Conserva	40.00	2027-06-15
226	Ervilha em Conserva	35.00	2027-06-15
227	Salsicha para Cachorro Quente	40.00	2026-09-05
228	Biscoito Cream Cracker	60.00	2026-12-01
229	Biscoito Maria	55.00	2026-12-05
230	Suco de Caju Concentrado	40.00	2027-01-20
231	Azeite de Oliva Extra Virgem	12.00	2027-08-10
232	Abóbora Cabotiá	35.00	2026-08-20
233	Chuchu	25.00	2026-08-08
234	Beterraba	40.00	2026-08-15
235	Melancia (kg)	75.00	2026-08-03
236	Melão Amarelo	40.00	2026-08-07
237	Atum em Conserva	45.00	2027-10-10
238	Sardinha em Conserva	50.00	2027-11-01
\.


--
-- Data for Name: item_restricao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.item_restricao (id_restricao, id_estoque) FROM stdin;
1	11
1	27
1	28
1	29
2	9
2	10
2	12
2	31
2	32
2	37
2	38
3	26
4	26
4	27
4	36
1	1
1	2
1	3
2	4
2	5
3	7
3	8
4	13
4	14
4	15
1	19
1	20
2	21
2	22
3	23
3	24
4	25
4	30
1	35
2	39
3	41
4	42
1	46
2	47
\.


--
-- Data for Name: merenda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.merenda (id_cardapio, dt_merenda, qtd_produzida) FROM stdin;
1	2025-06-23 11:00:00	120.00
2	2025-06-24 11:00:00	115.50
3	2025-06-25 11:00:00	118.00
4	2025-06-26 11:00:00	122.00
5	2025-06-27 11:00:00	110.00
6	2025-06-30 11:00:00	125.00
7	2025-07-01 11:00:00	117.50
8	2025-07-02 11:00:00	119.00
9	2025-07-03 11:00:00	121.00
10	2025-07-04 11:00:00	130.00
11	2025-07-07 11:00:00	114.00
12	2025-07-08 11:00:00	116.00
13	2025-07-09 11:00:00	108.50
14	2025-07-10 11:00:00	123.00
15	2025-07-11 11:00:00	105.00
16	2025-07-14 11:00:00	118.50
17	2025-07-15 11:00:00	120.00
18	2025-07-16 11:00:00	112.00
19	2025-07-17 11:00:00	119.50
20	2025-07-18 11:00:00	102.00
21	2025-07-21 11:00:00	124.00
22	2025-07-22 11:00:00	110.00
23	2025-07-23 11:00:00	116.50
24	2025-07-24 11:00:00	121.50
25	2025-07-25 11:00:00	106.00
26	2025-07-28 11:00:00	122.50
27	2025-07-29 11:00:00	128.00
28	2025-07-30 11:00:00	111.00
29	2025-07-31 11:00:00	115.00
30	2025-08-01 11:00:00	117.00
31	2025-08-04 11:00:00	119.00
32	2025-08-05 11:00:00	120.50
33	2025-08-06 11:00:00	113.00
34	2025-08-07 11:00:00	104.00
35	2025-08-08 11:00:00	121.00
36	2025-08-11 11:00:00	118.00
37	2025-08-12 11:00:00	109.50
38	2025-08-13 11:00:00	122.00
39	2025-08-14 11:00:00	110.00
40	2025-08-15 11:00:00	116.00
41	2025-08-18 11:00:00	114.50
42	2025-08-19 11:00:00	107.00
43	2025-08-20 11:00:00	123.50
44	2025-08-21 11:00:00	108.00
45	2025-08-22 11:00:00	117.00
46	2025-08-25 11:00:00	125.00
47	2025-08-26 11:00:00	119.00
\.


--
-- Data for Name: participacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.participacao (id_aluno, id_cardapio, dt_merenda) FROM stdin;
1	1	2025-06-23 11:00:00
2	1	2025-06-23 11:00:00
3	1	2025-06-23 11:00:00
1	2	2025-06-24 11:00:00
2	2	2025-06-24 11:00:00
4	3	2025-06-25 11:00:00
5	3	2025-06-25 11:00:00
6	4	2025-06-26 11:00:00
7	4	2025-06-26 11:00:00
8	5	2025-06-27 11:00:00
9	6	2025-06-30 11:00:00
10	6	2025-06-30 11:00:00
11	7	2025-07-01 11:00:00
12	7	2025-07-01 11:00:00
13	8	2025-07-02 11:00:00
14	9	2025-07-03 11:00:00
15	10	2025-07-04 11:00:00
16	10	2025-07-04 11:00:00
17	11	2025-07-07 11:00:00
18	12	2025-07-08 11:00:00
19	13	2025-07-09 11:00:00
20	14	2025-07-10 11:00:00
21	15	2025-07-11 11:00:00
22	16	2025-07-14 11:00:00
23	17	2025-07-15 11:00:00
24	18	2025-07-16 11:00:00
25	19	2025-07-17 11:00:00
26	20	2025-07-18 11:00:00
27	21	2025-07-21 11:00:00
28	22	2025-07-22 11:00:00
29	23	2025-07-23 11:00:00
30	24	2025-07-24 11:00:00
31	25	2025-07-25 11:00:00
32	26	2025-07-28 11:00:00
33	27	2025-07-29 11:00:00
34	28	2025-07-30 11:00:00
35	29	2025-07-31 11:00:00
36	30	2025-08-01 11:00:00
37	31	2025-08-04 11:00:00
38	32	2025-08-05 11:00:00
39	33	2025-08-06 11:00:00
40	34	2025-08-07 11:00:00
41	35	2025-08-08 11:00:00
42	36	2025-08-11 11:00:00
43	37	2025-08-12 11:00:00
44	38	2025-08-13 11:00:00
45	39	2025-08-14 11:00:00
\.


--
-- Data for Name: restricao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.restricao (id, descricao) FROM stdin;
1	lactose
2	gluten
3	amendoim
4	ovo
13	soja
14	castanhas
15	nozes
16	peixe
17	frutos do mar
18	gergelim
19	milho
20	corantes
21	conservantes
22	leite
\.


--
-- Data for Name: restricao_aluno; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.restricao_aluno (id_aluno, id_restricao) FROM stdin;
1	1
1	2
2	3
3	1
4	4
5	2
6	1
8	3
9	2
10	4
11	1
12	1
12	3
13	2
15	4
16	1
17	3
18	2
19	1
21	2
22	4
23	1
24	3
25	1
25	2
27	4
28	2
29	1
30	3
32	2
33	4
34	1
35	3
36	2
37	1
39	4
40	2
41	1
42	3
44	2
\.


--
-- Name: alunos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.alunos_id_seq', 238, true);


--
-- Name: cardapio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cardapio_id_seq', 62, true);


--
-- Name: estoque_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estoque_id_seq', 238, true);


--
-- Name: restricao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.restricao_id_seq', 32, true);


--
-- Name: alunos alunos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alunos
    ADD CONSTRAINT alunos_pkey PRIMARY KEY (id);


--
-- Name: cardapio cardapio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cardapio
    ADD CONSTRAINT cardapio_pkey PRIMARY KEY (id);


--
-- Name: estoque estoque_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estoque
    ADD CONSTRAINT estoque_pkey PRIMARY KEY (id);


--
-- Name: desperdicio pk_desperdicio; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.desperdicio
    ADD CONSTRAINT pk_desperdicio PRIMARY KEY (id_cardapio, dt_merenda);


--
-- Name: item_restricao pk_item_restricao; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_restricao
    ADD CONSTRAINT pk_item_restricao PRIMARY KEY (id_restricao, id_estoque);


--
-- Name: merenda pk_merenda; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merenda
    ADD CONSTRAINT pk_merenda PRIMARY KEY (id_cardapio, dt_merenda);


--
-- Name: participacao pk_participacao; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.participacao
    ADD CONSTRAINT pk_participacao PRIMARY KEY (id_aluno, id_cardapio, dt_merenda);


--
-- Name: restricao_aluno pk_restricao_aluno; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restricao_aluno
    ADD CONSTRAINT pk_restricao_aluno PRIMARY KEY (id_aluno, id_restricao);


--
-- Name: restricao restricao_descricao_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restricao
    ADD CONSTRAINT restricao_descricao_key UNIQUE (descricao);


--
-- Name: restricao restricao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restricao
    ADD CONSTRAINT restricao_pkey PRIMARY KEY (id);


--
-- Name: idx_desp_merenda; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_desp_merenda ON public.desperdicio USING btree (id_cardapio, dt_merenda);


--
-- Name: idx_ir_restricao; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ir_restricao ON public.item_restricao USING btree (id_restricao);


--
-- Name: idx_part_aluno; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_part_aluno ON public.participacao USING btree (id_aluno);


--
-- Name: idx_part_merenda; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_part_merenda ON public.participacao USING btree (id_cardapio, dt_merenda);


--
-- Name: idx_ra_aluno; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ra_aluno ON public.restricao_aluno USING btree (id_aluno);


--
-- Name: desperdicio fk_desp_merenda; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.desperdicio
    ADD CONSTRAINT fk_desp_merenda FOREIGN KEY (id_cardapio, dt_merenda) REFERENCES public.merenda(id_cardapio, dt_merenda) ON DELETE CASCADE;


--
-- Name: item_restricao fk_ir_estoque; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_restricao
    ADD CONSTRAINT fk_ir_estoque FOREIGN KEY (id_estoque) REFERENCES public.estoque(id) ON DELETE CASCADE;


--
-- Name: item_restricao fk_ir_restricao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_restricao
    ADD CONSTRAINT fk_ir_restricao FOREIGN KEY (id_restricao) REFERENCES public.restricao(id) ON DELETE CASCADE;


--
-- Name: merenda fk_merenda_cardapio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.merenda
    ADD CONSTRAINT fk_merenda_cardapio FOREIGN KEY (id_cardapio) REFERENCES public.cardapio(id) ON DELETE RESTRICT;


--
-- Name: participacao fk_part_aluno; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.participacao
    ADD CONSTRAINT fk_part_aluno FOREIGN KEY (id_aluno) REFERENCES public.alunos(id) ON DELETE RESTRICT;


--
-- Name: participacao fk_part_merenda; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.participacao
    ADD CONSTRAINT fk_part_merenda FOREIGN KEY (id_cardapio, dt_merenda) REFERENCES public.merenda(id_cardapio, dt_merenda) ON DELETE CASCADE;


--
-- Name: restricao_aluno fk_ra_aluno; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restricao_aluno
    ADD CONSTRAINT fk_ra_aluno FOREIGN KEY (id_aluno) REFERENCES public.alunos(id) ON DELETE CASCADE;


--
-- Name: restricao_aluno fk_ra_restricao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restricao_aluno
    ADD CONSTRAINT fk_ra_restricao FOREIGN KEY (id_restricao) REFERENCES public.restricao(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict k655gWsrDVsBFezrJLsLIxp8r096C7j8VSlfAks8JNFd3V2NTHc6u3BwQzX6oe7

