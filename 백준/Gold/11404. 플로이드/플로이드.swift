import Foundation

let INF = Int.max / 10

func floydWarshall(_ graph: [[Int]]) {
  let n = graph.count - 1
  var temp = graph
  
  for k in 1...n {
    for i in 1...n {
      for j in 1...n {
        if i == j {
          temp[i][j] = 0
        } else {
          temp[i][j] = min(temp[i][k] + temp[k][j], temp[i][j])
        }
      }
    }
  }
  
  for i in 1...n {
    for j in 1...n {
      print(temp[i][j] == INF ? 0 : temp[i][j], terminator: " ")
    }
    print()
  }
}

func solution()  {
  let n = Int(readLine()!)!
  let m = Int(readLine()!)!
  
  var graph = Array(repeating: Array(repeating: INF, count: n+1), count: n+1)
  
  for _ in 0..<m {
    let abc = readLine()!.split(separator: " ").map{Int($0)!}
    let (a, b, c) = (abc[0], abc[1], abc[2])
    graph[a][b] = min(graph[a][b], c)
  }
  
  floydWarshall(graph)
}

solution()
