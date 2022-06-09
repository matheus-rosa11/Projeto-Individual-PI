var database = require("../database/config");

function buscarUltimasMedidas() {
    instrucaoSql = `select nomeUsuario as pessoas, sum(pontos) as pontos FROM usuario JOIN pontuacao ON fkUsuario = idUsuario GROUP BY nomeUsuario ORDER BY SUM(pontos)`;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarMedidasEmTempoReal(idAquario) {
    instrucaoSql = `select nomeUsuario as pessoas, sum(pontos) as pontos FROM usuario JOIN pontuacao ON fkUsuario = idUsuario GROUP BY nomeUsuario`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}


module.exports = {
    buscarUltimasMedidas,
    buscarMedidasEmTempoReal
}