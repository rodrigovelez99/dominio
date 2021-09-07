create table CLIENTE (
   ID_CLIENTE           INT4                 not null,
   ID_FACTURA           INT4                 null,
   NOMBRES              VARCHAR(20)          null,
   APELLIDOS            VARCHAR(20)          null,
   CEDULA               VARCHAR(10)          null,
   TELEFONO             NUMERIC(10)          null,
   EMAIL                VARCHAR(25)          null,
   DIRECCION            VARCHAR(25)          null,
   constraint PK_CLIENTE primary key (ID_CLIENTE)
);

/*==============================================================*/
/* Index: CLIENTE_PK                                            */
/*==============================================================*/
create unique index CLIENTE_PK on CLIENTE (
ID_CLIENTE
);

/*==============================================================*/
/* Index: RELATIONSHIP_5_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_5_FK on CLIENTE (
ID_FACTURA
);

/*==============================================================*/
/* Table: DETALLE_PRODUCTO                                      */
/*==============================================================*/
create table DETALLE_PRODUCTO (
   ID_DETALLE           INT4                 not null,
   ID_FACTURA           INT4                 null,
   ID_TIPO              INT4                 null,
   DESCRIPCION          VARCHAR(50)          null,
   STOCK_PRODUCTO       NUMERIC(15)          null,
   constraint PK_DETALLE_PRODUCTO primary key (ID_DETALLE)
);

/*==============================================================*/
/* Index: DETALLE_PRODUCTO_PK                                   */
/*==============================================================*/
create unique index DETALLE_PRODUCTO_PK on DETALLE_PRODUCTO (
ID_DETALLE
);

/*==============================================================*/
/* Index: RELATIONSHIP_8_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_8_FK on DETALLE_PRODUCTO (
ID_FACTURA
);

/*==============================================================*/
/* Index: RELATIONSHIP_7_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_7_FK on DETALLE_PRODUCTO (
ID_TIPO
);

/*==============================================================*/
/* Table: FACTURA                                               */
/*==============================================================*/
create table FACTURA (
   ID_FACTURA           INT4                 not null,
   FECHA_ENTREGA        DATE                 null,
   DIRECCION            VARCHAR(25)          null,
   constraint PK_FACTURA primary key (ID_FACTURA)
);

/*==============================================================*/
/* Index: FACTURA_PK                                            */
/*==============================================================*/
create unique index FACTURA_PK on FACTURA (
ID_FACTURA
);

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO (
   ID_PRODUCTOS         INT4                 not null,
   ID_TIPO              INT4                 null,
   CODIGO_PRODUCTO      VARCHAR(20)          null,
   DIMENSIONES_PRODUCTO VARCHAR(20)          null,
   COSTO_PRODUCTO       MONEY                null,
   COLOR                VARCHAR(20)          null,
   DESCUENTO            FLOAT(10)              null,
   constraint PK_PRODUCTO primary key (ID_PRODUCTOS)
);

/*==============================================================*/
/* Index: PRODUCTO_PK                                           */
/*==============================================================*/
create unique index PRODUCTO_PK on PRODUCTO (
ID_PRODUCTOS
);
/*==============================================================*/
/* Index: RELATIONSHIP_6_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_6_FK on PRODUCTO (
ID_TIPO
);

/*==============================================================*/
/* Table: PROFORMA                                              */
/*==============================================================*/
create table PROFORMA (
   ID_PROFORMAS         INT4                 not null,
   ID_TECNICOS          INT4                 null,
   ID_PRODUCTOS         INT4                 null,
   FECHA_PROFORMANS     DATE                 null,
   constraint PK_PROFORMA primary key (ID_PROFORMAS)
);

/*==============================================================*/
/* Index: PROFORMA_PK                                           */
/*==============================================================*/
create unique index PROFORMA_PK on PROFORMA (
ID_PROFORMAS
);

/*==============================================================*/
/* Index: RELATIONSHIP_4_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_4_FK on PROFORMA (
ID_TECNICOS
);

/*==============================================================*/
/* Index: RELATIONSHIP_9_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_9_FK on PROFORMA (
ID_PRODUCTOS
);

/*==============================================================*/
/* Table: RELATIONSHIP_10                                       */
/*==============================================================*/
create table RELATIONSHIP_10 (
   ID_MADERA            INT4                 not null,
   ID_PRODUCTOS         INT4                 not null,
   constraint PK_RELATIONSHIP_10 primary key (ID_MADERA, ID_PRODUCTOS)
);

