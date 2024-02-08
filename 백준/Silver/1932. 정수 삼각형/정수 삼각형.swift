//32 정수 삼각형

let n = Int(readLine()!)!
var graph = [[Int]]()

for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map{Int(String($0))!}
    graph.append(line)
}

//dp[i][j] = dp[i-1][j] + dp[i-1][j-1]

var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count:n)

if n == 1 {
    print(graph[0][0])
} else if n == 2 {
    print(graph[1].max()! + graph[0][0])
} else {

    dp[0][0] = graph[0][0]
    dp[1][0] = graph[1][0] + graph[0][0]
    dp[1][1] = graph[1][1] + graph[0][0] 



    for i in 2..<n {
        for j in 0..<i+1 {
            if j == 0 {
                dp[i][j] = dp[i-1][j] + graph[i][j]
            } else if j == i {
                dp[i][j] = dp[i-1][j-1] + graph[i][j]
            } else {
                dp[i][j] = max(dp[i-1][j],dp[i-1][j-1]) + graph[i][j]
            }
        }
    }
    print(dp[n-1].max()!)
}