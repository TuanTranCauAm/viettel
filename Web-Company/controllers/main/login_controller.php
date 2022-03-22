<?php
require_once('controllers/main/base_controller.php');
require_once('models/user.php');

class LoginController extends BaseController{
	function __construct(){
		$this->folder = 'login';
	}

	public function index(){
		session_start();	//Sử dụng để check đăng nhập, khởi tạo khi vào trang đăng nhập
		if (isset($_SESSION["guest"])){	// Nếu có biến này tới trang chủ
			header('Location: index.php?page=main&controller=layouts&action=index');
		}
		else if (isset($_POST['submit-btn'])){ // Nếu thực hiện submit
			$phone = $_POST['phone'];
			$password = $_POST['password'];
			unset($_POST);	//Xóa biến
			$check = User::validation($phone, $password);
			if ($check == 1){
				$_SESSION["guest"] = $phone;
				header('Location: index.php?page=main&controller=layouts&action=index');
			}
			else{
				$err = "Tài khoản hoặc mật khẩu không đúng";
				$data = array('err' => $err);
				$this->render('index', $data);
			}
		}
		else{
			$this->render('index');
		}
	}

	public function logout(){
		session_start();
		unset($_SESSION["guest"]);
		session_destroy();
		header("Location: index.php?page=main&controller=login&action=index");
	}
}
