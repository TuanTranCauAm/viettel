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

            <ul class="list-group list-group-flush">
                <li class="list-group-item">Dịch vụ Thoại Quốc tế giúp khách hàng liên lạc với số thuê bao cố định, di động ở các Quốc gia, vùng lãnh thổ trên toàn thế giới.</li>
                <li class="list-group-item">Hiện tại, Viettel đã kết nối trực tiếp với trên 100 nhà cung cấp dịch vụ cố định và di động lớn trên thế giới. Do đó, các khách hàng Viettel có thể hoàn toàn yên tâm thực hiện cuộc gọi thoại Quốc tế với chất lượng cao nhất, dễ dàng giữ liên lạc với bạn bè, người thân hay đối tác vào bất cứ khi nào, ở bất kỳ đâu trên toàn cầu.</li>
            </ul>
            
            
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