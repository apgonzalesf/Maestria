create or replace PROCEDURE genera_ventas  IS      
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
		SELECT  floor(DBMS_RANDOM.VALUE(1,15))  into vRandom2  FROM dual; 
		INSERT INTO venta_detalle  (     tip_doc,     num_doc,     SKU,     CANTIDAD,     MTO_UNID  ) 
		VALUES ( vTipo,     vNumDoc,     vProducto.sku  ,     vRandom2    ,    vProducto.MTO_UNID   );   			 
	  end loop; 
	end; 
	COMMIT;  
 END LOOP;      
    
END;   
