import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
  // Method
  func bfs(_ start: Int, disabledNode: Int) -> Int{
    var index = 0
    var queue = [start]
    var visit = Array(repeating: false, count: n)
    
    visit[start] = true
    visit[disabledNode] = true
    var cnt = 1 // 방문한 노드의 개수
    
    while index < queue.count {
      let curNode = queue[index]
      index += 1
      
      for nextNode in graph[curNode] where visit[nextNode] == false {
        cnt += 1
        visit[nextNode] = true
        queue.append(nextNode)
      }
    }
    
    return cnt
  }
  
  // Logic
  
  var answer = n
  // 그래프 생성
  var graph = Array(repeating: [Int](), count: n)
  
  for wire in wires {
    graph[wire[0] - 1].append(wire[1] - 1)
    graph[wire[1] - 1].append(wire[0] - 1)
  }
  
  for i in 0..<n {
    for j in 0..<n {
      if i != j {
        let result = bfs(j, disabledNode: i)
        answer = min(answer, abs(result - (n - result)))
      }
    }
  }
  
  return answer
}