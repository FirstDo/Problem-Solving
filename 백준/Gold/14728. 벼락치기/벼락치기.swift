//14728번 벼락치기

import Foundation

let T = readLine()!.components(separatedBy: " ").map {Int($0)!}
let (n, t) = (T[0], T[1])

let list = (0..<n).compactMap { _ -> (weight: Int, value: Int) in
    let T = readLine()!.components(separatedBy: " ").map {Int($0)!}
    return (T[0], T[1])
}

var dp = Array(repeating: Array(repeating: 0, count: 10001), count: n)

for k in 0...t where k >= list[0].weight {
    dp[0][k] = list[0].value
}

for i in 1..<n {
    for j in 0...t {
        if j - list[i].weight >= 0 {
            dp[i][j] = max(dp[i-1][j], dp[i-1][j - list[i].weight] + list[i].value)
        } else {
            dp[i][j] = dp[i-1][j]
        }
    }
}

print(dp[n-1][t])
