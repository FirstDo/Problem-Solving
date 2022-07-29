// 숫자 문자열과 영단어

import Foundation

func solution(_ s:String) -> Int {
    let dict = ["zero": 0, "one": 1, "two": 2, "three": 3, "four": 4, "five": 5, "six": 6, "seven": 7, "eight": 8, "nine": 9]
    
    var result = ""
    var letter = ""
    
    for ch in s {
        // 숫자일 경우: letter 초기화 후, result에 숫자 추가
        if ch.isNumber {
            letter = ""
            result.append(ch)
            continue
        }
        
        letter.append(ch)
        
        // 숫자 단어가 완성되었을 경우: letter 초기화 후, result에 숫자 추가
        if let value = dict[letter] {
            letter = ""
            result.append(String(value))
        }
    }
    
    return Int(result)!
}
