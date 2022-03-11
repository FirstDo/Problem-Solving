struct Heap<T> {
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

        while index > 0, !comparer(nodes[index], nodes[(index - 1) / 2]) {
            nodes.swapAt(index, (index - 1) / 2)
            index = (index - 1) / 2
        }
    }

    mutating func delete() -> T? {

        guard !nodes.isEmpty else {
            return nil
        }

        if nodes.count == 1 {
            return nodes.removeFirst()
        }


        let result = nodes.first
        nodes.swapAt(0,nodes.count-1)
        _ = nodes.popLast()

        var index = 0

        while index < nodes.count {
            let left = index * 2 + 1
            let right = left + 1

            if right < nodes.count {
                if comparer(nodes[left],nodes[right]), !comparer(nodes[right], nodes[index]) {
                    nodes.swapAt(right,index)
                    index = right
                } else if !comparer(nodes[left], nodes[index]) {
                    nodes.swapAt(left,index)
                    index = left
                } else {
                    break
                }

            } else if left < nodes.count {
                if !comparer(nodes[left], nodes[index]) {
                    nodes.swapAt(index,left)
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

    var cost: Int
    var node: Int
}


var f = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n,m) = (f[0], f[1])
var graph = Array(repeating: [(Int,Int)](), count: n+1)
var distance = Array(repeating: 987654321, count: n+1)
var track = Array(repeating: -1, count: n+1)

for _ in 0..<m {
    f = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (a,b,c) = (f[0],f[1],f[2])
    graph[a].append((b,c))
    graph[b].append((a,c))
}

//1번컴퓨터에대해 원래네트워크에서의 다익스트라 수행

var heap = Heap<EdgeData>()
distance[1] = 0
heap.insert(EdgeData(cost: 0, node: 1))

while !heap.isEmpty {
    let popNode = heap.delete()!, (curD, curN) = (popNode.cost, popNode.node)
    if distance[curN] < curD {
        continue
    }

    for next in graph[curN] {
        let cost = curD + next.1
        if cost < distance[next.0] {
            track[next.0] = curN

            distance[next.0] = cost
            heap.insert(EdgeData(cost: cost, node: next.0))
        }
    }
}

//print(distance[1...])
//print(track[1...])

/*
1->2
1->3
1->2->4
*/


//새로운 네트워크 구성. 신장트리를 구해야하는데.. 조건: 1번컴퓨터가 다른 컴들과 통신하는데 걸리는 시간은 유지해야함..!

//print(track)
var result = [(Int,Int)]()

for i in 1...n {
    if track[i] != -1 {
        result.append((track[i],i))
    }
}

print(result.count)
for r in result {
    print(r.0, r.1, separator: " ")
}