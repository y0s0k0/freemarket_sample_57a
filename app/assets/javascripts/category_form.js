function() {
  function categoryChildren() {
    var html = `<div><input ></div>`
  }

  $("#parent-form").on("change", function() {
    var parentValue = document.getElementById("parent-form").nodeValue;
  
    $.ajax({
      url: "/items/search",
      type: "get",
      data: {
        parent_id: parentValue
      },
      dataType: "json"
    })
    .done(function(data) {
      // var html = 
    })
  
  })

}