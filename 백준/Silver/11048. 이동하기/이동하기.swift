// 11048번 이동하기

func input() -> [Int] {
    return readLine()!.split(separator: " ").map{Int($0)!}
}

let t = input()
let (n,m) = (t[0],t[1])

var arr = [[Int]]()

(1...n).forEach { _ in
    arr.append(input())
}

var dp = Array(repeating: Array(repeating: 0, count: m+1), count: n+1)

for i in 1...n {
    for j in 1...m {
        dp[i][j] = arr[i-1][j-1] + max(dp[i-1][j-1], dp[i-1][j], dp[i][j-1])
    }
}

print(dp[n][m])
