$(function(){
  // カテゴリーセレクトボックスのオプションを作成
  function appendOption(category){
    var html = `<option value="${category.id}" data-category="${category.name}">${category.name}</option>`;
    return html;
  }
  // 子カテゴリーの表示作成
  function appendChidrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = ` 
                  <div id="child-form">
                    <div class="row form-group">
                      <div class="col-sm-3">
                        職業選択
                      </div>
                        <div class="col-sm-9 category_form">
                          <select class="form-control" id="child_category" name="user[category_id]">
                            ${insertHTML}
                          <select>
                          </div>
                        </div>
                      </div>
                          `;
    $('.form-container').append(childSelectHtml);
  }
  // 親カテゴリー選択後のイベント
  $('#parent_category').on('change', function(){
    var parentCategory = document.getElementById('parent_category').value;
    if (parentCategory != "職業を選択してください"){
      $.ajax({
        type: 'GET',
        url: '/search',
        data: {
          parent_id: parentCategory
        },
        dataType: 'json'
      })
      .done(function(children){
        $('#child-form').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChidrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#child-form').remove();
    }
  });
});