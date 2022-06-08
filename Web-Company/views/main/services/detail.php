<?php
include_once('views/main/navbar.php');
?>
<section id="breadcrumbs" class="breadcrumbs">
    <div class="container">

    </div>
</section>
<main id="main">
    <section id="news-header" class="news-header pb-0">
        <?php
        echo '
      <div class="container-fluid p-0 news-background" style="background-image: url(' . $service->img . ');">
        <div class="news-overlay">
          <div class="container py-5 text-white" data-aos="fade-up">
            <h1 class="news-title news-md-title my-4">' . $service->name . '</h1>
            <p class="news-description my-3">' . $service->description . '</p>
          </div>
        </div>
      </div>'
        ?>
    </section>
    <section class="product-detail pb-0">
        <div class="container w-100 w-lg-75 w-xl-50">
            <!-- <ul class="list-group list-group-flush">
                <li class="list-group-item">
                    <h3 class="product-detail-title">Đối tượng sử dụng</h3>
                    <p>Khách hàng đang sử dụng dịch vụ di động, dịch vụ cố định của Viettel</p>
                </li>
                <li class="list-group-item">
                    <h3 class="product-detail-title">Lợi ích khi sử dụng dịch vụ</h3>
                    <p>Viettel cam kết luôn cung cấp dịch vụ Thoại Quốc tế với chất lượng thoại tốt nhất, đảm bảo trung thực và thời gian kết nối nhanh nhất. Khách hàng có thể thực hiện cuộc gọi thoại quốc tế từ bất kỳ thuê bao điện thoại nào của Viettel với cách quay số đơn giản.</p>
                </li>
                <li class="list-group-item">
                    <h3 class="product-detail-title">Đăng ký/Hủy dịch vụ</h3>
                    <p>Quý khách soạn tin nhắn QT OFF hoặc QT ON gửi 133 (miễn phí tin nhắn) để hủy/đăng ký dịch vụ.</p>
                </li>
            </ul> -->
            <?php
            echo $service->content;
            ?>
        </div>
    </section>

</main><!-- End #main -->

<?php
include_once('views/main/footer.php');
?>

<script src="public/assets/js/loadmore.js"></script>
<script type='text/javascript'>
    var modal = document.getElementById("myPopup");

    var btn = document.getElementsByClassName("openPopup");

    var span = document.getElementsByClassName("close")[0];

    for (let i = 0; i < btn.length; i++) {
        btn[i].onclick = function() {
            modal.style.display = "block";
        }
    }

    span.onclick = function() {
        modal.style.display = "none";
    }

    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
</script>