function validar() {
    var nomeUser = ipt_nome.value;
    var emailUser = ipt_email.value;
    var senhaUser = ipt_senha.value;
    var confirmacaoSenhaUser = ipt_confirmacao_senha.value;

    // console.log(nomeUser.length);

    if (nomeUser.length >= 2) {
        nomeMsg.innerHTML = "";

        if(emailUser.indexOf("@") > 0 && emailUser.endsWith(".com")){
            emailMsg.innerHTML = "";

            if(senhaUser.length > 5){
                senhaMsg.innerHTML = "";

                if(senhaUser == confirmacaoSenhaUser){
                    confirmacaoSenhaMsg.innerHTML = "";

                    alert("Dados cadastrados com êxito!")
                    cadastrar(nomeUser, emailUser, senhaUser, confirmacaoSenhaUser);

                    window.location.replace("login.html");
                }

                else{
                    confirmacaoSenhaUser.innerHTML = "As senhas não coincidem";
                }
            }

            else{
                senhaMsg.innerHTML = "Senha muito fraca";
            }
        }

        else{
            emailMsg.innerHTML = "Email inválido";
        }

    } 
}



function cadastrar(nomeVar, emailVar, senhaVar, confirmacaoSenhaVar) {

    console.log("CHEGANDO AQUI");
    // aguardar();

    //Recupere o valor da nova input pelo nome do id
    // Agora vá para o método fetch logo abaixo

    if (nomeVar == "" || emailVar == "" || senhaVar == "" || confirmacaoSenhaVar == "") {
        cardErro.style.display = "block"
        mensagem_erro.innerHTML = "(Mensagem de erro para todos os campos em branco)";

        // finalizarAguardar();
        return false;
    }
    // else {
    //     setInterval(sumirMensagem, 5000)
    // }

    // Enviando o valor da nova input
    fetch("/usuarios/cadastrar", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            // crie um atributo que recebe o valor recuperado aqui
            // Agora vá para o arquivo routes/usuario.js
            nomeServer: nomeVar, // vai pra tabela empresa
            emailServer: emailVar, // tabela usuario
            senhaServer: senhaVar // tabela usuario
        })
    }).then(function (resposta) {

        console.log("resposta: ", resposta);

        if (resposta.ok) {
            cardErro.style.display = "block";

            mensagem_erro.innerHTML = "Cadastro realizado com sucesso! Redirecionando para tela de Login...";

            setTimeout(() => {
                window.location = "login.html";
            }, "2000")

            limparFormulario();
            finalizarAguardar();
        } else {
            throw ("Houve um erro ao tentar realizar o cadastro!");
        }
    }).catch(function (resposta) {
        console.log(`#ERRO: ${resposta}`);
        // finalizarAguardar();
    });

    return false;
}