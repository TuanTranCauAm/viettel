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
    <!-- News -->
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
    <section id="allnews" class="allnews">
        <div class="container" data-aos="fade-up">
            <div class="row">
                <?php if (!is_null($firstnews)) echo'
                    <div class="col-12 col-lg-8 pb-4">
                        <a href="' . getNewslink($firstnews) . '" title="' . $firstnews->title . '">
                            <div class="card m-3 d-flex flex-column flex-md-row h-100">
                                <img src="' . $firstnews->thumbnail . '" class="w-100 w-md-50 card-img-top card-img-md-left">'
                                . getNewscontent_cardBody($firstnews) . '
                            </div>
                        </a>
                    </div>';
                    else echo 'Không có tin tức nào để hiển thị.';

                    foreach ($listnews as $news) {
                        echo'
                        <div class="col-12 col-md-6 col-lg-4 pb-4">
                            <a href="' . getNewslink($news) . '" title="' . $news->title . '">
                                <div class="card m-3 d-flex flex-column h-100">
                                    <img src="' . $news->thumbnail . '" class="w-100 card-img-top">'
                                    . getNewscontent_cardBody($news) . '
                                </div>
                            </a>
                        </div>
                        ';
                    }
                ?>
            </div>
            
            <!-- Pagination -->
            <?php
            $getPageLink = function ($numpage) use ($numpages) {
                if ($numpage <= 0 || $numpage > $numpages)
                    return '#';
                return 'index.php?page=main&controller=allnews&action=index&pg=' . strval($numpage);
            };
            $echoPagenum_li = function ($numpage, $pagedisabled, $icon) use ($getPageLink, $pg) {
                echo '
                <li class="nav-item">
                    <a href="' . $getPageLink($numpage) . '" class="nav-link'; if ($pg == $pagedisabled) echo ' disabled'; echo '">'
                        . $icon . '
                    </a>
                </li>
                ';
            };
            ?>
            <div class="row mt-3">
                <div class="d-flex flex-row justify-content-center">
                    <ul class="nav nav-pills red-vt">
                        <?php if ($numpages > 0) {
                            if ($pg > 1) {
                                // create link to first page
                                $echoPagenum_li(1, 1, '<i class="fa-solid fa-angles-left"></i>');
                                // create link to previous page
                                $echoPagenum_li($pg - 1, 1, '<i class="fa-solid fa-arrow-left"></i>');
                            }
                            // create link to nearly page
                            if ($pg == 1) {
                                $pagestart = 1;
                                $pageend = 3;
                            }
                            elseif ($pg == $numpages) {
                                $pageend = $numpages;
                                $pagestart = $numpages - 2;
                            }
                            else {
                                $pagestart = $pg - 1;
                                $pageend = $pg + 1;
                            }
                            if ($pagestart <= 0)
                                $pagestart = 1;
                            if ($pageend > $numpages)
                                $pageend = $numpages;
                            for ($pagenbr = $pagestart; $pagenbr <= $pageend; $pagenbr++) {
                                echo '
                                <li class="nav-item">
                                    <a href="' . $getPageLink($pagenbr) . '" class="nav-link'; if ($pagenbr == $pg) echo ' active disabled'; echo '">' 
                                        . $pagenbr . '
                                    </a>
                                </li>
                                    ';
                            }
                            if ($pg < $numpages) {
                                // create link to next page
                                $echoPagenum_li($pg + 1, $numpages, '<i class="fa-solid fa-arrow-right"></i>');
                                // create link to last page
                                $echoPagenum_li($numpages, $numpages, '<i class="fa-solid fa-angles-right"></i>');
                            }
                        }
                        ?>
                    </ul>
                </div>
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
<?=console_log($numpages)?>
  <?php
include_once('views/main/footer.php');
?>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="public/plugins/jquery/jquery.min.js"></script>
<!-- <script src="public/js/blog/index.js"></script> -->