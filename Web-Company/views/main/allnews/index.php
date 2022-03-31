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
    <section id="allnews" class="allnews">
        <div class="container" data-aos="fade-up">
            <div class="row">
                <?php echo'
                    <div class="col-12 col-lg-8 pb-4">
                        <a href="#" title="' . $firstnews->title . '">
                            <div class="card m-3 d-flex flex-column flex-md-row h-100">
                                <img src="' . $firstnews->thumbnail . '" class="w-100 w-md-50 card-img-top card-img-md-left">
                                <div class="card-body">
                                    <small class="text-muted text-uppercase">' . $firstnews->category . '</small>
                                    <h4 class="card-title my-3 text-uppercase font-weight-bold">' . $firstnews->title . '</h4>
                                    <p class="card-text">' . $firstnews->description . '</p>
                                    <small class="card-footer text-muted bg-transparent border-top-0 pl-0">
                                        ' . date("F j, Y, g:i a", strtotime($firstnews->date)) . '
                                    </small>
                                </div>
                            </div>
                        </a>
                    </div>';

                    foreach ($listnews as $news) {
                        echo'
                        <div class="col-12 col-md-6 col-lg-4 pb-4">
                            <a href="#" title="' . $news->title . '">
                                <div class="card m-3 d-flex flex-column h-100">
                                    <img src="' . $news->thumbnail . '" class="w-100 card-img-top">
                                    <div class="card-body">
                                        <small class="text-muted text-uppercase">' . $firstnews->category . '</small>
                                        <h4 class="card-title my-3 text-uppercase font-weight-bold">' . $firstnews->title . '</h4>
                                        <p class="card-text">' . $firstnews->description . '</p>
                                        <small class="card-footer text-muted bg-transparent border-top-0 pl-0">
                                            ' . date("F j, Y, g:i a", strtotime($firstnews->date)) . '
                                        </small>
                                    </div>
                                </div>
                            </a>
                        </div>
                        ';
                    }
                ?>
            </div>
        </div>
    </section>
  </main>

  <?php
include_once('views/main/footer.php');
?>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="public/plugins/jquery/jquery.min.js"></script>
<!-- <script src="public/js/blog/index.js"></script> -->