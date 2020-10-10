function menu() {
  const menuButton = document.getElementById("menu")
  const leftPart = document.getElementById("left-part")
  menuButton.addEventListener('click', function() {
    if (leftPart.getAttribute("style") == "display: block;") {
      leftPart.removeAttribute("style", "display: block;");
      menuButton.removeAttribute("style", "background-color: white; color: #FF5192;");
    } else {
    leftPart.setAttribute("style", "display: block;");
    menuButton.setAttribute("style", "background-color: white; color: #FF5192;");
    }
  })
}

setInterval(menu, 1000)