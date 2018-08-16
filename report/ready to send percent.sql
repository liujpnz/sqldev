--detail with stock

select SalesOrderLineInvoiced , SalesOrderLineQuantity 
select 
					ol.RefNumber,ol.SalesOrderLineSeqID,ol.SalesOrderLineItemRefFullName,ol.SalesOrderLineSeqID,ol.SalesOrderLineQuantity,sum(Qty) as sumstock,iif(sum(Qty)<=0,0,1)
					FROM Salesorderline ol,ItemStock st ,salesorder so, Warehouse w
					WHERE SalesOrderLineInvoiced < SalesOrderLineQuantity
						AND ol.RefNumber = so.RefNumber
						and ol.SalesOrderLineItemRefFullName = st.Sku
						and st.Warehouse=w.WarehouseName
						--and w.Store=so.Store
						AND SalesOrderLineItemRefFullName <> 'Freight'
					and (so.store = 'auckland') and w.Store= 'auckland'
	AND so.STATUS NOT IN (
		'fully_canceled'
		,'fully_invoiced'
		,'delivered'
		,'close'
		)
	AND so.IsApproved = 1
	AND so.ordertype != 'BACKORDER'
	group by ol.RefNumber,ol.SalesOrderLineSeqID,ol.SalesOrderLineItemRefFullName,ol.SalesOrderLineSeqID,ol.SalesOrderLineQuantity
	order by 1,2

310120
352310
355228



select 
--with style
with data
	as(
	select 
					ol.RefNumber,ol.SalesOrderLineSeqID,ol.SalesOrderLineQuantity,sum(Qty) as sumstock,iif(sum(Qty)<=0,0,iif(ol.SalesOrderLineQuantity-sum(Qty)>=0,0,1)) as flag
					FROM Salesorderline ol,ItemStock st ,salesorder so, Warehouse w
					WHERE SalesOrderLineInvoiced < SalesOrderLineQuantity
						AND ol.RefNumber = so.RefNumber
						and ol.SalesOrderLineItemRefFullName = st.Sku
						and st.Warehouse=w.WarehouseName
						and w.Store=so.Store
						AND SalesOrderLineItemRefFullName <> 'Freight'
					and (so.store = 'auckland') 
	AND so.STATUS NOT IN (
		'fully_canceled'
		,'fully_invoiced'
		,'delivered'
		,'close'
		)
	AND so.IsApproved = 1
	AND so.ordertype != 'BACKORDER'
	group by ol.RefNumber,ol.SalesOrderLineSeqID,ol.SalesOrderLineQuantity
	)

	select RefNumber,sum(flag),count(RefNumber),round(sum(flag)*100/count(RefNumber),2)  from data
	group by RefNumber
	order by 1




---with old style


