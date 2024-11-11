import Foundation

func makeGraph(array: [[Int]]) -> [[Int]] {
  let n = array.count
  
  var graph = Array(repeating: [Int](), count: n)
  
  for i in 0..<n {
    for j in 0..<n {
      if i != j, array[i][j] == 1 {
        graph[i].append(j)
        graph[j].append(i)
      }
    }
  }
  
  return graph
}

func dfs(graph: [[Int]], visited: inout [Bool], index: Int) {
  let n = graph.count
  
  for next in graph[index] {
    if visited[next] == false {
      visited[next] = true
      dfs(graph: graph, visited: &visited, index: next)
    }
  }
}

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
  let graph = makeGraph(array: computers)
  var visited = Array(repeating: false, count: n)
  var cnt = 0
  
  for i in 0..<n {
    if visited[i] == false {
      cnt += 1
      visited[i] = true
      dfs(graph: graph, visited: &visited, index: i)
    }
  }
  

  return cnt
}

