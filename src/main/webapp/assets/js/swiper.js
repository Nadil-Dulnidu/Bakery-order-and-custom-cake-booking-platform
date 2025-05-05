const TrandingSlider = new Swiper('.tranding-slider', {
    effect: 'coverflow',
    slidesPerView: "auto",
    spaceBetween:70,
    grabCursor: true,
    centeredSlides: true,
    loop: true,
    coverflowEffect: {
        rotate: 0,
        stretch: 0,
        depth: 100,
        modifier: 2.5,
    },
    pagination: {
        el: '.swiper-pagination',
        clickable: true,
    },
    navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
    }
});