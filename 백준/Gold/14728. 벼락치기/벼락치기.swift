//14728번 벼락치기

import Foundation

let T = readLine()!.components(separatedBy: " ").map {Int($0)!}
let (n, t) = (T[0], T[1])

var dp = Array(repeating: 0, count: 10001)

for _ in 0..<n {
    let T = readLine()!.components(separatedBy: " ").map {Int($0)!}
    let (weight, value) = (T[0], T[1])
    
    for i in stride(from: t, through: weight, by: -1) {
        dp[i] = max(dp[i], dp[i - weight] + value)
    }
}

print(dp[t])
    
