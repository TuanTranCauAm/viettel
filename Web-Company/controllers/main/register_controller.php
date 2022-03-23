<?php
require_once('controllers/main/base_controller.php');
require_once('models/user.php');

class RegisterController extends BaseController
{
	function __construct()
	{
		$this->folder = 'register';
	}

	public function index()
	{
		$this->render('index');
	}

	public function submit()
	{
		$phone = $_POST['phone'];
		$password = $_POST['password'];
		$fname = $_POST['fname'];
		$lname = $_POST['lname'];
		$day = $_POST['day'];
		$month = $_POST['month'];
		$year = $_POST['year'];
		$gender = $_POST['gender'];
		echo $phone . $password . $fname . $lname . $day . $month . $year . $gender;
		$req = User::insert($phone, 'public/img/user/default.JPG', $password, $fname, $lname, $day, $month, $year, $gender);
		if($req){header('Location: index.php?page=main&controller=login&action=index');}
		else{header('Location: index.php?page=main&controller=register&action=index&flag=false');}
	}

	public function editInfo()
	{
		session_start();
		$phone = $_SESSION['guest'];
		$fname = $_POST['fname'];
		$lname = $_POST['lname'];
		$day = $_POST['day'];
		$month = $_POST['month'];
		$year = $_POST['year'];
		$gender = $_POST['gender'];
		$urlcurrent = $_POST['img'];
		// Photo
		$target_dir = "public/img/user/";
		$path = $_FILES['fileToUpload']['name'];
		if($path){
			$ext = pathinfo($path, PATHINFO_EXTENSION);
			$id = (string)date("Y_m_d_h_i_sa");
			$fileuploadname = (string)$id;
			$fileuploadname .= ".";
			$fileuploadname .= $ext;
			$target_file = $target_dir . basename($fileuploadname);
			if (file_exists($target_file)) {
				echo "Sorry, file already exists.";
			}
			$fileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
			// Allow certain file formats
			if (
				$fileType != "jpg" && $fileType != "png" && $fileType != "jpeg"
				&& $fileType != "gif"
			) {
				echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
				$upload_ok = 0;
			}
			if ($_FILES["fileToUpload"]["size"] > 500000) {
				echo "Sorry, your file is too large.";
			}
			$file_pointer = $urlcurrent;
			unlink($file_pointer);
			move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file);
		}
		else{
			$target_file = $urlcurrent;
		}
		// Update
		$change_info = User::update($phone, $target_file, $fname, $lname, $day, $month, $year, $gender);
		if($change_info){header('Location: index.php?page=main&controller=layouts&action=index');}
		else{echo $phone . $fname . $lname . $day . $month . $year . $gender;}
	}

	public function editPass()
	{
		$email = $_POST['email'];
		$newpassword = $_POST['new-password'];
		echo $email . " " . $newpassword .  "\n";
		$change_pass = User::changePassword_($email, $newpassword);
		echo "change_pass";
		header('Location: index.php?page=admin&controller=user&action=index');
	}

	public function delete()
	{
		$email = $_POST['email'];
		$urlcurrent = $_POST['img'];
		unlink($urlcurrent);
		$delete_user = User::delete($email);
		header('Location: index.php?page=admin&controller=user&action=index');
	}
}
?>