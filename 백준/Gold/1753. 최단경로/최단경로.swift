import Foundation

struct Heap<T: Comparable> {
  private var nodes = [T]()
  private let compare: (T, T) -> Bool
  
  init(compare: @escaping (T, T) -> Bool) {
    self.compare = compare
  }
  
  var isEmpty: Bool {
    nodes.isEmpty
  }
  
  mutating func insert(_ element: T) {
    var index = nodes.count
    nodes.append(element)
    
    while index > 0, compare(nodes[index], nodes[(index - 1) / 2]) {
      nodes.swapAt(index, (index-1)/2)
      index = (index - 1) / 2
    }
  }
  
  mutating func delete() -> T {
    let target = nodes.first!
    nodes.swapAt(0, nodes.count - 1)
    _ = nodes.removeLast()
    
    var index = 0
    
    while index < nodes.count {
      let left = index * 2 + 1
      let right = left + 1
      
      var target = index
      
      if left < nodes.count, compare(nodes[left], nodes[index]) {
        target = left
      }
      
      if right < nodes.count, compare(nodes[right], nodes[index]) {
        target = right
      }
      
      if target == index {
        break
      } else {
        nodes.swapAt(index, target)
        index = target
      }
    }
    
    return target
  }
}

struct Node: Comparable {
  let index: Int
  let cost: Int
  
  static func < (lhs: Node, rhs: Node) -> Bool {
    return lhs.cost < rhs.cost
  }
}

func dijkstra(_ start: Int, _ graph: [[(Int, Int)]]) {
  var dist = Array(repeating: Int.max, count: graph.count)
  dist[start] = 0
  
  var heap = Heap<Node>(compare: <)
  heap.insert(Node(index: start, cost: 0))
  
  while heap.isEmpty == false {
    let cur = heap.delete()
    
    if dist[cur.index] < cur.cost {
      continue
    }
    
    for (next, cost) in graph[cur.index] {
      if dist[next] > cur.cost + cost {
        dist[next] = cur.cost + cost
        heap.insert(Node(index: next, cost: cur.cost + cost))
      }
    }
  }
  
  let answer = dist[1...].map {
    $0 == Int.max ? "INF" : String($0)
  }
  .joined(separator: "\n")
  print(answer)
}

func solution() {
  let (ve) = readLine()!.split(separator: " ").map {Int($0)!}
  let (v, e) = (ve[0], ve[1])
  
  let k = Int(readLine()!)!
  
  var graph = Array(repeating: [(Int, Int)](), count: v+1)
  
  for _ in 0..<e {
    let uvw = readLine()!.split(separator: " ").map {Int($0)!}
    let (u, v, w) = (uvw[0], uvw[1], uvw[2])
    graph[u].append((v, w))
  }
  
  dijkstra(k, graph)
}

solution()
