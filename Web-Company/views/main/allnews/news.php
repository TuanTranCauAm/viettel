<?php
  include_once('views/main/navbar.php');
?>
  <!-- ======= Breadcrumbs ======= -->
  <section id="breadcrumbs" class="breadcrumbs">
    <div class="container">

      <div class="d-flex justify-content-between align-items-center">
        <h1 style="color: white;"><strong>TIN TỨC</strong></h1>
        <ol>
          <li><a href="index.php?page=main&controller=layouts&action=index">Trang chủ</a></li>
          <li><a href="index.php?page=main&controller=blog&action=index">Tin tức</a></li>
        </ol>
      </div>

    </div>
  </section><!-- End Breadcrumbs -->

  <main id="main">
    <!--  News header -->
    <section id="news-header" class="news-header pb-0">
      <?php $newsdate = strtotime($news->date);
      echo '
      <div class="container-fluid p-0 news-background" style="background-image: url(' . $news->thumbnail . ');">
        <div class="news-overlay">
          <div class="container py-5 text-white" data-aos="fade-up">
            <div class="news-info my-3">
              Ngày ' . date("j", $newsdate) . ' tháng ' . date("n", $newsdate) . ' năm ' . date("Y", $newsdate) . ' | ' . $news->category . '
            </div>
            <h2 class="news-title my-4">' . $news->title . '</h2>
            <p class="news-description my-3">' . $news->description . '</p>
          </div>
        </div>
      </div>'
      ?>
    </section>
    <section id="news-content" class="news-content">
      <div class="container w-100 w-lg-75 w-xl-50" data-aos="fade-up">
        <?=$news->content?>
      </div>
    </section>
  </main>
  <?php
include_once('views/main/footer.php');
?>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="public/plugins/jquery/jquery.min.js"></script>
<!-- <script src="public/js/blog/index.js"></script> -->