// 1988번 낮잠 시간

import Foundation

let nb = readLine()!.components(separatedBy: " ").map{Int($0)!}
let (n, b) = (nb[0], nb[1])

var arr = Array(repeating: 0, count: 3001)
var dp1 = Array(repeating: Array(repeating: 0, count: 3001), count: 3001)
var dp2 = Array(repeating: Array(repeating: 0, count: 3001), count: 3001)

/*
 dp1[i][j] = arr[1...i]에서 j개 구간을 선택했을 때 구간 i에서 회복하는 최대 피로회복량
 dp2[i][j] = arr[1...i]에서 j개 구간을 선택했을 때 최대 피로회복량
 */

for i in 0..<n {
    let num = Int(readLine()!)!
    arr[i+1] = num
}

for i in 1...n {
    for j in 2...b {
        dp1[i][j] = max(dp2[i-1][j-2], dp1[i-1][j-1]) + arr[i]
        dp2[i][j] = max(dp2[i-1][j], dp1[i][j])
    }
}

print(dp2[n][b])