SELECT CONCAT (
		cast(round(1 * 1.00 / (
					SELECT CASE 
							WHEN count(*) = 0
								THEN 1
							WHEN count(*) > 0
								THEN count(*)
							END
					FROM Salesorderline
					WHERE SalesOrderLineInvoiced < SalesOrderLineQuantity
						AND RefNumber = so.RefNumber
						AND SalesOrderLineItemRefFullName <> 'Freight'
					), 2) * 100 AS INT)
		,'%'
		) AS PERCENTS,

		isnull((		
	select concat(round(sum(flag)*100/count(RefNumber),2),'%')  from (	select 
					ol.RefNumber,ol.SalesOrderLineSeqID,ol.SalesOrderLineQuantity,sum(Qty) as sumstock,iif(sum(Qty)<=0,0,iif(ol.SalesOrderLineQuantity-sum(Qty)>=0,0,1)) as flag
					FROM Salesorderline ol,ItemStock st , Warehouse w
					WHERE SalesOrderLineInvoiced < SalesOrderLineQuantity
						AND ol.RefNumber = so.RefNumber
						and ol.SalesOrderLineItemRefFullName = st.Sku
						and st.Warehouse=w.WarehouseName
						and w.Store=so.Store
						AND SalesOrderLineItemRefFullName <> 'Freight'
	group by ol.RefNumber,ol.SalesOrderLineSeqID,ol.SalesOrderLineQuantity) as temp
	group by RefNumber

		),'0%') as PERCENTS1

	,(
		SELECT TOP 1 binlocation
		FROM itemstock
		WHERE sku IN (
				SELECT TOP 1 SalesOrderLineItemRefFullName AS qty
				FROM Salesorderline
				WHERE SalesorderID = so.id
					AND SalesOrderLineInvoiced < SalesOrderLineQuantity
					AND SUBSTRING(SalesOrderLineItemRefFullName, 0, 3) <> '90'
					AND lower(SalesOrderLineItemRefFullName) <> 'freight'
				GROUP BY SalesOrderLineItemRefFullName
				ORDER BY sum(SalesOrderLineQuantity - SalesOrderLineInvoiced) DESC
				)
			AND qty > 0
		ORDER BY len(binlocation) DESC
		) AS MainArea
	,(
		SELECT CASE 
				WHEN count(*) > 0
					THEN 'backorder'
				WHEN count(*) <= 0
					THEN ''
				END
		FROM Salesorderline
		WHERE SalesorderID = so.id
			AND SalesOrderLineInvoiced < SalesOrderLineQuantity
			AND SUBSTRING(SalesOrderLineItemRefFullName, 0, 3) <> '90'
			AND lower(SalesOrderLineItemRefFullName) <> 'freight'
			AND (
				SELECT sum(qty)
				FROM ItemStock
				WHERE sku = Salesorderline.SalesOrderLineItemRefFullName
				) <= 0
		) AS IsBackOrder
	,(
		SELECT sum(SalesOrderLineRate * (salesorderlinequantity - SalesOrderLineInvoiced))
		FROM Salesorderline
		WHERE SalesorderID = so.id
		) AS totalamount
	,so.picker
	,cast(so.Txndate AS VARCHAR(50)) AS Txndate
	,so.id
	,so.RefNumber AS SALESORDER
	,so.ImportRefNumber AS REFERENCE
	,so.ShipPersonFullName AS Customer
	,so.ShipPersonFullName AS CUSTOMER
	,so.memo
	,so.notes
	,so.ShipMethodRefFullName
	,(
		CASE 
			WHEN substring(trim(ImportRefNumber), 1, 1) = '0'
				THEN 'Trademe'
			WHEN substring(trim(ImportRefNumber), 1, 1) = '1'
				THEN 'Web'
			ELSE 'Showroom'
			END
		) AS channel
	,CONCAT (
		ShipPersonTelephone
		,'  '
		,ShipPersonMobile
		) AS PHONE
	,datediff(dd, so.TxnDate, getdate()) AS DAYS
	,so.CustomerRefFullName AS CUSTOMERREFFULLNAME
	,CONCAT (
		so.ShipAddressLine1
		,so.ShipAddressLine2
		,so.ShipAddressDistrict
		,so.ShipAddressCity
		,so.ShipAddressRegion
		) AS NAMEAREA
	,so.CustomFieldEmail AS COMMENT
	,so.salesrepreffullname AS salesrep
FROM Salesorder so
WHERE (so.store = 'auckland')
	AND so.STATUS NOT IN (
		'fully_canceled'
		,'fully_invoiced'
		,'delivered'
		,'close'
		)
	AND so.IsApproved = 1
	AND so.ordertype != 'BACKORDER'
ORDER BY (
		CASE 
			WHEN substring(trim(ImportRefNumber), 1, 1) = '0'
				THEN 'Trademe'
			WHEN substring(trim(ImportRefNumber), 1, 1) = '1'
				THEN 'Web'
			ELSE 'Showroom'
			END
		)
	,so.ShipMethodRefFullName DESC
	,so.id DESC










