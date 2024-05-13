/* Você foi convocado pelo reino de Diolaris para uma missão de suma importância: auxiliar os aventureiros recém-chegados na escolha de sua classe. 
As opções são: Guerreiro, Mago e Arqueiro. Para isso, você deve criar um programa que solicite aos aventureiros a escolha de sua classe.
Com base nessa escolha, o programa deve exibir uma mensagem indicando a classe selecionada. Se o aventureiro inserir uma classe inválida, uma mensagem de orientação deve ser exibida, instruindo-o a escolher entre as opções válidas.
Entrada: A entrada será o nome da classe escolhida.
Saída: A saída esperada é uma mensagem informando a classe escolhida dentre as três opções: Guerreiro, Mago e Arqueiro.
caso tenha escolhido Guerreiro, deverá imprimir “Você escolheu a classe Guerreiro!”
 Caso a entrada seja diferente de uma dessas três classes, deverá retornar a mensagem: “Classe inválida! Escolha entre Guerreiro, Mago ou Arqueiro.”
 */

const readline = require('readline')

let warriorClass

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

async function main() {
    warriorClass = await askQuestion("\nEscolha sua classe: Guerreiro, Mago ou Arqueiro\n")

    switch (warriorClass) {
        case "Guerreiro":
            console.log("\nVocê escolheu a classe Guerreiro!\n")
            break
        case "Mago":
            console.log("\nVocê escolheu a classe Mago!\n")
            break
        case "Arqueiro":
            console.log("\nVocê escolheu a classe Arqueiro!\n")
            break
        default:
            console.log("\nClasse inválida! Escolha entre Guerreiro, Mago ou Arqueiro.\n")
    }
    rl.close()
}

main()