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
    // console.log(grandChildId );
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

  //孫カテゴリーから選ぶ時の処理
  // $('#parent_category_third').on('click', function(e){
  //   e.preventDefault();
  //   // console.log('hello');
  //   var childId = document.getElementById('parent_category_second').value;
  //   console.log(childId);
  //    //子カテゴリーが初期値でないことを確認
  //     $.ajax({
  //       url: 'get_category_grandchildren',
  //       type: 'GET',
  //       data: { child_id: childId },
  //       dataType: 'json'
  //     })
  //     .done(function(grandchildren){
  //       // $('.product-listings-page__main__contents__detail-box__select-list__category-form--third__value').empty();
  //       if (grandchildren.length != 0) {
  //         var insertHTML = '';
  //         grandchildren.forEach(function(grandchild){
  //           insertHTML += appendOption(grandchild);
  //         });
  //         $('#parent_category_third').append(insertHTML);
  //       }
  //     })
  //     .fail(function(){
  //       alert('カテゴリー取得に失敗しました');
  //     })
    
  // });
});

