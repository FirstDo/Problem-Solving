import Foundation

// 인접행렬 그래프 생성
func makeGraph(n: Int, results: [[Int]]) -> [[Int]] {
  var graph = Array(repeating: Array(repeating: 0, count: n), count: n)

  for result in results {
    let (p1, p2) = (result[0] - 1, result[1] - 1) // p1이 p2를 이김
    graph[p1][p2] = 1
    graph[p2][p1] = -1
  }
  
  return graph
}

// 플로이드 와샬 완전탐색
func floydWarshall(graph: [[Int]]) -> [[Int]] {
  let n = graph.count
  var graph = graph

  for k in 0..<n {
    for i in 0..<n {
      for j in 0..<n {
        // i > k > j 이면
        if graph[i][k] == 1 && graph[k][j] == 1 {
          graph[i][j] = 1
        }
        // i < k < j 이면
        if graph[i][k] == -1 && graph[k][j] == -1 {
          graph[i][j] = -1
        }
      }
    }
  }
  
  return graph
}

func solution(_ n:Int, _ results:[[Int]]) -> Int {
  let graph = makeGraph(n: n, results: results)
  let newGraph = floydWarshall(graph: graph)
  
  // 0의 개수가 오직 하나인 경우만 더해주기
  let answer = newGraph.reduce(0) { sum, arr in
    let canKnow = arr.filter { $0 == 0 }.count == 1
    return sum + (canKnow ? 1 : 0)
  }
  
  return answer
}