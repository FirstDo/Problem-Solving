// 9997번 폰트

import Foundation

extension Character {
    var toAscii: Int {
        return Int(UnicodeScalar(String(self))!.value) - 97
    }
}

func dfs(_ idx: Int, _ curMask: Int) {
    if curMask == (1<<26) - 1 {
        answer += 1
    }
    
    for i in idx..<n {
        let nextMask = curMask | bitMask[i]
        dfs(i+1, nextMask)
    }
}

let n = Int(readLine()!)!
var bitMask = Array(repeating: 0, count: 26)
var answer = 0

for i in 0..<n {
    let word = readLine()!
    
    for ch in word {
        let bit = ch.toAscii
        bitMask[i] |= (1<<bit)
    }
}

dfs(0, 0)
print(answer)
