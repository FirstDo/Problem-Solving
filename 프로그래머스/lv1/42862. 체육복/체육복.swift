import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var reserveDict = [Int: Bool]()
    reserve.forEach { reserveDict[$0] = true }
    
    let lost = lost.filter {
        if reserveDict[$0] == true {
            reserveDict[$0] = nil
            return false
        } else {
            return true
        }
    }
    
    var missingCount = 0
    
    for p in lost.sorted(by: <) {
        if reserveDict[p-1] == true {
            reserveDict[p-1] = false
        } else if reserveDict[p+1] == true {
            reserveDict[p+1] = false
        } else {
            missingCount += 1
        }
    }
    
    return n - missingCount
}