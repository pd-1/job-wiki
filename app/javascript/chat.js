function message () {
  const submit = document.getElementById("submit");
  if (!submit){ return false;}
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    const form = document.getElementById("form");
    const formData = new FormData(form);
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "/messages", true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`)
        return null;
      }
      const list = document.getElementById("list");
      const formText = document.getElementById("content");
      const item = XHR.response.message;
      const html = `
      <div class="d-flex justify-content-center">
      <div class="row chat-chat">
        <div class="col-10">
          <div class="says">
            <p class="chat-message">${item.content}</p>
            <span>${item.created_at}</span>
          </div>
        </div>
        <div class="col-2 chat-icon">
          <div>
            ${gon.user_name} <br>
          </div>
          <div class="chat-icon1">
            <img src="default.png" alt="ユーザー画像" class="chat-image chat-image-size">
          </div>
        </div>
      </div>
    </div>
      `;
    list.insertAdjacentHTML("beforeend",html);
    formText.value = "";
        list.scrollTop = list.scrollHeight;

  };
  });
}

window.addEventListener('load', message);