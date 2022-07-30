import Foundation

func solution(_ answers:[Int]) -> [Int] {
    let answer = (
        a: [1, 2, 3, 4, 5],
        b: [2, 1, 2, 3, 2, 4, 2, 5],
        c: [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    )
    
    var result = [1: 0, 2: 0, 3: 0]
    
    for (index, value) in answers.enumerated() {
        if value == answer.a[index % 5] { result[1]! += 1 }
        if value == answer.b[index % 8] { result[2]! += 1 }
        if value == answer.c[index % 10] { result[3]! += 1 }
    }
    
    return result
        .sorted { $0.key < $1.key }
        .filter { $0.value == result.values.max() }
        .map { $0.key }
}