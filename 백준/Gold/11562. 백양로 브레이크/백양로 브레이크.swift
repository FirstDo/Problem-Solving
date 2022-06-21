// 11562번 백양로 브레이크

import Foundation

let INF = Int.max / 10
let T = readLine()!.components(separatedBy: " ").map{Int($0)!}
let (n, m) = (T[0], T[1])

var graph = Array(repeating: Array(repeating: INF, count: n+1), count: n+1)

(0...n).forEach { graph[$0][$0] = 0 }

for _ in 0..<m {
    let T = readLine()!.components(separatedBy: " ").map{Int($0)!}
    let (u, v, b) = (T[0], T[1], T[2])
    
    graph[u][v] = 0
    graph[v][u] = (b == 0) ? 1 : 0
}

// 플로이드 - 와샬

for k in 1...n {
    for i in 1...n {
        for j in 1...n {
            graph[i][j] = min(graph[i][j], graph[i][k] + graph[k][j])
        }
    }
}

let k = Int(readLine()!)!

let answer = (0..<k).reduce("") { partialResult, _ in
    let T = readLine()!.components(separatedBy: " ").map{Int($0)!}
    return partialResult + String(graph[T[0]][T[1]]) + "\n"
}.dropLast()

print(answer)
