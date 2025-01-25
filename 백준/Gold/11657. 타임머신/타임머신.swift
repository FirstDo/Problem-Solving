import Foundation

let INF = Int.max / 10

struct Edge {
  let from, to, cost: Int
}

func bellmanFord(_ n: Int, _ edges: [Edge]) {
  // 1. 초기화
  var distance = Array(repeating: INF, count: n+1)
  distance[1] = 0
  
  var hasNegativeCycle = false
  
  // 2. 간선을 반복하며 거리갱신 (새로운 간선을 사용했을때 거리가 단축된다면 적용) n-1번 반복
  for i in 1...n {
    for edge in edges where distance[edge.from] != INF {
      if distance[edge.to] > distance[edge.from] + edge.cost {
        distance[edge.to] = distance[edge.from] + edge.cost
        
        // n번째에도 거리가 갱신이 된다면, 음의 사이클이 있는것
        if i == n {
          hasNegativeCycle = true
        }
      }
    }
  }
  
  
  if hasNegativeCycle {
    print(-1)
  } else {
    distance[2...].forEach {
      print($0 == INF ? -1 : $0)
    }
  }
}

func solution()  {
  let nm = readLine()!.split(separator: " ").map{Int($0)!}
  let (n, m) = (nm[0], nm[1])
  
  var edges = [Edge]()
  
  for _ in 0..<m {
    let abc = readLine()!.split(separator: " ").map{Int($0)!}
    let (a, b, c) = (abc[0], abc[1], abc[2])
    edges.append(.init(from: a, to: b, cost: c))
  }
  
  bellmanFord(n, edges)
}

solution()
