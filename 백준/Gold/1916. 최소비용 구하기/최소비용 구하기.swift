import Foundation

struct Heap<T: Comparable> {
	var nodes: [T] = []
	let comparer: (T,T) -> Bool

	init(comparer: @escaping (T,T) -> Bool) {
		self.comparer = comparer
	}
	
	var isEmpty: Bool {
		return nodes.isEmpty
	}

	mutating func insert(_ element: T) {
		var index = nodes.count
		nodes.append(element)

		while index > 0, comparer(nodes[(index-1)/2], nodes[index]) {
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
				if comparer(nodes[left], nodes[right]), comparer(nodes[index], nodes[right]) {
					nodes.swapAt(right, index)
					index = right
				} else if comparer(nodes[index], nodes[left]) {
					nodes.swapAt(left,index)
					index = left
				} else {
					break
				}

			} else if left < nodes.count {
				if comparer(nodes[index], nodes[left]) {
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

extension Heap where T: Comparable {
	init() {
		self.init(comparer: >)
	}
}

struct EdgeData: Comparable {
	static func < (lhs: EdgeData, rhs: EdgeData) -> Bool {
		return lhs.cost < rhs.cost
	}
	var node: Int
	var cost: Int
}

let n = Int(readLine()!)!
let m = Int(readLine()!)!

var graph = Array(repeating: [(Int,Int)](), count: n+1)

for _ in 0..<m {
	let t = readLine()!.split(separator: " ").map{Int(String($0))!}
	let (a,b,c) = (t[0],t[1],t[2])
	graph[a].append((b,c))
}

let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (start,end) = (t[0],t[1])

var distance = Array(repeating: 9876543210, count: n+1)
distance[start] = 0

var heap = Heap<EdgeData>()
heap.insert(EdgeData(node: start, cost: 0))

while !heap.isEmpty {
	let cur = heap.delete()!
	if distance[cur.node] < cur.cost {
		continue
	}

	for (next, d) in graph[cur.node] {
		let dist = cur.cost + d 
		if dist < distance[next] {
			distance[next] = dist
			heap.insert(EdgeData(node: next, cost: dist))
		}
	}
}

print(distance[end])