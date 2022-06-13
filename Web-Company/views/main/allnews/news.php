<?php
  include_once('views/main/navbar.php');
?>
  <!-- ======= Breadcrumbs ======= -->
  <section id="breadcrumbs" class="breadcrumbs">
    <div class="container">

      <!-- <div class="d-flex justify-content-between align-items-center">
        <h1 style="color: white;"><strong>TIN TỨC</strong></h1>
        <ol>
          <li><a href="index.php?page=main&controller=layouts&action=index">Trang chủ</a></li>
          <li><a href="index.php?page=main&controller=blog&action=index">Tin tức</a></li>
        </ol>
      </div>s -->

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
            <div class="news-info news-md-info my-3">
              Ngày ' . date("j", $newsdate) . ' tháng ' . date("n", $newsdate) . ' năm ' . date("Y", $newsdate) . ' | ' . $news->category . '
            </div>
            <h1 class="news-title news-md-title my-4">' . $news->title . '</h1>
            <p class="news-description my-3">' . $news->description . '</p>
          </div>
        </div>
      </div>'
      ?>
    </section>
    <section id="news-content" class="news-content pb-0">
      <div class="container w-100 w-lg-75 w-xl-50">
        <?=$news->content?>
      </div>
    </section>
    
    <?php
        function getNewscontent_cardBody($news) {
            $newsdate = strtotime($news->date);
            return '
                <div class="card-body">
                    <small class="text-muted text-uppercase">' . $news->category . '</small>
                    <h4 class="card-title my-3 text-uppercase font-weight-bold">' . $news->title . '</h4>
                    <p class="card-text">' . $news->description . '</p>
                    <small class="card-footer text-muted bg-transparent border-top-0 pl-0">
                        Ngày ' . date("j", $newsdate) . ' tháng ' . date("n", $newsdate) . ' năm ' . date("Y", $newsdate) . '
                    </small>
                </div>
            ';
        }
        function getNewslink($news) {
            return 'index.php?page=main&controller=allnews&action=news&id=' . strval($news->id);
        }
    ?>
    <section id="news-recent" class="news-recent">
      <div class="container">
        <h2 class="pl-3 text-black news-recent-title news-recent-md-title">Tin gần đây</h2>
        <div class="row">
          <?php
          $idx = 1; // use to track current news index
          foreach ($recentnews as $news) {
            $hidden_class = '';
            if ($idx >= 4) { // only add class to hide news with index >= 4
              if ($idx == 4) { // 4-th news
                $hidden_class = ' d-none d-md-block'; // hide on screens smaller than tablet
              }
              else {
                $hidden_class = ' d-none d-lg-block'; // hide on screens smaller than laptop
              }
            } // -> 3 news on mobile, 4 news on tablet, 6 news on laptop
            echo'
            <div class="col-12 col-md-6 col-lg-4 pb-4' . $hidden_class . '">
                <a href="' . getNewslink($news) . '" title="' . $news->title . '">
                    <div class="card m-3 d-flex flex-column h-100">
                        <img src="' . $news->thumbnail . '" class="w-100 card-img-top">'
                        . getNewscontent_cardBody($news) . '
                    </div>
                </a>
            </div>
            ';
            ++$idx;
          }?>
        </div>
      </div>
    </section>
  </main>
  <?php
function console_log($output, $with_script_tags = true) {
    $js_code = 'console.log(' . json_encode($output, JSON_HEX_TAG) . 
');';
    if ($with_script_tags) {
        $js_code = '<script>' . $js_code . '</script>';
    }
    echo $js_code;
}?>
<?=console_log($recentnews)?>
  <?php
include_once('views/main/footer.php');
?>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="public/plugins/jquery/jquery.min.js"></script>
<!-- <script src="public/js/blog/index.js"></script> -->