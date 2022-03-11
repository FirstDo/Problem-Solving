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

        while index > 0, !comparer(nodes[index], nodes[(index-1)/2]) {
            nodes.swapAt(index,(index-1)/2)
            index = (index-1)/2
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
                if comparer(nodes[left], nodes[right]), !comparer(nodes[right], nodes[index]) {
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


    var cost: Int
    var node: Int
    var cheapNode: Int
}

//백준 13308번 주유소

/*
아이디어: 기름이 더 싼 도시를 만나기 전까지 가장싼 도시를 저장하고 있는다.
탐색은 어떤식으로?
*/

var f = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N,M) = (f[0],f[1])
var graph = Array(repeating: [(desN: Int, weight: Int)](), count: N+1)
var oilCost = [0]
oilCost.append(contentsOf: readLine()!.split(separator: " ").map{Int(String($0))!})

for _ in 0..<M {
    f = readLine()!.split(separator: " ").map{Int(String($0))!}
    graph[f[0]].append((f[1],f[2]))
    graph[f[1]].append((f[0],f[2]))
}

var pq = Heap<EdgeData>()
let INF = Int.max
var dp = Array(repeating: Array(repeating: INF, count: N + 1), count: N+1)
dp[1][1] = 0


pq.insert(EdgeData(cost: 0, node: 1, cheapNode: 1))

while !pq.isEmpty {
    let cur = pq.delete()!
    
    if dp[cur.node][cur.cheapNode] < cur.cost {
        continue
    }

    if cur.node == N {
        print(cur.cost)
        break
    }

    for nx in graph[cur.node] {
        let finalCost = nx.weight * oilCost[cur.cheapNode] + cur.cost

        if finalCost < dp[nx.desN][cur.cheapNode] {
            dp[nx.desN][cur.cheapNode] = finalCost

            pq.insert(EdgeData(cost: finalCost, node: nx.desN, cheapNode: oilCost[cur.cheapNode] < oilCost[nx.desN] ? cur.cheapNode : nx.desN))
        }
    }
}

