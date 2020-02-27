$(function(){
  // 画像用のinputを生成する関数
  const buildFileField = (num)=> {
    const html = `<div data-index="${num}" class="js-file_group">
                    <label data-index="${num}" for="item_item_images_attributes_${num}_src">
                      <svg width="24" height="24" fill="#222222" fill-rule="evenodd" viewBox="0 0 24 24" aria-hidden="true">
                        <path d="M19.3,5H16.73l-.8-1.61A.7.7,0,0,0,15.3,3H8.7a.7.7,0,0,0-.63.39L7.27,5H4.7A2.7,2.7,0,0,0,2,7.7V18.3A2.7,2.7,0,0,0,4.7,21H19.3A2.7,2.7,0,0,0,22,18.3V7.7A2.7,2.7,0,0,0,19.3,5ZM12,17.3A4.3,4.3,0,1,1,16.3,13,4.31,4.31,0,0,1,12,17.3Z"></path>
                      </svg>
                      <input class="js-file" type="file"
                      name="item[images_attributes][${num}][src]"
                      id="item_item_images_attributes_${num}_src"><br>
                    </label>
                    <span class="js-remove">削除</div>
                  </div>`;
    return html;
  }
  // プレビュー用のimgタグを生成する関数
  const buildImg = (index, url)=> {
    const html = `<img id = "image-${index}" data-index="${index}" src="${url}" width="118px" height="118px">`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  // 既に使われているindexを除外
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);
  $('.hidden-destroy').hide();
  $('#image-box').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    // ファイルのブラウザ上でのURLを取得する
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {  // 新規画像追加の処理
      $('#previews').append(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る

      $('#image-box').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
  });

  $('#image-box').on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().data('index');
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    
    var id_str = '#image-' + targetIndex;
    var isExist = $(id_str).length;
    if(isExist) $(this).parent().remove();
    $(id_str).remove();

    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });
});