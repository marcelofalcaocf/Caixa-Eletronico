import UIKit

func validaValue(value: Double, money: Int ) -> Bool {
    if Int(value) > money {
        return true
    }
    return false
}

func cashMachine(value: Double) -> String {
    let availableValues: [Double] = [50.0,10.0,5.0,2.0]
    
    var fiftyCount = 0
    var tenCount = 0
    var fiveCount = 0
    var twoCount = 0
    var remainingAmount = value
    var result: String = ""
    
    
        if Int(remainingAmount/availableValues[0]) > 0 {
            fiftyCount = Int(remainingAmount/availableValues[0])
            remainingAmount -= Double(fiftyCount) * availableValues[0]
            result += "\(fiftyCount) nota(s) de 50"
        }
        
        if Int(remainingAmount/availableValues[1]) > 0 {
            tenCount = Int(remainingAmount/availableValues[1])
                remainingAmount -= Double(tenCount) * availableValues[1]
                if fiftyCount > 0 {
                    result += ", \(tenCount) nota(s) de 10"
                } else {
                    result += "\(tenCount) nota(s) de 10"
                }
        }
        
        if Int(remainingAmount/availableValues[2]) > 0 {
            fiveCount = Int(remainingAmount/availableValues[2])
            remainingAmount -= Double(fiveCount) * availableValues[2]
            if fiftyCount > 0 || tenCount > 0 {
                result += ", \(fiveCount) nota(s) de 5"
            } else {
                result += "\(fiveCount) nota(s) de 5"
            }
        }
        
        if Int(remainingAmount/availableValues[3]) > 0 {
            twoCount = Int(remainingAmount/availableValues[3])
            remainingAmount -= Double(twoCount) * availableValues[3]
            if fiveCount > 0 || tenCount > 0 || twoCount > 0 {
                result += ", \(twoCount) nota(s) de 2"
            } else {
                result += "\(twoCount) nota(s) de 2"
            }
        }
        
        if Int(remainingAmount - value) != 0 {
            result = "Por gentileza, informa valores compativeis com a maquina"
        }
    
    return result
}

print(cashMachine(value: 8))


