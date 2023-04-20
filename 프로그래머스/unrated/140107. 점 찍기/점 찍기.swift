import Foundation

func solution(_ k:Int, _ d:Int) -> Int64 {
    var answer: Int64 = 0
    
    for x in stride(from: 0, through: d, by: k) {
        let maxY = sqrt(Double(d*d - x*x))
        answer += Int64(maxY / Double(k)) + 1
    }
    
    return answer
}