PGDMP                          z            TEAM_1_JCC_DB    15.0    15.0 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    17259    TEAM_1_JCC_DB    DATABASE     �   CREATE DATABASE "TEAM_1_JCC_DB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE "TEAM_1_JCC_DB";
                postgres    false            �            1259    17293    address    TABLE     �   CREATE TABLE public.address (
    address_id integer NOT NULL,
    house_number text NOT NULL,
    street_id integer NOT NULL
);
    DROP TABLE public.address;
       public         heap    postgres    false            �            1259    17538    address_id_seq    SEQUENCE     w   CREATE SEQUENCE public.address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.address_id_seq;
       public          postgres    false    217            �           0    0    address_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.address_id_seq OWNED BY public.address.address_id;
          public          postgres    false    238            �            1259    17260    country    TABLE     X   CREATE TABLE public.country (
    country_id integer NOT NULL,
    country_name text
);
    DROP TABLE public.country;
       public         heap    postgres    false            �            1259    17540    country_id_seq    SEQUENCE     w   CREATE SEQUENCE public.country_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.country_id_seq;
       public          postgres    false    214            �           0    0    country_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.country_id_seq OWNED BY public.country.country_id;
          public          postgres    false    239            �            1259    17512    maintenance_report    TABLE     �   CREATE TABLE public.maintenance_report (
    maintenance_report_id integer NOT NULL,
    maintenance_type_id integer NOT NULL,
    maintenance_date date NOT NULL
);
 &   DROP TABLE public.maintenance_report;
       public         heap    postgres    false            �            1259    17511 ,   maintenance_report_maintenance_report_id_seq    SEQUENCE     �   CREATE SEQUENCE public.maintenance_report_maintenance_report_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE public.maintenance_report_maintenance_report_id_seq;
       public          postgres    false    236            �           0    0 ,   maintenance_report_maintenance_report_id_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public.maintenance_report_maintenance_report_id_seq OWNED BY public.maintenance_report.maintenance_report_id;
          public          postgres    false    235            �            1259    17523    maintenance_report_property    TABLE     �   CREATE TABLE public.maintenance_report_property (
    maintenance_report_id integer NOT NULL,
    property_id integer NOT NULL
);
 /   DROP TABLE public.maintenance_report_property;
       public         heap    postgres    false            �            1259    17503    maintenance_type    TABLE     �   CREATE TABLE public.maintenance_type (
    maintenance_type_id integer NOT NULL,
    maintenance_type_name text,
    description text
);
 $   DROP TABLE public.maintenance_type;
       public         heap    postgres    false            �            1259    17502 (   maintenance_type_maintenance_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.maintenance_type_maintenance_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.maintenance_type_maintenance_type_id_seq;
       public          postgres    false    234            �           0    0 (   maintenance_type_maintenance_type_id_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.maintenance_type_maintenance_type_id_seq OWNED BY public.maintenance_type.maintenance_type_id;
          public          postgres    false    233            �            1259    17356    property    TABLE     �  CREATE TABLE public.property (
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
       public         heap    postgres    false            �            1259    17337    property_history    TABLE     �   CREATE TABLE public.property_history (
    property_history_id integer NOT NULL,
    last_renovation_year text NOT NULL,
    "yearly_data_JSON" json
);
 $   DROP TABLE public.property_history;
       public         heap    postgres    false            �            1259    17544    property_history_id_seq    SEQUENCE     �   CREATE SEQUENCE public.property_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.property_history_id_seq;
       public          postgres    false    221            �           0    0    property_history_id_seq    SEQUENCE OWNED BY     d   ALTER SEQUENCE public.property_history_id_seq OWNED BY public.property_history.property_history_id;
          public          postgres    false    241            �            1259    17542    property_id_seq    SEQUENCE     x   CREATE SEQUENCE public.property_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.property_id_seq;
       public          postgres    false    222            �           0    0    property_id_seq    SEQUENCE OWNED BY     L   ALTER SEQUENCE public.property_id_seq OWNED BY public.property.property_id;
          public          postgres    false    240            �            1259    17328    property_type    TABLE     �   CREATE TABLE public.property_type (
    property_type_id integer NOT NULL,
    property_tpe_name text NOT NULL,
    description text
);
 !   DROP TABLE public.property_type;
       public         heap    postgres    false            �            1259    17546    property_type_id_seq    SEQUENCE     }   CREATE SEQUENCE public.property_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.property_type_id_seq;
       public          postgres    false    220            �           0    0    property_type_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.property_type_id_seq OWNED BY public.property_type.property_type_id;
          public          postgres    false    242            �            1259    17462    rent_report    TABLE     �   CREATE TABLE public.rent_report (
    rent_report_id integer NOT NULL,
    rental_contract_id integer NOT NULL,
    rent_due_date date NOT NULL,
    rent_paid bit(1) NOT NULL
);
    DROP TABLE public.rent_report;
       public         heap    postgres    false            �            1259    17461    rent_report_rent_report_id_seq    SEQUENCE     �   CREATE SEQUENCE public.rent_report_rent_report_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.rent_report_rent_report_id_seq;
       public          postgres    false    228            �           0    0    rent_report_rent_report_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.rent_report_rent_report_id_seq OWNED BY public.rent_report.rent_report_id;
          public          postgres    false    227            �            1259    17438    rental_contract    TABLE     S  CREATE TABLE public.rental_contract (
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
       public         heap    postgres    false            �            1259    17437    rental_contract_contract_id_seq    SEQUENCE     �   CREATE SEQUENCE public.rental_contract_contract_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.rental_contract_contract_id_seq;
       public          postgres    false    226            �           0    0    rental_contract_contract_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.rental_contract_contract_id_seq OWNED BY public.rental_contract.contract_id;
          public          postgres    false    225            �            1259    17403    security_deposit    TABLE     �   CREATE TABLE public.security_deposit (
    security_deposit_id integer NOT NULL,
    amount_paid double precision NOT NULL,
    amount_used double precision NOT NULL,
    "used_for_JSON" json
);
 $   DROP TABLE public.security_deposit;
       public         heap    postgres    false            �            1259    17402 (   security_deposit_security_deposit_id_seq    SEQUENCE     �   CREATE SEQUENCE public.security_deposit_security_deposit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.security_deposit_security_deposit_id_seq;
       public          postgres    false    224            �           0    0 (   security_deposit_security_deposit_id_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.security_deposit_security_deposit_id_seq OWNED BY public.security_deposit.security_deposit_id;
          public          postgres    false    223            �            1259    17281    street    TABLE     |   CREATE TABLE public.street (
    street_id integer NOT NULL,
    street_name text NOT NULL,
    town_id integer NOT NULL
);
    DROP TABLE public.street;
       public         heap    postgres    false            �            1259    17548    street_id_seq    SEQUENCE     v   CREATE SEQUENCE public.street_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.street_id_seq;
       public          postgres    false    216            �           0    0    street_id_seq    SEQUENCE OWNED BY     F   ALTER SEQUENCE public.street_id_seq OWNED BY public.street.street_id;
          public          postgres    false    243            �            1259    17269    town    TABLE     �   CREATE TABLE public.town (
    town_id integer NOT NULL,
    town_name text NOT NULL,
    zip_code integer NOT NULL,
    country_id integer NOT NULL
);
    DROP TABLE public.town;
       public         heap    postgres    false            �            1259    17549    town_id_seq    SEQUENCE     t   CREATE SEQUENCE public.town_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.town_id_seq;
       public          postgres    false    215            �           0    0    town_id_seq    SEQUENCE OWNED BY     @   ALTER SEQUENCE public.town_id_seq OWNED BY public.town.town_id;
          public          postgres    false    244            �            1259    17312    user    TABLE     n  CREATE TABLE public."user" (
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
       public         heap    postgres    false            �            1259    17305 	   user_role    TABLE     b   CREATE TABLE public.user_role (
    user_role_id integer NOT NULL,
    role_name text NOT NULL
);
    DROP TABLE public.user_role;
       public         heap    postgres    false            �            1259    17550    user_role_id_seq    SEQUENCE     y   CREATE SEQUENCE public.user_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.user_role_id_seq;
       public          postgres    false    218            �           0    0    user_role_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.user_role_id_seq OWNED BY public.user_role.user_role_id;
          public          postgres    false    245            �            1259    17486    utilities_report    TABLE       CREATE TABLE public.utilities_report (
    utilities_report_id integer NOT NULL,
    rental_contract_id integer NOT NULL,
    utility_type_id integer NOT NULL,
    amount_to_pay double precision NOT NULL,
    utility_due_date date NOT NULL,
    utility_paid bit(1) NOT NULL
);
 $   DROP TABLE public.utilities_report;
       public         heap    postgres    false            �            1259    17485 (   utilities_report_utilities_report_id_seq    SEQUENCE     �   CREATE SEQUENCE public.utilities_report_utilities_report_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.utilities_report_utilities_report_id_seq;
       public          postgres    false    232            �           0    0 (   utilities_report_utilities_report_id_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.utilities_report_utilities_report_id_seq OWNED BY public.utilities_report.utilities_report_id;
          public          postgres    false    231            �            1259    17475    utility_type    TABLE     �   CREATE TABLE public.utility_type (
    utility_type_id integer NOT NULL,
    utility_type_name text NOT NULL,
    description text
);
     DROP TABLE public.utility_type;
       public         heap    postgres    false            �            1259    17474     utility_type_utility_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.utility_type_utility_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.utility_type_utility_type_id_seq;
       public          postgres    false    230            �           0    0     utility_type_utility_type_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.utility_type_utility_type_id_seq OWNED BY public.utility_type.utility_type_id;
          public          postgres    false    229            �           2604    17539    address address_id    DEFAULT     p   ALTER TABLE ONLY public.address ALTER COLUMN address_id SET DEFAULT nextval('public.address_id_seq'::regclass);
 A   ALTER TABLE public.address ALTER COLUMN address_id DROP DEFAULT;
       public          postgres    false    238    217            �           2604    17541    country country_id    DEFAULT     p   ALTER TABLE ONLY public.country ALTER COLUMN country_id SET DEFAULT nextval('public.country_id_seq'::regclass);
 A   ALTER TABLE public.country ALTER COLUMN country_id DROP DEFAULT;
       public          postgres    false    239    214            �           2604    17515 (   maintenance_report maintenance_report_id    DEFAULT     �   ALTER TABLE ONLY public.maintenance_report ALTER COLUMN maintenance_report_id SET DEFAULT nextval('public.maintenance_report_maintenance_report_id_seq'::regclass);
 W   ALTER TABLE public.maintenance_report ALTER COLUMN maintenance_report_id DROP DEFAULT;
       public          postgres    false    235    236    236            �           2604    17506 $   maintenance_type maintenance_type_id    DEFAULT     �   ALTER TABLE ONLY public.maintenance_type ALTER COLUMN maintenance_type_id SET DEFAULT nextval('public.maintenance_type_maintenance_type_id_seq'::regclass);
 S   ALTER TABLE public.maintenance_type ALTER COLUMN maintenance_type_id DROP DEFAULT;
       public          postgres    false    233    234    234            �           2604    17543    property property_id    DEFAULT     s   ALTER TABLE ONLY public.property ALTER COLUMN property_id SET DEFAULT nextval('public.property_id_seq'::regclass);
 C   ALTER TABLE public.property ALTER COLUMN property_id DROP DEFAULT;
       public          postgres    false    240    222            �           2604    17545 $   property_history property_history_id    DEFAULT     �   ALTER TABLE ONLY public.property_history ALTER COLUMN property_history_id SET DEFAULT nextval('public.property_history_id_seq'::regclass);
 S   ALTER TABLE public.property_history ALTER COLUMN property_history_id DROP DEFAULT;
       public          postgres    false    241    221            �           2604    17547    property_type property_type_id    DEFAULT     �   ALTER TABLE ONLY public.property_type ALTER COLUMN property_type_id SET DEFAULT nextval('public.property_type_id_seq'::regclass);
 M   ALTER TABLE public.property_type ALTER COLUMN property_type_id DROP DEFAULT;
       public          postgres    false    242    220            �           2604    17465    rent_report rent_report_id    DEFAULT     �   ALTER TABLE ONLY public.rent_report ALTER COLUMN rent_report_id SET DEFAULT nextval('public.rent_report_rent_report_id_seq'::regclass);
 I   ALTER TABLE public.rent_report ALTER COLUMN rent_report_id DROP DEFAULT;
       public          postgres    false    228    227    228            �           2604    17441    rental_contract contract_id    DEFAULT     �   ALTER TABLE ONLY public.rental_contract ALTER COLUMN contract_id SET DEFAULT nextval('public.rental_contract_contract_id_seq'::regclass);
 J   ALTER TABLE public.rental_contract ALTER COLUMN contract_id DROP DEFAULT;
       public          postgres    false    226    225    226            �           2604    17406 $   security_deposit security_deposit_id    DEFAULT     �   ALTER TABLE ONLY public.security_deposit ALTER COLUMN security_deposit_id SET DEFAULT nextval('public.security_deposit_security_deposit_id_seq'::regclass);
 S   ALTER TABLE public.security_deposit ALTER COLUMN security_deposit_id DROP DEFAULT;
       public          postgres    false    223    224    224            �           2604    17551    street street_id    DEFAULT     m   ALTER TABLE ONLY public.street ALTER COLUMN street_id SET DEFAULT nextval('public.street_id_seq'::regclass);
 ?   ALTER TABLE public.street ALTER COLUMN street_id DROP DEFAULT;
       public          postgres    false    243    216            �           2604    17552    town town_id    DEFAULT     g   ALTER TABLE ONLY public.town ALTER COLUMN town_id SET DEFAULT nextval('public.town_id_seq'::regclass);
 ;   ALTER TABLE public.town ALTER COLUMN town_id DROP DEFAULT;
       public          postgres    false    244    215            �           2604    17553    user_role user_role_id    DEFAULT     v   ALTER TABLE ONLY public.user_role ALTER COLUMN user_role_id SET DEFAULT nextval('public.user_role_id_seq'::regclass);
 E   ALTER TABLE public.user_role ALTER COLUMN user_role_id DROP DEFAULT;
       public          postgres    false    245    218            �           2604    17489 $   utilities_report utilities_report_id    DEFAULT     �   ALTER TABLE ONLY public.utilities_report ALTER COLUMN utilities_report_id SET DEFAULT nextval('public.utilities_report_utilities_report_id_seq'::regclass);
 S   ALTER TABLE public.utilities_report ALTER COLUMN utilities_report_id DROP DEFAULT;
       public          postgres    false    232    231    232            �           2604    17478    utility_type utility_type_id    DEFAULT     �   ALTER TABLE ONLY public.utility_type ALTER COLUMN utility_type_id SET DEFAULT nextval('public.utility_type_utility_type_id_seq'::regclass);
 K   ALTER TABLE public.utility_type ALTER COLUMN utility_type_id DROP DEFAULT;
       public          postgres    false    229    230    230            �          0    17293    address 
   TABLE DATA           F   COPY public.address (address_id, house_number, street_id) FROM stdin;
    public          postgres    false    217   �       �          0    17260    country 
   TABLE DATA           ;   COPY public.country (country_id, country_name) FROM stdin;
    public          postgres    false    214   ��       �          0    17512    maintenance_report 
   TABLE DATA           j   COPY public.maintenance_report (maintenance_report_id, maintenance_type_id, maintenance_date) FROM stdin;
    public          postgres    false    236   �       �          0    17523    maintenance_report_property 
   TABLE DATA           Y   COPY public.maintenance_report_property (maintenance_report_id, property_id) FROM stdin;
    public          postgres    false    237   8�       �          0    17503    maintenance_type 
   TABLE DATA           c   COPY public.maintenance_type (maintenance_type_id, maintenance_type_name, description) FROM stdin;
    public          postgres    false    234   U�       �          0    17356    property 
   TABLE DATA           �   COPY public.property (property_id, property_type_id, landlord_oib, property_name, property_size, address_id, property_value, description, "features_JSON", property_history_id, status) FROM stdin;
    public          postgres    false    222   r�       �          0    17337    property_history 
   TABLE DATA           i   COPY public.property_history (property_history_id, last_renovation_year, "yearly_data_JSON") FROM stdin;
    public          postgres    false    221   ��       �          0    17328    property_type 
   TABLE DATA           Y   COPY public.property_type (property_type_id, property_tpe_name, description) FROM stdin;
    public          postgres    false    220   ��       �          0    17462    rent_report 
   TABLE DATA           c   COPY public.rent_report (rent_report_id, rental_contract_id, rent_due_date, rent_paid) FROM stdin;
    public          postgres    false    228   ɮ       �          0    17438    rental_contract 
   TABLE DATA           �   COPY public.rental_contract (contract_id, property_id, tenant_oib, check_in, check_out, rent_rate, security_deposit_id, contract_date, contract_document) FROM stdin;
    public          postgres    false    226   �       �          0    17403    security_deposit 
   TABLE DATA           j   COPY public.security_deposit (security_deposit_id, amount_paid, amount_used, "used_for_JSON") FROM stdin;
    public          postgres    false    224   �       �          0    17281    street 
   TABLE DATA           A   COPY public.street (street_id, street_name, town_id) FROM stdin;
    public          postgres    false    216    �       �          0    17269    town 
   TABLE DATA           H   COPY public.town (town_id, town_name, zip_code, country_id) FROM stdin;
    public          postgres    false    215   =�       �          0    17312    user 
   TABLE DATA           �   COPY public."user" ("OIB", user_role_id, email, password, first_name, last_name, phone_number, last_login, register_date, active) FROM stdin;
    public          postgres    false    219   Z�       �          0    17305 	   user_role 
   TABLE DATA           <   COPY public.user_role (user_role_id, role_name) FROM stdin;
    public          postgres    false    218   w�       �          0    17486    utilities_report 
   TABLE DATA           �   COPY public.utilities_report (utilities_report_id, rental_contract_id, utility_type_id, amount_to_pay, utility_due_date, utility_paid) FROM stdin;
    public          postgres    false    232   ��       �          0    17475    utility_type 
   TABLE DATA           W   COPY public.utility_type (utility_type_id, utility_type_name, description) FROM stdin;
    public          postgres    false    230   ��       �           0    0    address_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.address_id_seq', 1, false);
          public          postgres    false    238            �           0    0    country_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.country_id_seq', 1, false);
          public          postgres    false    239            �           0    0 ,   maintenance_report_maintenance_report_id_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public.maintenance_report_maintenance_report_id_seq', 1, false);
          public          postgres    false    235            �           0    0 (   maintenance_type_maintenance_type_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.maintenance_type_maintenance_type_id_seq', 1, false);
          public          postgres    false    233            �           0    0    property_history_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.property_history_id_seq', 1, false);
          public          postgres    false    241            �           0    0    property_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.property_id_seq', 1, false);
          public          postgres    false    240            �           0    0    property_type_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.property_type_id_seq', 1, false);
          public          postgres    false    242            �           0    0    rent_report_rent_report_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.rent_report_rent_report_id_seq', 1, false);
          public          postgres    false    227            �           0    0    rental_contract_contract_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.rental_contract_contract_id_seq', 1, false);
          public          postgres    false    225            �           0    0 (   security_deposit_security_deposit_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.security_deposit_security_deposit_id_seq', 1, false);
          public          postgres    false    223            �           0    0    street_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.street_id_seq', 1, false);
          public          postgres    false    243            �           0    0    town_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.town_id_seq', 1, false);
          public          postgres    false    244            �           0    0    user_role_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.user_role_id_seq', 1, false);
          public          postgres    false    245            �           0    0 (   utilities_report_utilities_report_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.utilities_report_utilities_report_id_seq', 1, false);
          public          postgres    false    231            �           0    0     utility_type_utility_type_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.utility_type_utility_type_id_seq', 1, false);
          public          postgres    false    229            �           2606    17299    address address_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (address_id);
 >   ALTER TABLE ONLY public.address DROP CONSTRAINT address_pkey;
       public            postgres    false    217            �           2606    17266    country country_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (country_id);
 >   ALTER TABLE ONLY public.country DROP CONSTRAINT country_pkey;
       public            postgres    false    214            �           2606    17268    country coutry_name_unique 
   CONSTRAINT     ]   ALTER TABLE ONLY public.country
    ADD CONSTRAINT coutry_name_unique UNIQUE (country_name);
 D   ALTER TABLE ONLY public.country DROP CONSTRAINT coutry_name_unique;
       public            postgres    false    214            �           2606    17517 *   maintenance_report maintenance_report_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY public.maintenance_report
    ADD CONSTRAINT maintenance_report_pkey PRIMARY KEY (maintenance_report_id);
 T   ALTER TABLE ONLY public.maintenance_report DROP CONSTRAINT maintenance_report_pkey;
       public            postgres    false    236            �           2606    17527 <   maintenance_report_property maintenance_report_property_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.maintenance_report_property
    ADD CONSTRAINT maintenance_report_property_pkey PRIMARY KEY (maintenance_report_id, property_id);
 f   ALTER TABLE ONLY public.maintenance_report_property DROP CONSTRAINT maintenance_report_property_pkey;
       public            postgres    false    237    237            �           2606    17510 &   maintenance_type maintenance_type_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.maintenance_type
    ADD CONSTRAINT maintenance_type_pkey PRIMARY KEY (maintenance_type_id);
 P   ALTER TABLE ONLY public.maintenance_type DROP CONSTRAINT maintenance_type_pkey;
       public            postgres    false    234            �           2606    17343 &   property_history property_history_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.property_history
    ADD CONSTRAINT property_history_pkey PRIMARY KEY (property_history_id);
 P   ALTER TABLE ONLY public.property_history DROP CONSTRAINT property_history_pkey;
       public            postgres    false    221            �           2606    17362    property property_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.property
    ADD CONSTRAINT property_pkey PRIMARY KEY (property_id);
 @   ALTER TABLE ONLY public.property DROP CONSTRAINT property_pkey;
       public            postgres    false    222            �           2606    17334     property_type property_type_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.property_type
    ADD CONSTRAINT property_type_pkey PRIMARY KEY (property_type_id);
 J   ALTER TABLE ONLY public.property_type DROP CONSTRAINT property_type_pkey;
       public            postgres    false    220            �           2606    17336 1   property_type property_type_property_tpe_name_key 
   CONSTRAINT     y   ALTER TABLE ONLY public.property_type
    ADD CONSTRAINT property_type_property_tpe_name_key UNIQUE (property_tpe_name);
 [   ALTER TABLE ONLY public.property_type DROP CONSTRAINT property_type_property_tpe_name_key;
       public            postgres    false    220            �           2606    17467    rent_report rent_report_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.rent_report
    ADD CONSTRAINT rent_report_pkey PRIMARY KEY (rent_report_id);
 F   ALTER TABLE ONLY public.rent_report DROP CONSTRAINT rent_report_pkey;
       public            postgres    false    228            �           2606    17445 $   rental_contract rental_contract_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.rental_contract
    ADD CONSTRAINT rental_contract_pkey PRIMARY KEY (contract_id);
 N   ALTER TABLE ONLY public.rental_contract DROP CONSTRAINT rental_contract_pkey;
       public            postgres    false    226            �           2606    17410 &   security_deposit security_deposit_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.security_deposit
    ADD CONSTRAINT security_deposit_pkey PRIMARY KEY (security_deposit_id);
 P   ALTER TABLE ONLY public.security_deposit DROP CONSTRAINT security_deposit_pkey;
       public            postgres    false    224            �           2606    17287    street street_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.street
    ADD CONSTRAINT street_pkey PRIMARY KEY (street_id);
 <   ALTER TABLE ONLY public.street DROP CONSTRAINT street_pkey;
       public            postgres    false    216            �           2606    17275    town town_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.town
    ADD CONSTRAINT town_pkey PRIMARY KEY (town_id);
 8   ALTER TABLE ONLY public.town DROP CONSTRAINT town_pkey;
       public            postgres    false    215            �           2606    17320    user user_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_email_key;
       public            postgres    false    219            �           2606    17322    user user_phone_number_key 
   CONSTRAINT     _   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_phone_number_key UNIQUE (phone_number);
 F   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_phone_number_key;
       public            postgres    false    219            �           2606    17318    user user_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY ("OIB");
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public            postgres    false    219            �           2606    17311    user_role user_role_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT user_role_pkey PRIMARY KEY (user_role_id);
 B   ALTER TABLE ONLY public.user_role DROP CONSTRAINT user_role_pkey;
       public            postgres    false    218            �           2606    17491 &   utilities_report utilities_report_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.utilities_report
    ADD CONSTRAINT utilities_report_pkey PRIMARY KEY (utilities_report_id);
 P   ALTER TABLE ONLY public.utilities_report DROP CONSTRAINT utilities_report_pkey;
       public            postgres    false    232            �           2606    17482    utility_type utility_type_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.utility_type
    ADD CONSTRAINT utility_type_pkey PRIMARY KEY (utility_type_id);
 H   ALTER TABLE ONLY public.utility_type DROP CONSTRAINT utility_type_pkey;
       public            postgres    false    230            �           2606    17484 /   utility_type utility_type_utility_type_name_key 
   CONSTRAINT     w   ALTER TABLE ONLY public.utility_type
    ADD CONSTRAINT utility_type_utility_type_name_key UNIQUE (utility_type_name);
 Y   ALTER TABLE ONLY public.utility_type DROP CONSTRAINT utility_type_utility_type_name_key;
       public            postgres    false    230            �           2606    17300    address address_street_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_street_id_fkey FOREIGN KEY (street_id) REFERENCES public.street(street_id);
 H   ALTER TABLE ONLY public.address DROP CONSTRAINT address_street_id_fkey;
       public          postgres    false    217    3273    216            �           2606    17276    town country_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.town
    ADD CONSTRAINT "country_FK" FOREIGN KEY (country_id) REFERENCES public.country(country_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 ;   ALTER TABLE ONLY public.town DROP CONSTRAINT "country_FK";
       public          postgres    false    214    3267    215            �           2606    17518 >   maintenance_report maintenance_report_maintenance_type_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.maintenance_report
    ADD CONSTRAINT maintenance_report_maintenance_type_id_fkey FOREIGN KEY (maintenance_type_id) REFERENCES public.maintenance_type(maintenance_type_id);
 h   ALTER TABLE ONLY public.maintenance_report DROP CONSTRAINT maintenance_report_maintenance_type_id_fkey;
       public          postgres    false    236    234    3305            �           2606    17528 R   maintenance_report_property maintenance_report_property_maintenance_report_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.maintenance_report_property
    ADD CONSTRAINT maintenance_report_property_maintenance_report_id_fkey FOREIGN KEY (maintenance_report_id) REFERENCES public.maintenance_report(maintenance_report_id);
 |   ALTER TABLE ONLY public.maintenance_report_property DROP CONSTRAINT maintenance_report_property_maintenance_report_id_fkey;
       public          postgres    false    236    3307    237            �           2606    17533 H   maintenance_report_property maintenance_report_property_property_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.maintenance_report_property
    ADD CONSTRAINT maintenance_report_property_property_id_fkey FOREIGN KEY (property_id) REFERENCES public.property(property_id);
 r   ALTER TABLE ONLY public.maintenance_report_property DROP CONSTRAINT maintenance_report_property_property_id_fkey;
       public          postgres    false    222    237    3291            �           2606    17373 !   property property_address_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.property
    ADD CONSTRAINT property_address_id_fkey FOREIGN KEY (address_id) REFERENCES public.address(address_id);
 K   ALTER TABLE ONLY public.property DROP CONSTRAINT property_address_id_fkey;
       public          postgres    false    217    3275    222            �           2606    17368 #   property property_landlord_oib_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.property
    ADD CONSTRAINT property_landlord_oib_fkey FOREIGN KEY (landlord_oib) REFERENCES public."user"("OIB");
 M   ALTER TABLE ONLY public.property DROP CONSTRAINT property_landlord_oib_fkey;
       public          postgres    false    219    3283    222            �           2606    17378 *   property property_property_history_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.property
    ADD CONSTRAINT property_property_history_id_fkey FOREIGN KEY (property_history_id) REFERENCES public.property_history(property_history_id);
 T   ALTER TABLE ONLY public.property DROP CONSTRAINT property_property_history_id_fkey;
       public          postgres    false    222    221    3289            �           2606    17363 '   property property_property_type_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.property
    ADD CONSTRAINT property_property_type_id_fkey FOREIGN KEY (property_type_id) REFERENCES public.property_type(property_type_id);
 Q   ALTER TABLE ONLY public.property DROP CONSTRAINT property_property_type_id_fkey;
       public          postgres    false    3285    222    220            �           2606    17468 /   rent_report rent_report_rental_contract_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.rent_report
    ADD CONSTRAINT rent_report_rental_contract_id_fkey FOREIGN KEY (rental_contract_id) REFERENCES public.rental_contract(contract_id);
 Y   ALTER TABLE ONLY public.rent_report DROP CONSTRAINT rent_report_rental_contract_id_fkey;
       public          postgres    false    228    226    3295            �           2606    17446 0   rental_contract rental_contract_property_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.rental_contract
    ADD CONSTRAINT rental_contract_property_id_fkey FOREIGN KEY (property_id) REFERENCES public.property(property_id);
 Z   ALTER TABLE ONLY public.rental_contract DROP CONSTRAINT rental_contract_property_id_fkey;
       public          postgres    false    3291    226    222            �           2606    17456 8   rental_contract rental_contract_security_deposit_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.rental_contract
    ADD CONSTRAINT rental_contract_security_deposit_id_fkey FOREIGN KEY (security_deposit_id) REFERENCES public.security_deposit(security_deposit_id);
 b   ALTER TABLE ONLY public.rental_contract DROP CONSTRAINT rental_contract_security_deposit_id_fkey;
       public          postgres    false    224    3293    226            �           2606    17451 /   rental_contract rental_contract_tenant_oib_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.rental_contract
    ADD CONSTRAINT rental_contract_tenant_oib_fkey FOREIGN KEY (tenant_oib) REFERENCES public."user"("OIB");
 Y   ALTER TABLE ONLY public.rental_contract DROP CONSTRAINT rental_contract_tenant_oib_fkey;
       public          postgres    false    226    3283    219            �           2606    17288    street street_town_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.street
    ADD CONSTRAINT street_town_id_fkey FOREIGN KEY (town_id) REFERENCES public.town(town_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 D   ALTER TABLE ONLY public.street DROP CONSTRAINT street_town_id_fkey;
       public          postgres    false    3271    215    216            �           2606    17323    user user_user_role_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_user_role_id_fkey FOREIGN KEY (user_role_id) REFERENCES public.user_role(user_role_id);
 G   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_user_role_id_fkey;
       public          postgres    false    219    218    3277            �           2606    17492 9   utilities_report utilities_report_rental_contract_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.utilities_report
    ADD CONSTRAINT utilities_report_rental_contract_id_fkey FOREIGN KEY (rental_contract_id) REFERENCES public.rental_contract(contract_id);
 c   ALTER TABLE ONLY public.utilities_report DROP CONSTRAINT utilities_report_rental_contract_id_fkey;
       public          postgres    false    232    226    3295            �           2606    17497 6   utilities_report utilities_report_utility_type_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.utilities_report
    ADD CONSTRAINT utilities_report_utility_type_id_fkey FOREIGN KEY (utility_type_id) REFERENCES public.utility_type(utility_type_id);
 `   ALTER TABLE ONLY public.utilities_report DROP CONSTRAINT utilities_report_utility_type_id_fkey;
       public          postgres    false    3299    232    230            �      x^����� � �      �      x^����� � �      �      x^����� � �      �      x^����� � �      �      x^����� � �      �      x^����� � �      �      x^����� � �      �      x^����� � �      �      x^����� � �      �      x^����� � �      �      x^����� � �      �      x^����� � �      �      x^����� � �      �      x^����� � �      �      x^����� � �      �      x^����� � �      �      x^����� � �     