/*==============================================================*/
/* Index: RELATIONSHIP_10_PK                                    */
/*==============================================================*/
create unique index RELATIONSHIP_10_PK on RELATIONSHIP_10 (
ID_MADERA,
ID_PRODUCTOS
);

/*==============================================================*/
/* Index: RELATIONSHIP_11_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_11_FK on RELATIONSHIP_10 (
ID_PRODUCTOS
);

/*==============================================================*/
/* Index: RELATIONSHIP_10_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_10_FK on RELATIONSHIP_10 (
ID_MADERA
);

/*==============================================================*/
/* Table: TECNICO                                               */
/*==============================================================*/
create table TECNICO (
   ID_TECNICOS          INT4                 not null,
   NOMBRE_TEC           VARCHAR(20)          null,
   APELLIDO_TEC         VARCHAR(20)          null,
   FECHA_NACIMIENTO     DATE                 null,
   CEDULA               VARCHAR(10)          null,
   TELEFONO             NUMERIC(10)          null,
   constraint PK_TECNICO primary key (ID_TECNICOS)
);

/*==============================================================*/
/* Index: TECNICO_PK                                            */
/*==============================================================*/
create unique index TECNICO_PK on TECNICO (
ID_TECNICOS
);

/*==============================================================*/
/* Table: TIPO_MADERA                                           */
/*==============================================================*/
create table TIPO_MADERA (
   ID_MADERA            INT4                 not null,
   TIPO_MADERA          VARCHAR(20)          null,
   constraint PK_TIPO_MADERA primary key (ID_MADERA)
);

/*==============================================================*/
/* Index: TIPO_MADERA_PK                                        */
/*==============================================================*/
create unique index TIPO_MADERA_PK on TIPO_MADERA (
ID_MADERA
);

/*==============================================================*/
/* Table: TIPO_PRODUCTO                                         */
/*==============================================================*/
create table TIPO_PRODUCTO (
   ID_TIPO              INT4                 not null,
   ID_TECNICOS          INT4                 null,
   MUEBLE_SALA          VARCHAR(20)          null,
   MUEBLE_COMEDOR       VARCHAR(20)          null,
   MUEBLE_DORMITRIO     VARCHAR(20)          null,
   MUEBELE_OFICINA      VARCHAR(20)          null,
   constraint PK_TIPO_PRODUCTO primary key (ID_TIPO)
);

/*==============================================================*/
/* Index: TIPO_PRODUCTO_PK                                      */
/*==============================================================*/
create unique index TIPO_PRODUCTO_PK on TIPO_PRODUCTO (
ID_TIPO
);

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_3_FK on TIPO_PRODUCTO (
ID_TECNICOS
);

alter table CLIENTE
   add constraint FK_CLIENTE_RELATIONS_FACTURA foreign key (ID_FACTURA)
      references FACTURA (ID_FACTURA)
      on delete restrict on update restrict;

alter table DETALLE_PRODUCTO
   add constraint FK_DETALLE__RELATIONS_TIPO_PRO foreign key (ID_TIPO)
      references TIPO_PRODUCTO (ID_TIPO)
      on delete restrict on update restrict;

alter table DETALLE_PRODUCTO
   add constraint FK_DETALLE__RELATIONS_FACTURA foreign key (ID_FACTURA)
      references FACTURA (ID_FACTURA)
      on delete restrict on update restrict;

alter table PRODUCTO
   add constraint FK_PRODUCTO_RELATIONS_TIPO_PRO foreign key (ID_TIPO)
      references TIPO_PRODUCTO (ID_TIPO)
      on delete restrict on update restrict;

alter table PROFORMA
   add constraint FK_PROFORMA_RELATIONS_TECNICO foreign key (ID_TECNICOS)
      references TECNICO (ID_TECNICOS)
      on delete restrict on update restrict;

alter table PROFORMA
   add constraint FK_PROFORMA_RELATIONS_PRODUCTO foreign key (ID_PRODUCTOS)
      references PRODUCTO (ID_PRODUCTOS)
      on delete restrict on update restrict;

