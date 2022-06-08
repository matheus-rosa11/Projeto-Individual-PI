var nome = sessionStorage.NOME_USUARIO
var email = sessionStorage.EMAIL_USUARIO

if (sessionStorage.length <= 0) {
    alert('Faça Login e tente novamente!');

    setTimeout(() => {
        window.location = '../index.html'
    }, 1000);
} else {
    document.getElementById("userName").innerHTML = nome;
    document.getElementById("userEmail").innerHTML = email;
}
