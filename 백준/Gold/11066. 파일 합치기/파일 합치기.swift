let t = Int(readLine()!)!

for _ in 0..<t {
    let n = Int(readLine()!)!
    let page = readLine()!.split(separator: " ").map{Int(String($0))!}

    var total = [0]
    for p in page {
        total.append(total[total.endIndex-1]+p)
    }
    var dp: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)

    /*
    print(page)
    print(total)
    print(dp)
    */

    for d in 1..<n {
        for i in 0..<(n-d) {
            let j = i + d
            dp[i][j] = Int.max
            for k in i..<j {
                dp[i][j] = min(dp[i][j],dp[i][k] + dp[k+1][j] + total[j+1] - total[i])
            }
        }
    }
    print(dp[0][n-1])
}