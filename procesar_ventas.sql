PROCEDURE procesar_ventas  IS      
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
