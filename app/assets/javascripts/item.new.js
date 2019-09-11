// $(function() {
//   Dropzone.autoDiscover = false;

//   $(".dropzone").dropzone({
//     maxFilesize: 10,
//     addRemoveLinks: true
//   });
// });

$(function() {
  function addPreview(image) {
    var html = `<p><img src="${image}" class="exhibit-main__image-content__form__body__img-small__box" id="image"></p>
                <div class="item-btn">
                  <div class="edit">
                    <a>編集</a>
                  </div>
                  <div class="delete">
                    <a>削除</a>
                  </div>
                </div> `;
    return html;
  }

  var inputImage = document.getElementById("file");
  var addImage = document.getElementById("img_field");
  var outputImage = document.getElementById("image");
  
  $(inputImage).on("change", function(e) {
    var reader = new FileReader();
    reader.onload = function(e) {
      var result = e.target.result
      $(addImage).html(addPreview(result));
      $(outputImage).attr("src", result);
    };
    reader.readAsDataURL(e.target.files[0]);
  });
  $(addImage).show();

});
