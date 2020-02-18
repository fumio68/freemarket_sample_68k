$(function(){
	
	
	//ログイン画面 例外処理
	
	$(".main__case__contents__form__login").on('click',function(e){
    e.preventDefault();                      //エラー文消さない
    if(log_in_input_check()){                        //
			return false;                           //親要素のイベントを発生させない
		}
	});
});

// 入力内容チェックのための関数
function log_in_input_check(){
	let result = true;

	// エラー用装飾のためのクラスリセット
	$('.main__case__contents__form__email').removeClass("inp_error");
  $('.main__case__contents__form__pass').removeClass("inp_error");
	
	// 入力エラー文をリセット
	$("#email_error").empty();
	$("#pass_error").empty();

	// 入力内容セット
	let email   = $(".main__case__contents__form__email").val();
	var pass    = $("#user_password").val();

	// 入力内容チェック

	// パスワード
  if(pass == ""){
		$("#pass_error").html(" パスワードを入力してください");
		$(".main__case__contents__form__pass").addClass("inp_error");
		result = false;
	}else if(pass.length > 7){
		$("#pass_error").html(" パスワードはは7文字以上 128文字以下で入力してください。");
		$("#user_password").addClass("inp_error");
		result = false;
	}
	
	
	// メールアドレス
	if(email == ""){
		$("#email_error").html(" メールアドレスを入力してください。");
		$(".main__case__contents__form__email").addClass("inp_error");
		result = false;
  }else if(!email.match(/^([a-zA-Z0-9])+([a-zA-Z0-9\._-])*@([a-zA-Z0-9_-])+([a-zA-Z0-9\._-]+)+$/) && email.length > 255){
  $('#email_error2').html(`フォーマットが不適切です`);
  $('#email_error2').html(`メールアドレスは255文字以下で入力してください`);
  $(".main__case__contents__form__email").addClass("inp_error");}

  // }else if(!email.match(/^([a-zA-Z0-9])+([a-zA-Z0-9\._-])*@([a-zA-Z0-9_-])+([a-zA-Z0-9\._-]+)+$/)){
	// 	$('#mailaddress_error').html("フォーマットが不適切です");
	// 	$("#mailaddress").addClass("inp_error");
	// 	result = false;
	// }else if(mailaddress.length > 255){
	// 	$('#mailaddress_error').html(" メールアドレスは255文字以下で入力してください");
	// 	$("#user_email").addClass("inp_error");
	// 	result = false;
	// }
	
	return result;
}