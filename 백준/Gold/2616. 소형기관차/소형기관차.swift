import Foundation
//2616번 소형기관차

let n = Int(readLine()!)!
let train = [0] + readLine()!.split(separator: " ").map{Int(String($0))!}
let m = Int(readLine()!)!

var total = [0]
for i in 1...n {
	total.append(total[i-1] + train[i])
}

var dp = Array(repeating: Array(repeating: 0, count: n+1), count: 4)
//dp[i][j] = i번째 소형기관차가 j번째 기차를 선택했을때의 승객수 (j-m+1 ~ j 까지 끄는셈)
for i in 1..<4 {
	for j in m...n {
		dp[i][j] = max(dp[i][j-1], dp[i-1][j-m] + total[j] - total[j-m])
	}
}

print(dp[3][n])