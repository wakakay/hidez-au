<?php
$to = 'sales@hidez.com.au';
$servername = "localhost";
$username = "hidez_atomwakaka";
$password = "STAR.electrical5";
$dbname = "hidez_shop";

// 创建连接
$conn = new mysqli($servername, $username, $password, $dbname);
// 检测连接
if ($conn->connect_error) {
    die("连接失败: " . $conn->connect_error);
}

//saveForm" tabindex="25" type="submit

if($_POST['saveForm']=='Submit' and $_POST['Email']){

	if($_POST['mod']=='1'){
		$subject = 'Hidez Sponsorship Application'.$_POST[FirstName].$_POST[LastName];
		$message = "<html><head><title>".$subject."</title></head><body>";
		$message.= "<table style='border:0'>";
		$message.= "<tr><td style='width:260px;'><span style='color:#999'>First name</span></td><td>".$_POST[FirstName]."</td></tr>";
		$message.= "<tr><td><span style='color:#999'>Last name</span></td><td>".$_POST[LastName]."</td></tr>";
		$message.= "<tr><td><span style='color:#999'>Gender</span></td><td>".$_POST[Gender]."</td></tr>";
		$message.= "<tr><td><span style='color:#999'>Age</span></td><td>".$_POST[Age]."</td></tr>";
		$message.= "<tr><td><span style='color:#999'>Street Address</span></td><td>".$_POST[StreetAddress]."</td></tr>";
		$message.= "<tr><td><span style='color:#999'>Address Line 2</span></td><td>".$_POST[AddressLine]."</td></tr>";
		$message.= "<tr><td><span style='color:#999'>City</span></td><td>".$_POST[City]."</td></tr>";
		$message.= "<tr><td><span style='color:#999'>State/Province/Region</span></td><td>".$_POST[State]."</td></tr>";
		$message.= "<tr><td><span style='color:#999'>Postal/Zip Code</span></td><td>".$_POST[Postal]."</td></tr>";
		$message.= "<tr><td><span style='color:#999'>Country</span></td><td>".$_POST[Country]."</td></tr>";
		$message.= "<tr><td><span style='color:#999'>Nationality/Country that you represent</span></td><td>".$_POST[Nat]."</td></tr>";
		$message.= "<tr><td><span style='color:#999'>Email</span></td><td>".$_POST[Email]."</td></tr>";
		$message.= "<tr><td><span style='color:#999'>Phone</span></td><td>".$_POST[Phone]."</td></tr>";
		$message.= "</table>";
		$message.= "<table style='border:0;'>";
		$message.= "<tr><td><span style='color:#999'><br>Sport seeking sponsorship for</span></td></tr><tr><td>".$_POST[Field]."</td></tr>";
		$message.= "<tr><td><span style='color:#999'><br>Achievements in your sport to date</span></td></tr><tr><td>".$_POST[Achievements]."</td></tr>";
		$message.= "<tr><td><span style='color:#999'><br>Do you have our own website or facebook facebook page or similar ?If Yes, please provide details (name, website etc)</span></td></tr><tr><td>".$_POST[provide]."</td></tr>";
		$message.= "<tr><td><span style='color:#999'><br>Competition level</span></td></tr><tr><td>".$_POST[Competition]."</td></tr>";
		$message.= "<tr><td><span style='color:#999'><br>Current ranking</span></td></tr><tr><td>".$_POST[ranking]."</td></tr>";
		$message.= "<tr><td><span style='color:#999'><br>Upcoming activity</span></td></tr><tr><td>".$_POST[activity]."</td></tr>";
		$message.= "<tr><td><span style='color:#999'><br>Received media exposure &amp; publicity – include links to your personal website/blog and any external exposure/photography/videos </span></td></tr><tr><td>".$_POST[website]."</td></tr>";
		$message.= "<tr><td><span style='color:#999'><br>Upcoming media exposure &amp; publicity – include any relevant links</span></td></tr><tr><td>".$_POST[links]."</td></tr>";
		$message.= "<tr><td><span style='color:#999'><br>Current sponsors</span></td></tr><tr><td>".$_POST[sponsors]."</td></tr>";
		$message.= "<tr><td><span style='color:#999'><br>Interested in which Hidez , products</span></td></tr><tr><td>".$_POST[products]."</td></tr>";
		$message.= "<tr><td><span style='color:#999'><br>Why do you think you will be a good brand ambassador for HIDEZ ?</span></td></tr><tr><td>".$_POST[ambassador]."</td></tr>";
		$message.= "<tr><td><span style='color:#999'><br>Other comments</span></td></tr><tr><td>".$_POST[comments]."</td></tr>";
		$message.= "</table>";
		$message.= "</body></html>";
	}

	if($_POST['mod']=='2'){

		if ((($_FILES["problem"]["type"] == "image/gif")|| ($_FILES["problem"]["type"] == "image/jpeg")|| ($_FILES["problem"]["type"] == "image/pjpeg"))&& ($_FILES["problem"]["size"] < 20000)){
		  if ($_FILES["problem"]["error"] > 0){
				$_POST[problem]='';
			}else{
				  $t=time();
				  if($_FILES["problem"]["type"] == "image/gif"){ $FILESname=$t.'.gif';}
				  if($_FILES["problem"]["type"] == "image/jpeg"){ $FILESname=$t.'.jpeg';}
				  if($_FILES["problem"]["type"] == "image/pjpeg"){ $FILESname=$t.'.pjpeg';}
				  move_uploaded_file($_FILES["problem"]["tmp_name"],"mail/". $FILESname);
			  if (file_exists('mail/'.$FILESname)){
				$_POST[problem]='<img src="mail/'.$FILESname.'">';
			  }else{
				$_POST[problem]='';
			  }
			}
		  }else{
		  $_POST[problem]='';
		  }

		$subject = 'Hidez Warranty Claim Form:'.$_POST[FirstName].$_POST[LastName];
		$message = "<html><head><title>".$subject."</title></head><body>";
		$message.= "<tr><td><br>First Name</td></tr><tr><td>".$_POST[FirstName]."</td></tr>";
		$message.= "<tr><td><br>Last Name</td></tr><tr><td>".$_POST[LastName]."</td></tr>";
		$message.= "<tr><td><br>Email Address</td></tr><tr><td>".$_POST[Email]."</td></tr>";
		$message.= "<tr><td><br>Daytime Phone Number</td></tr><tr><td>".$_POST[dpn]."</td></tr>";

		$message.= "<tr><td><br>Address</td></tr>";
		$message.= "<tr><td><br>Slieet Address</td></tr><tr><td>".$_POST[Address]."</td></tr>";
		$message.= "<tr><td><br>Address Line 2</td></tr><tr><td>".$_POST[Saddress]."</td></tr>";
		$message.= "<tr><td><br>State / Province / Region</td></tr><tr><td>".$_POST[State]."</td></tr>";
		$message.= "<tr><td><br>Postal / Zip Code</td></tr><tr><td>".$_POST[Postal]." ".$_POST[counliy]."</td></tr>";

		$message.= "<tr><td><br>Item Name</td></tr><tr><td>".$_POST[ItemName]."</td></tr>";
		$message.= "<tr><td><br>Size</td></tr><tr><td>".$_POST[size]."</td></tr>";
		$message.= "<tr><td><br>Colour</td></tr><tr><td>".$_POST[colour]."</td></tr>";
		$message.= "<tr><td><br>Date of Purchase</td></tr><tr><td>".$_POST[data]."</td></tr>";
		//$message.= "<tr><td><br>Counliy of Origin</td></tr><tr><td>".$_POST[Coo]."</td></tr>";
		$message.= "<tr><td><br>What's the defect?</td></tr><tr><td>".$_POST[wtd]."</td></tr>";
		$message.= "<tr><td><br>A photo of the problem</td></tr><tr><td>".$_POST[problem]."</td></tr>";
		$message.= "<tr><td><br>Where did you buy your Hidez?</td></tr><tr><td>".$_POST[Hidez]."</td></tr>";
		$message.= "</body></html>";
	}

	$headers  = "MIME-Version: 1.0" . "\r\n"; 
	$headers .= "Content-type: text/html; charset=iso-8859-1" . "\r\n";
	$headers .= "To: Hidez <".$to.">" . "\r\n";;
	$headers .= "From: ".$_POST[FirstName]." <".$_POST[Email].">" ."\r\n";
	

     $sql = "INSERT INTO `oc_sponsorship_application` (`FirstName`, `LastName`, `Gender`, `Age`, `StreetAddress`, `AddressLine`, `City`, `State`, `Postal`, `Country`, `Nat`, `Email`, `Phone`, `Field`, `Achievements`, `provide`, `Competition`, `ranking`, `activity`, `website`, `links`, `sponsors`, `products`, `comments`, `date_added`) VALUES ('". $_POST[FirstName]."', '".$_POST[LastName] ."', '".$_POST[Gender] ."', '".$_POST[Age] ."', '".$_POST[StreetAddress] ."', '".$_POST[AddressLine] ."', '".$_POST[City] ."', '".$_POST[State] ."', '".$_POST[Postal] ."', '".$_POST[Country] ."', '".$_POST[Nat] ."', '".$_POST[Email] ."', '".$_POST[Phone] ."', '".$_POST[Field] ."', '".$_POST[Achievements] ."', '".$_POST[provide] ."', '".$_POST[Competition] ."', '".$_POST[ranking] ."', '".$_POST[activity] ."', '".$_POST[website] ."', '".$_POST[links] ."', '".$_POST[sponsors] ."', '".$_POST[products] ."', '".$_POST[comments] ."', ". time() . ")";

    $conn->query($sql);
    $conn->close();

	$returnMsg=mail($to, $subject, $message, $headers) ? 'success' : 'failure';

	$returnUrl=$_POST['mod']=='1'?'index.php?route=information/information&information_id=30':'index.php?route=information/information&information_id=31';
	Return_Msg($returnMsg,$returnUrl,2);
}else{
	$returnMsg='failure';
	$returnUrl=$_POST['mod']=='1'?'index.php?route=information/information&information_id=30':'index.php?route=information/information&information_id=31';
	Return_Msg($returnMsg,$returnUrl,2);
}


function Return_Msg($returnMsg,$returnUrl,$returnTime=1){
$returnMsgs="<html><meta http-equiv='Content-Type' content='text/html; charset=utf-8'><head><meta HTTP-EQUIV='REFRESH' CONTENT='$returnTime;URL=$returnUrl'></head>";
$returnMsgs.="
<body><br/><br/><TABLE width=700 height=200 border=0 align=center cellPadding=5 cellSpacing=2 bgColor=#CCCCCC>
  <TBODY>
  <TR><TD align=center bgColor=#FFFFFF>$returnMsg</TD>
  </TR></TBODY></TABLE>
<br/><br/></body></html>";
echo $returnMsgs;
exit;
}
?> 






