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
                        <img src=${src} width="114" height="130" margin-top="16" class='image-icon' >
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



  // // ドラッグアンドドロップに対応
  // let dropArea = document.getElementsByClassName('items');

  // window.onload = function(e){
    
  //   dropArea.addEventListener("dragover", function(e){
  //     e.preventDefault();

  //     $(this).children('.putitems__image--input').css({'border': '1px solid rgb(204, 204, 204)','box-shadow': '0px 0px 4px'})
  //     },false);

  //     dropArea.addEventListener("dragleave", function(e){
  //       e.preventDefault();
  //   　　 //ドロップエリアの影が消える
  //       $(this).children('.putitems__image--input').css({'border': '1px dashed rgb(204, 204, 204)','box-shadow': '0px 0px 0px'})      
  //     },false);



  //     dropArea.addEventListener("drop", function(e){
  //       e.preventDefault();
  //       $(this).children('.putitems__image--input').css({'border': '1px dashed rgb(204, 204, 204)','box-shadow': '0px 0px 0px'});

  //     let files = e.dataTransfer.files;

  //     $.each(files, function(i,file){
  //       let fileReader = new FileReader();

  //       dataBox.items.add(file)
  //       file_field.files = dataBox.files
  //       let num= $('.item-image').length + i + 1
  //       fileReader.readAsDataURL(file);

  //       if (num==10){
  //         $('.putitems__image--input').css('display', 'none')   
  //       }

  //       fileReader.onload = function(){
  //       let src = fileReader.result
  //       let html =`<div class='item-image' data-image="${file.name}">
  //                   <div class=' item-image__content'>
  //                     <div class='item-image__content--icon'>
  //                       <img src=${src} width="114" height="80" >
  //                     </div>
  //                   </div>
  //                   <div class='item-image__operetion'>
  //                     <div class='item-image__operetion--delete'>削除</div>
  //                   </div>
  //                 </div>`
  //       $('.putitems__image--input').before(html);
  //       };
  //       $('.putitems__image--input').add('class', `item-num-${num}`)
  //     })
  //   })
  // }


  // カテゴリーのAjax実装
  $("#product_category-select").on("change",function(){
    let parentValue = document.getElementById("product_category-select").value;

    $.ajax({
      url: '/products/search',
      type: "GET",
      data: {
        parent_id: parentValue
      },
      dataType: 'json'
    })

  })

});