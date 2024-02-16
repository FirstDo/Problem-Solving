import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var connections = Array(repeating: Array(repeating: false, count: n), count: n)
var visit = Array(repeating: false, count: n)
var answer = 0

for _ in 0..<m {
  let uv = readLine()!.split(separator: " ").map { Int($0)! }
  let (u, v) = (uv[0] - 1, uv[1] - 1)
  
  connections[u][v] = true
  connections[v][u] = true
}

for i in 0..<n {
  if visit[i] == false {
    bfs(i)
    answer += 1
  }
}

print(answer)

// BFS
func bfs(_ node: Int) {
  visit[node] = true
  
  var index = 0
  var queue = [node]
  
  while queue.count > index {
    let target = queue[index]
    index += 1
    
    for i in 0..<n where connections[target][i] && !visit[i] {
      visit[i] = true
      queue.append(i)
    }
  }
}

