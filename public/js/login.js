function entrar() {

    var emailVar = ipt_email.value;
    var senhaVar = ipt_senha.value;

    if (emailVar == "" || senhaVar == "") {
        alert('Preencha todos os campos!');
        return false;
    } else {

        console.log("FORM LOGIN: ", emailVar);
        console.log("FORM SENHA: ", senhaVar);

        fetch("/usuarios/autenticar", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                emailServer: emailVar,
                senhaServer: senhaVar
            })
        }).then(function (resposta) {
            console.log("ESTOU NO THEN DO entrar()!")
    
            if (resposta.ok) {
                console.log(resposta);
    
                resposta.json().then(json => {
                    console.log(json);
                    console.log(JSON.stringify(json));
    
                    sessionStorage.ID_USUARIO = json.idUsuario;
                    sessionStorage.NOME_USUARIO = json.nomeUsuario;
                    sessionStorage.EMAIL_USUARIO = json.emailUsuario;
                    sessionStorage.PONTOS_USUARIO = json.pontos;
    
                    setTimeout(function () {
                        window.location = "../user_area/userIndex.html";
                    }, 1000); // apenas para exibir o loading
    
                });
    
            } else {
    
                console.log("Houve um erro ao tentar realizar o login!");
    
                resposta.text().then(texto => {
                    console.error(texto);
                });
            }
    
        }).catch(function (erro) {
            console.log(erro);
        })
    
        return false;
    }

}

function sair() {
    sessionStorage.clear();
    window.location = "login.html";
}

