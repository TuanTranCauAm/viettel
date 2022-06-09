<?php
session_start();
if (!isset($_SESSION["user"])) {
	header("Location: index.php?page=admin&controller=login&action=index");
}
?>
<?php
require_once('views/admin/header.php'); ?>

<!-- Add CSS -->


<?php
require_once('views/admin/content_layouts.php'); ?>


<!-- Code -->
<div class="content-wrapper">
	<!-- Add Content -->
	<!-- Content Header (Page header)-->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>Khách hàng</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active">Khách hàng</li>
					</ol>
				</div>
			</div>
		</div>
		<!-- /.container-fluid-->
	</section>
	<!-- Main content-->
	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body">
							<!-- Button trigger modal-->
							<button class="btn btn-primary" type="button" data-toggle="modal" data-target="#addUserModal">Thêm mới</button>
							<button class="btn btn-warning" type="button" data-toggle="modal" data-target="#delUserModal">Xóa</button>
							
							<!--Modal-->
							<div class="modal fade" id="delUserModal" tabindex="-1" role="dialog" aria-labelledby="delUserModal" aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title">Xóa</h5>
											<button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										</div>
										
										<form action="index.php?page=admin&controller=user&action=delete" enctype="multipart/form-data" method="post">
											
											<div class="modal-body">
												<div class="form-group">
													<label>Số điện thoại</label>
														<input class="form-control" type="text" placeholder="Số điện thoại" name="phone" />
													</div>
													<div class="modal-footer">
														<button class="btn btn-primary" type="submit">Xóa</button>
													</div>
												</div>
											</div>
										</form>
									</div>	
								</div>	
							</div>	
							<!-- Modal-->
							<div class="modal fade" id="addUserModal" tabindex="-1" role="dialog" aria-labelledby="addUserModal" aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title">Thêm mới</h5>
											<button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										</div>
										
										<form action="index.php?page=admin&controller=user&action=add" enctype="multipart/form-data" method="post">
											<div class="modal-body">
              									<div class="form-group">
													<img src="' . $data->profile_photo . '" width="120" height="120">
												</div>

												<div class="form-group">
													<input type="file" name="fileToUpload" id="fileToUpload" />
												</div>

												<div class="form-group">
													<input class="form-control" type="text" name="img" placeholder="Link ảnh"/>
												</div>

												<div class="row">
													<div class="col-md-6">
														<div class="form-group">
															<div class="row"> </div>
															<label style="color:red">Họ</label>
															<input class="form-control" type="text" placeholder="Họ" name="fname" />
														</div>
													</div>
													<div class="col-md-6">
														<div class="form-group">
															<div class="row"> </div>
															<label style="color:red">Tên</label>
															<input class="form-control" type="text" placeholder="Tên" name="lname" />
														</div>
													</div>
												</div>

												<div class="row">
													<div class="col-md-6">
														<label style="color:red">Sinh:</label>
														<div class="col-8 d-flex">
															<select class="form-control col-6" name="day">
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
												</div>
											
											
												<div class="col-md-6">
													<div class="form-group">
														<label>Giới tính:</label>
														<div class="row">
															<div class="col-md-4">
																<div class="form-check">
																	<input class="form-check-input" type="radio" name="gender" value="0" />
																	<label>Nam</label>
																</div>
															</div>
															<div class="col-md-4">
																<div class="form-check">
																	<input class="form-check-input" type="radio" name="gender" value="1" />
																	<label>Nữ</label>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="form-group">
													<label>Số điện thoại</label>
													<input class="form-control" type="text" placeholder="Số điện thoại" name="phone" />
												</div>

												<div class="form-group">
													<label>Mật khẩu</label>
													<input class="form-control" type="password" placeholder="Mật khẩu" name="password" />
												</div>

												<div class="modal-footer">
													<button class="btn btn-primary" type="submit">Thêm mới</button>
												</div>
											</div>
										</form>
								</div>
							</div>
						</div>

						<table class="table table-bordered table-striped" id="tab-user">
							<thead>
								<tr class="text-center">
									<th>STT</th>
									<th>Hình ảnh</th>
									<th>Họ</th>
									<th>Tên</th>
									<th>Giới tính</th>
									<th>Ngày sinh</th>
									<th>Số điện thoại</th>
									<th> </th>
								</tr>
							</thead>
								<tbody>
									<?php
									$index = 1;
									foreach ($user as $user) {
										echo "<tr class='text-center' style='height:300px; line-height:300px; white-space: nowrap;'>";
										echo "<td>" . $index++ . "</td>";
										echo "<td><img style=\"width: 200px; height:300px;\" src='$user->profile_photo'></td>";
										echo "<td>" . $user->fname . "</td>";
										echo "<td>" . $user->lname . "</td>";
										echo "<td>" . (($user->gender == 0) ? "Nam" : "Nữ") . "</td>";
										echo "<td>" . $user->day . '/' . $user->month . '/' . $user->year ."</td>";
										echo "<td>" . $user->phone . "</td>";
										echo "<td>
											<btn class='btn-edit btn btn-primary btn-xs' style='margin-right: 5px' data-phone='$user->phone' data-fname='$user->fname' data-lname='$user->lname' data-gender='$user->gender' data-img='$user->profile_photo' data-day='$user->day' data-month='$user->month' data-year='$user->year'>Chỉnh sửa</i></btn>
							
											</td>";
										echo "</tr>";
									}
									?>
								</tbody>
							</table>

							<div class="modal fade" id="EditUserModal" tabindex="-1" role="dialog" aria-labelledby="EditUserModal" aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title">Chỉnh sửa</h5>
											<button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										</div>
										<form action="index.php?page=admin&controller=user&action=editInfo" enctype="multipart/form-data" method="post">
											<div class="modal-body">
												<div class="row">
													<div class="col-md-6">
														<div class="form-group">
															<div class="row"> </div>
															<label>Họ và tên lót</label>
															<input class="form-control" type="text" placeholder="Họ và tên lót" name="fname" />
														</div>
													</div>
													<div class="col-md-6">
														<div class="form-group">
															<div class="row"> </div>
															<label>Tên</label>
															<input class="form-control" type="text" placeholder="Tên" name="lname" />
														</div>
													</div>
												</div>

												<div class="row">
													<div class="col-md-6">
														<label>Sinh:</label>
														<div class="col-8 d-flex">
															<select class="form-control col-6" name="day">
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
												</div>
											
											
												<div class="col-md-6">
													<div class="form-group">
														<label>Giới tính:</label>
														<div class="row">
															<div class="col-md-4">
																<div class="form-check">
																	<input class="form-check-input" type="radio" name="gender" value="0" />
																	<label>Nam</label>
																</div>
															</div>
															<div class="col-md-4">
																<div class="form-check">
																	<input class="form-check-input" type="radio" name="gender" value="1" />
																	<label>Nữ</label>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="form-group">
													<label>Số điện thoại</label>
													<input class="form-control" type="text" placeholder="Số điện thoại" name="phone" readonly/>
												</div>

												<div class="form-group">
													<label>Mật khẩu</label>
													<input class="form-control" type="password" placeholder="Mật khẩu" name="password" />
												</div>

												<div class="modal-footer">
													<button class="btn btn-primary" type="submit">Cập nhật</button>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>

							<div class="modal fade" id="DeleteUserModal" tabindex="-1" role="dialog" aria-labelledby="DeleteUserModal" aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content bg-danger">
										<div class="modal-header">
											<h5 class="modal-title">Cảnh báo!</h5>
											<button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										</div>
										<form action="index.php?page=admin&controller=user&action=delete" enctype="multipart/form-data" method="post">
											<div class="modal-body">
												<input type="text" name="phone" readonly/>
												<input class="form-control" type="text" placeholder="Họ và tên lót" name="fname" />
												<p>Xác nhận xóa khách hàng này</p>
												<div class="modal-footer">
													<button class="btn btn-danger btn-outline-light" type="submit">Xác nhận</button>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


	</section>
