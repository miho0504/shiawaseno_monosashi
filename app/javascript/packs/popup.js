
window.onload = function() {
  // cookieを配列に格納する
  const cookieArray = new Array();
  if(document.cookie != ''){
    const tmp = document.cookie.split('; ');
    for(let i=0;i<tmp.length;i++){
      const data = tmp[i].split('=');
      cookieArray[data[0]] = decodeURIComponent(data[1]);
    }
  }
  // cookieの配列からmodalBrowseを取得する
  const modalBrowse = cookieArray["modalBrowse"];
  const modal = document.getElementById("js_modal");
 
  // modalBrowseが無い場合のみモーダルを表示しつつ今日の23:59:59を期限にしたcookieをセット
  if (!modalBrowse) {
    modal.classList.add("is_active");
    const date = new Date();
    const todayEnd = new Date(date.getFullYear(), date.getMonth(), date.getDate(), 23, 59, 59);
    const dateTime = date.getTime();
    const todayEndTime = todayEnd.getTime();
    const remainingTime = Math.ceil((todayEndTime - dateTime) / 1000);
    document.cookie = 'modalBrowse=allready; max-age=' + remainingTime;
  }
 
  // 閉じるボタン
  const modalClose = document.getElementsByClassName('js_modal_close');
  for( var i = 0; i < modalClose.length; i++ ) {
    modalClose[i].onclick = function () {
      modal.classList.remove("is_active");
    }
  }
}
    