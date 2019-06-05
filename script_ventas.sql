
CREATE TABLE  "CLIENTE" 
   (	"COD_PAIS" CHAR(2) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"TIP_DOC" CHAR(3) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"NUM_DOC" CHAR(15) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"NOM_CLIENTE" VARCHAR2(200) COLLATE "USING_NLS_COMP", 
	"APE_CLIENTE" VARCHAR2(200) COLLATE "USING_NLS_COMP", 
	 PRIMARY KEY ("TIP_DOC", "NUM_DOC", "COD_PAIS")
  USING INDEX  ENABLE
   )  DEFAULT COLLATION "USING_NLS_COMP"
/
CREATE TABLE  "PAIS" 
   (	"COD_PAIS" CHAR(2) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"NOM_PAIS" VARCHAR2(200) COLLATE "USING_NLS_COMP", 
	 PRIMARY KEY ("COD_PAIS")
  USING INDEX  ENABLE
   )  DEFAULT COLLATION "USING_NLS_COMP"
/
CREATE TABLE  "PRODUCTO" 
   (	"SKU" CHAR(15) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"NOMBRE" VARCHAR2(250) COLLATE "USING_NLS_COMP", 
	"COD_TIP_PROD" CHAR(6) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"CANT_UNIDAD" NUMBER(*,0), 
	"UNIDAD" VARCHAR2(50) COLLATE "USING_NLS_COMP", 
	"MTO_UNID" NUMBER(10,4), 
	 PRIMARY KEY ("SKU")
  USING INDEX  ENABLE
   )  DEFAULT COLLATION "USING_NLS_COMP"
/
CREATE TABLE  "TH_VENTAS" 
   (	"FEC_VENTA" DATE, 
	"MES" CHAR(2) COLLATE "USING_NLS_COMP", 
	"ANHO" CHAR(4) COLLATE "USING_NLS_COMP", 
	"TIENDA_COD_TIENDA" CHAR(8) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"TIPO_PRODUCTO_COD_TIP_PROD" CHAR(6) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"PRODUCTO_SKU" CHAR(15) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"MTO_UNIDAD" VARCHAR2(45) COLLATE "USING_NLS_COMP", 
	"CANTIDAD" VARCHAR2(45) COLLATE "USING_NLS_COMP"
   )  DEFAULT COLLATION "USING_NLS_COMP"
/
CREATE TABLE  "TIENDA" 
   (	"COD_TIENDA" CHAR(8) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"UBIGEO" CHAR(6) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"NOMBRE" VARCHAR2(100) COLLATE "USING_NLS_COMP", 
	 PRIMARY KEY ("COD_TIENDA")
  USING INDEX  ENABLE
   )  DEFAULT COLLATION "USING_NLS_COMP"
/
CREATE TABLE  "TIPO_DOC" 
   (	"COD_TIP_DOC" CHAR(3) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"DESC_DOCUMENTO" VARCHAR2(45) COLLATE "USING_NLS_COMP", 
	 PRIMARY KEY ("COD_TIP_DOC")
  USING INDEX  ENABLE
   )  DEFAULT COLLATION "USING_NLS_COMP"
/
CREATE TABLE  "TIPO_PRODUCTO" 
   (	"COD_TIP_PROD" CHAR(6) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"NOMBRE" VARCHAR2(100) COLLATE "USING_NLS_COMP", 
	 PRIMARY KEY ("COD_TIP_PROD")
  USING INDEX  ENABLE
   )  DEFAULT COLLATION "USING_NLS_COMP"
/
CREATE TABLE  "UBIGEO" 
   (	"UBIGEO" CHAR(6) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"COD_PROV" CHAR(2) COLLATE "USING_NLS_COMP", 
	"COD_DIS" VARCHAR2(45) COLLATE "USING_NLS_COMP", 
	"COD_DEP" VARCHAR2(45) COLLATE "USING_NLS_COMP", 
	"DESC_UBIGEO" VARCHAR2(200) COLLATE "USING_NLS_COMP", 
	 PRIMARY KEY ("UBIGEO")
  USING INDEX  ENABLE
   )  DEFAULT COLLATION "USING_NLS_COMP"
