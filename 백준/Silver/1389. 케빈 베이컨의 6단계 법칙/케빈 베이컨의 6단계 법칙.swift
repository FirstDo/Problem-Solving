import Foundation

func floydWarshall(_ graph: [[Int]]) -> [[Int]] {
  let n = graph.count - 1
  var temp = graph
  
  for k in 1...n {
    for i in 1...n {
      for j in 1...n {
        if temp[i][k] + temp[k][j] < temp[i][j] {
          temp[i][j] = temp[i][k] + temp[k][j]
        }
      }
    }
  }
  
  // 자기자신은 0으로 처리
  for i in 1...n {
    temp[i][i] = 0
  }
  
  return temp
}

func solution() -> Int {
  let nm = readLine()!.split(separator: " ").map{Int($0)!}
  let (n, m) = (nm[0], nm[1])
  
  var graph = Array(repeating: Array(repeating: Int.max/5, count: n+1), count: n+1)
  
  for _ in 0..<m {
    let ab = readLine()!.split(separator: " ").map{Int($0)!}
    let (a,b) = (ab[0], ab[1])
    graph[a][b] = 1
    graph[b][a] = 1
  }
  
  let newGraph = floydWarshall(graph)
  var results = [(no: Int, sum: Int)]()
  
  for i in 1...n {
    results.append((i, newGraph[i][1...].reduce(0, +)))
  }
  
  return results.min {
    if $0.sum == $1.sum {
      return $0.no < $1.no
    } else {
      return $0.sum < $1.sum
    }
  }!.no
}

print(solution())