$(function() {
  function appendOption(category) {
    var html = `<option value="${category.name}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }
  function appendChildrenBox(insertHtml) {
    var childSelectHtml = "";
    childSelectHtml = `<div id= "children-wrapper">
                        <div>
                          <select id="child-category" name="category_id">
                            <option value="---" data-category="---">---</option>
                            ${insertHtml}
                          <select>
                        </div>
                      </div>`;
    $(".exhibit-main__detail__input__category").append(childSelectHtml);
  }

  function appendGrandchidrenBox(insertHtml) {
    var grandchildSelectHtml = "";
    grandchildSelectHtml = `<div id= "grandchildren-wrapper">
                              <div>
                                <select id="grandchild-category" name="category_id">
                                  <option value="---" data-category="---">---</option>
                                  ${insertHtml}
                                </select>
                              </div>
                            </div>`;
    $(".exhibit-main__detail__input__category").append(grandchildSelectHtml);
  }
  
  $("#parent-form").on("change", function() {
    var parentValue = document.getElementById("parent-form").value;
    if (parentValue !== "---"){
      $.ajax({
        url: "get_category_children",
        type: "GET",
        data: {
          parent_name: parentValue
        },
        dataType: "json"
      })
      .done(function(children) {
        $("#children-wrapper").remove();
        $("#grandchildren-wrapper").remove();
        var insertHtml = "";
        children.forEach(function(child) {
          insertHtml += appendOption(child);
        });
        appendChildrenBox(insertHtml);
      })
      .fail(function() {
        alert("カテゴリー取得に失敗しました");
      })
    } else {
      $("#children-wrapper").remove();
      $("#grandchildren-wrapper").remove();
    }
  });
  
  $(".exhibit-main__detail__input__category").on("change", "#child-category", function() {
    var childValue = $("#child-category option:selected").data("category");
    if (childValue != "---") {
      $.ajax({
        url: "get_category_grandchildren",
        type: "GET",
        data: { child_name: childValue },
        dataType: "json"
      })
      .done(function(grandchildren) {
        if (grandchildren.length !== 0) {
          $("#grandchildren-wrapper").remove();
          var insertHtml = "";
          grandchildren.forEach(function(grandchild) {
            insertHtml += appendOption(grandchild);
          });
          appendGrandchidrenBox(insertHtml);
        }
      })
      .fail(function() {
        alert("カテゴリー取得に失敗しました");
      })
    } else {
      $("#grandchildren-wrapper").remove();
    }
  });
});

