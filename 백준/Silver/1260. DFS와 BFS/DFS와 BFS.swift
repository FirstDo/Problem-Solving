import Foundation

func bfs(start: Int, graph: [[Int]], visited: inout [Bool]) -> String {
  visited[start] = true
  
  var log = [start + 1]
  var index = 0
  var queue = [start]
  
  while queue.count > index {
    let cur = queue[index]
    index += 1
    
    for next in graph[cur] where visited[next] == false {
      log.append(next + 1)
      visited[next] = true
      queue.append(next)
    }
  }
  
  return log.map {String($0)}.joined(separator: " ")
}

func dfs(node: Int, graph: [[Int]], visited: inout [Bool]) -> String {
  var stack = [node]
  var log = [Int]()
  
  while !stack.isEmpty {
    let cur = stack.removeLast()
    
    if visited[cur] == false {
      log.append(cur + 1)
      visited[cur] = true
      stack += graph[cur].reversed()
    }
  }
  
  return log.map {String($0)}.joined(separator: " ")
}

func solution() -> String {
  let nmv = readLine()!.split(separator: " ").map({ Int($0)! })
  let (n, m, v) = (nmv[0], nmv[1], nmv[2] - 1)
  
  var graph = Array(repeating: [Int](), count: n)
  var visited = Array(repeating: false, count: n)
  
  for _ in 0..<m {
    let ab = readLine()!.split(separator: " ").map({ Int($0)! })
    let (a, b) = (ab[0]-1, ab[1]-1)
    graph[a].append(b)
    graph[b].append(a)
  }
  
  for i in 0..<n {
    graph[i].sort()
  }
  
  let dfsResult = dfs(node: v, graph: graph, visited: &visited)
  visited = Array(repeating: false, count: n)
  let bfsResult = bfs(start: v, graph: graph, visited: &visited)
  
  return "\(dfsResult)\n\(bfsResult)"
}

print(solution())
