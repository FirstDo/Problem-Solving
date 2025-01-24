import Foundation

func floydWarshall(_ graph: [[Int]]) {
  let n = graph.count
  var temp = graph
  
  for k in 0..<n {
    for i in 0..<n {
      for j in 0..<n {
        if temp[i][j] == 0 && temp[i][k] == 1 && temp[k][j] == 1 {
          temp[i][j] = 1
        }
      }
    }
  }
  
  for t in temp {
    print(t.map { String($0) }.joined(separator: " "))
  }
}

func solution() {
  let n = Int(readLine()!)!
  let graph = (0..<n)
    .map { _ in readLine()!.split(separator: " ").map{Int($0)!} }
  floydWarshall(graph)
  
  
}

solution()
