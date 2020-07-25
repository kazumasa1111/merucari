$(function(){
  //DataTransferオブジェクトで、データを格納する箱を作る
  let dataBox = new DataTransfer();

  let file_field = document.querySelector('input[type=file]')

  $('.putitems-image').change(function(){
    let files = $('input[type=file]').prop('files')[0];

    $.each(this.files, function(i, file){
      let fileReader = new FileReader();
      
      dataBox.items.add(file)

      file_field.files = dataBox.files

      let num = $('.item-image').length + 1 + i
      fileReader.readAsDataURL(file);

      if (num == 10){
        $('.putitems__image--input').css('display','none')
      }

    
    

    fileReader.onloadend = function(){
      let src = fileReader.result
      let html = `<div class='item-image' data-image="${file.name}">
                    <div class=' item-image__content'>
                      <div class='item-image__content--icon'>
                        <img src=${src} width="114" height="130" margin-top="16" >
                      </div>
                    </div>
                    <div class='item-image__operetion'>
                      <div class='item-image__operetion--delete'>削除</div>
                    </div>
                  </div>`
      $('.putitems__image--input').before(html);
    };
    $('.putitems__image--input').add('class', `item-num-${num}`)
  });
});

  $(document).on("click", '.item-image__operetion--delete', function(){
    //プレビュー要素を取得
    let target_image = $(this).parent().parent()
    //プレビューを削除
    target_image.remove();
    //inputタグに入ったファイルを削除
    file_field.val("")
  })
});