document.addEventListener(
  "DOMContentLoaded", e => {
    if (document.getElementById("token_submit") != null) { //token_submitというidがnullの場合、下記コードを実行しない
      Payjp.setPublicKey("pk_test_331457e5f1c04844f8d5e06a"); //ここに公開鍵を直書き
      let btn = document.getElementById("token_submit"); //IDがtoken_submitの場合に取得されます
      btn.addEventListener("click", e => { //ボタンが押されたときに作動します
        e.preventDefault(); //ボタンを一旦無効化します
        let card = {
          number: document.getElementById("card_number").value,
          cvc: document.getElementById("cvc").value,
          exp_month: document.getElementById("exp_month").value,
          exp_year: document.getElementById("exp_year").value
        }; //入力されたデータを取得します。
        Payjp.createToken(card, (status, response) => {
          if (status === 200) { //成功した場合
            $("#card_number").removeAttr("name");
            $("#cvc").removeAttr("name");
            $("#exp_month").removeAttr("name");
            $("#exp_year").removeAttr("name"); //データを自サーバにpostしないように削除
            $("#card_token").append(
              $('<input type="hidden" name="payjp-token">').val(response.id)
            ); //取得したトークンを送信できる状態にします
            document.inputForm.submit();
          } 
          else {
            alert("カード情報が正しくありません。"); //確認用
          }
        });
      });
    }
  },
  false
);

// ? をクリックした時の動作
$(function(){
  $('a.card__card-main__mask__contents__body__security__bottom__note__question').click(function(){
    var targetNote = $(this).attr('href');
      $('p.card__card-main__mask__contents__body__security__bottom__note__tooltip'+targetNote).addClass('open');
    });
  
    // 表示されたツールチップを隠す処理（マウスクリックで全て隠す）
    $('html').mousedown(function(){
      $('p.card__card-main__mask__contents__body__security__bottom__note__tooltip').removeClass('open');
    });
  });


// textをクリックした時の動作
$(function(){
  $('a.card__card-main__mask__contents__body__security__bottom__note__text').click(function(){
    var targetNote = $(this).attr('href');
    $('p.card__card-main__mask__contents__body__security__bottom__note__tooltip'+targetNote).addClass('open');
  });
 
  // 表示されたツールチップを隠す処理（マウスクリックで全て隠す）
  $('html').mousedown(function(){
    $('p.card__card-main__mask__contents__body__security__bottom__note__tooltip').removeClass('open');
  });
});



// エラーハンドリング
$(function(){
	$(".card__card-main__mask__contents__body__btn__box").on('click',function(e){
    if(!card_input_check()){
			e.preventDefault(); 
		}
	});
});
// 入力内容チェックのための関数
function card_input_check(){
	let result = true;
	// エラー用装飾のためのクラスリセット
	$('.card__card-main__mask__contents__body__card__middle__box').removeClass("inp_error");
  $('.card__card-main__mask__contents__body__security__bottom__box').removeClass("inp_error");
  $('.card__card-main__mask__contents__body__effective__bottom__month__select').removeClass("inp_error");
  $('.card__card-main__mask__contents__body__effective__bottom__year__select').removeClass("inp_error");
	// 入力エラー文をリセット
  $("#card_error").empty();
  $("#effective_error").empty();
  $("#cvc_error").empty();
	// 入力内容セット
	let card   = $(".card__card-main__mask__contents__body__card__middle__box").val();
  let effective_month    = $(".card__card-main__mask__contents__body__effective__bottom__month__select").val();
  let effective_year    = $(".card__card-main__mask__contents__body__effective__bottom__year__select").val();
	let cvc    = $("#cvc").val();
	// カード番号
  if(card == ""){
		$("#card_error").html(" 必須項目です");
		$(".card__card-main__mask__contents__body__card__middle__box").addClass("inp_error");
		result = false;
  }
  // 有効期限
  if(effective_month == ""){
    $("#effective_error").html(" 必須項目です");
    $(".card__card-main__mask__contents__body__effective__bottom__month__select").addClass("inp_error");
		result = false;
  }
  if(effective_year == ""){
    $("#effective_error").html(" 必須項目です");
		$(".card__card-main__mask__contents__body__effective__bottom__year__select").addClass("inp_error");
		result = false;
  }
	// cvc
	if(cvc == ""){
		$("#cvc_error").html(" 必須項目です");
		$(".card__card-main__mask__contents__body__security__bottom__box").addClass("inp_error");
		result = false;
	}else if(cvc.length < 3 ){
		$("#cvc_error").html(" カード背面３桁から４桁の番号で入力してください");
		$(".card__card-main__mask__contents__body__security__bottom__box").addClass("inp_error");
		result = false;
	}
	return result;
}


