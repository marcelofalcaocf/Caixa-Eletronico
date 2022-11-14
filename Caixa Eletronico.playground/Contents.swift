import UIKit

//// MARK: DevPoli
//
//let notasDisponiveis = [50,10, 5, 2]
//
//
//func sacar(retirar: Int) -> Bool{
//    guard retirar > 0 else {
//        return true //NAO TENHO SALDO REMANESCENTE
//    }
//    for nota in notasDisponiveis {
//        if retirar >= nota {
//            let novoSaque = retirar - nota
//            if sacar(retirar: novoSaque) {
//                print("Moeda: \(nota)")
//                return true
//            }
//        }
//    }
//    return false //NAO TENHO NOTA DISPONIVEL
//}
//
//// sacar(retirar: 28)
//
//
//// MARK: Marcelo
//
//let availableNotes = [50,10, 5, 2]
//
//func withdrawMoney(retirar: Int) -> String? {
//    var result: String = ""
//
//    guard retirar > 0 else {
//        return  result //NAO TENHO SALDO REMANESCENTE
//    }
//
//    for nota in availableNotes {
//
//        if retirar >= nota {
//            let novoSaque = retirar - nota
//            if (withdrawMoney(retirar: novoSaque) != nil) {
//                if let resultado  = withdrawMoney(retirar: novoSaque) {
//                    if resultado != "" {
//                        result += "Moeda \(nota) + \(resultado)"
//                        print(result)
//                        return result
//                    }
//                }
//                result += "Moeda \(nota)"
//                print(result)
//                return result
//            }
//        }
//    }
//    return nil
//}

// withdrawMoney(retirar: 8)



// MARK: Marcelo com dic

//let notes = [50,10, 5, 2]
//
//func withdraw(retirar: Int) -> [Int: Int]? {
//    var resultsNotes: [Int: Int] = [:]
//
//    guard retirar > 0 else {
//        return  resultsNotes //NAO TENHO SALDO REMANESCENTE
//    }
//
//    for nota in notes {
//        if retirar >= nota {
//            let novoSaque = retirar - nota
//            if (withdraw(retirar: novoSaque) != nil)  {
//                if let resultado = withdraw(retirar: novoSaque) {
//                    if resultado != [:] {
//                        resultsNotes = [nota : 1]
//                        let valueDic = resultsNotes[nota] ?? 0
//
//                        return resultsNotes
//                    }
//                }
//                resultsNotes.updateValue(1, forKey: nota)
//                print(resultsNotes)
//                return resultsNotes
//            }
//        }
//    }
//    return nil
//}
//
//withdraw(retirar: 8)
//
//// MARK: Exercício 1 pronto
//
//let notes = [50,10, 5, 2]
//
//func withdraw(retirar: Int) -> [Int: Int]? {
//    var resultsNotes: [Int: Int] = [:]
//
//    guard retirar > 0 else {
//        return  resultsNotes //NAO TENHO SALDO REMANESCENTE
//    }
//
//    for nota in notes {
//        if retirar >= nota {
//            let novoSaque = retirar - nota
//            if var result = withdraw(retirar: novoSaque) {
//                var valor = result[nota] ?? 0
//                valor += 1
//                result.updateValue(valor, forKey: nota)
//                print(result)
//                return result
//            }
//        }
//    }
//    return nil
//}
//
//withdraw(retirar: 8)

// MARK: Exercício 2

struct Note {
    var note: Int
    var inventory: Int
}

var notesAvailable: [Note] = [
    Note(note: 50, inventory: 2),
    Note(note: 10, inventory: 5),
    Note(note: 5, inventory: 5),
    Note(note: 2, inventory: 5
        )
]

var notesWithIndex = notesAvailable.enumerated()

func withdraw(retirar: Int) -> [Int: Int]? {
    var resultsNotes: [Int: Int] = [:]
    
    guard retirar > 0 else {
        return  resultsNotes //NAO TENHO SALDO REMANESCENTE
    }
    
    for (index, note) in notesWithIndex {
        if retirar >= note.note && notesAvailable[index].inventory > 0 {
            var newInvetory = notesAvailable[index].inventory
            newInvetory -= 1
            notesAvailable[index].inventory =  newInvetory
            
            let newWithdraw = retirar - note.note
            if var result = withdraw(retirar: newWithdraw) {
                var newValue = result[note.note] ?? 0
                newValue += 1
                result.updateValue(newValue, forKey: note.note)
                return result
            }
        }
    }
    return nil
}

withdraw(retirar: 150)

