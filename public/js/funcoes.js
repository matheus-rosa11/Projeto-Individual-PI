// sessão
var autenticacao = sessionStorage.length > 0;

if (autenticacao) {
    document.getElementById('btn-entrar').innerHTML = 'PERFIL';
}

function entrarProdutos() {
    if (!autenticacao) {
        alert('Faça cadastro para acessar a página de produtos!');

        setTimeout(() => {
            window.location = 'cadastro.html';
        }, 100);

    } else {
        window.location = 'produtos.html';
    }
}

function voltar() {
    window.location = '../index.html';
}

function verificar() {
    if (!autenticacao) {
        window.location = 'login.html';
    } else {
        window.location = 'user_area/userIndex.html'
    }
}

function validarSessao() {
    // aguardar();

    var email = sessionStorage.EMAIL_USUARIO;
    var nome = sessionStorage.NOME_USUARIO;

    var h1LoginUsuario = document.getElementById("h1_login_usuario");

    if (email != null && nome != null) {
        // window.alert(`Seja bem-vindo, ${nome}!`);
        if (h1LoginUsuario != undefined) {
            h1LoginUsuario.innerHTML = email;
        }
        // b_usuario.innerHTML = nome;

        // finalizarAguardar();
    } else {
        window.location = "../login.html";
    }
}

function limparSessao() {
    // aguardar();
    sessionStorage.clear();
    // finalizarAguardar();
    window.location = "../login.html";
}

// carregamento (loading)
function aguardar() {
    var divAguardar = document.getElementById("div_aguardar");
    divAguardar.style.display = "flex";
}

function finalizarAguardar(texto) {
    var divAguardar = document.getElementById("div_aguardar");
    divAguardar.style.display = "none";

    var divErrosLogin = document.getElementById("div_erros_login");
    if (texto) {
        divErrosLogin.innerHTML = texto;
    }
}


// modal
function mostrarModal() {
    var divModal = document.getElementById("div_modal");
    divModal.style.display = "flex";
}

function fecharModal() {
    var divModal = document.getElementById("div_modal");
    divModal.style.display = "none";
}

