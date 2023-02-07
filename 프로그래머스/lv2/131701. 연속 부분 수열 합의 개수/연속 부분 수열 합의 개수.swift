import Foundation

func solution(_ elements:[Int]) -> Int {
    let doubleElements = elements + elements
    var totalSumSet = Set<Int>()
    
    for len in 1...elements.count {
        
        var temp = elements[0..<len].reduce(0, +)
        totalSumSet.insert(temp)
        
        for i in 1..<elements.count {
            temp -= doubleElements[i-1]
            temp += doubleElements[i-1+len]
            
            totalSumSet.insert(temp)
        }
    }
    
    return totalSumSet.count
}