/
CREATE TABLE  "VENTA" 
   (	"TIP_DOC" CHAR(2) COLLATE "USING_NLS_COMP", 
	"NUM_DOC" VARCHAR2(15) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"FEC_VENTA" DATE, 
	"MTO_TOTAL" NUMBER(10,4), 
	"COD_TIENDA" CHAR(8) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"CLI_COD_PAIS" CHAR(2) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"CLI_TIP_DOC" CHAR(3) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"CLI_NUM_DOC" CHAR(15) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"IND_PROC" CHAR(1) COLLATE "USING_NLS_COMP", 
	 PRIMARY KEY ("TIP_DOC", "NUM_DOC")
  USING INDEX  ENABLE
   )  DEFAULT COLLATION "USING_NLS_COMP"
/
CREATE TABLE  "VENTA_DETALLE" 
   (	"TIP_DOC" CHAR(2) COLLATE "USING_NLS_COMP", 
	"NUM_DOC" VARCHAR2(15) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"SKU" CHAR(15) COLLATE "USING_NLS_COMP" NOT NULL ENABLE, 
	"CANTIDAD" NUMBER(*,0), 
	"MTO_UNID" NUMBER(10,4), 
	 PRIMARY KEY ("TIP_DOC", "NUM_DOC", "SKU")
  USING INDEX  ENABLE
   )  DEFAULT COLLATION "USING_NLS_COMP"
/
ALTER TABLE  "TIENDA" ADD CONSTRAINT "FK_TIENDA_UBIGEO" FOREIGN KEY ("UBIGEO")
	  REFERENCES  "UBIGEO" ("UBIGEO") ENABLE
/
ALTER TABLE  "PRODUCTO" ADD CONSTRAINT "FK_PRODUCTO_TIPO_PRODUCTO1" FOREIGN KEY ("COD_TIP_PROD")
	  REFERENCES  "TIPO_PRODUCTO" ("COD_TIP_PROD") ENABLE
/
ALTER TABLE  "CLIENTE" ADD CONSTRAINT "FK_CLIENTE_TIP_DOC1" FOREIGN KEY ("TIP_DOC")
	  REFERENCES  "TIPO_DOC" ("COD_TIP_DOC") ENABLE
/
ALTER TABLE  "CLIENTE" ADD CONSTRAINT "FK_CLIENTE_PAIS1" FOREIGN KEY ("COD_PAIS")
	  REFERENCES  "PAIS" ("COD_PAIS") ENABLE
/
ALTER TABLE  "VENTA" ADD CONSTRAINT "FK_VENTA_TIENDA1" FOREIGN KEY ("COD_TIENDA")
	  REFERENCES  "TIENDA" ("COD_TIENDA") ENABLE
/
ALTER TABLE  "VENTA" ADD CONSTRAINT "FK_VENTA_CLIENTE1" FOREIGN KEY ("CLI_TIP_DOC", "CLI_NUM_DOC", "CLI_COD_PAIS")
	  REFERENCES  "CLIENTE" ("TIP_DOC", "NUM_DOC", "COD_PAIS") ENABLE
/
ALTER TABLE  "TH_VENTAS" ADD CONSTRAINT "FK_TH_VENTAS_TIENDA1" FOREIGN KEY ("TIENDA_COD_TIENDA")
	  REFERENCES  "TIENDA" ("COD_TIENDA") ENABLE
/
ALTER TABLE  "TH_VENTAS" ADD CONSTRAINT "FK_TH_VENTAS_TIPO_PRODUCTO1" FOREIGN KEY ("TIPO_PRODUCTO_COD_TIP_PROD")
	  REFERENCES  "TIPO_PRODUCTO" ("COD_TIP_PROD") ENABLE
/
ALTER TABLE  "TH_VENTAS" ADD CONSTRAINT "FK_TH_VENTAS_PRODUCTO1" FOREIGN KEY ("PRODUCTO_SKU")
	  REFERENCES  "PRODUCTO" ("SKU") ENABLE
/
ALTER TABLE  "VENTA_DETALLE" ADD CONSTRAINT "FK_VENTA_DETALLE_VENTA1" FOREIGN KEY ("TIP_DOC", "NUM_DOC")
	  REFERENCES  "VENTA" ("TIP_DOC", "NUM_DOC") ENABLE
/
ALTER TABLE  "VENTA_DETALLE" ADD CONSTRAINT "FK_VENTA_DETALLE_PRODUCTO1" FOREIGN KEY ("SKU")
	  REFERENCES  "PRODUCTO" ("SKU") ENABLE
