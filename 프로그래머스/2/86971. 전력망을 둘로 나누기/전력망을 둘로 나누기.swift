import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
  var graph = Array(repeating: [Int](), count: n)

  for wire in wires {
    graph[wire[0] - 1].append(wire[1] - 1)
    graph[wire[1] - 1].append(wire[0] - 1)
  }
  
  func bfs(_ start: Int) -> Int {
    var queue = [start]
    var index = 0
    
    while index < queue.count {
      let cur = queue[index]
      index += 1
      
      visited[cur] = true
      
      for node in graph[cur] {
        if visited[node] == false {
          queue.append(node)
        }
      }
    }
    
    return index
  }
  
  var visited = [Bool]()
  var result = Int.max
  
  for i in 0..<n {
    visited = Array(repeating: false, count: n)
    visited[i] = true
    let count = bfs(0)
    result = min(result, abs(count - (n - count)))
  }
  
  return result
}