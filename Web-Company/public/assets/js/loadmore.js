jQuery(document).ready(function ($) {
    $(".card-container-data").slice(0, 6).show();
    $(".load-more-btn-data").click(function (e) {
        $(".card-container-data:hidden").slice(0, 6).fadeIn();
        if ($(".card-container-data:hidden").length < 1) $(this).fadeOut();
    })
})