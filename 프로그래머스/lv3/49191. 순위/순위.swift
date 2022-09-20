import Foundation

func solution(_ n:Int, _ results:[[Int]]) -> Int {
  var graph = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)
  
  results.forEach {
    graph[$0[0]][$0[1]] = 1
    graph[$0[1]][$0[0]] = -1
  }
  
  // 플로이드 와샬
  
  for k in 1...n {
    for i in 1...n {
      for j in 1...n where graph[i][j] == 0 {
        if graph[i][k] == graph[k][j] {
          graph[i][j] = graph[i][k]
        }
      }
    }
  }
  
  return graph[1...].reduce(0) { partialResult, line in
    if line[1...].filter ({ $0 == 0 }).count == 1 {
      return partialResult + 1
    } else {
      return partialResult
    }
  }
}