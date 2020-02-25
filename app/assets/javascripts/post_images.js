$(function(){
  // function
  function buildFileField(index){
    var html = `<div data-index="${index}" class="js-file_group">
                  <input class="js-file" type="file"
                  name="item[item_images_attributes][${index}][image]"
                  id="item_item_images_attributes_${index}_image"><br>
                  <div class="js-remove">削除</div>
                </div>`;
    return html;
  }
  function resizeFileFiled(index){
    var html = '<input class="js-file" tyle="file" name="item[item_images_attributes]';
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  var fileIndex = [1,2,3,4,5,6,7,8,9,10];

  $('#image-box').on('change', '.js-file', function(e) {
    // 画像と削除ボタンを追加して、file-fieldの大きさを変更できるような処理にする。
    // 画像のイメージを表示できるような処理をつける。
    $('#image-box').append(buildFileField(fileIndex[0]));
    $('#image-box').append(resizeFileFiled(fileIndex[0]));
    fileIndex.shift();
    // 末尾の数に1足した数を追加する
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
  });

  $('#image-box').on('click', '.js-remove', function() {
    $(this).parent().remove();
    // 画像入力欄が0個にならないようにする
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });
  
})