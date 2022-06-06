var swiper = new Swiper(".mySwiper", {
    slidesPerView: 1,
    spaceBetween: 10,
    pagination: {
      el: ".swiper-pagination",
      clickable: true,
    },
    breakpoints: {
      960: {
        slidesPerView: 2,
        spaceBetween: 40,
      },
      1350: {
        slidesPerView: 3,
        spaceBetween: 50,
      },
    },
  });

  var swiper2 = new Swiper(".mySwiper2", {
    slidesPerView: 1,
    spaceBetween: 10,
    pagination: {
      el: ".swiper-pagination",
      clickable: true,
    },
    breakpoints: {
      960: {
        slidesPerView: 2,
        spaceBetween: 40,
      },
      1350: {
        slidesPerView: 2,
        spaceBetween: 50,
      },
    },
  });