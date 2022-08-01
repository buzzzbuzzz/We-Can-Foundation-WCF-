<?php
ob_start();
include "include/config.php";
include "include/menu.php";
?>
	
    
	<div id="contents">
	<?php 
    if(isset($_GET["about"])){include"pages/about.php";}
    elseif(isset($_GET["donation"])){include"pages/donation.php";}
    elseif(isset($_GET["contact"])){include"pages/contact.php";}
    elseif(isset($_GET["privacypolicy"])){include"pages/privacypolicy.php";}
     elseif(isset($_GET["terms"])){include"pages/terms.php";}
    elseif(isset($_GET["securitypolicy"])){include"pages/securitypolicy.php";}
    else{include "pages/home.php" ;}
    ?>
	</div>
<?php include "include/footer.php"; ?>
</body>
</html>
<?
mysqli_close($conn);
ob_end_flush();
?>