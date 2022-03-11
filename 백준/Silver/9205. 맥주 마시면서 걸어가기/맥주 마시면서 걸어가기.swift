//9205번 맥주 마시면서 걸어가기

let t = Int(readLine()!)!
for _ in 0..<t {
    let n = Int(readLine()!)!
    
    var edges: [(Int,Int)] = []
    
    let h = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (sx, sy) = (h[0], h[1])
    edges.append((sx,sy))
    
    for _ in 0..<n {
        let xy = readLine()!.split(separator: " ").map{Int(String($0))!}
        let (x,y) = (xy[0],xy[1])
        edges.append((x,y))
    }
    
    let r = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (rx, ry) = (r[0], r[1])
    edges.append((rx,ry))
    
    var graph = Array(repeating: [Int](), count: n+2)
    
    let len = edges.count
    
    for i in 0..<len-1 {
        for j in i+1..<len {
            if isConnect(from: edges[i], to: edges[j]) {
                graph[i].append(j)
                graph[j].append(i)
            }
        }
    }
    print(bfs(start: 0, end: n+1, graph: &graph) ? "happy" : "sad")
}


func isConnect(from: (Int,Int), to: (Int,Int)) -> Bool {
    let limit = 1_000
    
    return abs(from.0 - to.0) + abs(from.1 - to.1) <= limit
}

func bfs(start: Int, end: Int, graph: inout [[Int]]) -> Bool {
    var queue = [start]
    var idx = 0
    var visit = Array(repeating: false, count: end+1)
    visit[start] = true
    
    while queue.count > idx {
        let cur = queue[idx]
        idx += 1
        
        if cur == end {
            return true
        }
        
        for nx in graph[cur] where visit[nx] == false {
            visit[nx] = true
            queue.append(nx)
        }
    }
    
    return false
}
