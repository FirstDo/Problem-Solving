import Foundation

func solution(_ a:[Int], _ edges:[[Int]]) -> Int64 {
  
  func dfs(_ current: Int, _ parent: Int) {
    for chlid in graph[current] {
      if chlid != parent {
        dfs(chlid, current)
      }
    }
    
    answer += abs(cost[current])
    cost[parent] += cost[current]
    cost[current] = 0
  }
  
  var answer = 0
  var cost = a
  var graph = Array(repeating: [Int](), count: a.count)
  
  for edge in edges {
    graph[edge[0]].append(edge[1])
    graph[edge[1]].append(edge[0])
  }
  
  guard cost.reduce(0, +) == 0 else {
    return -1
  }

  dfs(0, 0)
  return Int64(answer)
}