$(function(){
  $('#item_price').on('input', function(){
    var data = $('#item_price').val();
    var profit = Math.round(data * 0.9);
    var fee = (data - profit);
    $('.product-listings-page__main__contents__price-box__form-box__lists-fee-right').html(fee)
    $('.product-listings-page__main__contents__price-box__form-box__lists-fee-right').prepend('¥')
    $('.product-listings-page__main__contents__price-box__form-box__lists-interests-right').html(profit)
    $('.product-listings-page__main__contents__price-box__form-box__lists-interests-right').prepend('¥')
    if(profit == '') {
    $('.product-listings-page__main__contents__price-box__form-box__lists-fee-right').html('');
    $('.product-listings-page__main__contents__price-box__form-box__lists-interests-right').html('');
    }
  });
  $('#item_price').ready(function(){
    var data = $('#item_price').val();
    var profit = Math.round(data * 0.9);
    var fee = (data - profit);
    $('.product-listings-page__main__contents__price-box__form-box__lists-fee-right').html(fee)
    $('.product-listings-page__main__contents__price-box__form-box__lists-fee-right').prepend('¥')
    $('.product-listings-page__main__contents__price-box__form-box__lists-interests-right').html(profit)
    $('.product-listings-page__main__contents__price-box__form-box__lists-interests-right').prepend('¥')
    if(profit == '') {
    $('.product-listings-page__main__contents__price-box__form-box__lists-fee-right').html('');
    $('.product-listings-page__main__contents__price-box__form-box__lists-interests-right').html('');
    }
  });
});