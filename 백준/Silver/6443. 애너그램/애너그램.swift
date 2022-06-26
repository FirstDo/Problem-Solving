// 11497번 통나무 건너뛰기

import Foundation

func dfs(_ s: String, _ len: Int) {
    if s.count == len {
        print(s)
        return
    }

    for i in 0..<26 {
        if alpha[i] > 0 {
            alpha[i] -= 1
            dfs(s + "\(Character(UnicodeScalar(i+97)!))", len)
            alpha[i] += 1
        }
    }
}


var alpha: [Int]

for _ in 0..<Int(readLine()!)! {
    let word = Array(readLine()!)
    alpha = Array(repeating: 0, count: 26)
    
    for ch in word {
        let index = Int(ch.asciiValue!) - 97
        alpha[index] += 1
    }
    
    dfs("", word.count)
}
