import Foundation

struct Queue<T> {
  private var index = 0
  private(set) var elements: [T]
  
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

func bfs(_ graph: [[Int]]) {
  let n = graph.count - 1
  
  var queue = Queue([1])
  
  var visited = Array(repeating: false, count: n+1)
  visited[1] = true
  
  var parents = Array(repeating: 0, count: n+1)
  
  while queue.isEmpty == false {
    let cur = queue.dequeue()
    
    for next in graph[cur] where visited[next] == false {
      parents[next] = cur
      visited[next] = true
      queue.enqueue(next)
    }
  }
  
  print(parents[2...].map {String($0)}.joined(separator: "\n"))
}

func solution() {
  let n = Int(readLine()!)!
  var graph = Array(repeating: [Int](), count: n+1)
  
  for _ in 0..<n-1 {
    let uv = readLine()!.split(separator: " ").map {Int($0)!}
    let (u, v) = (uv[0], uv[1])
    graph[u].append(v)
    graph[v].append(u)
  }
  
  bfs(graph)
}

solution()
