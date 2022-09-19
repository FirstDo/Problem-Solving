import Foundation

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
  func findParent(_ node: Int) -> Int {
    if parent[node] != node {
      return findParent(parent[node])
    } else {
      return node
    }
  }
  
  func union(_ a: Int, _ b: Int) {
    let a = findParent(a)
    let b = findParent(b)
    
    if a < b {
      parent[b] = a
    } else {
      parent[a] = b
    }
  }
  
  var totalCost = 0
  var parent = Array(repeating: 0, count: n+1)
  (1...n).forEach { parent[$0] = $0 }
  
  for cost in costs.sorted(by: { $0[2] < $1[2] }) {
    let (a, b, dist) = (cost[0], cost[1], cost[2])
    
    if findParent(a) != findParent(b) {
      union(a, b)
      totalCost += dist
    }
  }
  
  return totalCost
}
