/*Você está desenvolvendo um sistema para um jogo de combate onde os jogadores acumulam dinheiro ao longo dos rounds e no início de cada round devem comprar um item ou economizar para rounds futuros. 
No início da partida, o jogador possui um saldo inicial. 
Durante o jogo, o saldo do jogador é ajustado de acordo com o resultado de cada round: se o jogador ganhar, o saldo aumenta em 15%
e o jogador perder, o saldo aumenta em apenas 5%
e se for um round bônus, o saldo aumenta em 20%
Sua tarefa é criar um método que determine se um jogador deve comprar um item ou economizar com base no saldo atual.
Entrada: A entrada será composta por três valores:
o primeiro valor será um número inteiro representando o saldo inicial do jogador
o segundo valor será "ganhou" se o jogador ganhou o último round, 
"perdeu" se o jogador perdeu 
o último round ou “bônus” se for um round bônus
o terceiro valor será um número inteiro representando o custo do item que o jogador deseja comprar neste round.
Saída: Imprima a mensagem "Comprar" se o jogador tiver saldo suficiente para comprar o item, caso contrário deve retornar "Economizar".
*/

const readline = require('readline')

let initialAmount
let lastRoundResult
let itemCost
let newAmount

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

function buyOrSave() {
    if (itemCost > newAmount)
        console.log("Economizar")
    else
        console.log("Comprar")
}

async function main() {
    initialAmount = await askQuestion("\nQual foi seu saldo inical?\n")
    lastRoundResult = await askQuestion("\nQual foi o resultado do seu último round?\n")
    itemCost = await askQuestion("\nQual o valor do item a ser comprado?\n")
    initialAmount = parseInt(initialAmount)

    if (lastRoundResult === 'ganhou')
        newAmount = initialAmount + (0.15 * initialAmount)
    else if (lastRoundResult === 'perdeu')
        newAmount = initialAmount + (0.05 * initialAmount)
    else
        newAmount = initialAmount + (0.2 * initialAmount)

    buyOrSave()
    rl.close()
}

main();

