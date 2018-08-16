<?php
date_default_timezone_set('NZ');
ini_set('allow_url_fopen', 1); 
require_once "C:\web\lib\dw.php";
$qodbc= new qodbc();
$qodbc->connect();

//$sql_get_est  = "select top 6 RefNumber, Memo  from Estimate where TxnDate = {d'" . $current_date . "'} order by RefNumber DESC";
//$ret          = $qodbc->queryArray($sql_get_est);
//$result[] = $qodbc->executeSQL($sql);


$userList = array(
	"Solac" => 'http://192.168.20.58/calllog.htm',
	"Lorra" => 'http://192.168.20.71/calllog.htm',
	"Saqib" => 'http://192.168.20.125/calllog.htm',
	//"Katrina" => 'http://192.168.20.64/calllog.htm',
	"Chris" => 'http://192.168.20.72/calllog.htm',
	//"Solac" => 'http://192.168.20.110/calllog.htm',
	"Beena" => 'http://192.168.20.52/calllog.htm',
	"David" => 'http://192.168.20.62/calllog.htm',
	//"Chris" => 'http://192.168.20.64/calllog.htm',
	"Emma" => 'http://192.168.20.86/calllog.htm',
	"Parth" => 'http://192.168.20.65/calllog.htm',

	//"Vanessa" => 'http://192.168.20.39/calllog.htm',
	
	//"Andruis" => 'http://192.168.20.16/calllog.htm',
	//"Raaj" => 'http://192.168.20.57/calllog.htm',

);


function savePhoneLog($salesrep, $type, $destination, $date, $duration) {
	$duration = ltrim(rtrim($duration));
	$salesrep = ltrim(rtrim($salesrep));
	$type = ltrim(rtrim($type));
	$destination = ltrim(rtrim($destination));
	
	date_default_timezone_set('NZ');
	global $qodbc;
	$datePart = explode(" ", $date);
	$datePart = $datePart[1];
	$datePart = explode("/", $datePart);  
	
	
	$month = date('n');
	$day = date('j');
	
	
	
	if ($datePart[0] != $month || $datePart[1] != $day ) {
		
		return false;
	
	}
	
	
	$sql = "select count(*) as qty from phone where phonetype='" . $type . "' and phoneto='" . $destination . "' and phonetime='" . $date . "' and phoneduration='" . $duration . "' and salesrep='" . $salesrep . "'";

	$ret = $qodbc->queryArray($sql);
	
	$duplicated = false;
	foreach($ret as $record){
		if ($record["qty"]>0) {
			$duplicated = true;
		}
	}
	
	if (!$duplicated) {
		if (ltrim(rtrim($duration)) != "0s" && $type != "missed") {
			$sql = "insert into phone (phonetype, phoneto, phonetime, phoneduration, salesrep) values ('" . $type . "', '" . $destination . "', '" . $date . "', '" . $duration . "', '" . $salesrep . "')";
			$qodbc->executeSQL($sql);
		}
		
		if ($type == "missed") {
			$sql = "insert into phone (phonetype, phoneto, phonetime, phoneduration, salesrep) values ('" . $type . "', '" . $destination . "', '" . $date . "', '" . $duration . "', '" . $salesrep . "')";
			$qodbc->executeSQL($sql);
		}
		
	}
	
}


function getPhoneLogs($name, $url) {
	date_default_timezone_set('NZ');
	
	$html = file_get_contents($url);

	$matches = array();
	preg_match_all('/(<table[^>]*>(?:.|\n)*?<\/table>)/', $html, $matches);

	//placed
	//$matches[0][5];

	
	//placed 
	$dom = new DOMDocument;
	$html = $matches[0][count($matches[0])-3];

	$records = array();

	$records = explode("<td>&nbsp;", $html);
	foreach ($records as $record) {
		
		$phoneRecord = explode("<tr bgcolor", $record);
		$phoneRecord = $phoneRecord[0];
		$phoneRecord = explode("<td>", $phoneRecord);
		$phoneRecord = $phoneRecord[0];
		if (strlen($phoneRecord) > 80) {
			continue;
		}
		
		$parts = explode(",", $phoneRecord);
		if (strlen($parts[0]) < 6 || strpos($parts[0], "Voice Mail") !== false) {
			continue;
		}
			

		savePhoneLog($name, "place", $parts[count($parts)-3], $parts[count($parts)-2], $parts[count($parts)-1]);
	}
	
	
	$html = $matches[0][count($matches[0])-2];

	$records = array();

	$records = explode("<td>&nbsp;", $html);
	foreach ($records as $record) {
		
		$phoneRecord = explode("<tr bgcolor", $record);
		$phoneRecord = $phoneRecord[0];
		$phoneRecord = explode("<td>", $phoneRecord);
		$phoneRecord = $phoneRecord[0];
		if (strlen($phoneRecord) > 80) {
			continue;
		}
		
		$parts = explode(",", $phoneRecord);
		if (strlen($parts[0]) < 6 || strpos($parts[0], "Voice Mail") !== false) {
			continue;
		}
			
		savePhoneLog($name, "answer", $parts[count($parts)-3], $parts[count($parts)-2], $parts[count($parts)-1]);
	}
	
	
	$html = $matches[0][count($matches[0])-1];

	$records = array();

	$records = explode("<td>&nbsp;", $html);
	foreach ($records as $record) {
		
		$phoneRecord = explode("<tr bgcolor", $record);
		$phoneRecord = $phoneRecord[0];
		$phoneRecord = explode("<td>", $phoneRecord);
		$phoneRecord = $phoneRecord[0];
		if (strlen($phoneRecord) > 80) {
			continue;
		}
		
		$parts = explode(",", $phoneRecord);
		if (strlen($parts[0]) < 6 || strpos($parts[0], "Voice Mail") !== false) {
			continue;
		}
			
		savePhoneLog($name, "missed", $parts[count($parts)-3], $parts[count($parts)-2], $parts[count($parts)-1]);
	}
	
	
}

date_default_timezone_set('NZ');
//$sql = "delete from phone where CAST(createdtime as DATE) = '" . date("Y-m-d"). "' and phonetype<>'missed'";
//$qodbc->executeSQL($sql);

foreach ($userList as $user=>$url) {
	
	getPhoneLogs($user, $url);
	
	
}


$sql = "delete FROM phone
WHERE  ID NOT IN (SELECT MAX(ID)
                  FROM   phone
                  GROUP  BY  phonetype,phonetime,phoneto,phoneduration,salesrep
          
                  HAVING MAX(ID) IS NOT NULL) ";
$qodbc->executeSQL($sql);


