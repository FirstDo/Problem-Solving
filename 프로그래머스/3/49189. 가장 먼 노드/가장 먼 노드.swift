import Foundation

func makeGraph(n: Int, edge: [[Int]]) -> [[Int]] {
  var graph = Array(repeating: [Int](), count: n)
  
  for e in edge {
    let (e1, e2) = (e[0] - 1, e[1] - 1)
    graph[e1].append(e2)
    graph[e2].append(e1)
  }
  
  return graph
}

func bfs(graph: [[Int]], n: Int) -> [Int] {
  var visited = Array(repeating: -1, count: n)
  visited[0] = 0
  
  var index = 0
  var queue = [0]
  
  while queue.count > index {
    let cur = queue[index]
    index += 1
    
    for next in graph[cur] {
      if visited[next] == -1 {
        visited[next] = visited[cur] + 1
        queue.append(next)
      }
    }
  }
  
  return visited
}

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
  let graph = makeGraph(n: n, edge: edge)
  let result = bfs(graph: graph, n: n)
  let maxValue = result.max()!
  
  return result.filter { $0 == maxValue }.count
}