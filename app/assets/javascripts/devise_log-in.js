$(function(){
	
	
	//ログイン画面 例外処理
	
	$("#btn_submit").on('click',function(e){
    e.preventDefault();                      //エラー文消さない
    if(input_check()){                        //
			return false;                           //親要素のイベントを発生させない
		}
	});
});

// 入力内容チェックのための関数
function input_check(){
	let result = true;

	// エラー用装飾のためのクラスリセット
	$('#name').removeClass("inp_error");
  $('#mailaddress').removeClass("inp_error");
  
	// 入力エラー文をリセット
	$("#name_error").empty();
	$("#mailaddress_error").empty();

	// 入力内容セット
	var password   = $("#name").val();
	var mailaddress  = $("#mailaddress").val();

	// 入力内容チェック

	// パスワード
  if(password == ""){
		$("#name_error").html(" 入力してください");
		$("#name").addClass("inp_error");
		result = false;
	}else if(password.length > 7){
		$("#name_error").html(" パスワードはは7文字以上 128文字以下で入力してください。");
		$("#name").addClass("inp_error");
		result = false;
	}
	
	
	// メールアドレス
	if(mailaddress == ""){
		$("#mailaddress_error").html(" 入力してください。");
		$("#mailaddress").addClass("inp_error");
		result = false;
  }else if(!mailaddress.match(/^([a-zA-Z0-9])+([a-zA-Z0-9\._-])*@([a-zA-Z0-9_-])+([a-zA-Z0-9\._-]+)+$/) && mailaddress.length > 255){
  $('#mailaddress_error').html(`フォーマットが不適切です`);
  $('#mailaddress_error2').html(`メールアドレスは255文字以下で入力してください`);
  $("#mailaddress").addClass("inp_error");

  }else if(!mailaddress.match(/^([a-zA-Z0-9])+([a-zA-Z0-9\._-])*@([a-zA-Z0-9_-])+([a-zA-Z0-9\._-]+)+$/)){
		$('#mailaddress_error').html("フォーマットが不適切です");
		$("#mailaddress").addClass("inp_error");
		result = false;
	}else if(mailaddress.length > 255){
		$('#mailaddress_error').html(" メールアドレスは255文字以下で入力してください");
		$("#mailaddress").addClass("inp_error");
		result = false;
	}
	
	return result;
}