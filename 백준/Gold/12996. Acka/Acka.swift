// 12996번 Acka

import Foundation

func dim<T>(_ count: Int, _ value: T) -> [T] {
    return [T](repeating: value, count: count)
}

func solve(_ s: Int, _ a: Int, _ b: Int, _ c: Int) -> Int {
    if s == 0 {
        if a == 0 && b == 0 && c == 0 {
            return 1
        } else {
            return 0
        }
    }
    
    if a < 0 || b < 0 || c < 0 { return 0 }
    
    guard dp[s][a][b][c] == -1 else {
        return dp[s][a][b][c]
    }
    
    dp[s][a][b][c] = 0

    dp[s][a][b][c] += solve(s-1, a-1, b, c)
    dp[s][a][b][c] += solve(s-1, a, b-1, c)
    dp[s][a][b][c] += solve(s-1, a, b, c-1)
    dp[s][a][b][c] += solve(s-1, a-1, b-1, c)
    dp[s][a][b][c] += solve(s-1, a-1, b, c-1)
    dp[s][a][b][c] += solve(s-1, a, b-1, c-1)
    dp[s][a][b][c] += solve(s-1, a-1, b-1, c-1)
    dp[s][a][b][c] %= mod
    
    return dp[s][a][b][c]
}

let mod = 1_000_000_007
var dp = dim(51, dim(51, dim(51, dim(51, -1))))

let t = readLine()!.components(separatedBy: " ").map{Int($0)!}
let (s, p1, p2, p3) = (t[0], t[1], t[2], t[3])

print(solve(s, p1, p2, p3))
