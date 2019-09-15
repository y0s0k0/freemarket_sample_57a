$(function() {
  function appendOption(category) {
    var html = `<option value="${category.name}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  function categoryChildren(insertHtml) {
    var childSelectHtml = "";
    childSelectHtml = `<div class='listing-select-wrapper__added' id= 'children_wrapper'>
                        <div class='listing-select-wrapper__box'>
                          <select class="listing-select-wrapper__box--select" id="child_category" name="category_id">
                            <option value="---" data-category="---">---</option>
                            ${insertHTML}
                          <select>
                          <i class='fas fa-chevron-down listing-select-wrapper__box--arrow-down'></i>
                        </div>
                      </div>`;
    $('.exhibit-main__detail__input__category').append(childSelectHtml);
  }

  $("#parent-form").on("change", function() {
    var parentValue = document.getElementById("parent-form").value;
    if (parentValue !== "---"){
      $.ajax({
        url: "/items/search",
        type: "get",
        data: {
          parent_id: parentValue
        },
        dataType: "json"
      })
      .done(function(data) {
        $("#children-wrapper").remove();
        $("#grandchildren_wrapper").remove();
        $("size_wrapper").remove();
        $("brand_wrapper").remove();
        var insertHTML = "";
        children.forEach(function(child) {
          insertHTML += appendOption(child);
        });
        appendChildrenBox(insertHTML);
      })
      .fail(function() {
        alert("カテゴリー取得に失敗しました");
      })
    } else {
      $("#children-wrapper").remove();
      $("#grandchildren_wrapper").remove();
      $("size_wrapper").remove();
      $("brand_wrapper").remove();
    }
  });
});