</div>


<?php
require_once('views/admin/footer.php'); ?>
<script src="public/js/user/index.js"></script>
<!--
<script>
	*$("#tab-user")
	.DataTable({
		// dom: "Bfrtip", //Thêm dom vào thì nó sẽ hiện đồng thời giữa language và bottom
		responsive: true,
		lengthChange: false,
		autoWidth: false,
		language: {
			url: "//cdn.datatables.net/plug-ins/1.10.25/i18n/Vietnamese.json",
		},
	})

	$(".btn-edit").click(function (e) {
		var fname = $(this).data("fname");
		var lname = $(this).data("lname");
		var gender = $(this).data("gender");
		var phone = $(this).data("phone");
		var img = $(this).data("img");
		var day = $(this).data("day");
		var month = $(this).data("month");
		var year = $(this).data("year");
		// console.log(email, fname, lname, gender, age, phone);
		$("#EditUserModal input[name='fname']").val(fname);
		$("#EditUserModal input[name='lname']").val(lname);
		if (gender)
			$('#EditUserModal #Nam').prop("checked", true); //Search checked input radio jquery
		else
			$('#EditUserModal #Nu').prop("checked", true);
		$("#EditUserModal input[name='day']").val(day);
		$("#EditUserModal input[name='month']").val(month);
		$("#EditUserModal input[name='year']").val(year);
		$("#EditUserModal input[name='phone']").val(phone);
		$("#EditUserModal input[name='img']").val(img);
		$('#EditUserModal').modal('show');
	})


	$(".btn-delete").click(function (e) {
		//var phone = $(this).data("phone");
		//$("#DeleteUserModal input[name='phone']").val(phone);
		//$("#DeleteUserModal input[name='fname']").val(phone);
		//$('#DeleteUserModal').modal('show');
	})
</script>
-->
</body>

</html>