/
CREATE OR REPLACE EDITIONABLE SYNONYM  "DBMS_XPLAN" FOR "LIVESQL"."ORACLE_SQL_USER_XPLAN"
/
CREATE OR REPLACE EDITIONABLE SYNONYM  "V$SESSION" FOR "LIVESQL"."ORACLE_SQL_USER_V$SESSION"
/
CREATE OR REPLACE EDITIONABLE SYNONYM  "V$SQL_PLAN_STATISTICS_ALL" FOR "LIVESQL"."ORACLE_SQL_USER_V$SQL_PLAN_S_A"
/
CREATE OR REPLACE EDITIONABLE PROCEDURE  "GENERA_VENTAS" IS 
vTienda     tienda%ROWTYPE;      
vCliente    cliente%ROWTYPE;      
vProducto   producto%ROWTYPE;     
vNumDoc     varchar2(15);     
vTipo       varchar2(2);       
vRandom1    number;     
vRandom2    number; 
vMonto    number;          
vFechaIni   DATE := TO_DATE ( '01012005', 'DDMMYYYY' );      
vFechaFin   DATE := TRUNC ( SYSDATE );   
BEGIN     DBMS_RANDOM.initialize ( TO_NUMBER ( TO_CHAR ( SYSDATE, 'HH24MMSS' ) ) );      
FOR i IN 1..10     LOOP  
 SELECT * into  vCliente FROM ( SELECT * FROM cliente ORDER BY dbms_random.VALUE ) WHERE ROWNUM <= 1;   
 SELECT * into  vTienda  FROM ( SELECT * FROM tienda ORDER BY dbms_random.VALUE ) WHERE ROWNUM <= 1;  
 SELECT  floor(DBMS_RANDOM.VALUE(0,2))  into vRandom1  FROM dual;            
    IF vRandom1 =0  
    THEN           
        vTipo:='F';           
        SELECT LPAD(SEQ_FACTURA.nextval ,15,'0') into vNumDoc FROM DUAL;      
    ELSE       
        vTipo:='B';           
        SELECT LPAD(SEQ_BOLETA.nextval ,15,'0') into vNumDoc FROM DUAL;              
    END IF;   
	INSERT INTO venta (     tip_doc,     num_doc,     fec_venta,     mto_total,     cod_tienda,     cli_cod_pais,     cli_tip_doc,     cli_num_doc ) 
	VALUES ( vTipo,     vNumDoc,     vFechaIni + ABS ( MOD ( DBMS_RANDOM.random, vFechaFin - vFechaIni ) ),     0,     vTienda.COD_TIENDA,     vCliente.COD_PAIS,     vCliente.TIP_DOC,     vCliente.NUM_DOC );       
	begin 
	  for vProducto in (SELECT * FROM producto SAMPLE(10) ) 
		LOOP  
		SELECT  floor(DBMS_RANDOM.VALUE(0,2))  into vRandom2  FROM dual; 
		INSERT INTO venta_detalle  (     tip_doc,     num_doc,     SKU,     CANTIDAD,     MTO_UNID  ) 
		VALUES ( vTipo,     vNumDoc,     vProducto.sku  ,     vRandom2    ,    vProducto.MTO_UNID   );   			 
	  end loop; 
	end; 
	COMMIT;    
 END LOOP;       
END;  
/

CREATE OR REPLACE EDITIONABLE PROCEDURE  "PROCESAR_VENTAS" IS      
vVenta venta%ROWTYPE;      
vDetalle venta_detalle%ROWTYPE;    
vMonto    number;   
BEGIN      
  for vVenta in (SELECT * FROM venta where IND_PROC is null ) 
	LOOP    
		SELECT   sum(CANTIDAD * MTO_UNID) into vMonto FROM venta_detalle where tip_doc =vVenta.tip_doc and num_doc=vVenta.num_doc;  
		insert into TH_VENTAS( 
			select v.fec_venta , EXTRACT(month  FROM v.fec_venta), EXTRACT(year  FROM v.fec_venta) , v.cod_tienda,  p.cod_tip_prod  , d.sku , d.MTO_UNID ,d.CANTIDAD from venta v  
			inner join venta_detalle d on v.tip_doc =  d.tip_doc and v.num_doc = d.num_doc   
			inner join producto p on d.sku = p.sku 
			where v.tip_doc =vVenta.tip_doc and v.num_doc=vVenta.num_doc); 	   
		UPDATE  venta set mto_total = vMonto,	IND_PROC='1' where tip_doc =vVenta.tip_doc and num_doc=vVenta.num_doc;   
	end loop;   
  	 
	END;
/

 CREATE SEQUENCE   "SEQ_FACTURA"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 81 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
/
 CREATE SEQUENCE   "SEQ_BOLETA"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL
/
