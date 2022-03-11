//15900번 나무 탈출

let n = Int(readLine()!)!
var graph = Array(repeating: [Int](), count: n+1)
var distance = Array(repeating: -1, count: n+1)
var isLeaf = Array(repeating: false, count: n+1)

for _ in 0..<n-1 {
    let ab = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (a,b) = (ab[0],ab[1])
    graph[a].append(b)
    graph[b].append(a)
}

bfs(start: 1)
//리프노드고, 거리가 홀수인 개수가 홀수면 승리 짝수면 패배
let cnt = (1...n).filter{isLeaf[$0] && distance[$0] % 2 != 0}.count

print(cnt % 2 != 0 ? "Yes" : "No")


func bfs(start: Int) {
    
    var queue = [(start,0)]
    var idx = 0
    
    distance[start] = 0
    
    while queue.count > idx {
        let (cur, dist) = queue[idx]
        idx += 1
        let nextNodes = graph[cur].filter{distance[$0] == -1}
        
        
        for nx in nextNodes {
            distance[nx] = dist + 1
            queue.append((nx,dist+1))
        }
        
        //루프노드라는 뜻
        if nextNodes.isEmpty {
            isLeaf[cur] = true
        }
    }
}
