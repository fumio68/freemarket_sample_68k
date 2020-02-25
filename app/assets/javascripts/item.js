$(function(){

  // ここからカテゴリーボックスの生成
  // カテゴリーセレクトボックスのオプションを作成
  function appendOption(category){
    var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  // 子カテゴリーの表示作成
  function appendChildrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `<div class='product-listings-page__main__contents__detail-box__select-list__category-form--second' id= 'children_wrapper'>
                        <select class="product-listings-page__main__contents__detail-box__select-list__category-form--second__value" id="child_category" name=item[category_id_2] category_id_2>
                          <option value="---" data-category="---">---</option>
                            ${insertHTML}
                        </select>
                        <i class='fas fa-chevron-down product-listings-page__main__contents__detail-box__select-list__category-form--second__icon'></i>
                        </div>
                      </div>`;
    $('.product-listings-page__main__contents__detail-box__select-list__category-form').append(childSelectHtml);
  }
  // 孫カテゴリーの表示作成
  function appendGrandchildrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `<div class='product-listings-page__main__contents__detail-box__select-list__category-form--third' id= 'grandchildren_wrapper'>
                              <select class="product-listings-page__main__contents__detail-box__select-list__category-form--third__value" id="grandchild_category" name=item[category_id_3] category_id_3>
                              <option value="---" data-category="---">---</option>
                                ${insertHTML}
                              </select>
                              <i class='fas fa-chevron-down product-listings-page__main__contents__detail-box__select-list__category-form--third__icon'></i>
                              </div>
                            </div>`;
    $('.product-listings-page__main__contents__detail-box__select-list__category-form').append(grandchildSelectHtml);
  }
  // ひ孫(サイズ)カテゴリーの表示作成
  function appendSizeBox(insertHTML){
    var SizeSelectHtml = '';
    SizeSelectHtml = `<div class='product-listings-page__main__contents__detail-box__select-list__category-form--fourth' id= 'size_wrapper'>
                        <div class='product-listings-page__main__contents__detail-box__select-list__title'>
                          <p class='product-listings-page__main__contents__detail-box__select-list__title__left'>サイズ</p>
                          <span class='product-listings-page__main__contents__detail-box__select-list__title__right'>必須</span>
                        </div>
                        <div class='product-listings-page__main__contents__detail-box__select-list__size-form'>
                          <select class="product-listings-page__main__contents__detail-box__select-list__size-form__value" id="size" name=item[size_id] size_id>
                          <option value="---" data-category="---">---</option>
                            ${insertHTML}
                          </select>
                          <i class='fas fa-chevron-down product-listings-page__main__contents__detail-box__select-list__size-form__icon'></i>
                        </div>
                      </div>`;
    $('.product-listings-page__main__contents__detail-box__select-list__category-form').append(SizeSelectHtml);
  }
  // 親カテゴリー選択後のイベント
  $('#parent_category').on('change', function(){
    var parentCategory = document.getElementById('parent_category').value; //選択された親カテゴリーの名前を取得
    if (parentCategory != "---"){ //親カテゴリーが初期値でないことを確認
      $.ajax({
        url: 'get_category_children',
        type: 'GET',
        data: { parent_id: parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        $('#children_wrapper').remove(); //親が変更された時、子以下を削除する
        $('#grandchildren_wrapper').remove();
        $('#size_wrapper').remove();
        $('#brand_wrapper').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChildrenBox(insertHTML);
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
  $('.product-listings-page__main__contents__detail-box__select-list__category-form').on('change', '#child_category', function(){
    var childId = $('#child_category option:selected').data('category'); //選択された子カテゴリーのidを取得
    if (childId != "---"){ //子カテゴリーが初期値でないことを確認
      $.ajax({
        url: 'get_category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          $('#grandchildren_wrapper').remove(); //子が変更された時、孫以下を削除する
          $('#size_wrapper').remove();
          $('#brand_wrapper').remove();
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchildrenBox(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#grandchildren_wrapper').remove(); //子カテゴリーが初期値になった時、孫以下を削除する
      $('#size_wrapper').remove();
      $('#brand_wrapper').remove();
    }
  });
  // 孫カテゴリー選択後のイベント
  $('.product-listings-page__main__contents__detail-box__select-list__category-form').on('change', '#grandchild_category', function(){
    var grandChildId = $('#grandchild_category option:selected').data('category'); //選択された子カテゴリーのidを取得
    if (grandChildId != "---"){ //子カテゴリーが初期値でないことを確認
      $.ajax({
        url: 'get_size',
        type: 'GET',
        data: { grandchild_id: grandChildId },
        dataType: 'json'
      })
      .done(function(size){
        if (size.length != 0) {
          $('#size_wrapper').remove();//孫が変更された時、ひ孫以下を削除する
          $('#brand_wrapper').remove();
          var insertHTML = '';
          size.forEach(function(size){
            insertHTML += appendOption(size);
          });
          appendSizeBox(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#size_wrapper').remove();//子カテゴリーが初期値になった時、孫以下を削除する
      $('#brand_wrapper').remove();
    }
  });
});