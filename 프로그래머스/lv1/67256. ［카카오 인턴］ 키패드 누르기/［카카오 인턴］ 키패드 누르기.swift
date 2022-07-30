import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    let posDict = [
        1: (0, 0), 2: (0, 1), 3: (0, 2),
        4: (1, 0), 5: (1, 1), 6: (1, 2),
        7: (2, 0), 8: (2, 1), 9: (2, 2),
        0: (3, 1)
    ]
    
    var result = ""
    
    var left = (3, 0)
    var right = (3, 2)
    
    for number in numbers {
        switch number {
        case 1, 4, 7:
            result += "L"
            left = posDict[number]!
        case 3, 6, 9:
            result += "R"
            right = posDict[number]!
        case 2, 5, 8, 0:
            let targetNumber = posDict[number]!
            
            let leftDiff = abs(targetNumber.0 - left.0) + abs(targetNumber.1 - left.1)
            let rightDiff = abs(targetNumber.0 - right.0) + abs(targetNumber.1 - right.1)
            
            if leftDiff < rightDiff {
                result += "L"
                left = posDict[number]!
            } else if leftDiff > rightDiff {
                result += "R"
                right = posDict[number]!
            } else {
                if hand == "left" {
                    result += "L"
                    left = posDict[number]!
                } else {
                    result += "R"
                    right = posDict[number]!
                }
            }
            
            break
        default:
            break
        }
    }
    
    return result
}