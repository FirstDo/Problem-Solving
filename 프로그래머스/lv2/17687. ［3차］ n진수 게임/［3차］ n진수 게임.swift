import Foundation

func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    let number = (0...m*t).reduce("") { partialResult, num in
        partialResult + String(num, radix: n, uppercase: true)
    }
    
    let numberArr = Array(number)
    var answer = ""
    
    for i in 0..<t {
        let index = i * m + p - 1
        answer.append(numberArr[index])
    }

    return answer
}
