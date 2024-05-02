// Objetivo: Crie uma variável para armazenar o nome e a quantidade de experiência (XP) de um herói, depois utilize uma estrutura de decisão para apresentar alguma das mensagens abaixo: ferro, bronze, prata, ouro, platina, ascendente, imortal ou radiante
// Saída: "O Herói de nome **{nome}** está no nível de **{nivel}**"

const readline = require('readline');

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
})

let name, qtdXP, level; // Variáveis para armazenar as respostas

// Função para fazer uma pergunta e atribuir a resposta à variável correspondente
function askQuestion(pergunta) {
    return new Promise((resolve) => {
        rl.question(pergunta, (resposta) => {
            resolve(resposta) // Retorna a resposta
        })
    })
}

async function main() {
    name = await askQuestion("\nQual o nome do herói?\n")
    qtdXP = await askQuestion("\nQual a sua quantidade de experiência (XP)?\n")
    qtdXP = parseInt(qtdXP)

    if (qtdXP < 1000) // Estrutura condicional
        level = "Ferro"
    else if (qtdXP > 1000 && qtdXP <= 2000)
        level = "Bronze"
    else if (qtdXP > 2000 && qtdXP <= 5000)
        level = "Prata"
    else if (qtdXP > 5000 && qtdXP <= 7000)
        level = "Ouro"
    else if (qtdXP > 7000 && qtdXP <= 8000)
        level = "Platina"
    else if (qtdXP > 8000 && qtdXP <= 9000)
        level = "Ascendente"
    else if (qtdXP > 9000 && qtdXP <= 10000)
        level = "Imortal"
    else if (qtdXP >= 10001)
        level = "Radiante"

    console.log("\nO Héroi de nome " + name + " está no nível " + level + "!\n\n")

    rl.close() // Finalizar o programa
}

main();