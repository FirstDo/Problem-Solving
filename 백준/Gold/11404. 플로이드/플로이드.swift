let n = Int(readLine()!)!
let inf = 100000000

var graph = Array(repeating: Array(repeating: inf, count: n), count: n)

for _ in 0..<Int(readLine()!)! {
    let t = readLine()!.split(separator: " ").map{Int(String($0))!}
    graph[t[0]-1][t[1]-1] = min(graph[t[0]-1][t[1]-1], t[2])
}

for i in 0..<n {
    graph[i][i] = 0
}

for k in 0..<n {
    for i in 0..<n {
        for j in 0..<n {
            if i == j {
                continue
            } else {
                graph[i][j] = min(graph[i][k] + graph[k][j], graph[i][j])
            }
        }
    }
}

for i in 0..<n {
    for j in 0..<n {
        print(graph[i][j] >= inf ? 0 : graph[i][j], terminator: " ")
    }
    print()
}