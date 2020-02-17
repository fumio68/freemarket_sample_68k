
//新規登録時  例外処理

$(function(){
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
	$('#nickname').removeClass("inp_error");
	$('#mailaddress').removeClass("inp_error");
	$('#password').removeClass("inp_error");
	$('#namekanzi').removeClass("inp_error");
	$('#namekana').removeClass("inp_error");
	$('#b_year').removeClass("inp_error");
	$('#b_month').removeClass("inp_error");
	$('#b_day').removeClass("inp_error");
  
	// 入力エラー文をリセット
	$("#nickname_error").empty();
	$("#mailaddress_error").empty();
	$("#password_error").empty();
	$("#namekanzi_error").empty();
	$("#namekana_error").empty();
	$('#b_year_error').empty();
	$('#b_month_error').empty();
	$('#b_day_error').empty();

	// 入力内容セット
	let nickname      =$("#nickname").val();
	let mailaddress   =$("#mailaddress").val();
	let password      =$("#password").val();
	let nameseikanzi  =$("#nameseikanzi").val();
	let namemeikanzi  =$("#namemeikanzi").val();
	let nameseikana   =$("#nameseikana").val();
	let namemeikana   =$("#namemeikana").val();
	let b_year        =$("#b_year").val();
	let b_month       =$("#b_month").val();
	let b_day         =$("#b_day").val();


	// 入力内容チェック

	//ニックネーム
	if(nickname == ""){
		$("#nickname_error").html(" ニックネームを入力してください");
		$("#nickname").addClass("inp_error");
		result = false;
	}
	
	// メールアドレス
	if(mailaddress == ""){
		$("#mailaddress_error").html(" メールアドレスを入力してください。");
		$("#mailaddress").addClass("inp_error");
		result = false;
	}else if(!mailaddress.match(/^([a-zA-Z0-9])+([a-zA-Z0-9\._-])*@([a-zA-Z0-9_-])+([a-zA-Z0-9\._-]+)+$/)){
		$('#mailaddress_error').html("フォーマットが不適切です");
		$("#mailaddress").addClass("inp_error");
		result = false;
	}

	// パスワード
  if(password == ""){
		$("#password_error").html(" パスワードを入力してください");
		$("#password").addClass("inp_error");
		result = false;
	}else if(password.length < 7 || password.length > 128 ){
		$("#password_error").html(" パスワードは7文字以上 128文字以下で入力してください。");
		$("#password").addClass("inp_error");
		result = false;
	}

	//name sei kanzi
	if(nameseikanzi == ""){
		$("#nameseikanzi_error").html("姓を入力してください");
		$("#nameseikanzi").addClass("inp_error");
		result = false;
	}

	//name mei kanzi
	if(namemeikanzi == ""){
		$("#namemeikanzi_error").html("名を入力してください");
		$("#namemeikanzi").addClass("inp_error");
		result = false;
	}

	//name sei kana
	if(nameseikana == ""){
		$("#nameseikana_error").html("姓カナを入力してください");
		$("#nameseikana").addClass("inp_error");
		result = false;
	}

	//name mei kana
	if(namemeikana == ""){
		$("#namemeikana_error").html("名カナを入力してください");
		$("#namemeikana").addClass("inp_error");
		result = false;
	}

	//b_year, b_month, b_day
	if(b_year == "" || b_month == "" || b_day == ""){
		$("#b_year_error").html("生年月日を入力してください");
		$("#b_year").addClass("inp_error");
		$("#b_month").addClass("inp_error");
		$("#b_day").addClass("inp_error");
		result = false;
	}
  
	return result;
}