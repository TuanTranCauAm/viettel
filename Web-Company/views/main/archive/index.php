<?php
  include_once('views/main/navbar.php');

?>
  <main id='main'>
     <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <!-- <div class="d-flex justify-content-between align-items-center">
          <h1 style="color: white;"><strong>THÀNH TỰU</strong></h1>
          <ol>
            <li><a href="index.php?page=main&controller=layouts&action=index">Trang chủ</a></li>
            <li><a href="index.php?page=main&controller=archive&action=index">Thành tựu</a></li>
          </ol>
        </div> -->

      </div>
    </section><!-- End Breadcrumbs -->
    <!-- ======= Services Section ======= -->
    <section id="services" class="services section-bg">
      <div class="container" data-aos="fade-up">
        <div class="row row-cols-1 row-cols-md-3 g-4">
          <!-- Card 1 -->
            <?php 
          foreach($archives as $archive)
          {
            echo '<div class="col" data-aos="zoom-in" data-aos-delay="100">
            <div class="card h-100">
              <img src="./public/assets/img/archives/'.$archive->id.'.jpg" class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title">'. $archive->title.               
                '</h5>
                <p class="card-text">'.$archive->date.'</p>
              </div>
            </div>
          </div> ';
            
          }
          ?>  
        </div>
      </div>

  </main><!-- End #main -->
<?php
include_once('views/main/footer.php');
?>