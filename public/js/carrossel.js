const imgs = document.getElementById("img");
const img = document.querySelectorAll('#img img');

let idx = 0;
let idx2 = 0;

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

function carrosselCurso(){
    idx2++;

    if (idx2 > img.length - 4) {
        idx2 = 0
    }

    imgs.style.transform = `translateX(${-idx2 * 200}px)`;
}

function carrosselCursoRight() {
    idx2--;

    // if (idx2 > img.length - 1) {
    //     idx2 = 0
    // }

    if (idx2 < 0) {
        idx2 = 0;
    }

    imgs.style.transform = `translateX(${-idx2 * 200}px)`;
}