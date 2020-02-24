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
            alert("登録が完了しました"); //確認用
          } else {
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
  $('a.card-main__contents__body__security__bottom__note__question').click(function(){
  $('a.card-main__contents__body__security__bottom__note__text').click(function(){
    // リンクの #note** を取得
    var targetNote = $(this).attr('href');
    $('p.card-main__contents__body__security__bottom__note__tooltip'+targetNote).addClass('open');
  });
 
  // 表示されたツールチップを隠す処理（マウスクリックで全て隠す）
  $('html').mousedown(function(){
    $('p.card-main__contents__body__security__bottom__note__tooltip').removeClass('open');
  });
});


// textをクリックした時の動作
$(function(){
  $('a.card-main__contents__body__security__bottom__note__question').click(function(){
    var targetNote = $(this).attr('href');
    $('p.card-main__contents__body__security__bottom__note__tooltip'+targetNote).addClass('open');
  });
 
  // 表示されたツールチップを隠す処理（マウスクリックで全て隠す）
  $('html').mousedown(function(){
    $('p.card-main__contents__body__security__bottom__note__tooltip').removeClass('open');
  });
});




