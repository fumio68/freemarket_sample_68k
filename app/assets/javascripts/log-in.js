$(function(){
	
	$(".main__case__contents__form__login").on('click',function(e){
    if(!log_in_input_check()){
			e.preventDefault(); 
		}
	});
});
// 入力内容チェックのための関数
function log_in_input_check(){
	let result = true;
	// エラー用装飾のためのクラスリセット
	$('.main__case__contents__form__email').removeClass("inp_error");
	$('.main__case__contents__form__pass').removeClass("inp_error");
	$('.main__case__contents__form__info__left__checkbox').removeClass("inp_error");
	// 入力エラー文をリセット
	$("#email_error").empty();
	$("#pass_error").empty();
	$("#check_error").empty();
	// 入力内容セット
	let email   = $(".main__case__contents__form__email").val();
	var pass    = $("#user_password").val();
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
		console.log($('.main__case__contents__form__info__left__checkbox'));
		$('#check_error').html("選択してください");
		$(".main__case__contents__form__info").addClass("inp_error");
		result = false;
	}
	return result;
}