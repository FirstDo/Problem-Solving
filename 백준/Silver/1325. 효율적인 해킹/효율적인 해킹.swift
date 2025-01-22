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


func bfs(_ start: Int, graph: [[Int]]) -> Int {
  var visit = Array(repeating: false, count: graph.count)
  visit[start] = true
  
  var queue = Queue([start])
  
  var cnt = 0
  
  while queue.isEmpty == false {
    let cur = queue.dequeue()
    
    for next in graph[cur] where visit[next] == false {
      cnt += 1
      visit[next] = true
      queue.enqueue(next)
    }
  }
  
  return cnt
}

func solution() -> String {
  let nm = readLine()!.split(separator: " ").map {Int($0)!}
  let (n, m) = (nm[0], nm[1])
  
  var graph = Array(repeating: [Int](), count: n+1)
  
  for _ in 0..<m {
    let ab = readLine()!.split(separator: " ").map {Int($0)!}
    let (a, b) = (ab[0], ab[1])
    graph[b].append(a)
  }
  
  var maxCnt = 0
  var result = [String]()
  
  for i in 1...n {
    let cnt = bfs(i, graph: graph)
    
    if cnt > maxCnt {
      maxCnt = cnt
      result = [String(i)]
    }
    else if cnt == maxCnt {
      result.append(String(i))
    }
  }
  
  return result.joined(separator: " ")
}

print(solution())
