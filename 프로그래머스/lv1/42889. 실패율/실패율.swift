import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var clear = Array(repeating: 0, count: N+2)
    var stop = Array(repeating: 0, count: N+2)
    
    for stage in stages {
        stop[stage] += 1
        clear[stage - 1] += 1
    }
    
    for i in stride(from: N, through: 0, by: -1) {
        clear[i] += clear[i+1]
    }
    
    return zip(clear[1...], stop[1...]).enumerated()
        .map { (index: Int, value: (c: Int, s: Int)) -> (Int, Double) in
            let total = value.c + value.s
            
            if total == 0 {
                return (index+1, 0)
            } else {
                return (index+1, Double(value.s) / Double(total))
            }
        }
        .dropLast()
        .sorted {
            if $0.1 == $1.1 {
                return $0.0 < $1.0
            } else {
                return $0.1 > $1.1
            }
        }
        .map { $0.0 }
}