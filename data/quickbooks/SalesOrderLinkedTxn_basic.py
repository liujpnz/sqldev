import pyodbc 

cn = pyodbc.connect('DSN=QuickBooks Data 2016;')

cursor = cn.cursor()

cursor.execute("SELECT  TxnID ,LinkedTxnSeqNo,LinkedTxnTxnID ,LinkedTxnTxnType ,LinkedTxnTxnDate ,LinkedTxnRefNumber ,LinkedTxnLinkType  ,LinkedTxnAmount   FROM SalesOrderLinkedTxn nosync")
file = open('F:/dbmigration/rackon/SalesOrderLinkedTxn.txt','a') 
for row in cursor.fetchall():

		file.write(str(row)+"\n")

cursor.close()
file.close()
cn.close() 


