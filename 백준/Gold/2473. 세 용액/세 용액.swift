// 2473번 세 용액

import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.components(separatedBy: " ").map{Int($0)!}.sorted(by: <)

// 결과를 저장할 곳
var (res, w1, w2, w3) = (Int.max,0,0,0)

// 고정시킬 값
for k in 0..<n-2 {
    // 투포인터
    var start = k + 1
    var end = n - 1
    
    while start < end {
        let target = arr[start] + arr[end] + arr[k]
        
        if abs(res) > abs(target) {
            res = target
            w1 = arr[start]
            w2 = arr[end]
            w3 = arr[k]
        }
        
        if target > 0 {
            end -= 1
        } else {
            start += 1
        }
    }
}

print(w3, w1, w2)
