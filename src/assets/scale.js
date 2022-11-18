let main = document.getElementById("main")
let sw = document.getElementById("zoomsw")

let zoom_auto = () => {
    let s = Math.floor(Math.min(window.innerWidth, window.innerHeight)/34)
    main.style.zoom = s;
    sw.innerText = "Zoom: " + s + "x"
    localStorage.setItem("zoom", s);
}

let zoom_reset = () => {
    main.style.zoom = 1
    sw.innerText = "Zoom: 1x"
    localStorage.setItem("zoom", 1);
}

let zoom_toggle = () => {
    if (sw.innerText == "Zoom: 1x") {
        zoom_auto()
    } else {
        zoom_reset()
    }
}

// Init
sw.addEventListener('click', zoom_toggle)
if (localStorage.getItem("zoom") == 1) {
    zoom_reset()
} else {
    zoom_auto()
}