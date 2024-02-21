func solve() {
  let k = Int(readLine()!)!
  
  for _ in 0..<k {
    let ve = readLine()!.split(separator: " ").map {Int($0)!}
    let (v, e) = (ve[0], ve[1])
    
    var graph = Array(repeating: [Int](), count: v + 1)
    var visit = Array(repeating: 0, count: v+1)
    
    for _ in 0..<e {
      let uv = readLine()!.split(separator: " ").map {Int($0)!}
      let (u, v) = (uv[0], uv[1])
      graph[u].append(v)
      graph[v].append(u)
    }
    
    var result = true
    
    for i in 1...v {
      if visit[i] == 0 {
        if bfs(node: i, graph: graph, visit: &visit) == false {
          result = false
        }
      }
    }
    
    print(result ? "YES" : "NO")
  }
}

func bfs(node: Int, graph: [[Int]], visit: inout [Int]) -> Bool {
  var queue = [node]
  var index = 0
  
  visit[node] = 1
  
  while queue.count > index {
    let current = queue[index]
    index += 1
    
    for next in graph[current] {
      if visit[next] == 0 {
        visit[next] = visit[current] * -1
        queue.append(next)
      }
      else if visit[next] == visit[current] {
        return false
      }
      else {
        // skip
      }
    }
  }
  
  return true
}

solve()