alter table RELATIONSHIP_10
   add constraint FK_RELATION_RELATIONS_TIPO_MAD foreign key (ID_MADERA)
      references TIPO_MADERA (ID_MADERA)
      on delete restrict on update restrict;

alter table RELATIONSHIP_10
   add constraint FK_RELATION_RELATIONS_PRODUCTO foreign key (ID_PRODUCTOS)
      references PRODUCTO (ID_PRODUCTOS)
      on delete restrict on update restrict;

alter table TIPO_PRODUCTO
   add constraint FK_TIPO_PRO_RELATIONS_TECNICO foreign key (ID_TECNICOS)
      references TECNICO (ID_TECNICOS)
      on delete restrict on update restrict;
	  

insert into factura values(1,'10/03/2020','Manta-Si_Vivienda');
insert into factura values(2,'20/06/2020','Manta-El_Palmar');
insert into factura values(3,'15/02/2021','Manta-Jocay');
insert into factura values(4,'28/05/2021','Manta-La_Cuadra');


insert into cliente values(1,1,'Andree','Velez',1310834569,0985658980,'rodrigo@gmail.com','Manta-Si_Vivienda');
insert into cliente values(2,2,'Solange','Marcillo',1307586547,0996586547,'solange@gmail.com','Manta-El_Palmar');
insert into cliente values(3,3,'Paul','Velez',1312468589,0980974781,'paul@gmail.com','Manta-Jocay');
insert into cliente values(4,4,'Roberth','Moreira',1310678858,0993467210,'roberth@gmail.com','Manta-La_Cuadra');
	  
	
insert into tecnico values(1,'Jose','Campuzano','04/07/1965',1310732707,0978567540);
insert into tecnico values(2,'Freddy','Macias','10/08/1962',1310557887,0997489768);
insert into tecnico values(3,'Dany','Mendoza','23/10/1968',1304369778,0985346790);
insert into tecnico values(4,'Steven','Mejia','18/03/1975',1308657567,0999357009);


insert into tipo_producto values(1,1,'mesa_sala','mesa_comedor','cama','silla_oficina');
insert into tipo_producto values(2,2,'mueble_sala','anaqueles','armario','mesa_oficina');
insert into tipo_producto values(3,3,'silla_sala','silla_comedor','respaldor_tv','escritorio_oficina');
insert into tipo_producto values(4,4,'stand_sala','stand_comedor','cajonera','stand_oficina');


insert into tipo_madera values(1,'ebano');
insert into tipo_madera values(2,'roble');
insert into tipo_madera values(3,'olivo');
insert into tipo_madera values(4,'palo_santo');


insert into detalle_producto values(1,1,1,'Olivo',60);
insert into detalle_producto values(2,2,2,'Roble',20);
insert into detalle_producto values(3,3,3,'Palo_Santo',50);
insert into detalle_producto values(4,4,4,'Ebano',100);

insert into producto values(1,1,'EA-123','75X80_cm',280,'cafe',30);
insert into producto values(2,2,'EB-213','88X99_cm',150,'negro',25);
insert into producto values(3,3,'EC-321','55X60_cm',190,'cafe_capuccino',20);
insert into producto values(4,4,'ED-231','95X120_cm',350,'gris',50);


insert into proforma values(1,1,1,'25/09/2020');
insert into proforma values(2,2,2,'14/12/2020');
insert into proforma values(3,3,3,'20/03/2021');
insert into proforma values(4,4,4,'20/06/2021');

select
MUEBLE_SALA as Muebles_de_sala,
CODIGO_PRODUCTO as codigo,
DIMENSIONES_PRODUCTO as dimension,
COSTO_PRODUCTO as costo,
COLOR as color
FROM PRODUCTO
INNER JOIN TIPO_PRODUCTO ON PRODUCTO.ID_PRODUCTOS = TIPO_PRODUCTO.ID_TIPO

