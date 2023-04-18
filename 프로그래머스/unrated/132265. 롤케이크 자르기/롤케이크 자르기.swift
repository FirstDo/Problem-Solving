import Foundation

func solution(_ topping:[Int]) -> Int {
    var answer = 0
    var leftDicts = [Int: Int]()
    var rightDicts = [Int: Int]()
    
    topping.forEach {
        if rightDicts[$0] == nil {
            rightDicts[$0] = 1
        } else {
            rightDicts[$0]! += 1
        }
    }
    
    for index in 0..<topping.count {
        if leftDicts.count == rightDicts.count {
            answer += 1
        }
        
        let target = topping[index]
        
        if leftDicts[target] == nil {
            leftDicts[target] = 1
        } else {
            leftDicts[target]! += 1
        }
        
        rightDicts[target]! -= 1
        if rightDicts[target] == 0 {
            rightDicts[target] = nil
        }
    }
    
    return answer
}
