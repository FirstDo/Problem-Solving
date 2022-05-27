// 1105번 팔

import Foundation

let t = readLine()!.components(separatedBy: " ")
let (L, R) = (Array(t[0]), Array(t[1]))

var result = 0

if L.count == R.count {
    for i in 0..<L.count {
        if L[i] != R[i] {
            break
        }
        
        if L[i] == R[i] && L[i] == "8" {
            result += 1
        }
    }
}

print(result)
