let inputs: [Int] = readLine()!.split{$0 == " "}.map{Int($0)!}
let N = inputs[0]
let M = inputs[1]
let V = inputs[2]

var graph: [[Int]] = [[Int]](repeating: [], count: N+1)
for _ in 0..<M {
    let node: [Int] = readLine()!.split{$0 == " "}.map{Int($0)!}
    graph[node[0]].append(node[1])
    graph[node[1]].append(node[0])
}

func dfs(_ start: Int, _ graph: [[Int]]) -> String{
    var visited: [Bool] = [Bool](repeating: false, count: N+1)
    var stack: [Int] = [start]
    var ans: String = ""
    while !stack.isEmpty {
        let node = stack.popLast()!
        if visited[node] { continue }
        
        visited[node] = true
        ans += "\(node) "
        stack += graph[node]
    }
    return ans
}

func bfs(_ start: Int, _ graph: [[Int]]) -> String{
    var ans: String = ""
    var queueStartIndex: Int = 0
    var queue: [Int] = [start]
    var visited: [Bool] = [Bool](repeating: false, count: N+1)
    
    while queueStartIndex<queue.count {
        let node = queue[queueStartIndex]
        queueStartIndex += 1
        
        if visited[node] {continue}
        
        visited[node] = true
        ans += "\(node) "
        queue += graph[node]
    }
    return ans
}

for i in 1...N {
    graph[i].sort(by: >)
}
print(dfs(V,graph))
for i in 1...N{
    graph[i].sort(by: <)
}
print(bfs(V,graph))

