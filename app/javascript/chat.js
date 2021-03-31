function message () {
  const submit = document.getElementById("submit");
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
      <tr class="row justify-content-center">
      <td class="col-2">
      </td>
      <td class="col-10">
        <div class="col-1 float-right">
          ${gon.user_name}
        </div>      
        <div class="says">
        <p>${item.content}</p>
        <span>${item.created_at}</span>
      </div>
      </td>
    </tr> `;
    list.insertAdjacentHTML("beforeend",html);
    formText.value = "";
    // $('html').animate({ scrollTop: $('html')[0].scrollHeight});
        list.scrollTop = list.scrollHeight;

  };
  });
}

window.addEventListener('load', message);