<?php
include_once('views/main/navbar.php');
?>
  <main id="main">
    <!-- Modal -->
    <?php
      foreach ($products as $product) {
        echo
        '<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">' . $product->name . '</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                  <img src="' . $product->img . '" class="card-img-top" alt="...">
                  <h6 class="card-text"><strong>' . $product->description . '</strong></h6>
                  <p><strong>Giá thành: ' . $product->price . '</strong></p>
                  <p>' . $product->content . '</p>
                </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
              </div>
            </div>
          </div>
        </div>';
      }
    ?>

     <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h1 style="color: white;"><strong>SẢN PHẨM</strong></h1>
          <ol>
            <li><a href="index.html">Trang chủ</a></li>
            <li>Sản phẩm</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->
    <!-- ======= Services Section ======= -->
    <section id="services" class="services section-bg">
	<div class="row">
		<div class="content col-md-8 offset-md-2 col-sm-10 col-sm-offset-1 col-xs-10 col-xs-offset-1">
			<div class="row">
				<div class="data-pack col-md-6">
					<div class="row" style="display: flex; align-items: baseline;">
						<div class="col-md-6 col-sm-6 col-xs-6">
							<h2 class="big-title">Gói Data</h2>
						</div>
						<div class="col-md-6 col-sm-6 col-xs-6 text-right">
							<a class="see-all" href="#">Xem tất cả</a>
						</div>
					</div>
					<div id="datapack" class="carousel carousel-dark slide" data-bs-ride="carousel" data-aos="fade-up">
						<div class="carousel-inner">
							<div class="carousel-item active" data-bs-interval="5000">
								<div class="card-container col-md-12 col-md-offset-1 col-sm-12 col-xs-12">
									<div class="card-data-pack">
										<div class="top-card-data-pack">
											<h2>ST15K</h2>
										</div>
										<div class="bottom-card-data-pack">
											<div class="content-btn">
												<div class="row">
													<div class="col-md-6 col-sm-6 col-xs-6">
														<h4>ST15K</h4>
													</div>
													<div class="col-md-6 col-sm-6 col-xs-6 text-right">
														<h4>15.000đ</h4>
													</div>
												</div>
												<p>500MB sử dụng đến 24h ngày đăng ký (gia hạn tự động).</p>
											</div>
											<div class="text-center">
												<button type="button" class="btn btn-primary register-btn">Đăng ký ngay</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="carousel-item" data-bs-interval="5000">
								<div class="card-container col-md-12 col-md-offset-1 col-sm-12 col-xs-12">
									<div class="card-data-pack">
										<div class="top-card-data-pack">
											<h2>ST30K</h2>
										</div>
										<div class="bottom-card-data-pack">
											<div class="content-btn">
												<div class="row">
													<div class="col-md-6 col-sm-6 col-xs-6">
														<h4>ST30K</h4>
													</div>
													<div class="col-md-6 col-sm-6 col-xs-6 text-right">
														<h4>30.000đ</h4>
													</div>
												</div>
												<p>7GB tốc độ cao sử dụng trong 7 ngày (gia hạn tự động).</p>
											</div>
											<div class="text-center">
												<button type="button" class="btn btn-primary register-btn">Đăng ký ngay</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<button class="carousel-control-prev" type="button" data-bs-target="#datapack" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					</button>
					<button class="carousel-control-next" type="button" data-bs-target="#datapack" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					</button>
					
				</div>
				<div class="data-pack col-md-6">
					<div class="row" style="display: flex; align-items: baseline;">
						<div class="col-md-6 col-sm-6 col-xs-6">
							<h2 class="big-title">Gói cước</h2>
						</div>
						<div class="col-md-6 col-sm-6 col-xs-6 text-right">
							<a class="see-all" href="#">Xem tất cả</a>
						</div>
					</div>
					<div id="serviceplan" class="carousel carousel-dark slide" data-bs-ride="carousel" data-aos="fade-up">
						<div class="carousel-inner">
							<div class="carousel-item active" data-bs-interval="5000">
								<div class="card-container col-md-12 col-md-offset-1 col-sm-12 col-xs-12">
									<div class="card-data-pack">
										<div class="top-card-data-pack">
											<h2>ST15K</h2>
										</div>
										<div class="bottom-card-data-pack">
											<div class="content-btn">
												<div class="row">
													<div class="col-md-6 col-sm-6 col-xs-6">
														<h4>ST15K</h4>
													</div>
													<div class="col-md-6 col-sm-6 col-xs-6 text-right">
														<h4>15.000đ</h4>
													</div>
												</div>
												<p>500MB sử dụng đến 24h ngày đăng ký (gia hạn tự động).</p>
											</div>
											<div class="text-center">
												<button type="button" class="btn btn-primary register-btn">Đăng ký ngay</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="carousel-item" data-bs-interval="5000">
								<div class="card-container col-md-12 col-md-offset-1 col-sm-12 col-xs-12">
									<div class="card-data-pack">
										<div class="top-card-data-pack">
											<h2>ST30K</h2>
										</div>
										<div class="bottom-card-data-pack">
											<div class="content-btn">
												<div class="row">
													<div class="col-md-6 col-sm-6 col-xs-6">
														<h4>ST30K</h4>
													</div>
													<div class="col-md-6 col-sm-6 col-xs-6 text-right">
														<h4>30.000đ</h4>
													</div>
												</div>
												<p>7GB tốc độ cao sử dụng trong 7 ngày (gia hạn tự động).</p>
											</div>
											<div class="text-center">
												<button type="button" class="btn btn-primary register-btn">Đăng ký ngay</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							
						</div>
					</div>
					<button class="carousel-control-prev" type="button" data-bs-target="#serviceplan" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
					</button>
					<button class="carousel-control-next" type="button" data-bs-target="#serviceplan" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>
			<div class="international-service">
				<div class="row" style="display: flex; align-items: baseline;">
					<div class="col-md-6 col-sm-6 col-xs-6">
						<h2 class="big-title">Dịch vụ quốc tế</h2>
					</div>
					<div class="col-md-6 col-sm-6 col-xs-6 text-right">
						<a class="see-all" href="#">Xem tất cả</a>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 col-sm-12 col-xs-12">
						<div class="entertainment-card ">
							<div class="entertainment-img">
								<img src="public/img/products/inter-video-call.png" alt="kplus"/>
							</div>
							<h2>Gọi quốc tế có hình</h2>
							<p>Gọi Quốc tế có hình (Video call quốc tế) là dịch vụ giúp khách hàng của Viettel 
								có thể nhìn thấy hình ảnh trực tiếp của người nhận cuộc gọi.</p>
							<div class="text-right">
								<button type="button" class="btn btn-primary register-btn">
									<a>Chi tiết</a>
								</button>
							</div>
						</div> 

					</div>
					<div class="col-md-6 col-sm-12 col-xs-12">
						<div class="entertainment-card ">
							<div class="entertainment-img">
								<img src="public/img/products/inter-call.png" alt="kplus"/>
							</div>
							<h2>Gọi quốc tế thông thường</h2>
							<p>Giữ liên lạc với bạn bè, người thân và đối tác nước ngoài dù bạn ở bất kỳ đâu trên 
								lãnh thổ Việt Nam với giá cước tốt nhất và chất lượng tốt nhất.</p>
							<div class="text-right">
								<button type="button" class="btn btn-primary register-btn">
									<a>Chi tiết</a>
								</button>
							</div>
						</div> 

					</div>
				</div>
			</div>
		</div>
	</div>
</section>

  </main><!-- End #main -->

<?php
include_once('views/main/footer.php');
?>