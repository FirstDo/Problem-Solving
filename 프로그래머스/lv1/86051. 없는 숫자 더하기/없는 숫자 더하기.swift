// 숫자 문자열과 영단어

import Foundation

func solution(_ numbers:[Int]) -> Int {
    let allNumber = [1,2,3,4,5,6,7,8,9]
    let targetNumbers = Set(allNumber).subtracting(numbers)
    
    return targetNumbers.reduce(0, +)
}
