//1132번 합
import Foundation

let n = Int(readLine()!)!

var dict: [Character: Double] = [:]
var frontAlpha: Set<Character> = []

for _ in 0..<n {
    let numbers = Array(readLine()!)
    frontAlpha.insert(numbers.first!)
    
    for (idx,ch) in numbers.reversed().enumerated() {
        if dict[ch] != nil {
            dict[ch]! += pow(10, Double(idx))
        } else {
            dict[ch] = pow(10, Double(idx))
        }
    }
}

//0처리 하기
if dict.count == 10 {
    for (key,_) in dict.sorted(by: {$0.value < $1.value}) where !frontAlpha.contains(key) {
        dict[key] = nil
        break
    }
}

var ans = 0
var num = 9
for value in dict.values.sorted(by: >) {
    ans += Int(value) * num
    num -= 1
}

print(ans)
