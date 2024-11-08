import Foundation

var parents = [Int]()

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
  var answers = 0

  parents = (0..<n).map { Int($0) }
  
  let costs = costs.sorted { $0[2] < $1[2] }
  
  for cost in costs {
    let (n1, n2, c) = (cost[0], cost[1], cost[2]) // node1, node2, 연결비용
    
    let parent1 = findParent(n1)
    let parent2 = findParent(n2)
    
    if parent1 != parent2 {
      unionNodes(parent1, parent2)
      answers += c
    }
  }

  return answers
}

// Find
func findParent(_ x: Int) -> Int {
  if parents[x] != x {
    parents[x] = findParent(parents[x])
  }
    
  return parents[x]
}

// Union
func unionNodes(_ a: Int, _ b: Int) {
  let a = findParent(a)
  let b = findParent(b)
  
  parents[a] = b
}
