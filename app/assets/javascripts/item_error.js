$(function(){
	$(".product-listings-page__main__contents__send-box__btn").on('click',function(e){
    if(!item_check()){
			e.preventDefault();
			return false;
		}
	});
});

function item_check(){
	let result = true;
	$('#image-box').removeClass("inp_error");
	$('.product-listings-page__main__contents__name-box__text-field').removeClass("inp_error");
	$('.product-listings-page__main__contents__name-box__text-area').removeClass("inp_error");
	$('.product-listings-page__main__contents__detail-box__select-list__category-form--first__value').removeClass("inp_error");
	$('.product-listings-page__main__contents__detail-box__select-list__category-form--second__value').removeClass("inp_error");
	$('.product-listings-page__main__contents__detail-box__select-list__category-form--third__value').removeClass("inp_error");
	$('.product-listings-page__main__contents__detail-box__select-list__size-form__value').removeClass("inp_error");
	$('.product-listings-page__main__contents__detail-box__select-list__condition-form__value').removeClass("inp_error");
	$('.product-listings-page__main__contents__delivery-box__select-list__shipping-form__value').removeClass("inp_error");
	$('.product-listings-page__main__contents__delivery-box__select-list__method-form__value').removeClass("inp_error");
	$('.product-listings-page__main__contents__delivery-box__select-list__area-form__value').removeClass("inp_error");
	$('.product-listings-page__main__contents__delivery-box__select-list__days-form__value').removeClass("inp_error");
	$('.product-listings-page__main__contents__price-box__form-box__lists-price-right__form').removeClass("inp_error");
  
	$("#image_error").empty();
	$("#name_error").empty();
	$("#content_error").empty();
	$("#category_error").empty();
	$("#condition_error").empty();
	$("#shipping_error").empty();
	$("#shipping_method_error").empty();
	$("#shipping_area_error").empty();
	$("#days_to_ship_error").empty();
	$("#price_error").empty();


	let image      =$(".js-file_group").length;
	let name         =$(".product-listings-page__main__contents__name-box__text-field").val();
	let content      =$(".product-listings-page__main__contents__name-box__text-area").val();
	let category1        =$(".product-listings-page__main__contents__detail-box__select-list__category-form--first__value").val();
	let category2        =$(".product-listings-page__main__contents__detail-box__select-list__category-form--second__value").val();
	let category3        =$(".product-listings-page__main__contents__detail-box__select-list__category-form--third__value").val();
	let size        =$(".product-listings-page__main__contents__detail-box__select-list__size-form__value").val();
	let condition  =$(".product-listings-page__main__contents__detail-box__select-list__condition-form__value").val();
	let shipping  =$(".product-listings-page__main__contents__delivery-box__select-list__shipping-form__value").val();
	let shipping_method  =$(".product-listings-page__main__contents__delivery-box__select-list__method-form__value").val();
	let shipping_area  =$(".product-listings-page__main__contents__delivery-box__select-list__area-form__value").val();
	let days_to_ship  =$(".product-listings-page__main__contents__delivery-box__select-list__days-form__value").val();
	let price  =$(".product-listings-page__main__contents__price-box__form-box__lists-price-right__form").val();
	

	if(image == 1){
		$("#image_error").html("画像がありません");
		$("#image-box").addClass("inp_error");
		result = false;
	}
	
	if(name == ""){
		$("#name_error").html("入力してください");
		$(".product-listings-page__main__contents__name-box__text-field").addClass("inp_error");
		result = false;
	}

  if(content == ""){
		$("#content_error").html("入力してください");
		$(".product-listings-page__main__contents__name-box__text-area").addClass("inp_error");
		result = false;
  }

  if(category1 == 0){
		$("#category_error").html("選択してください");
		$(".product-listings-page__main__contents__detail-box__select-list__category-form--first__value").addClass("inp_error");
		result = false;
	}
  if(category2 == "---"){
		$("#category_error").html("選択してください");
		$(".product-listings-page__main__contents__detail-box__select-list__category-form--second__value").addClass("inp_error");
		result = false;
	}
  if(category3 == "---"){
		$("#category_error").html("選択してください");
		$(".product-listings-page__main__contents__detail-box__select-list__category-form--third__value").addClass("inp_error");
		result = false;
	}
  if(size == "---"){
		$("#category_error").html("選択してください");
		$(".product-listings-page__main__contents__detail-box__select-list__size-form__value").addClass("inp_error");
		result = false;
  }
  
  if(condition == "---"){
		$("#condition_error").html("選択してください");
		$(".product-listings-page__main__contents__detail-box__select-list__condition-form__value").addClass("inp_error");
		result = false;
  }
  
  if(shipping == "---"){
		$("#shipping_error").html("選択してください");
		$(".product-listings-page__main__contents__delivery-box__select-list__shipping-form__value").addClass("inp_error");
		result = false;
  }
  
  if(shipping_method == "---"){
		$("#shipping_method_error").html("選択してください");
		$(".product-listings-page__main__contents__delivery-box__select-list__method-form__value").addClass("inp_error");
		result = false;
  }
  
  if(shipping_area == "---"){
		$("#shipping_area_error").html("選択してください");
		$(".product-listings-page__main__contents__delivery-box__select-list__area-form__value").addClass("inp_error");
		result = false;
  }
  
  if(days_to_ship == "---"){
		$("#days_to_ship_error").html("選択してください");
		$(".product-listings-page__main__contents__delivery-box__select-list__days-form__value").addClass("inp_error");
		result = false;
  }
  
  if(price == "" || price < 300 || price > 9999999){
		$("#price_error").html("300以上9999999以下で入力してください");
		$(".product-listings-page__main__contents__price-box__form-box__lists-price-right__form").addClass("inp_error");
		result = false;
  }
  return result;
}