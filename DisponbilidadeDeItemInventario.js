//em seu inventário, você possui uma espada, um escudo, seis poções de cura, quatro poções de mana e três pergaminhos.
//sua missão é criar um algoritmo que retorne a mensagem “Disponível”, caso possua o item na quantidade especificada no seu inventário, e “Indisponível” caso não.
//A entrada vai receber duas informações: o nome do item a ser verificado e a quantidade desejada desse item.
//Imprima "Disponível" se a quantidade desejada do item estiver disponível no inventário e "Indisponível" caso contrário.

const readline = require('readline')
const name = ""
const qtd = 0
let inventory = [
    { name: 'espada', qtd: 1 },
    { name: 'escudo', qtd: 1 },
    { name: 'poção de cura', qtd: 6 },
    { name: 'poção de mana', qtd: 4 },
    { name: 'pergaminho', qtd: 3 }
]

let inputName
let inputQtd

const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
})

function askQuestion(question) {
    return new Promise((resolve) => {
        rl.question(question, (answer) => {
            resolve(answer) // Retorna a resposta
        })
    })
}

function verifyInput() {
    const found = inventory.find(item => item.name === inputName)

    if (found) {
        if (found.qtd >= inputQtd) {
            console.log("\n Disponível!\n\n")
        }
        else
            console.log("\n Indisponível!\n\n")
    }
    else
        console.log("\n Item não encontrado!\n\n")
}

async function main() {
    inputName = await askQuestion("\nQual o item a ser verificado?\n")
    inputQtd = await askQuestion("\nQual a quantidade necessária?\n")
    inputQtd = parseInt(inputQtd)

    verifyInput()
    rl.close() // Finalizar o programa
}

main();
