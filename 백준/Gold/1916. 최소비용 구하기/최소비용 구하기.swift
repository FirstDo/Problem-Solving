struct Heap<T: Comparable> {
	var nodes: [T] = []
	let compare: (T,T) -> Bool

	init(compare: @escaping (T,T) -> Bool) {
		self.compare = compare
	}
	
	var isEmpty: Bool {
		return nodes.isEmpty
	}

	mutating func insert(_ element: T) {
		var index = nodes.count
		nodes.append(element)

		while index > 0, compare(nodes[(index-1)/2], nodes[index]) {
			nodes.swapAt(index, (index-1)/2)
			index = (index-1)/2
		}
	}

	mutating func delete() -> T? {
		guard !nodes.isEmpty else {return nil}
		if nodes.count == 1 {
			return nodes.removeFirst()
		}

		let result = nodes.first
		nodes.swapAt(0, nodes.count - 1)
		_ = nodes.popLast()

		var index = 0

		while index < nodes.count {
			let left = index * 2 + 1
			let right = left + 1

			if right < nodes.count {
				if compare(nodes[left], nodes[right]), compare(nodes[index], nodes[right]) {
					nodes.swapAt(right, index)
					index = right
				} else if compare(nodes[index], nodes[left]) {
					nodes.swapAt(left,index)
					index = left
				} else {
					break
				}

			} else if left < nodes.count {
				if compare(nodes[index], nodes[left]) {
					nodes.swapAt(left, index)
					index = left
				} else {
					break
				}
			} else {
				break
			}
		}
		return result
	}
}

import Foundation

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
    let cur = heap.delete()!
    
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