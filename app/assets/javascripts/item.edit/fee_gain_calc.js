$(function() {
  $("#exhibit-price").on("keyup", function() {
    var val = $(this).val().replace(/^[0]+/, "");
    if (val !== null && val >= 300) {
      var fee = Math.floor(val * 0.1);
      if (fee) {
        var feeResult = String(fee).replace(/(\d)(?=(\d\d\d)+$)/g, "$1,");
        $(".exhibit-main__sell-price__body__fee__calc").text("¥" + feeResult);
      }
      var gain = val - fee;
      if (gain) {
        var gainResult = String(gain).replace(/(\d)(?=(\d\d\d)+$)/g, "$1,");
        $(".exhibit-main__sell-price__body__gain__calc").text("¥" + gainResult);
      }
    } else {
      $(".exhibit-main__sell-price__body__fee__calc").text("-");
      $(".exhibit-main__sell-price__body__gain__calc").text("-");
    }
  });
});