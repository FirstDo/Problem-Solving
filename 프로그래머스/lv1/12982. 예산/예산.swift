import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    var budget = budget
    var cnt = 0
    
    for cost in d.sorted(by: <) {
        if budget - cost >= 0 {
            budget -= cost
            cnt += 1
        } else {
            break
        }
    }
    
    return cnt
}
