import Foundation

var dict: [String: Int] = ["A": 1, "B": 2, "C": 3, "D": 4, "E": 5, "F": 6, "G": 7, "H": 8, "I": 9, "J": 10, "K": 11, "L": 12, "M": 13, "N": 14, "O": 15, "P": 16, "Q": 17, "R": 18, "S": 19, "T": 20, "U": 21, "V": 22, "W": 23, "X": 24, "Y": 25, "Z": 26]

func solution(_ msg:String) -> [Int] {
    let msg = Array(msg)
    let len = msg.count
    
    var dictIndex = 27
    var result = [Int]()
    
    var i = 0
    
    while i < len {
        // 사전에 있는 최대 범위까지 커버하기
        var current = "\(msg[i])"
        
        while true {
            // 문자열이 사전에 있을 경우. key 문자열 +1
            if dict[current] != nil {
                i += 1
                
                if i == len {
                    result.append(dict[current]!)
                    break
                }
                
                current.append(msg[i])
            }
            // 문자열이 사전에 없을경우, 사전에 추가
            else {
                dict[current] = dictIndex
                dictIndex += 1
                _ = current.removeLast()
                result.append(dict[current]!)
                break
            }
        }
    }
    
    return result
}