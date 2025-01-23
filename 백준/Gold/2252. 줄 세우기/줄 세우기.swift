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

func topologySort(_ graph: [[Int]]) {
  let n = graph.count
  var indegree = Array(repeating: 0, count: n)
  
  for nodeList in graph {
    nodeList.forEach { indegree[$0] += 1 }
  }
  
  var queue = Queue<Int>()
  var answer = [Int]()
  
  for i in 1..<n where indegree[i] == 0 {
    queue.enqueue(i)
  }
  
  while queue.isEmpty == false {
    let cur = queue.dequeue()
    answer.append(cur)
    
    for next in graph[cur] {
      indegree[next] -= 1
      if indegree[next] == 0 {
        queue.enqueue(next)
      }
    }
  }
  
  print(answer.map {String($0)}.joined(separator: " "))
}

func solution() {
  let (nm) = readLine()!.split(separator: " ").map {Int($0)!}
  let (n, m) = (nm[0], nm[1])
  
  var graph = Array(repeating: [Int](), count: n+1)
  
  for _ in 0..<m {
    let ab = readLine()!.split(separator: " ").map {Int($0)!}
    let (a, b) = (ab[0], ab[1])
    graph[a].append(b)
  }
  
  topologySort(graph)
}

solution()
