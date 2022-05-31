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

        <!-- <div class="d-flex justify-content-between align-items-center">
          <h1 style="color: white;"><strong>SẢN PHẨM</strong></h1>
          <ol>
            <li><a href="index.html">Trang chủ</a></li>
            <li>Sản phẩm</li>
          </ol>
        </div> -->

      </div>
    </section><!-- End Breadcrumbs -->
    <!-- ======= Services Section ======= -->
    <section id="services" class="services section-bg">
		<div class="row">
			
		</div>
		<div class="row">
			
			<div class="col-md-8 offset-md-2 col-sm-10 offset-sm-1 col-10 offset-1 content-service ">
				<div class="data-pack">
					<div class="row" style="display: flex; align-items: baseline;">
						<div class="col-md-6 col-sm-6 col-6">
							<h2 class="big-title">Gói Data</h2>
						</div>
						<div class="col-md-6 col-sm-6 col-6 text-right">
							<a class="see-all" href="#">Xem tất cả</a>
						</div>
					</div>
					<div class="swiper mySwiper">
						<div class="swiper-wrapper">
							<div class="swiper-slide">
								<div class="card-container col-md-12 col-sm-12 col-12">
									<div class="card-data-pack">
										<div class="top-card-data-pack">
											<h2>ST15K</h2>
										</div>
										<div class="bottom-card-data-pack">
											<div class="content-btn">
												<div class="row">
													<div class="col-md-6 col-sm-6 col-6">
														<h4>ST15K</h4>
													</div>
													<div class="col-md-6 col-sm-6 col-6 text-right">
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
							<div class="swiper-slide">
								<div class="card-container col-md-12 col-sm-12 col-12">
									<div class="card-data-pack">
										<div class="top-card-data-pack">
											<h2>ST15K</h2>
										</div>
										<div class="bottom-card-data-pack">
											<div class="content-btn">
												<div class="row">
													<div class="col-md-6 col-sm-6 col-6">
														<h4>ST15K</h4>
													</div>
													<div class="col-md-6 col-sm-6 col-6 text-right">
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
							<div class="swiper-slide">
								<div class="card-container col-md-12 col-sm-12 col-12">
									<div class="card-data-pack">
										<div class="top-card-data-pack">
											<h2>ST15K</h2>
										</div>
										<div class="bottom-card-data-pack">
											<div class="content-btn">
												<div class="row">
													<div class="col-md-6 col-sm-6 col-6">
														<h4>ST15K</h4>
													</div>
													<div class="col-md-6 col-sm-6 col-6 text-right">
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
							<div class="swiper-slide">
								<div class="card-container col-md-12 col-sm-12 col-12">
									<div class="card-data-pack">
										<div class="top-card-data-pack">
											<h2>ST15K</h2>
										</div>
										<div class="bottom-card-data-pack">
											<div class="content-btn">
												<div class="row">
													<div class="col-md-6 col-sm-6 col-6">
														<h4>ST15K</h4>
													</div>
													<div class="col-md-6 col-sm-6 col-6 text-right">
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
						</div>
						<div class="swiper-pagination" style="position: static; --swiper-theme-color: #be0129;"></div>
					</div>
				</div>
				
				<div class="data-pack">
					<div class="row" style="display: flex; align-items: baseline;">
						<div class="col-md-6 col-sm-6 col-6">
							<h2 class="big-title">Gói cước</h2>
						</div>
						<div class="col-md-6 col-sm-6 col-6 text-right">
							<a class="see-all" href="#">Xem tất cả</a>
						</div>
					</div>
					<div class="swiper mySwiper">
						<div class="swiper-wrapper">
							<div class="swiper-slide">
								<div class="card-container col-md-12 col-sm-12 col-12">
									<div class="card-data-pack">
										<div class="top-card-data-pack">
											<h2>ST15K</h2>
										</div>
										<div class="bottom-card-data-pack">
											<div class="content-btn">
												<div class="row">
													<div class="col-md-6 col-sm-6 col-6">
														<h4>ST15K</h4>
													</div>
													<div class="col-md-6 col-sm-6 col-6 text-right">
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
							<div class="swiper-slide">
								<div class="card-container col-md-12 col-sm-12 col-12">
									<div class="card-data-pack">
										<div class="top-card-data-pack">
											<h2>ST15K</h2>
										</div>
										<div class="bottom-card-data-pack">
											<div class="content-btn">
												<div class="row">
													<div class="col-md-6 col-sm-6 col-6">
														<h4>ST15K</h4>
													</div>
													<div class="col-md-6 col-sm-6 col-6 text-right">
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
							<div class="swiper-slide">
								<div class="card-container col-md-12 col-sm-12 col-12">
									<div class="card-data-pack">
										<div class="top-card-data-pack">
											<h2>ST15K</h2>
										</div>
										<div class="bottom-card-data-pack">
											<div class="content-btn">
												<div class="row">
													<div class="col-md-6 col-sm-6 col-6">
														<h4>ST15K</h4>
													</div>
													<div class="col-md-6 col-sm-6 col-6 text-right">
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
							<div class="swiper-slide">
								<div class="card-container col-md-12 col-sm-12 col-12">
									<div class="card-data-pack">
										<div class="top-card-data-pack">
											<h2>ST15K</h2>
										</div>
										<div class="bottom-card-data-pack">
											<div class="content-btn">
												<div class="row">
													<div class="col-md-6 col-sm-6 col-6">
														<h4>ST15K</h4>
													</div>
													<div class="col-md-6 col-sm-6 col-6 text-right">
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
						</div>
						<div class="swiper-pagination" style="position: static; --swiper-theme-color: #be0129;"></div>
					</div>
				</div>

				<div class="international-service">
					<div class="row" style="display: flex; align-items: baseline;">
						<div class="col-md-6 col-sm-6 col-6">
							<h2 class="big-title">Dịch vụ quốc tế</h2>
						</div>
						<div class="col-md-6 col-sm-6 col-6 text-right">
							<a class="see-all" href="#">Xem tất cả</a>
						</div>
					</div>
					<div class="row">
						<div class="col-md-6 col-sm-12 col-12">
							<div class="international-card ">
								<div class="international-img">
									<img src="public/img/products/inter-video-call.png" alt="kplus"/>
								</div>
								<h2>Gọi có hình</h2>
								<p>Gọi Quốc tế có hình (Video call quốc tế) là dịch vụ giúp khách hàng của Viettel 
									có thể nhìn thấy hình ảnh trực tiếp của người nhận cuộc gọi.</p>
								<div class="text-right">
									<button type="button" class="btn btn-primary register-btn">
										<a>Chi tiết</a>
									</button>
								</div>
							</div> 

						</div>
						<div class="col-md-6 col-sm-12 col-12">
							<div class="international-card ">
								<div class="international-img">
									<img src="public/img/products/inter-call.png" alt="kplus"/>
								</div>
								<h2>Gọi thông thường</h2>
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