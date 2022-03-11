let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n,m) = (nm[0], nm[1])

var snakeLadderPoints: [Int: Int] = [:]

for _ in 0..<(n+m) {
    let xy = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (x,y) = (xy[0],xy[1])
    snakeLadderPoints[x] = y
}

func bfs() {
    var idx = 0
    var queue = [(x: 1, cnt: 0)]
    var visit = Array(repeating: false, count: 101)
    visit[1] = true
    
    while queue.count > idx {
        let (cx,count) = queue[idx]
        idx += 1
        
        if cx == 100 {
            print(count)
            return
        }
        
        //주사위를 굴린다
        for i in 1...6 {
            var nx = cx + i
            
            if nx > 100 {continue}
            if let value = snakeLadderPoints[nx] {
                nx = value
            }
            
            if !visit[nx] {
                visit[nx] = true
                queue.append((nx,count+1))
            }
        }
    }
}

bfs()
