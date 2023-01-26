PGDMP     "                    z            TEAM_1_JCC_DB    15.1    15.1 �    �           0    0    ENCODING    ENCODING     #   SET client_encoding = 'SQL_ASCII';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16394    TEAM_1_JCC_DB    DATABASE     �   CREATE DATABASE "TEAM_1_JCC_DB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Croatian_Croatia.1252';
    DROP DATABASE "TEAM_1_JCC_DB";
                postgres    false            �            1259    16399    address    TABLE     �   CREATE TABLE public.address (
    address_id integer NOT NULL,
    house_number text NOT NULL,
    street_id integer NOT NULL
);
    DROP TABLE public.address;
       public         heap    postgres    false            �            1259    16404    address_id_seq    SEQUENCE     w   CREATE SEQUENCE public.address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.address_id_seq;
       public          postgres    false    214            �           0    0    address_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.address_id_seq OWNED BY public.address.address_id;
          public          postgres    false    215            �            1259    16405    country    TABLE     X   CREATE TABLE public.country (
    country_id integer NOT NULL,
    country_name text
);
    DROP TABLE public.country;
       public         heap    postgres    false            �            1259    16410    country_id_seq    SEQUENCE     w   CREATE SEQUENCE public.country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.country_id_seq;
       public          postgres    false    216            �           0    0    country_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.country_id_seq OWNED BY public.country.country_id;
          public          postgres    false    217            �            1259    16411    maintenance_report    TABLE     �   CREATE TABLE public.maintenance_report (
    maintenance_report_id integer NOT NULL,
    maintenance_type_id integer NOT NULL,
    maintenance_date date NOT NULL
);
 &   DROP TABLE public.maintenance_report;
       public         heap    postgres    false            �            1259    16414 ,   maintenance_report_maintenance_report_id_seq    SEQUENCE     �   CREATE SEQUENCE public.maintenance_report_maintenance_report_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE public.maintenance_report_maintenance_report_id_seq;
       public          postgres    false    218            �           0    0 ,   maintenance_report_maintenance_report_id_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public.maintenance_report_maintenance_report_id_seq OWNED BY public.maintenance_report.maintenance_report_id;
          public          postgres    false    219            �            1259    16415    maintenance_report_property    TABLE     �   CREATE TABLE public.maintenance_report_property (
    maintenance_report_id integer NOT NULL,
    property_id integer NOT NULL
);
 /   DROP TABLE public.maintenance_report_property;
       public         heap    postgres    false            �            1259    16418    maintenance_type    TABLE     �   CREATE TABLE public.maintenance_type (
    maintenance_type_id integer NOT NULL,
    maintenance_type_name text,
    description text
);
 $   DROP TABLE public.maintenance_type;
       public         heap    postgres    false            �            1259    16423 (   maintenance_type_maintenance_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.maintenance_type_maintenance_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.maintenance_type_maintenance_type_id_seq;
       public          postgres    false    221            �           0    0 (   maintenance_type_maintenance_type_id_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.maintenance_type_maintenance_type_id_seq OWNED BY public.maintenance_type.maintenance_type_id;
          public          postgres    false    222            �            1259    16424    property    TABLE     �  CREATE TABLE public.property (
    property_id integer NOT NULL,
    property_type_id integer NOT NULL,
    landlord_oib text NOT NULL,
    property_name text NOT NULL,
    property_size text NOT NULL,
    address_id integer NOT NULL,
    property_value double precision NOT NULL,
    description text,
    "features_JSON" json,
    property_history_id integer,
    status text NOT NULL
);
    DROP TABLE public.property;
       public         heap    postgres    false            �            1259    16429    property_history    TABLE     �   CREATE TABLE public.property_history (
    property_history_id integer NOT NULL,
    last_renovation_year text NOT NULL,
    "yearly_data_JSON" json
);
 $   DROP TABLE public.property_history;
       public         heap    postgres    false            �            1259    16434    property_history_id_seq    SEQUENCE     �   CREATE SEQUENCE public.property_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.property_history_id_seq;
       public          postgres    false    224            �           0    0    property_history_id_seq    SEQUENCE OWNED BY     d   ALTER SEQUENCE public.property_history_id_seq OWNED BY public.property_history.property_history_id;
          public          postgres    false    225            �            1259    16435    property_id_seq    SEQUENCE     x   CREATE SEQUENCE public.property_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.property_id_seq;
       public          postgres    false    223            �           0    0    property_id_seq    SEQUENCE OWNED BY     L   ALTER SEQUENCE public.property_id_seq OWNED BY public.property.property_id;
          public          postgres    false    226            �            1259    16436    property_type    TABLE     �   CREATE TABLE public.property_type (
    property_type_id integer NOT NULL,
    property_tpe_name text NOT NULL,
    description text
);
 !   DROP TABLE public.property_type;
       public         heap    postgres    false            �            1259    16441    property_type_id_seq    SEQUENCE     }   CREATE SEQUENCE public.property_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.property_type_id_seq;
       public          postgres    false    227            �           0    0    property_type_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.property_type_id_seq OWNED BY public.property_type.property_type_id;
          public          postgres    false    228            �            1259    16442    rent_report    TABLE     �   CREATE TABLE public.rent_report (
    rent_report_id integer NOT NULL,
    rental_contract_id integer NOT NULL,
    rent_due_date date NOT NULL,
    rent_paid bit(1) NOT NULL
);
    DROP TABLE public.rent_report;
       public         heap    postgres    false            �            1259    16445    rent_report_rent_report_id_seq    SEQUENCE     �   CREATE SEQUENCE public.rent_report_rent_report_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.rent_report_rent_report_id_seq;
       public          postgres    false    229            �           0    0    rent_report_rent_report_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.rent_report_rent_report_id_seq OWNED BY public.rent_report.rent_report_id;
          public          postgres    false    230            �            1259    16446    rental_contract    TABLE     S  CREATE TABLE public.rental_contract (
    contract_id integer NOT NULL,
    property_id integer NOT NULL,
    tenant_oib text NOT NULL,
    check_in date NOT NULL,
    check_out date NOT NULL,
    rent_rate double precision NOT NULL,
    security_deposit_id integer,
    contract_date date NOT NULL,
    contract_document text NOT NULL
);
 #   DROP TABLE public.rental_contract;
       public         heap    postgres    false            �            1259    16451    rental_contract_contract_id_seq    SEQUENCE     �   CREATE SEQUENCE public.rental_contract_contract_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.rental_contract_contract_id_seq;
       public          postgres    false    231            �           0    0    rental_contract_contract_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.rental_contract_contract_id_seq OWNED BY public.rental_contract.contract_id;
          public          postgres    false    232            �            1259    16452    security_deposit    TABLE     �   CREATE TABLE public.security_deposit (
    security_deposit_id integer NOT NULL,
    amount_paid double precision NOT NULL,
    amount_used double precision NOT NULL,
    "used_for_JSON" json
);
 $   DROP TABLE public.security_deposit;
       public         heap    postgres    false            �            1259    16457 (   security_deposit_security_deposit_id_seq    SEQUENCE     �   CREATE SEQUENCE public.security_deposit_security_deposit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.security_deposit_security_deposit_id_seq;
       public          postgres    false    233            �           0    0 (   security_deposit_security_deposit_id_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.security_deposit_security_deposit_id_seq OWNED BY public.security_deposit.security_deposit_id;
          public          postgres    false    234            �            1259    16458    street    TABLE     |   CREATE TABLE public.street (
    street_id integer NOT NULL,
    street_name text NOT NULL,
    town_id integer NOT NULL
);
    DROP TABLE public.street;
       public         heap    postgres    false            �            1259    16463    street_id_seq    SEQUENCE     v   CREATE SEQUENCE public.street_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.street_id_seq;
       public          postgres    false    235            �           0    0    street_id_seq    SEQUENCE OWNED BY     F   ALTER SEQUENCE public.street_id_seq OWNED BY public.street.street_id;
          public          postgres    false    236            �            1259    16464    town    TABLE     �   CREATE TABLE public.town (
    town_id integer NOT NULL,
    town_name text NOT NULL,
    zip_code integer NOT NULL,
    country_id integer NOT NULL
);
    DROP TABLE public.town;
       public         heap    postgres    false            �            1259    16469    town_id_seq    SEQUENCE     t   CREATE SEQUENCE public.town_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.town_id_seq;
       public          postgres    false    237            �           0    0    town_id_seq    SEQUENCE OWNED BY     @   ALTER SEQUENCE public.town_id_seq OWNED BY public.town.town_id;
          public          postgres    false    238            �            1259    16470    user    TABLE     n  CREATE TABLE public."user" (
    "OIB" text NOT NULL,
    user_role_id integer NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    phone_number text NOT NULL,
    last_login timestamp with time zone NOT NULL,
    register_date timestamp with time zone NOT NULL,
    active bit(1) NOT NULL
);
    DROP TABLE public."user";
       public         heap    postgres    false            �            1259    16475 	   user_role    TABLE     b   CREATE TABLE public.user_role (
    user_role_id integer NOT NULL,
    role_name text NOT NULL
);
    DROP TABLE public.user_role;
       public         heap    postgres    false            �            1259    16480    user_role_id_seq    SEQUENCE     y   CREATE SEQUENCE public.user_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.user_role_id_seq;
       public          postgres    false    240            �           0    0    user_role_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.user_role_id_seq OWNED BY public.user_role.user_role_id;
          public          postgres    false    241            �            1259    16481    utilities_report    TABLE       CREATE TABLE public.utilities_report (
    utilities_report_id integer NOT NULL,
    rental_contract_id integer NOT NULL,
    utility_type_id integer NOT NULL,
    amount_to_pay double precision NOT NULL,
    utility_due_date date NOT NULL,
    utility_paid bit(1) NOT NULL
);
 $   DROP TABLE public.utilities_report;
       public         heap    postgres    false            �            1259    16484 (   utilities_report_utilities_report_id_seq    SEQUENCE     �   CREATE SEQUENCE public.utilities_report_utilities_report_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.utilities_report_utilities_report_id_seq;
       public          postgres    false    242            �           0    0 (   utilities_report_utilities_report_id_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.utilities_report_utilities_report_id_seq OWNED BY public.utilities_report.utilities_report_id;
          public          postgres    false    243            �            1259    16485    utility_type    TABLE     �   CREATE TABLE public.utility_type (
    utility_type_id integer NOT NULL,
    utility_type_name text NOT NULL,
    description text
);
     DROP TABLE public.utility_type;
       public         heap    postgres    false            �            1259    16490     utility_type_utility_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.utility_type_utility_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.utility_type_utility_type_id_seq;
       public          postgres    false    244            �           0    0     utility_type_utility_type_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.utility_type_utility_type_id_seq OWNED BY public.utility_type.utility_type_id;
          public          postgres    false    245            �           2604    16491    address address_id    DEFAULT     p   ALTER TABLE ONLY public.address ALTER COLUMN address_id SET DEFAULT nextval('public.address_id_seq'::regclass);
 A   ALTER TABLE public.address ALTER COLUMN address_id DROP DEFAULT;
       public          postgres    false    215    214            �           2604    16492    country country_id    DEFAULT     p   ALTER TABLE ONLY public.country ALTER COLUMN country_id SET DEFAULT nextval('public.country_id_seq'::regclass);
 A   ALTER TABLE public.country ALTER COLUMN country_id DROP DEFAULT;
       public          postgres    false    217    216            �           2604    16493 (   maintenance_report maintenance_report_id    DEFAULT     �   ALTER TABLE ONLY public.maintenance_report ALTER COLUMN maintenance_report_id SET DEFAULT nextval('public.maintenance_report_maintenance_report_id_seq'::regclass);
 W   ALTER TABLE public.maintenance_report ALTER COLUMN maintenance_report_id DROP DEFAULT;
       public          postgres    false    219    218            �           2604    16494 $   maintenance_type maintenance_type_id    DEFAULT     �   ALTER TABLE ONLY public.maintenance_type ALTER COLUMN maintenance_type_id SET DEFAULT nextval('public.maintenance_type_maintenance_type_id_seq'::regclass);
 S   ALTER TABLE public.maintenance_type ALTER COLUMN maintenance_type_id DROP DEFAULT;
       public          postgres    false    222    221            �           2604    16495    property property_id    DEFAULT     s   ALTER TABLE ONLY public.property ALTER COLUMN property_id SET DEFAULT nextval('public.property_id_seq'::regclass);
 C   ALTER TABLE public.property ALTER COLUMN property_id DROP DEFAULT;
       public          postgres    false    226    223            �           2604    16496 $   property_history property_history_id    DEFAULT     �   ALTER TABLE ONLY public.property_history ALTER COLUMN property_history_id SET DEFAULT nextval('public.property_history_id_seq'::regclass);
 S   ALTER TABLE public.property_history ALTER COLUMN property_history_id DROP DEFAULT;
       public          postgres    false    225    224            �           2604    16497    property_type property_type_id    DEFAULT     �   ALTER TABLE ONLY public.property_type ALTER COLUMN property_type_id SET DEFAULT nextval('public.property_type_id_seq'::regclass);
 M   ALTER TABLE public.property_type ALTER COLUMN property_type_id DROP DEFAULT;
       public          postgres    false    228    227            �           2604    16498    rent_report rent_report_id    DEFAULT     �   ALTER TABLE ONLY public.rent_report ALTER COLUMN rent_report_id SET DEFAULT nextval('public.rent_report_rent_report_id_seq'::regclass);
 I   ALTER TABLE public.rent_report ALTER COLUMN rent_report_id DROP DEFAULT;
       public          postgres    false    230    229            �           2604    16499    rental_contract contract_id    DEFAULT     �   ALTER TABLE ONLY public.rental_contract ALTER COLUMN contract_id SET DEFAULT nextval('public.rental_contract_contract_id_seq'::regclass);
 J   ALTER TABLE public.rental_contract ALTER COLUMN contract_id DROP DEFAULT;
       public          postgres    false    232    231            �           2604    16500 $   security_deposit security_deposit_id    DEFAULT     �   ALTER TABLE ONLY public.security_deposit ALTER COLUMN security_deposit_id SET DEFAULT nextval('public.security_deposit_security_deposit_id_seq'::regclass);
 S   ALTER TABLE public.security_deposit ALTER COLUMN security_deposit_id DROP DEFAULT;
       public          postgres    false    234    233            �           2604    16501    street street_id    DEFAULT     m   ALTER TABLE ONLY public.street ALTER COLUMN street_id SET DEFAULT nextval('public.street_id_seq'::regclass);
 ?   ALTER TABLE public.street ALTER COLUMN street_id DROP DEFAULT;
       public          postgres    false    236    235            �           2604    16502    town town_id    DEFAULT     g   ALTER TABLE ONLY public.town ALTER COLUMN town_id SET DEFAULT nextval('public.town_id_seq'::regclass);
 ;   ALTER TABLE public.town ALTER COLUMN town_id DROP DEFAULT;
       public          postgres    false    238    237            �           2604    16503    user_role user_role_id    DEFAULT     v   ALTER TABLE ONLY public.user_role ALTER COLUMN user_role_id SET DEFAULT nextval('public.user_role_id_seq'::regclass);
 E   ALTER TABLE public.user_role ALTER COLUMN user_role_id DROP DEFAULT;
       public          postgres    false    241    240            �           2604    16504 $   utilities_report utilities_report_id    DEFAULT     �   ALTER TABLE ONLY public.utilities_report ALTER COLUMN utilities_report_id SET DEFAULT nextval('public.utilities_report_utilities_report_id_seq'::regclass);
 S   ALTER TABLE public.utilities_report ALTER COLUMN utilities_report_id DROP DEFAULT;
       public          postgres    false    243    242            �           2604    16505    utility_type utility_type_id    DEFAULT     �   ALTER TABLE ONLY public.utility_type ALTER COLUMN utility_type_id SET DEFAULT nextval('public.utility_type_utility_type_id_seq'::regclass);
 K   ALTER TABLE public.utility_type ALTER COLUMN utility_type_id DROP DEFAULT;
       public          postgres    false    245    244            �          0    16399    address 
   TABLE DATA           F   COPY public.address (address_id, house_number, street_id) FROM stdin;
    public          postgres    false    214   ��       �          0    16405    country 
   TABLE DATA           ;   COPY public.country (country_id, country_name) FROM stdin;
    public          postgres    false    216   ��       �          0    16411    maintenance_report 
   TABLE DATA           j   COPY public.maintenance_report (maintenance_report_id, maintenance_type_id, maintenance_date) FROM stdin;
    public          postgres    false    218   %�       �          0    16415    maintenance_report_property 
   TABLE DATA           Y   COPY public.maintenance_report_property (maintenance_report_id, property_id) FROM stdin;
    public          postgres    false    220   �       �          0    16418    maintenance_type 
   TABLE DATA           c   COPY public.maintenance_type (maintenance_type_id, maintenance_type_name, description) FROM stdin;
    public          postgres    false    221   ��       �          0    16424    property 
   TABLE DATA           �   COPY public.property (property_id, property_type_id, landlord_oib, property_name, property_size, address_id, property_value, description, "features_JSON", property_history_id, status) FROM stdin;
    public          postgres    false    223   .�       �          0    16429    property_history 
   TABLE DATA           i   COPY public.property_history (property_history_id, last_renovation_year, "yearly_data_JSON") FROM stdin;
    public          postgres    false    224   �       �          0    16436    property_type 
   TABLE DATA           Y   COPY public.property_type (property_type_id, property_tpe_name, description) FROM stdin;
    public          postgres    false    227   �       �          0    16442    rent_report 
   TABLE DATA           c   COPY public.rent_report (rent_report_id, rental_contract_id, rent_due_date, rent_paid) FROM stdin;
    public          postgres    false    229   W�       �          0    16446    rental_contract 
   TABLE DATA           �   COPY public.rental_contract (contract_id, property_id, tenant_oib, check_in, check_out, rent_rate, security_deposit_id, contract_date, contract_document) FROM stdin;
    public          postgres    false    231   ��       �          0    16452    security_deposit 
   TABLE DATA           j   COPY public.security_deposit (security_deposit_id, amount_paid, amount_used, "used_for_JSON") FROM stdin;
    public          postgres    false    233   ��       �          0    16458    street 
   TABLE DATA           A   COPY public.street (street_id, street_name, town_id) FROM stdin;
    public          postgres    false    235   0�       �          0    16464    town 
   TABLE DATA           H   COPY public.town (town_id, town_name, zip_code, country_id) FROM stdin;
    public          postgres    false    237   �       �          0    16470    user 
   TABLE DATA           �   COPY public."user" ("OIB", user_role_id, email, password, first_name, last_name, phone_number, last_login, register_date, active) FROM stdin;
    public          postgres    false    239   b�       �          0    16475 	   user_role 
   TABLE DATA           <   COPY public.user_role (user_role_id, role_name) FROM stdin;
    public          postgres    false    240   p�       �          0    16481    utilities_report 
   TABLE DATA           �   COPY public.utilities_report (utilities_report_id, rental_contract_id, utility_type_id, amount_to_pay, utility_due_date, utility_paid) FROM stdin;
    public          postgres    false    242   ��       �          0    16485    utility_type 
   TABLE DATA           W   COPY public.utility_type (utility_type_id, utility_type_name, description) FROM stdin;
    public          postgres    false    244   �       �           0    0    address_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.address_id_seq', 1, false);
          public          postgres    false    215            �           0    0    country_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.country_id_seq', 1, false);
          public          postgres    false    217            �           0    0 ,   maintenance_report_maintenance_report_id_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.maintenance_report_maintenance_report_id_seq', 1, false);
          public          postgres    false    219            �           0    0 (   maintenance_type_maintenance_type_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.maintenance_type_maintenance_type_id_seq', 1, false);
          public          postgres    false    222            �           0    0    property_history_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.property_history_id_seq', 1, false);
          public          postgres    false    225            �           0    0    property_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.property_id_seq', 1, false);
          public          postgres    false    226            �           0    0    property_type_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.property_type_id_seq', 1, false);
          public          postgres    false    228            �           0    0    rent_report_rent_report_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.rent_report_rent_report_id_seq', 1, false);
          public          postgres    false    230            �           0    0    rental_contract_contract_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.rental_contract_contract_id_seq', 1, false);
          public          postgres    false    232            �           0    0 (   security_deposit_security_deposit_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.security_deposit_security_deposit_id_seq', 1, false);
          public          postgres    false    234            �           0    0    street_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.street_id_seq', 1, false);
          public          postgres    false    236            �           0    0    town_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.town_id_seq', 1, false);
          public          postgres    false    238            �           0    0    user_role_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.user_role_id_seq', 1, false);
          public          postgres    false    241            �           0    0 (   utilities_report_utilities_report_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.utilities_report_utilities_report_id_seq', 1, false);
          public          postgres    false    243            �           0    0     utility_type_utility_type_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.utility_type_utility_type_id_seq', 1, false);
          public          postgres    false    245            �           2606    16507    address address_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (address_id);
 >   ALTER TABLE ONLY public.address DROP CONSTRAINT address_pkey;
       public            postgres    false    214            �           2606    16509    country country_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (country_id);
 >   ALTER TABLE ONLY public.country DROP CONSTRAINT country_pkey;
       public            postgres    false    216            �           2606    16511    country coutry_name_unique 
   CONSTRAINT     ]   ALTER TABLE ONLY public.country
    ADD CONSTRAINT coutry_name_unique UNIQUE (country_name);
 D   ALTER TABLE ONLY public.country DROP CONSTRAINT coutry_name_unique;
       public            postgres    false    216            �           2606    16513 *   maintenance_report maintenance_report_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY public.maintenance_report
    ADD CONSTRAINT maintenance_report_pkey PRIMARY KEY (maintenance_report_id);
 T   ALTER TABLE ONLY public.maintenance_report DROP CONSTRAINT maintenance_report_pkey;
       public            postgres    false    218            �           2606    16515 <   maintenance_report_property maintenance_report_property_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.maintenance_report_property
    ADD CONSTRAINT maintenance_report_property_pkey PRIMARY KEY (maintenance_report_id, property_id);
 f   ALTER TABLE ONLY public.maintenance_report_property DROP CONSTRAINT maintenance_report_property_pkey;
       public            postgres    false    220    220            �           2606    16517 &   maintenance_type maintenance_type_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.maintenance_type
    ADD CONSTRAINT maintenance_type_pkey PRIMARY KEY (maintenance_type_id);
 P   ALTER TABLE ONLY public.maintenance_type DROP CONSTRAINT maintenance_type_pkey;
       public            postgres    false    221            �           2606    16519 &   property_history property_history_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.property_history
    ADD CONSTRAINT property_history_pkey PRIMARY KEY (property_history_id);
 P   ALTER TABLE ONLY public.property_history DROP CONSTRAINT property_history_pkey;
       public            postgres    false    224            �           2606    16521    property property_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.property
    ADD CONSTRAINT property_pkey PRIMARY KEY (property_id);
 @   ALTER TABLE ONLY public.property DROP CONSTRAINT property_pkey;
       public            postgres    false    223            �           2606    16523     property_type property_type_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.property_type
    ADD CONSTRAINT property_type_pkey PRIMARY KEY (property_type_id);
 J   ALTER TABLE ONLY public.property_type DROP CONSTRAINT property_type_pkey;
       public            postgres    false    227            �           2606    16525 1   property_type property_type_property_tpe_name_key 
   CONSTRAINT     y   ALTER TABLE ONLY public.property_type
    ADD CONSTRAINT property_type_property_tpe_name_key UNIQUE (property_tpe_name);
 [   ALTER TABLE ONLY public.property_type DROP CONSTRAINT property_type_property_tpe_name_key;
       public            postgres    false    227            �           2606    16527    rent_report rent_report_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.rent_report
    ADD CONSTRAINT rent_report_pkey PRIMARY KEY (rent_report_id);
 F   ALTER TABLE ONLY public.rent_report DROP CONSTRAINT rent_report_pkey;
       public            postgres    false    229            �           2606    16529 $   rental_contract rental_contract_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.rental_contract
    ADD CONSTRAINT rental_contract_pkey PRIMARY KEY (contract_id);
 N   ALTER TABLE ONLY public.rental_contract DROP CONSTRAINT rental_contract_pkey;
       public            postgres    false    231            �           2606    16531 &   security_deposit security_deposit_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.security_deposit
    ADD CONSTRAINT security_deposit_pkey PRIMARY KEY (security_deposit_id);
 P   ALTER TABLE ONLY public.security_deposit DROP CONSTRAINT security_deposit_pkey;
       public            postgres    false    233            �           2606    16533    street street_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.street
    ADD CONSTRAINT street_pkey PRIMARY KEY (street_id);
 <   ALTER TABLE ONLY public.street DROP CONSTRAINT street_pkey;
       public            postgres    false    235            �           2606    16535    town town_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.town
    ADD CONSTRAINT town_pkey PRIMARY KEY (town_id);
 8   ALTER TABLE ONLY public.town DROP CONSTRAINT town_pkey;
       public            postgres    false    237            �           2606    16537    user user_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_email_key;
       public            postgres    false    239            �           2606    16539    user user_phone_number_key 
   CONSTRAINT     _   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_number_key UNIQUE (phone_number);
 F   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_phone_number_key;
       public            postgres    false    239            �           2606    16541    user user_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY ("OIB");
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public            postgres    false    239            �           2606    16543    user_role user_role_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT user_role_pkey PRIMARY KEY (user_role_id);
 B   ALTER TABLE ONLY public.user_role DROP CONSTRAINT user_role_pkey;
       public            postgres    false    240            �           2606    16545 &   utilities_report utilities_report_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.utilities_report
    ADD CONSTRAINT utilities_report_pkey PRIMARY KEY (utilities_report_id);
 P   ALTER TABLE ONLY public.utilities_report DROP CONSTRAINT utilities_report_pkey;
       public            postgres    false    242            �           2606    16547    utility_type utility_type_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.utility_type
    ADD CONSTRAINT utility_type_pkey PRIMARY KEY (utility_type_id);
 H   ALTER TABLE ONLY public.utility_type DROP CONSTRAINT utility_type_pkey;
       public            postgres    false    244            �           2606    16549 /   utility_type utility_type_utility_type_name_key 
   CONSTRAINT     w   ALTER TABLE ONLY public.utility_type
    ADD CONSTRAINT utility_type_utility_type_name_key UNIQUE (utility_type_name);
 Y   ALTER TABLE ONLY public.utility_type DROP CONSTRAINT utility_type_utility_type_name_key;
       public            postgres    false    244            �           2606    16550    address address_street_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_street_id_fkey FOREIGN KEY (street_id) REFERENCES public.street(street_id);
 H   ALTER TABLE ONLY public.address DROP CONSTRAINT address_street_id_fkey;
       public          postgres    false    3293    214    235            �           2606    16555    town country_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.town
    ADD CONSTRAINT "country_FK" FOREIGN KEY (country_id) REFERENCES public.country(country_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 ;   ALTER TABLE ONLY public.town DROP CONSTRAINT "country_FK";
       public          postgres    false    237    3269    216            �           2606    16560 >   maintenance_report maintenance_report_maintenance_type_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.maintenance_report
    ADD CONSTRAINT maintenance_report_maintenance_type_id_fkey FOREIGN KEY (maintenance_type_id) REFERENCES public.maintenance_type(maintenance_type_id);
 h   ALTER TABLE ONLY public.maintenance_report DROP CONSTRAINT maintenance_report_maintenance_type_id_fkey;
       public          postgres    false    218    3277    221            �           2606    16565 R   maintenance_report_property maintenance_report_property_maintenance_report_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.maintenance_report_property
    ADD CONSTRAINT maintenance_report_property_maintenance_report_id_fkey FOREIGN KEY (maintenance_report_id) REFERENCES public.maintenance_report(maintenance_report_id);
 |   ALTER TABLE ONLY public.maintenance_report_property DROP CONSTRAINT maintenance_report_property_maintenance_report_id_fkey;
       public          postgres    false    218    220    3273            �           2606    16570 H   maintenance_report_property maintenance_report_property_property_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.maintenance_report_property
    ADD CONSTRAINT maintenance_report_property_property_id_fkey FOREIGN KEY (property_id) REFERENCES public.property(property_id);
 r   ALTER TABLE ONLY public.maintenance_report_property DROP CONSTRAINT maintenance_report_property_property_id_fkey;
       public          postgres    false    3279    223    220            �           2606    16575 !   property property_address_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.property
    ADD CONSTRAINT property_address_id_fkey FOREIGN KEY (address_id) REFERENCES public.address(address_id);
 K   ALTER TABLE ONLY public.property DROP CONSTRAINT property_address_id_fkey;
       public          postgres    false    223    3267    214            �           2606    16580 #   property property_landlord_oib_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.property
    ADD CONSTRAINT property_landlord_oib_fkey FOREIGN KEY (landlord_oib) REFERENCES public."user"("OIB");
 M   ALTER TABLE ONLY public.property DROP CONSTRAINT property_landlord_oib_fkey;
       public          postgres    false    239    223    3301            �           2606    16585 *   property property_property_history_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.property
    ADD CONSTRAINT property_property_history_id_fkey FOREIGN KEY (property_history_id) REFERENCES public.property_history(property_history_id);
 T   ALTER TABLE ONLY public.property DROP CONSTRAINT property_property_history_id_fkey;
       public          postgres    false    223    224    3281            �           2606    16590 '   property property_property_type_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.property
    ADD CONSTRAINT property_property_type_id_fkey FOREIGN KEY (property_type_id) REFERENCES public.property_type(property_type_id);
 Q   ALTER TABLE ONLY public.property DROP CONSTRAINT property_property_type_id_fkey;
       public          postgres    false    227    223    3283            �           2606    16595 /   rent_report rent_report_rental_contract_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.rent_report
    ADD CONSTRAINT rent_report_rental_contract_id_fkey FOREIGN KEY (rental_contract_id) REFERENCES public.rental_contract(contract_id);
 Y   ALTER TABLE ONLY public.rent_report DROP CONSTRAINT rent_report_rental_contract_id_fkey;
       public          postgres    false    3289    229    231            �           2606    16600 0   rental_contract rental_contract_property_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.rental_contract
    ADD CONSTRAINT rental_contract_property_id_fkey FOREIGN KEY (property_id) REFERENCES public.property(property_id);
 Z   ALTER TABLE ONLY public.rental_contract DROP CONSTRAINT rental_contract_property_id_fkey;
       public          postgres    false    231    223    3279            �           2606    16605 8   rental_contract rental_contract_security_deposit_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.rental_contract
    ADD CONSTRAINT rental_contract_security_deposit_id_fkey FOREIGN KEY (security_deposit_id) REFERENCES public.security_deposit(security_deposit_id);
 b   ALTER TABLE ONLY public.rental_contract DROP CONSTRAINT rental_contract_security_deposit_id_fkey;
       public          postgres    false    231    233    3291            �           2606    16610 /   rental_contract rental_contract_tenant_oib_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.rental_contract
    ADD CONSTRAINT rental_contract_tenant_oib_fkey FOREIGN KEY (tenant_oib) REFERENCES public."user"("OIB");
 Y   ALTER TABLE ONLY public.rental_contract DROP CONSTRAINT rental_contract_tenant_oib_fkey;
       public          postgres    false    239    231    3301            �           2606    16615    street street_town_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.street
    ADD CONSTRAINT street_town_id_fkey FOREIGN KEY (town_id) REFERENCES public.town(town_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 D   ALTER TABLE ONLY public.street DROP CONSTRAINT street_town_id_fkey;
       public          postgres    false    235    237    3295            �           2606    16620    user user_user_role_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_user_role_id_fkey FOREIGN KEY (user_role_id) REFERENCES public.user_role(user_role_id);
 G   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_user_role_id_fkey;
       public          postgres    false    240    3303    239            �           2606    16625 9   utilities_report utilities_report_rental_contract_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.utilities_report
    ADD CONSTRAINT utilities_report_rental_contract_id_fkey FOREIGN KEY (rental_contract_id) REFERENCES public.rental_contract(contract_id);
 c   ALTER TABLE ONLY public.utilities_report DROP CONSTRAINT utilities_report_rental_contract_id_fkey;
       public          postgres    false    231    3289    242            �           2606    16630 6   utilities_report utilities_report_utility_type_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.utilities_report
    ADD CONSTRAINT utilities_report_utility_type_id_fkey FOREIGN KEY (utility_type_id) REFERENCES public.utility_type(utility_type_id);
 `   ALTER TABLE ONLY public.utilities_report DROP CONSTRAINT utilities_report_utility_type_id_fkey;
       public          postgres    false    244    3307    242            �   @   x�ı� ���/@B���:�7X/�pȓ�����}-�fstp�*b.��
�L6��H� ϟ      �      x�3�
�2���2������� %�U      �   J   x�=���0�޹]��Kt���)�H�X�|��l�\�O��bU�����v��t��J�������*5�s ��k      �   *   x���4�2�4�2�4�2�4�2�|# �ȷ �c���� j*�      �   e   x�M�;
�0E�z���@� M)���H|��8�w/v��ޒ��;�UG�~�� ��^����@��Ⳝ��M�h�1	��iE��_5u����3A��8fJ�.%�      �   �   x�U�M�@���S�	�t:��Ґ�2���D�� Qn/��颋~}u`8Ι�%��(�WUs�}΂̀ț�P��v�FŰH��f�zr	�YՓ��c/�y��v�ZB/eAy�c�t?V��� ����7�f�y�&]H3H��.��9�H�r}��[�R�9�      �   (   x�3�4202���2�L@,# �� �2ɂY1z\\\ ��      �   -   x�3��OK�LN���2���/-39�JrS�J@�=... ��      �   %   x�3�4�4202�50�54�4�2�4D0������ y)�      �   b   x�M�A
�0��/-j4�k�z����*x�;u����S]IY�`�U6�2cX�s�k���}��5 �ƉT�[)^��L	������ot�R�J߳��|��      �   "   x�3�450�4����2ⴄ1�9�`�=... }h-      �   �   x�E�;�0E�zf^���4@PD$DG3K�3r�C�j6D�A�󮞞�^�$��Tn�pw#HQk((��"��Q�c�Q�4͕ �9�?[�3X�by�m�>���8K�2�����!��LVH�A�	,ɝؾ�oa+��D�������d��"� ;A�      �   n   x�-�1
�@���)r�03�`��,�f�"����v{/W�}���'a)�h_&[�k��0��zd`FA%>��o&����8��p^���h,Z�{(���ID`E�      �   �   x��ѻj�0���)��ݎ.��1�B�N]D�b[
��W���*�1�.q����H����#��iJ1�����~?| �B���Rx)�k����j���L�SV����(����0-�亨.'����!L1��ˣ&�$3�Ui�hQ�"w���.��[�O5�g��l[�"[�KidR�a�i�|jp��s繰v3+PZ(� ��ZeA?�=����놷��H�r&��=}�m�[1���p��|뗾�	!�qQ�b      �   ,   x�3�,�,NL����2��I�K��/J�2�,I�K�+����� ֓
�      �   U   x�e���0���%���t�9�|���e��ΡH#�
�X7
��+MT��;��2��5��ϱ­��l�]�������"m      �   R   x�3��HM,��K���2�O,I-19]sR�K�2�3K*A&��y@�������$U!%�� �81$f��c���� ��<     