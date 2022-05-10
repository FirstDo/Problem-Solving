let n = Int(String(readLine()!))!
var graph =  Array(repeating: [Int](), count: n)

for i in 0..<n{
    graph[i] = readLine()!.split(separator: " ").map{Int(String($0))!}
}

var depth = 0
var result = Int.max
var sum = 0

var visited = Array(repeating: false, count: n)

func dfs(_ depth: Int, _ cur: Int, _ start: Int) {
    if depth == n && cur == start {
        result = min(result, sum)
        return
    }
    
    for i in 0..<n where !visited[i] && graph[cur][i] > 0 {
        visited[i] = true
        sum += graph[cur][i]
        if sum <= result {
            dfs(depth + 1, i, start)
        }
        visited[i] = false
        sum -= graph[cur][i]
    }
}

dfs(0, 0, 0)

print(result)
