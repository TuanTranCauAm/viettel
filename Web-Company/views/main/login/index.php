<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
  
	<title>VIETTEL</title>
	<meta content="" name="description">
	<meta content="" name="keywords">
  
	<!-- ICON WEB -->
	<link href="public/uploads/favicon.png" rel="icon">
	<!-- CSS -->
	<link href="public/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="public/assets/css/register-login.css" rel="stylesheet">
</head>
	<body>	
		<div>
			<div class="register-login">
				<form class="login validate-form" method="POST">
					<span class="login-title" style="color:red">
						<strong>ĐĂNG NHẬP</strong>
					</span><br>

					<div>
						<input type="text" class="form-control" name="phone" placeholder="Số điện thoại" style="border-color: red;box-shadow:red;"><br>
					</div>
				
					<div data-validate="Password is required">
						<input type="password" class="form-control" name="password" placeholder="Mật khẩu" style="border-color: red"><br>
					</div>
					<?php

					if (isset($err))
					{
						echo '<strong style="color: red">' . $err . '</strong>';
						unset($err);
					}
					?>

					<div class="container-login-btn">
						<button class="login-btn" name="submit-btn">
							Đăng nhập
						</button>
					</div><br>

					<div>
						<a href="index.php?page=main&controller=register&action=index&flag=true" class="btn btn-success">
							Đăng ký
						</a>
						<a href="index.php?page=main&controller=layouts&action=index" class="btn btn-warning">
							Trang chủ
						</a>
					</div>
				</form>

				<div class="login-image" style="background-image: url('public/img/layouts/register.png');">
				</div>
			</div>
		</div>
	

</body>
</html>