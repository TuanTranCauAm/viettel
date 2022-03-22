<?php
  session_start();
  if (isset($_SESSION['guest']))
  {
    require_once('models/user.php');
    $data = User::get($_SESSION['guest']);
  }
  
?>
<!DOCTYPE html>
<html lang="vi">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>VNGREEN - Build technology and grow people</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="public/uploads/favicon.png" rel="icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="public/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="public/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="public/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="public/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="public/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="public/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="public/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="public/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">

  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&amp;display=fallback">
	<!-- Font Awesome-->
	<link rel="stylesheet" href="public/plugins/fontawesome-free/css/all.min.css">
	<!-- DataTables-->
	<link rel="stylesheet" href="public/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
	<link rel="stylesheet" href="public/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
	<link rel="stylesheet" href="public/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
	<!-- Theme style-->
	<link rel="stylesheet" href="public/dist/css/adminlte.min.css">
	<!-- Add Style -->

  <link href="public/assets/css/style.css" rel="stylesheet">


</head>

<body>
  <?php
  if (isset($_SESSION['guest'])){
    echo '
      <div class="modal fade" id="UserInfo" tabindex="-1" role="dialog" aria-labelledby="UserInfo" aria-hidden="true" style="background-color:linear-gradient(to right, #f1b1b1 , #82e6e8);">
      <div class="modal-dialog" role="document">
        <div class="modal-content" style="border:solid;border-color:red;border-radius:25px;">
          <div class="modal-header">
            <h5 class="modal-title" style="color:red">Thông tin cá nhân</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          </div>
          <form action="index.php?page=main&controller=register&action=editInfo" enctype="multipart/form-data" method="post">
            <div class="modal-body">
              <div class="form-group">
                <img src="' . $data->profile_photo . '" width="120" height="120">
              </div>
              <div class="form-group">
                <input type="file" name="fileToUpload" id="fileToUpload" />
              </div>
              
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <div class="row"> </div>
                    <label style="color:red">Họ</label>
                    <input class="form-control" type="text" placeholder="Họ" name="fname" value="' . $data->fname . '"/>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <div class="row"> </div>
                    <label style="color:red">Tên</label>
                    <input class="form-control" type="text" placeholder="Tên" name="lname" value="' . $data->lname . '"/>
                  </div>
                </div>
              </div>

              <div class="row">
                <div class="col-md-6">
                  <label style="color:red">Sinh:</label>
                  <div class="col-8 d-flex">
                    <select class="form-control col-6" name="day">
                        <option selected disabled hidden>' . $data->day . '</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                        <option value="11">11</option>
                        <option value="12">12</option>
                        <option value="13">13</option>
                        <option value="14">14</option>
                        <option value="15">15</option>
                        <option value="16">16</option>
                        <option value="17">17</option>
                        <option value="18">18</option>
                        <option value="19">19</option>
                        <option value="20">20</option>
                        <option value="21">21</option>
                        <option value="22">22</option>
                        <option value="23">23</option>
                        <option value="24">24</option>
                        <option value="25">25</option>
                        <option value="26">26</option>
                        <option value="27">27</option>
                        <option value="28">28</option>
                        <option value="29">29</option>
                        <option value="30">30</option>
                        <option value="31">31</option>
                    </select>
                    <select class="form-control col-6" name="month">
                        <option selected disabled hidden>' . $data->month . '</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                        <option value="11">11</option>
                        <option value="12">12</option>
                    </select>
                    <select class="form-control col-6" name="year">
                        <option selected disabled hidden>' . $data->year . '</option>
                        <option value="2020">2020</option>
                        <option value="2019">2019</option>
                        <option value="2018">2018</option>
                        <option value="2017">2017</option>
                        <option value="2016">2016</option>
                        <option value="2015">2015</option>
                        <option value="2014">2014</option>
                        <option value="2013">2013</option>
                        <option value="2012">2012</option>
                        <option value="2011">2011</option>
                        <option value="2010">2010</option>
                        <option value="2009">2009</option>
                        <option value="2008">2008</option>
                        <option value="2007">2007</option>
                        <option value="2006">2006</option>
                        <option value="2005">2005</option>
                        <option value="2004">2004</option>
                        <option value="2003">2003</option>
                        <option value="2002">2002</option>
                        <option value="2001">2001</option>
                        <option value="2000">2000</option>
                        <option value="1999">1999</option>
                        <option value="1998">1998</option>
                        <option value="1997">1997</option>
                        <option value="1996">1996</option>
                        <option value="1995">1995</option>
                        <option value="1994">1994</option>
                        <option value="1993">1993</option>
                        <option value="1992">1992</option>
                        <option value="1991">1991</option>
                        <option value="1990">1990</option>
                        <option value="1989">1989</option>
                        <option value="1988">1988</option>
                        <option value="1987">1987</option>
                        <option value="1986">1986</option>
                        <option value="1985">1985</option>
                        <option value="1984">1984</option>
                        <option value="1983">1983</option>
                        <option value="1982">1982</option>
                        <option value="1981">1981</option>
                        <option value="1980">1980</option>
                        <option value="1979">1979</option>
                        <option value="1978">1978</option>
                        <option value="1977">1977</option>
                        <option value="1976">1976</option>
                        <option value="1975">1975</option>
                        <option value="1974">1974</option>
                        <option value="1973">1973</option>
                        <option value="1972">1972</option>
                        <option value="1971">1971</option>
                        <option value="1970">1970</option>
                        <option value="1969">1969</option>
                        <option value="1968">1968</option>
                        <option value="1967">1967</option>
                        <option value="1966">1966</option>
                        <option value="1965">1965</option>
                        <option value="1964">1964</option>
                        <option value="1963">1963</option>
                        <option value="1962">1962</option>
                        <option value="1961">1961</option>
                        <option value="1960">1960</option>
                        <option value="1959">1959</option>
                        <option value="1958">1958</option>
                        <option value="1957">1957</option>
                        <option value="1956">1956</option>
                        <option value="1955">1955</option>
                        <option value="1954">1954</option>
                        <option value="1953">1953</option>
                        <option value="1952">1952</option>
                        <option value="1951">1951</option>
                        <option value="1950">1950</option>
                        <option value="1949">1949</option>
                        <option value="1948">1948</option>
                        <option value="1947">1947</option>
                        <option value="1946">1946</option>
                        <option value="1945">1945</option>
                        <option value="1944">1944</option>
                        <option value="1943">1943</option>
                        <option value="1942">1942</option>
                        <option value="1941">1941</option>
                        <option value="1940">1940</option>
                        <option value="1939">1939</option>
                        <option value="1938">1938</option>
                        <option value="1937">1937</option>
                        <option value="1936">1936</option>
                        <option value="1935">1935</option>
                        <option value="1934">1934</option>
                        <option value="1933">1933</option>
                        <option value="1932">1932</option>
                        <option value="1931">1931</option>
                        <option value="1930">1930</option>
                    </select>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label style="color:red">Giới tính:</label>
                    <div class="row">
                      <div class="col-md-4">
                        <div class="form-check">
                          <input class="form-check-input" type="radio" name="gender"' . (($data->gender == 'Nam')?'checked':"") . ' value="Nam" />
                          <label>Nam</label>
                        </div>
                      </div>
                      <div class="col-md-4">
                        <div class="form-check">
                          <input class="form-check-input" type="radio" name="gender"' . (($data->gender == 'Nữ')?'checked':"") . ' value="Nữ" />
                          <label>Nữ</label>
                        </div>
                      </div>
                      <div class="col-md-4">
                        <div class="form-check">
                          <input class="form-check-input" type="radio" name="gender"' . (($data->gender == 'Khác')?'checked':"") . ' value="Khác" />
                          <label>Khác</label>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <div class="row"> </div>
                    <label style="color:red">Số điện thoại</label>
                    <input class="form-control" type="text" name="img" readonly value="' . $data->phone . '" />
                  </div>
                </div>
              </div>
            
            </div>
            <div class="modal-footer">
              <button class="btn btn-warning" type="button" data-dismiss="modal">Đóng lại</button>
              <button class="btn btn-success" type="submit">Cập nhật</button>
            </div>
          </form>
        </div>
      </div>
    </div>';
  }
  ?>
  
  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center">

      <h1 class="logo me-auto"><a href="index.html"><img src="public/uploads/favicon.png" class="img-fluid" alt="">VN<span>GREEN</span></a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo me-auto me-lg-0"><img src="public/assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav id="navbar" class="navbar order-last order-lg-0">
        <ul>
          <li><a href="index.php?page=main&controller=layouts&action=index">Trang chủ</a></li>
          <li><a href="index.php?page=main&controller=about&action=index">Chúng tôi</a></li>
          <li><a href="index.php?page=main&controller=services&action=index">Sản phẩm</a></li>
          <li><a href="index.php?page=main&controller=blog&action=index">Tin tức</a></li>
          <li><a href="index.php?page=main&controller=archive&action=index">Thành tựu</a></li>
          <li><a href="index.php?page=main&controller=contact&action=index">Kết nối</a></li>
          <?php
          if (!isset($_SESSION["guest"])){
            echo '
              <li><a href="index.php?page=main&controller=login&action=index&flag=true"><i class="fas fa-user"></i></a></li>
            ';
          }
          else{
            echo '
            <li class="dropdown"><a href="" data-toggle="modal" data-target="#UserInfo">
              <i class="fas fa-user"></i></a>
              <ul class="dropdown-content">
                  <li><a>Chào '. $data->lname .' !</a></li>
                  <li><a href="" data-toggle="modal" data-target="#UserInfo">Thông tin cá nhân</a></li>
                  <li><a href="index.php?page=main&controller=login&action=logout">Đăng xuất</a></li>
            </li>
            ';
          }
          ?>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

      <div class="header-social-links d-flex">
        <a href="https://www.facebook.com/VNGCorporation.Page/" class="facebook"><i class="bu bi-facebook"></i></a>
        <a href="https://www.youtube.com/channel/UCk2jT9v-BOmjbPZ08LUbTVA" class="youtube"><i class="bu bi-youtube"></i></a>
      </div>

    </div>
  </header><!-- End Header -->