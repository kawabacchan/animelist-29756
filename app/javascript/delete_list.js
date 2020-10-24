function delete_list() {
  const deleteListBtn = document.getElementById("delete-list-btn")
  const deleteList = document.getElementById("delete-list")
  const normalList = document.getElementById("normal-list")

  deleteListBtn.addEventListener('click', function() {
    if (deleteList.getAttribute("style") == "display: block;") {
      deleteList.removeAttribute("style", "display: block;");
      normalList.removeAttribute("style", "display: none;");
      deleteListBtn.removeAttribute("style", "background-color: #FF5192; color: white;");
    } else {
      deleteList.setAttribute("style", "display: block;");
      normalList.setAttribute("style", "display: none;");
      deleteListBtn.setAttribute("style", "background-color: #FF5192; color: white;");
    }
  })
}

setInterval(delete_list, 250);