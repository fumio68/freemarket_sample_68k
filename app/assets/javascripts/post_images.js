$(function(){
  // function
  function buildFileField(index){
    var html = `<div data-index="${index}" class="js-file_group">

                  <input class="js-file" type="file"
                  name="item[item_images_attributes][${index}][image]"
                  id="item_item_images_attributes_${index}_image">
                  <div class="js-remove">削除</div>
                </div>`;
    return html;
  }
  function buildImg(index, url){
    var html = `<img data-index="${index}" src="${url}" width="118px" height="118px">`;
    return html;
  }

  // file_fieldのnameに動的なindexをつける為の配列
  var fileIndex = [1,2,3,4,5,6,7,8,9,10];
  // 既に使われているindexを除外
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);
  // $('.hidden-destroy').hide();

  $('#image-box').on('change', '.js-file_group__hidden', function(e) {
    // 画像と削除ボタンを追加して、file-fieldの大きさを変更できるような処理にする。
    // 画像のイメージを表示できるような処理をつける。
    // console.log('Hello World.');
    var targetIndex = $(this).parent().data('index');

    console.log('$(this)', $(this));
    console.log('$(this).parent()', $(this).parent());
    console.log('targetIndex', targetIndex);

    var file = e.target.files[0];
    var blobUrl = window.URL.createObjectURL(file);
    console.log(blobUrl);
    
    // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('src', blobUrl);
    } else {  // 新規画像追加の処理
      // console.log('Hello.');
      $('#preview-box').append(buildImg(targetIndex, blobUrl));
      // fileIndexの先頭の数字を使ってinputを作る
      $('#file-box').empty();
      $('#file-box').append(buildFileField(fileIndex[0]));
      fileIndex.shift();
      // 末尾の数に1足した数を追加する
      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
      
    }
    
  });

  $('#image-box').on('click', '.js-remove', function() {
    console.log('remove');
    console.log($(this));
    console.log($(this).parent());
    $(this).parent().remove();
    // 画像入力欄が0個にならないようにする
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });
  
})