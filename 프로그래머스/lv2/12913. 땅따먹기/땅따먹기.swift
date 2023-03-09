import Foundation

func solution(_ land:[[Int]]) -> Int {
    let n = land.count
    var dp = Array(repeating: Array(repeating: 0, count: 4), count: n)
    
    dp[0] = land[0]
    
    for row in 1..<n {
        for col in 0..<4 {
            for j in 0..<4 where j != col {
                dp[row][col] = max(dp[row][col], dp[row-1][j] + land[row][col])
            }
        }
    }
    
    return dp.last!.max()!
}
