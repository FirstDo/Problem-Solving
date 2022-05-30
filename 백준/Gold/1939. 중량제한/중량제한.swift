// 1939번 중량제한

import Foundation

// bfs
func bfs(_ target: Int) -> Bool {
    var visit = Array(repeating: false, count: n+1)
    
    var queue = [start]
    var idx = 0
    
    visit[start] = true
    
    while queue.count > idx {
        let cur = queue[idx]
        idx += 1
        
        if cur == end { return true }
        
        for (next, weight) in graph[cur] {
            if !visit[next] && weight >= target {
                visit[next] = true
                queue.append(next)
            }
        }
    }
    
    return false
}

// 이분탐색
func binarySearch(_ low: Int, _ high: Int) -> Int {
    if low > high { return high }
    
    let mid = (low + high) / 2
    
    if bfs(mid) {
        return binarySearch(mid + 1, high)
    } else {
        return binarySearch(low, mid - 1)
    }
}

let nm = readLine()!.components(separatedBy: " ").map{Int($0)!}
let (n, m) = (nm[0], nm[1])

var maxWeight = 0

var graph = Array(repeating: [(node: Int, weight: Int)](), count: n+1)

for _ in 0..<m {
    let t = readLine()!.components(separatedBy: " ").map{Int($0)!}
    let (a, b, c) = (t[0], t[1], t[2])
    
    maxWeight = max(c, maxWeight)
    
    graph[a].append((b,c))
    graph[b].append((a,c))
}

let se = readLine()!.components(separatedBy: " ").map{Int($0)!}
let (start, end) = (se[0], se[1])

print(binarySearch(0, maxWeight))
