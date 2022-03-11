//백준 10217번 KCM Travel

struct Heap<T> {
    var nodes: [T] = []
    let comparer: (T, T) -> Bool

    init(comparer: @escaping (T, T) -> Bool ) {
        self.comparer = comparer
    }

    var isEmpty: Bool {
        return nodes.isEmpty
    }

    mutating func insert(_ element: T) {
        var index = nodes.count
        nodes.append(element)

        while index > 0, !comparer(nodes[index],nodes[(index-1)/2]){
            nodes.swapAt(index, (index-1)/2)
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
                    nodes.swapAt(right, index)
                    index = right
                } else if !comparer(nodes[left], nodes[index]) {
                    nodes.swapAt(left, index)
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
        return lhs.time < rhs.time
    }

    var node: Int
    var cost: Int
    var time: Int
}

var T = Int(readLine()!)!

while T > 0 {
    T -= 1
    var f = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (N,M,K) = (f[0],f[1],f[2])
    var graph = Array(repeating: [(Int,Int,Int)](), count: N+1)
    let INF = Int.max
    var dp = Array(repeating: Array(repeating: INF, count: M+1), count: N+1)

    for _ in 0..<K {
        f = readLine()!.split(separator: " ").map{Int(String($0))!}
        let (u,v,c,d) = (f[0], f[1], f[2], f[3])
        graph[u].append((v,c,d))
    }

    dp[1][0] = 0
    var pq = Heap<EdgeData>()
    pq.insert(EdgeData(node: 1, cost: 0, time: 0))

    while !pq.isEmpty {
        let cur = pq.delete()!

        if dp[cur.node][cur.cost] < cur.time {
            continue
        }

        for nx in graph[cur.node] {
            let (nxNode, nxCost, nxTime) = nx

            let finalCost = nxCost + cur.cost
            let finalTime = nxTime + cur.time

            if finalCost > M {
                continue
            }

            
            if dp[nxNode][finalCost] > finalTime {
                //최적화 코드
                for p in finalCost...M {
                    if dp[nxNode][p] > finalTime {
                        dp[nxNode][p] = finalTime
                    }
                }
                //dp[nxNode][finalCost] = finalTime
                pq.insert(EdgeData(node: nxNode, cost: finalCost, time: finalTime))
            }
        }
    }

    let res = dp[N].min()!

    print(res == INF ? "Poor KCM" : res)
    
}
