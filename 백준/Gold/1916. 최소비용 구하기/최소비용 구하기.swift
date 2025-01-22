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

func dijkstra(_ start: Int, _ end: Int, _ graph: [[(Int, Int)]]) {
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
  
  print(dist[end])
}

func solution() {
  let n = Int(readLine()!)!
  let m = Int(readLine()!)!
  
  var graph = Array(repeating: [(Int, Int)](), count: n+1)
  
  for _ in 0..<m {
    let sec = readLine()!.split(separator: " ").map {Int($0)!}
    let (s, e, c) = (sec[0], sec[1], sec[2])
    graph[s].append((e, c))
  }
  
  let se = readLine()!.split(separator: " ").map {Int($0)!}
  let (start, end) = (se[0], se[1])
  
  dijkstra(start, end, graph)
}

solution()
