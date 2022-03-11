struct Heap<T> {
    var nodes: [T] = []
    var comparer: (T, T) -> Bool

    init(comparer: @escaping (T, T) -> Bool ) {
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
        nodes.swapAt(0, nodes.count - 1)
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
    var cnt: Int
}


var f = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N,M,K) = (f[0],f[1],f[2])
var graph = Array(repeating: [(Int,Int)](), count: N+1)
let Inf = Int.max

var dp = Array(repeating: Array(repeating: Inf, count: K+1), count: N+1)

for _ in 0..<M {
    f = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (a,b,t) = (f[0],f[1],f[2])
    graph[a].append((b,t))
    graph[b].append((a,t))
}

dp[1][0] = 0
var heap = Heap<EdgeData>()
heap.insert(EdgeData(cost: 0, node: 1, cnt: 0))

while !heap.isEmpty {
    let pop = heap.delete()!
    let (curCost, curNode, curCnt) = (pop.cost, pop.node, pop.cnt)

    if dp[curNode][curCnt] < curCost {
        continue
    }

    for next in graph[curNode] {
        let (nxNode, nxCost) = (next.0, next.1)

        //도로 포장을 안하는경우
        let cost = curCost + nxCost
        
        if cost < dp[nxNode][curCnt] {
            dp[nxNode][curCnt] = cost
            heap.insert(EdgeData(cost: cost, node: nxNode, cnt: curCnt))
        }

        //도로 포장을 하는 경우
        if curCnt < K && curCost < dp[nxNode][curCnt + 1] {
            dp[nxNode][curCnt + 1] = curCost
            heap.insert(EdgeData(cost: curCost, node: nxNode, cnt: curCnt + 1))
        }
    }
}

print(dp[N].min()!)

