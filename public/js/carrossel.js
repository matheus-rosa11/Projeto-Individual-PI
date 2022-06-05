const imgs = document.getElementById("img");
const img = document.querySelectorAll('#img img');

let idx = 0;

function carrossel(){
    idx++;

    if (idx > img.length - 4) {
        idx = 0
    }

    imgs.style.transform = `translateX(${-idx * 200}px)`;
}

function carrosselRight() {
    idx--;

    // if (idx > img.length - 1) {
    //     idx = 0
    // }

    if (idx < 0) {
        idx = 0;
    }

    imgs.style.transform = `translateX(${-idx * 200}px)`;
}

// setInterval(carrossel, 1800);