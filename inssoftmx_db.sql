PGDMP      
    
    
        |            inssoft    16.4    16.4     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16397    inssoft    DATABASE     {   CREATE DATABASE inssoft WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Mexico.1252';
    DROP DATABASE inssoft;
                postgres_inssoft    false            �            1259    16399    user    TABLE     �   CREATE TABLE public."user" (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    email character varying(40) NOT NULL,
    password character varying NOT NULL,
    "phoneNumber" character varying NOT NULL
);
    DROP TABLE public."user";
       public         heap    postgres_inssoft    false            �            1259    16415    user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public          postgres_inssoft    false    215            �           0    0    user_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;
          public          postgres_inssoft    false    216                       2604    16416    user id    DEFAULT     d   ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);
 8   ALTER TABLE public."user" ALTER COLUMN id DROP DEFAULT;
       public          postgres_inssoft    false    216    215            �          0    16399    user 
   TABLE DATA           J   COPY public."user" (id, name, email, password, "phoneNumber") FROM stdin;
    public          postgres_inssoft    false    215   �       �           0    0    user_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.user_id_seq', 49, true);
          public          postgres_inssoft    false    216                       2606    16426 #   user PK_cace4a159ff9f2512dd42373760 
   CONSTRAINT     e   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "PK_cace4a159ff9f2512dd42373760" PRIMARY KEY (id);
 Q   ALTER TABLE ONLY public."user" DROP CONSTRAINT "PK_cace4a159ff9f2512dd42373760";
       public            postgres_inssoft    false    215                       2606    16502 #   user UQ_e12875dfb3b1d92d7d7c5377e22 
   CONSTRAINT     c   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "UQ_e12875dfb3b1d92d7d7c5377e22" UNIQUE (email);
 Q   ALTER TABLE ONLY public."user" DROP CONSTRAINT "UQ_e12875dfb3b1d92d7d7c5377e22";
       public            postgres_inssoft    false    215            �     x�mӹr�H�y
gS%�R���fӂ0B¸&i- A�����G��h�/6mߚ���䫿�#$��+2|�I[R�=H?�_�?N��T�9OJ��'��L9�������8�ǋ4z�V��t�V�z�����g7H�̀
(#+p� �H���p����s:}�������&���`�.Ҧ��㠹��l�Cx�|ҟ��uzH��A'(U@��J>?��M�!��$"Q*~���㏌��w��b��¸ߍݺr�M"5��m��VX�v�_v���6t�}O/"�
e]æ2@*�Uuz$EN���	�W �o%%�s�5p_5���"�aT�3u&�F^GO���a鶔��5p�أ�~�2�XQ!BX6(l�� �ES�G�h���T�dL[Y��^R�A��2K$Fӷ�,��~��NA��K휛ƮX�o�F��,4�4"U��b8%e$�5O8�>������ ��g{mu���4�62�9����ϯcz�7]�s��x9���5�Q��3bi5���-^�jE�u֒$-��M<�����mc�kȴ�E���(�B#xq<��g-�揜���c��Ht+�I~�҄���_��J�YZd�~ɋo.X	.DE��y��Pu$u,k*����d�����h�гŎ�Ӂv�{�M5�f@��&4�ӆ�������IR�r�u�B���V��2��T/��\ɳY�d�@�o��t'������/�� M�m��rg�="qL��M�h���v��K8��D/J����耜����y7�[I��-�ڒ �X�:�U��)��en�     