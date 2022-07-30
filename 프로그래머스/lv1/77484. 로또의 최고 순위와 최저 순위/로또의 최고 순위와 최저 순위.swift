import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    let result = [6: 1, 5: 2, 4: 3, 3: 4, 2: 5, 1: 6, 0: 6]
    
    let match = Set(win_nums).intersection(lottos).count
    let zeroCount = lottos.filter { $0 == 0 }.count
    
    let maxResult = match + zeroCount
    let minResult = match
    
    return [result[maxResult]!, result[minResult]!]
}
