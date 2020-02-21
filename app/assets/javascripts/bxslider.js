$(function(){
  var thumbWidth = 120;
  var thumbHeight = 80;
  var insert = '';
  for (var i = 0; i < $('.main__show__content__top__itemInfo__image__ul li').length; i++) {
      insert += '<span id = slide' + i + '> <a data-slide-index="' + i + '" href="#"><img src="' + $('.main__show__content__top__itemInfo__image__ul li').eq(i).children('img').attr('src') + '" width="' + thumbWidth + '" height="' + thumbHeight + '" class="thumb"/></a></span>';
  };
  $('.custom-thumb').append(insert);
  $('.main__show__content__top__itemInfo__image__ul').bxSlider({
    pagerCustom: '.custom-thumb',
    controls: false
  });
});