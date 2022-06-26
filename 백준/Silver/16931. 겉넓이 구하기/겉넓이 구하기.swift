// 16931번 겉넓이 구하기

import Foundation

let dx = [1,-1,0,0]
let dy = [0,0,1,-1]

let t = readLine()!.components(separatedBy: " ").map{Int($0)!}
let (n, m) = (t[0], t[1])

var arr = Array(repeating: Array(repeating: 0, count: m+2), count: n+2)

for i in 1...n {
    arr[i] = [0] + readLine()!.components(separatedBy: " ").map{Int($0)!} + [0]
}

var result = 0

// 상, 하 겉넓이 더하기
result += n * m * 2

// 한 자리에 대해서 옆면 너비 더하기
for i in 1...n {
    for j in 1...m {
        for k in 0..<4 {
            let nx = dx[k] + i
            let ny = dy[k] + j
            
            let value = arr[i][j] - arr[nx][ny]
            if value > 0 { result += value }
        }
    }
}

print(result)
