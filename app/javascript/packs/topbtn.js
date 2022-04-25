jQuery(function() {
  let topBtn = $("#topBtn");
  // 画面を開いたら
  $(window).on('load', function() {
    // ボタンがしたから出てくる
    topBtn.stop().animate({ bottom: "70px" }, 1600);
  });
});