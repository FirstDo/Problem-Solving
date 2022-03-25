//1965번 상자넣기
let n = Int(readLine()!)!
let boxes = readLine()!.split(separator: " ").map{Int(String($0))!}

//가장 긴 증가하는 부분수열 구하는 문제
var dp = Array(repeating: 1, count: n+1)

for i in 1..<n {
    for j in 0..<i {
        if dp[i] < dp[j] + 1 && boxes[i] > boxes[j] {
            dp[i] = dp[j] + 1
        }
    }
}

print(dp.max()!)
