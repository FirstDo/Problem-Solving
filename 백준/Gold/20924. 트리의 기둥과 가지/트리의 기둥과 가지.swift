//20924번 트리의 기둥과 가지
let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n,r) = (t[0],t[1])

var graph = Array(repeating: [(Int,Int)](), count: n+1)
var visit = Array(repeating: false, count: n+1)

func bfs(root: Int) -> (dist: Int, giga: Int) {
    var queue = [(root,0)]
    var idx = 0
    
    visit[root] = true
    
    while true {
        let (cur,curDist) = queue[idx]
        idx += 1
        
        let nextNodes = graph[cur].filter{!visit[$0.0]}
        if nextNodes.count >= 2 {
            return (dist: curDist, giga: cur)
        }
        
        for (nx,dist) in nextNodes {
            visit[nx] = true
            queue.append((nx,dist + curDist))
        }
        
        if queue.count <= idx {
            return (curDist,cur)
        }
    }
}

func bfs2(start: Int) -> Int {
    var maxDist = 0
    
    var queue = [(start,0)]
    var idx = 0
    
    while queue.count > idx {
        let (curNode, curDist) = queue[idx]
        idx += 1
        
        maxDist = max(maxDist, curDist)
        
        for (nx,dist) in graph[curNode] where !visit[nx] {
            visit[nx] = true
            queue.append((nx,dist + curDist))
        }
    }
    
    return maxDist
}

for _ in 0..<n-1 {
    let t = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (a,b,d) = (t[0],t[1],t[2])
    graph[a].append((b,d))
    graph[b].append((a,d))
}

let (pillar, gigaNode) = bfs(root: r)

let branch = bfs2(start: gigaNode)

print("\(pillar) \(branch)")
