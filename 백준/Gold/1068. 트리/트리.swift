import Foundation

func solution() {
  let n = Int(readLine()!)!
  let nodes = readLine()!.split(separator: " ").map {Int($0)!}
  let deleteNode = Int(readLine()!)!
  
  var parents = Array(repeating: -1, count: n)
  var cnt = 0
  
  for i in 0..<n {
    parents[i] = nodes[i]
  }
  
  parents[deleteNode] = -2
  
  // 리프노드 탐색을 시작
  for i in 0..<n where parents.contains(i) == false {
    var x = i
    
    while true {
      // 루트 도달
      if parents[x] == -1 {
        cnt += 1
        break
      }
      
      // 끊긴 노드 도달
      if parents[x] == -2 {
        break
      }
    
      x = parents[x]
    }
  }
  
  print(cnt)
}

solution()
