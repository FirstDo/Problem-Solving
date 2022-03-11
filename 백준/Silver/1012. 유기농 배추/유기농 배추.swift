//1012번 유기농 배추

let T = Int(readLine()!)!

for _ in 0..<T {
    let mnk = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (m,n,k) = (mnk[0],mnk[1],mnk[2])
    
    var graph = Array(repeating: Array(repeating: 0, count: m), count: n)
    
    for _ in 0..<k {
        let xy = readLine()!.split(separator: " ").map{Int(String($0))!}
        let (x,y) = (xy[0],xy[1])
        graph[y][x] = 1
    }
    
    var cnt = 0

    for i in 0..<n {
        for j in 0..<m {
            if graph[i][j] == 1 {
                graph[i][j] = 0
                bfs(i,j,n,m,&graph)
                cnt += 1
            }
        }
    }
    print(cnt)
}

func bfs(_ x: Int, _ y: Int, _ n: Int, _ m: Int, _ graph: inout [[Int]]) {
    var queue = [(x,y)]
    var idx = 0
    
    let dx = [1,-1,0,0]
    let dy = [0,0,1,-1]
    
    while queue.count > idx {
        let (cx,cy) = queue[idx]
        idx += 1
        
        for i in 0..<4 {
            let (nx,ny) = (cx+dx[i], cy+dy[i])
            if (0..<n) ~= nx && (0..<m) ~= ny && graph[nx][ny] == 1 {
                graph[nx][ny] = 0
                queue.append((nx,ny))
            }
        }
    }
}