select
NOMBRE_TEC as nombre_tecnico,
APELLIDO_TEC as apellido_tecnico,
CEDULA as cedula_tecnico,
TELEFONO as telefono_tecnico,
FECHA_PROFORMANS as fecha_proforma,
CODIGO_PRODUCTO,
DIMENSIONES_PRODUCTO,
COSTO_PRODUCTO,
COLOR,
MUEBLE_COMEDOR
FROM PROFORMA
INNER JOIN TECNICO ON PROFORMA.ID_PROFORMAS = TECNICO.ID_TECNICOS
INNER JOIN PRODUCTO ON PROFORMA.ID_PROFORMAS = PRODUCTO.ID_PRODUCTOS
INNER JOIN TIPO_PRODUCTO ON PROFORMA.ID_PROFORMAS = TIPO_PRODUCTO.ID_TIPO


select
NOMBRES,
APELLIDOS,
CEDULA,
TELEFONO,
EMAIL,
FECHA_ENTREGA,
DESCRIPCION,
COSTO_PRODUCTO
FROM CLIENTE
INNER JOIN FACTURA ON CLIENTE.ID_CLIENTE = FACTURA.ID_FACTURA
INNER JOIN DETALLE_PRODUCTO ON CLIENTE.ID_CLIENTE = DETALLE_PRODUCTO.ID_FACTURA
INNER JOIN PRODUCTO ON CLIENTE.ID_CLIENTE = PRODUCTO.ID_PRODUCTOS
GROUP BY
NOMBRES,
APELLIDOS,
CEDULA,
TELEFONO,
EMAIL,
FECHA_ENTREGA,
DESCRIPCION,
COSTO_PRODUCTO


select
NOMBRE_TEC as nombre_tecnico,
APELLIDO_TEC as apellido_tecnico,
CEDULA as cedula_tecnico,
TELEFONO as telefono_tecnico,
MUEBLE_SALA,
MUEBLE_COMEDOR,
MUEBLE_DORMITRIO,
MUEBELE_OFICINA,
COSTO_PRODUCTO
FROM TIPO_PRODUCTO
INNER JOIN TECNICO ON TIPO_PRODUCTO.ID_TIPO = TECNICO.ID_TECNICOS
INNER JOIN PRODUCTO ON TIPO_PRODUCTO.ID_TIPO = PRODUCTO.ID_PRODUCTOS

--stop-procidio--
create or replace function total(
IN tipo varchar,
	OUT total varchar
)
as $BODY$
begin 
	select count(distinct tecnico.id_tecnicos) into total
	from tipo_producto
	inner join tecnico on tecnico.id_tecnicos = tipo_producto.id_tipo
	where mueble_comedor = tipo;
	
end
$BODY$
language plpgsql;
select * from total('mesa_sala')

--cursor--

do $$
declare 
contador decimal =0;
total Record;
--INICIO DEL CURSOR
totalingresos Cursor for select * from producto,tipo_producto,tecnico, detalle_producto, proforma, cliente
where producto.id_productos = producto.id_productos and 
tecnico.id_tecnicos = 2 and tecnico.nombre_tec ='Freddy' and tipo_producto.id_tecnicos = tipo_producto.id_tecnicos and
detalle_producto.id_tipo = detalle_producto.id_tipo and proforma.id_productos =proforma.id_productos and cliente.id_cliente =cliente.id_cliente;
begin
for total in totalingresos loop
contador = contador+count(total.id_tecnicos);
Raise Notice 'tecnico: %, Nombres: %, cliente: %, cantidad: %, mueble: %,descuento: %, contador: %',
total.id_tecnicos, total.nombre_tec,total.nombres,total.stock_producto,total.mueble_comedor, total.descuento, contador;
end loop;
end $$
Language 'plpgsql';


--trigger--
CREATE OR REPLACE FUNCTION VALOR() RETURNS TRIGGER
AS 
$VALOR$
	DECLARE
		cantidad int;
		ful int = 3;
BEGIN 
select count (*) into cantidad  from cliente where id_cliente = new.id_cliente;
select proforma.id_proformas into ful from proforma;
	if (cantidad >= ful) then
	RAISE EXCEPTION 'NO SE PUEDE HACER MAS PROFORMAS';
	END if;
	RETURN new;
END;
$VALOR$
LANGUAGE plpgsql;

create trigger VALOR before insert
on cliente for EACH ROW
execute procedure VALOR();

--INSERTAMOS DATOS PARA VERIFICAR EN EL TRIGGER
insert into cliente values(1,1,'Andree','Velez',1310834569,0985658980,'rodrigo@gmail.com','Manta-Si_Vivienda')




