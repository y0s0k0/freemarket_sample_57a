// $(function() {
//   Dropzone.autoDiscover = false;

//   $(".dropzone").dropzone({
//     maxFilesize: 10,
//     addRemoveLinks: true
//   });
// });

$(function() {
  function addPreview(i, image) {
    var html = `<div class="exhibit-main__image-content__form__body__img-small__box" id="image_num${i}">
                  <p><img src="${image}"></p>
                  <div class="item-btn">
                    <div class="edit-btn">
                      <a>編集</a>
                    </div>
                    <div id="delete${i}">
                      <a class="delete-btn">削除</a>
                    </div>
                  </div>
                </div>`;
    return html;
  }

  var inputImage = document.getElementById("file");
  var addImage = document.gneetElementById("img_field");
  var outputImage = document.getElementById("add");
  var deleteTarget = document.getElementsByClassName(".exhibit-main__image-content__form__body__img-small__box");
  // var $deleteTarget = $(".exhibit-main__image-content__form__body__img-small__box");
  
  $(inputImage).on("change", function(e) {
    var files = document.getElementById("file").files.length;
    for(var i = 0; i < files; i++) {
      var file = e.target.files[i];
      var reader = new FileReader();
      reader.onload = function(e) {
        var result = e.target.result
        $(addImage).append(addPreview(i, result));
        $(outputImage).attr("src", result);
      }
      reader.readAsDataURL(file);
    };
  });

  $(addImage).on("click", ".delete-btn", function() {
    // $(this).parents(deleteTarget).remove();
    $(this).parent().parent().parent().remove();

    // $(this).parents(".exhibit-main__image-content__form__body__img-small__box").remove();
    // $(this).parent(".exhibit-main__image-content__form__body__img-small__box").remove();
  });
});

// $(function() {
//   Dropzone.autoDiscover = false;

//   $(".dropzone").dropzone({
//     maxFilesize: 10,
//     addRemoveLinks: true
//   });
// });

// $(function() {
//     function addPreview(image) {
//       var html = `<div class="exhibit-main__image-content__form__body__img-small__box" id="image_num">
//                     <p><img src="${image}"></p>
//                     <div class="item-btn">
//                       <div class="edit">
//                         <a>編集</a>
//                       </div>
//                       <div class="delete">
//                         <a>削除</a>
//                       </div>
//                     </div>
//                   </div>`;
//       return html;
//     }
  
//     var inputImage = document.getElementById("file");
//     var addImage = document.getElementById("img_field");
//     var outputImage = document.getElementById("add");
//     var showImage = document.getElementById("image");
//     
//     $(inputImage).on("change", function(e) {
//       var reader = new FileReader();
//       reader.onload = function(e) {
//         var result = e.target.result
//         $(addImage).append(addPreview(result));
//         $(outputImage).attr("src", result);
//         $(showImage).show();
//       };
//       reader.readAsDataURL(e.target.files[0]);
//     });
  
//   });
  
  