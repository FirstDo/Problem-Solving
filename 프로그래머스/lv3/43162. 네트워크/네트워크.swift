import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
  
  func bfs(start: Int) {
    var queue = [start]
    var index = 0
    
    while queue.count > index {
      let current = queue[index]
      index += 1
      
      for (next, isConnect) in computers[current].enumerated() {
        if !visit[next] && isConnect == 1 {
          visit[next] = true
          queue.append(next)
        }
      }
    }
  }
  
  var count = 0
  var visit = Array(repeating: false, count: n)
  
  for i in 0..<n {
    if visit[i] == false {
      visit[i] = true
      count += 1
      bfs(start: i)
    }
  }
  
  return count
}