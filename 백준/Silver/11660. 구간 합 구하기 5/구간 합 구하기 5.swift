func solution() -> String {
  let nm = readLine()!.split(separator: " ").map { Int($0)! }
  let (n, m) = (nm[0], nm[1])
  
  let arr = (0..<n).map { _ in
    readLine()!.split(separator: " ").map { Int($0)! }
  }
  
  // dp 구하기
  var dp = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)
  
  for i in 1...n {
    for j in 1...n {
      dp[i][j] += arr[i-1][j-1] + dp[i-1][j] + dp[i][j-1] - dp[i-1][j-1]
    }
  }
  
  var ans = [Int]()
  
  for _ in 0..<m {
    let x1y1x2y2 = readLine()!.split(separator: " ").map { Int($0)! }
    let (x1,y1,x2,y2) = (x1y1x2y2[0], x1y1x2y2[1], x1y1x2y2[2], x1y1x2y2[3])
    ans.append(dp[x2][y2] - dp[x2][y1-1] - dp[x1-1][y2] + dp[x1-1][y1-1])
  }

  return ans.map {String($0)}.joined(separator: "\n")
}

let result = solution()
print(result)
