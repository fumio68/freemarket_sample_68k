$(function(){
  console.log('Hello World.');
  
  // ここから画像投稿関連
  function buildFileField(index){
    var html = `<div data-index="${index}" class="js-file_group">
                  <input class="js-file" type="file"
                  name="item[item_images_attributes][${index}][image]"
                  id="item_item_images_attributes_${index}_image"><br>
                  <div class="js-remove">削除</div>
                </div>`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  var fileIndex = [1,2,3,4,5,6,7,8,9,10];

  $('#image-box').on('change', '.js-file', function(e) {

    $('#image-box').append(buildFileField(fileIndex[0]));
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