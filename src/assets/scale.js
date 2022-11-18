let main = document.getElementById("main")
let sw = document.getElementById("zoomsw")

let zoom_auto = () => {
    let s = Math.floor(Math.min(window.innerWidth, window.innerHeight)/34)
    main.style.zoom = s;
    sw.innerText = "Zoom: " + s + "x"
}

let zoom_reset = () => {
    main.style.zoom = 1
    sw.innerText = "Zoom: 1x"
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
zoom_auto()