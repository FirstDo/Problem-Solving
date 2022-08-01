import Foundation

var dict: [String: Int] = ["A": 1, "B": 2, "C": 3, "D": 4, "E": 5, "F": 6, "G": 7, "H": 8, "I": 9, "J": 10, "K": 11, "L": 12, "M": 13, "N": 14, "O": 15, "P": 16, "Q": 17, "R": 18, "S": 19, "T": 20, "U": 21, "V": 22, "W": 23, "X": 24, "Y": 25, "Z": 26]

func solution(_ msg:String) -> [Int] {
    var dictIndex = 27
    
    let msg = Array(msg)
    let len = msg.count
    
    var result = [Int]()
    
    var i = 0
    
    while i < len {
        // 사전에 있는 최대 범위까지 커버하기
        var current = "\(msg[i])"
        
        if i == len - 1 {
            result.append(dict[current]!)
            break
        }
        
        for j in i+1..<len {
            current.append(msg[j])
            
            if dict[current] == nil {
                // 새 문자열을 사전에 넣기
                dict[current] = dictIndex
                dictIndex += 1
                
                // result 배열에 추가
                _ = current.removeLast()
                result.append(dict[current]!)
                
                i = j
                
                break
            }
            
            if j == len - 1 {
                result.append(dict[current]!)
                i = len
            }
        }
    }
    
    return result
}
