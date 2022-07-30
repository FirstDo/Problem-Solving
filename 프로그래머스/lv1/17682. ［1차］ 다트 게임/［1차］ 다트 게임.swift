import Foundation

func solution(_ dartResult:String) -> Int {
    let bounsDict: [Character: Double] = ["S": 1, "D": 2, "T": 3]
    
    var scores = [Double]()
    var score: Double = 0
    
    for value in dartResult {
        if value.isNumber {
            score = score * 10 + Double(String(value))!
        } else if value.isLetter {
            scores.append(pow(score, bounsDict[value]!))
            score = 0
        } else {
            if value == "*" {
                for index in [scores.endIndex - 1, scores.endIndex - 2] where index >= 0 {
                    scores[index] *= 2
                }
            }
            
            if value == "#" {
                let target = scores.removeLast()
                scores.append(target * -1)
            }
        }
    }
    
    return Int(scores.reduce(0, +))
}
