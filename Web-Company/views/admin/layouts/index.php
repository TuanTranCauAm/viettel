<?php
session_start();
if (!isset($_SESSION["user"])) {
	header("Location: index.php?page=admin&controller=login&action=index");
}
?>
<?php require_once('views/admin/header.php'); ?>
<?php require_once('views/admin/content_layouts.php'); ?>
<div class="content-wrapper"></div>
<?php require_once('views/admin/footer.php'); ?>
</body>

</html>