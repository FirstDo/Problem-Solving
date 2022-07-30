// 소수 만들기

import Foundation

func isPrime(_ number: Int) -> Bool {
    if number == 1 { return false }
    
    for i in 2..<number {
        if number % i == 0 { return false }
    }
    
    return true
}

func combination(_ nums: [Int], _ depth: Int) -> [[Int]] {
    
    func combi(_ index: Int, _ temp: [Int]) {
        if temp.count == depth {
            result.append(temp)
            return
        }
        
        for i in index..<nums.count {
            combi(i+1, temp + [nums[i]])
        }
    }
    
    var result = [[Int]]()
    combi(0, [])
    return result
}


func solution(_ nums:[Int]) -> Int {
    let result = combination(nums, 3)
    let addResult = result.map { $0.reduce(0,+) }
    let count = addResult.filter(isPrime).count
    
    return count
}