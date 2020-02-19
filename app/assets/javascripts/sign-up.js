$(function(){
	$(".main__box__contents__eight__middle").on('click',function(e){
    e.preventDefault();                     
    if(input_check()){                        
			return false;                           
		}
	});
});

function input_check(){
	let result = true;

	$('.main__box__contents__nickname__form').removeClass("inp_error");
	$('.main__box__contents__email__form').removeClass("inp_error");
	$('.main__box__contents__pass__form').removeClass("inp_error");
	$('.main__box__contents__repeat__form').removeClass("inp_error");
	$('.main__box__contents__name__form__family').removeClass("inp_error");
	$('.main__box__contents__name__form__last').removeClass("inp_error");
	$('.main__box__contents__kana__form__j-family').removeClass("inp_error");
	$('.main__box__contents__kana__form__j-last').removeClass("inp_error");
	$('.main__box__contents__birth__middle__year-box').removeClass("inp_error");
	$('.main__box__contents__birth__middle__month-box').removeClass("inp_error");
	$('.main__box__contents__birth__middle__date-box').removeClass("inp_error");
  
	$("#nickname_error").empty();
	$("#email_error").empty();
	$("#pass_error").empty();
	$("#repeat_error").empty();
	$(".main__box__contents__name__error__family").empty();
	$(".main__box__contents__name__error__last").empty();
	$(".main__box__contents__kana__name-error__j-family").empty();
	$(".main__box__contents__kana__name-error__j-last").empty();
	$('#b_year_error').empty();

	let nickname       =$(".main__box__contents__nickname__form").val();
	let email          =$(".main__box__contents__email__form").val();
	let pass      	   =$(".main__box__contents__pass__form").val();
	let repeat_pass    =$(".main__box__contents__repeat__form").val();
	let name_sei_kanzi =$(".main__box__contents__name__form__family").val();
	let name_mei_kanzi =$(".main__box__contents__name__form__last").val();
	let name_sei_kana  =$(".main__box__contents__kana__form__j-family").val();
	let name_mei_kana  =$(".main__box__contents__kana__form__j-last").val();
	let b_year         =$(".main__box__contents__birth__middle__year-box").val();
	let b_month        =$(".main__box__contents__birth__middle__month-box").val();
	let b_day          =$(".main__box__contents__birth__middle__date-box").val();

	if(nickname == ""){
		$("#nickname_error").html(" ニックネームを入力してください");
		$(".main__box__contents__nickname__form").addClass("inp_error");
		result = false;
	}
	
	if(email == ""){
		$("#email_error").html(" メールアドレスを入力してください。");
		$(".main__box__contents__email__form").addClass("inp_error");
		result = false;
	}else if(!email.match(/^([a-zA-Z0-9])+([a-zA-Z0-9\._-])*@([a-zA-Z0-9_-])+([a-zA-Z0-9\._-]+)+$/)){
		$('#email_error').html("フォーマットが不適切です");
		$(".main__box__contents__email__form").addClass("inp_error");
		result = false;
	}

  if(pass == ""){
		$("#pass_error").html(" パスワードを入力してください");
		$(".main__box__contents__pass__form").addClass("inp_error");
		result = false;
	}else if(pass.length < 7 || pass.length > 128 ){
		$("#pass_error").html(" パスワードは7文字以上 128文字以下で入力してください。");
		$("#.main__box__contents__pass__form").addClass("inp_error");
		result = false;
	}

	if(repeat_pass == ""){
		$("#repeat_error").html(" パスワードを入力してください");
		$(".main__box__contents__repeat__form").addClass("inp_error");
		result = false;
	}else if(repeat_pass.length < 7 || repeat_pass.length > 128 ){
		$("#repeat_error").html(" パスワードは7文字以上 128文字以下で入力してください。");
		$("#.main__box__contents__repeat__form").addClass("inp_error");
		result = false;
	}

	if(name_sei_kanzi == ""){
		$(".main__box__contents__name__error__family").html("姓を入力してください");
		$(".main__box__contents__name__form__family").addClass("inp_error");
		result = false;
	}

	if(name_mei_kanzi == ""){
		$(".main__box__contents__name__error__last").html("名を入力してください");
		$(".main__box__contents__name__form__last").addClass("inp_error");
		result = false;
	}

	if(name_sei_kana == ""){
		$(".main__box__contents__kana__name-error__j-family").html("姓カナを入力してください");
		$(".main__box__contents__kana__form__j-family").addClass("inp_error");
		result = false;
	}

	if(name_mei_kana == ""){
		$(".main__box__contents__kana__name-error__j-last").html("名カナを入力してください");
		$(".main__box__contents__kana__form__j-last").addClass("inp_error");
		result = false;
	}

	if(b_year == "" && b_month == "" && b_day == ""){
		$("#b_year_error").html("生年月日を入力してください");
		$(".main__box__contents__seven__middle__year-box").addClass("inp_error");
		$(".main__box__contents__seven__middle__month-box").addClass("inp_error");
		$(".main__box__contents__seven__middle__date-box").addClass("inp_error");
		result = false;
	}

	if(b_year == "" ){
		$("#b_year_error").html("生年月日を入力してください");
		$(".main__box__contents__birth__middle__year-box").addClass("inp_error");
		result = false;
	}

	if(b_month == "" ){
		$("#b_year_error").html("生年月日を入力してください");
		$(".main__box__contents__birth__middle__month-box").addClass("inp_error");
		result = false;
	}

	if( b_day == ""){
		$("#b_year_error").html("生年月日を入力してください");
		$(".main__box__contents__birth__middle__date-box").addClass("inp_error");
		result = false;
	}
	return result;
}

$(function(){
	$('#password').on('change', function(){
		let password = $('#user_password').val();
		let check = $('#password').prop('checked');
		if(check){
		$('.main__box__contents__pass__password').html(password);
		$('.main__box__contents__pass__password').addClass("pass-display");
		}
		else {
			$('.main__box__contents__pass__password').text('')
		}
	});
});