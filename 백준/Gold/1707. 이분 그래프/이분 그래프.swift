import Foundation

struct Queue<T> {
  var elements: [T]
  var index = 0
  
  init(_ elements: [T] = []) {
    self.elements = elements
  }
  
  var isEmpty: Bool {
    !(elements.count > index)
  }
  
  mutating func enqueue(_ element: T) {
    elements.append(element)
  }
  
  mutating func dequeue() -> T {
    index += 1
    return elements[index - 1]
  }
}

func bfs(_ start: Int, visit: inout [Int], graph: [[Int]]) -> Bool {
  var queue = Queue([start])
  visit[start] = 1
  
  while queue.isEmpty == false {
    let cur = queue.dequeue()
    
    for next in graph[cur] {
      if visit[next] == 0 {
        visit[next] = visit[cur] * -1
        queue.enqueue(next)
      }
      else if visit[next] == visit[cur] {
        return false
      }
    }
  }
  
  return true
}

func solution() {
  let k = Int(readLine()!)!
  
  for _ in 0..<k {
    let ve = readLine()!.split(separator: " ").map {Int($0)!}
    let (v, e) = (ve[0], ve[1])
    
    var graph = Array(repeating: [Int](), count: v+1)
    var visit = Array(repeating: 0, count: v+1)
    
    for _ in 0..<e {
      let t = readLine()!.split(separator: " ").map {Int($0)!}
      let (n1, n2) = (t[0], t[1])
      graph[n1].append(n2)
      graph[n2].append(n1)
    }
    
    var result = true
    
    for i in 1...v where visit[i] == 0 {
      if bfs(i, visit: &visit, graph: graph) == false {
        result = false
      }
    }
    
    print(result ? "YES" : "NO")
  }
}

solution()
