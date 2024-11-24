import Foundation

func makeGraph(n: Int, road: [[Int]]) -> [[Int]] {
  var array = Array(repeating: Array(repeating: Int.max, count: n), count: n)
  
  for r in road {
    let (a,b,cost) = (r[0] - 1, r[1] - 1, r[2])
    array[a][b] = min(array[a][b], cost)
    array[b][a] = min(array[b][a], cost)
  }
  
  return array
}

func bfs(graph: [[Int]]) -> [Int] {
  let len = graph.count
  var dist = Array(repeating: Int.max, count: len)
  dist[0] = 0
  
  var index = 0
  var queue = [0]
  
  while queue.count > index {
    let cur = queue[index]
    index += 1
    
    // cur -> next 경로가 있을때
    for next in 0..<len where graph[cur][next] != Int.max {
      // 최단거리라면 갱신
      if dist[next] > dist[cur] + graph[cur][next] {
        dist[next] = dist[cur] + graph[cur][next]
        queue.append(next)
      }
    }
  }
  
  return dist
}

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
  let graph = makeGraph(n: N, road: road)
  let dist = bfs(graph: graph)
  
  return dist.filter { $0 <= k }.count
}