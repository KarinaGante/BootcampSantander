/* O objetivo é permitir que os jogadores votem em qual mapa eles gostariam de jogar na próxima partida.
Entrada: A entrada consistirá em uma lista de votos dos jogadores.
Cada voto será representado por uma letra, indicando o mapa escolhido pelo jogador. 
Os votos serão apresentados em uma única linha, separados por espaços.
Saída: A saída esperada é o mapa que recebeu mais votos.
*/

const readline = require('readline')

let input
let votes = []

const votesCount = {}

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
    input = await askQuestion("\nQuais os votos?\n")
    votes = input.split(' ')

    votes.forEach(vote => {
        votesCount[vote] = (votesCount[vote] || 0) + 1
    })

    let winnerMap
    let maxVotes = 0

    for (let map in votesCount) {
        if (votesCount[map] > maxVotes) {
            maxVotes = votesCount[map]
            winnerMap = map
        }
    }

    console.log(winnerMap)

    rl.close()
}

main()