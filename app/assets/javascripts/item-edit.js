$(function(){
  // ここからカテゴリーボックスの生成
  // カテゴリーセレクトボックスのオプションを作成
  function appendOption(category){
    var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  // 親カテゴリー選択後のイベント
  $('#parent_category_first').on('change', function(){
    var parentCategory = document.getElementById('parent_category_first').value; //選択された親カテゴリーの名前を取得
    if (parentCategory != 0){ //親カテゴリーが初期値でないことを確認
      $.ajax({
        url: 'get_category_children',
        type: 'GET',
        data: { parent_id: parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        $('.product-listings-page__main__contents__detail-box__select-list__category-form--second__value').empty();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        $("#parent_category_second").append(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#children_wrapper').remove(); //親カテゴリーが初期値になった時、子以下を削除する
      $('#grandchildren_wrapper').remove();
      $('#size_wrapper').remove();
      $('#brand_wrapper').remove();
    }
  });
  // 子カテゴリー選択後のイベント
  $('#parent_category_second').on('change', function(){
    var childId = document.getElementById('parent_category_second').value;
    if (childId != 0){ //子カテゴリーが初期値でないことを確認
      $.ajax({
        url: 'get_category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        $('.product-listings-page__main__contents__detail-box__select-list__category-form--third__value').empty();
        if (grandchildren.length != 0) {
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          $('#parent_category_third').append(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }
  });
  // // 孫カテゴリー選択後のイベント
  $('#parent_category_third').on('change', function(){
    var grandChildId = document.getElementById('parent_category_third').value; //選択された子カテゴリーのidを取得
    if (grandChildId != 0){ //子カテゴリーが初期値でないことを確認
      $.ajax({
        url: 'get_size',
        type: 'GET',
        data: { grandchild_id: grandChildId },
        dataType: 'json'
      })
      .done(function(size){
        $('.product-listings-page__main__contents__detail-box__select-list__size-form__value').empty();
        if (size.length != 0) {
          var insertHTML = '';
          size.forEach(function(size){
            insertHTML += appendOption(size);
          });
          $('#size_select').append(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }
  });
});

//エラーハンドリング
$(function(){
	$(".product-listings-page__main__contents__send-box__btn").on('click',function(e){
    if(!item_edit_check()){
			e.preventDefault(); 
		}
	});
});
// 入力内容チェックのための関数
function item_edit_check(){
	let result = true;
	// エラー用装飾のためのクラスリセット
	$('.main__case__contents__form__email').removeClass("inp_error");
	$('.main__case__contents__form__pass').removeClass("inp_error");
	$('.main__case__contents__form__info__left__checkbox').removeClass("inp_error");
	$(".main__case__contents__form__info").removeClass("inp_error");
	// 入力エラー文をリセット
	$("#email_error").empty();
	$("#pass_error").empty();
	$("#check_error").empty();
	// 入力内容セット
	let email   = $(".main__case__contents__form__email").val();
	let pass    = $("#user_password").val();
	// パスワード
  if(pass == ""){
		$("#pass_error").html(" パスワードを入力してください");
		$(".main__case__contents__form__pass").addClass("inp_error");
		result = false;
	}else if(pass.length < 7){
		$("#pass_error").html(" パスワードは7文字以上 128文字以下で入力してください。");
		$("#user_password").addClass("inp_error");
		result = false;
	}
	// メールアドレス
	if(email == ""){
		$("#email_error").html(" メールアドレスを入力してください。");
		$(".main__case__contents__form__email").addClass("inp_error");
		result = false;
	}else if(!email.match(/^([a-zA-Z0-9])+([a-zA-Z0-9\._-])*@([a-zA-Z0-9_-])+([a-zA-Z0-9\._-]+)+$/)){
		$('#email_error').html("フォーマットが不適切です");
		$(".main__case__contents__form__email").addClass("inp_error");
		result = false;
	}else if(email.length > 255){
		$('#email_error').html("フォーマットが不適切です");
		$(".main__case__contents__form__email").addClass("inp_error");
		result = false;
	}
	// チェックボックス 
	if($('#main__case__contents__form__info__left__checkbox').prop("checked") == true){	
		$('#check_error').html("");
	}else{
		$('#check_error').html("選択してください");
		$(".main__case__contents__form__info").addClass("inp_error");
		result = false;
	}
	return result;
}