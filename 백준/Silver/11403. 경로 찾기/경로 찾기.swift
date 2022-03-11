let n = Int(readLine()!)!
var graph: [[Int]] = []
let inf: Int = 100 * 100 + 1

for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map{Int(String($0))!}.map{$0==0 ? inf:$0}
    graph.append(line)
}

func floydWarshall() {
    for k in 0..<n {
        for from in 0..<n {
            for to in 0..<n {
                graph[from][to] = min(graph[from][k] + graph[k][to], graph[from][to])
            }
        }
    }
}

floydWarshall()
var ans = ""
for i in 0..<n {
    let line = graph[i].map { $0 == inf ? 0:1}
    for e in line {
        print(e, terminator: " ")
    }
    print()
}

