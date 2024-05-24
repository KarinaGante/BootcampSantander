/*a missão é retornar uma mensagem para cada guerreiro informando a sua aptidão.
A entrada consiste no nome e no nível do guerreiro que se submeterá ao teste.
A saída esperada é uma mensagem com o nome do guerreiro informando a sua aptidão.
nível >= 40 “Parabéns, valente <guerreiro>! Sua coragem e habilidade são notáveis!”. 
nível == 30 e < 40 "Quase lá, <guerreiro>! Continue treinando!".
nível < 30, a mensagem deverá ser: “Ainda é cedo, jovem <guerreiro>. Treine mais!".*/

const readline = require('readline')

let playerName
let playerLevel

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
})

function askQuestion(question) {
    return new Promise((resolve) => {
        rl.question(question, (answer) => {
            resolve(answer)
        })
    })
}

function verifyLevel() {
    if (playerLevel >= 40)
        console.log("\nParabéns, valente " + playerName + "! Sua coragem e habilidade são notáveis!\n")
    else if (playerLevel < 30)
        console.log("\nAinda é cedo, jovem " + playerName + ". Treine mais!\n")
    else
        console.log("\nQuase lá, " + playerName + "! Continue treinando!\n")
}

async function main() {
    playerName = await askQuestion("\nQual o seu nome?\n")
    playerLevel = await askQuestion("\nQual o seu nível?\n")
    playerLevel = parseInt(playerLevel)

    verifyLevel()

    rl.close()
}

main()