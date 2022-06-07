var produtos = ['combo-utils', 'amplificador', 'combo-palhetas', 'cordas-daddario', 'cordas-elixir', 'combo-violao', 'suporte-parede', 'palheta-flow', 'pedal-fender', 'suporte-chao'];

for (let i = 0; i < produtos.length; i++) {
    let produto = produtos[i];

    if (produto == 'combo-utils') {
        document.getElementById(produto).innerHTML = 'Combo de Utilitários';
    } else if (produto == 'amplificador') {
        document.getElementById(produto).innerHTML = 'Amplificador Borne';
    } else if (produto == 'combo-palhetas') {
        document.getElementById(produto).innerHTML = `Palhetas D'Addario`;
    } else if (produto == 'cordas-daddario') {
        document.getElementById(produto).innerHTML = `Cordas D'Addario`;
    } else if (produto == 'cordas-elixir') {
        document.getElementById(produto).innerHTML = 'Cordas Elixir';
    } else if (produto == 'combo-violao') {
        document.getElementById(produto).innerHTML = 'Violão com capa + palhetas';
    } else if (produto == 'suporte-parede') {
        document.getElementById(produto).innerHTML = 'Suporte para violão e guitarra';
    } else if (produto == 'palheta-flow') {
        document.getElementById(produto).innerHTML = 'Palheta Flow .60mm';
    } else if (produto == 'pedal-fender') {
        document.getElementById(produto).innerHTML = 'Pedal Fender';
    } else if (produto == 'suporte-chao') {
        document.getElementById(produto).innerHTML = 'Suporte para violão';
    } else {
        document.getElementById(produto).innerHTML = 'PRODUTO NOVO!'
    }
}



