$(function(){
  function buildChildHTML(child){
    let html = `<li>
                <a class="child-category" id="${child.id}" 
                href="/categories/${child.id}/">${child.name}</a>
                </li>`;
  
    return html;
    }

    function buildGrandChildHTML(child){
      let html = `<li>
                  <a class="grandchild-category" id="${child.id}" 
                  href="/categories/${child.id}/">${child.name}</a>
                  </li>`;
    
      return html;
      }


  $(".parent-category").on("mouseover", function(){
    const id = this.id
    $(".select-red").remove("select-red");
    $('#'+ id).addClass("select-red");
    $(".child-category").remove();
    $(".grandchild-category").remove();

    $.ajax({
      type: 'GET',
      url: '/products/search',
      data: {parent_id: id},
      dataType: 'json'
    }).done(function(children){
      children.forEach(function (child){
        const html = buildChildHTML(child);
        $(".children-list").append(html);
      });
    });
  });


  $(document).on("mouseover", ".child-category", function () {
    const id = this.id
    $(".selected-gray").removeClass("selected-gray");
    $('#' + id).addClass("selected-gray");
    $.ajax({
      type: 'GET',
      url: '/products/search',
      data: {parent_id: id},
      dataType: 'json'
    }).done(function(children) {
      children.forEach(function (child) {
        const html = buildGrandChildHTML(child);
        $(".grandchildren-list").append(html);
      })
      $(document).on("mouseover", ".child-category", function () {
        $(".grandchild-category").remove();
      });
    });
  });  





});