import Foundation

func bfs() -> Int {
    //queue
    var queue = [(r1,c1,0)]
    var idx = 0
    
    // pos
    let dx = [-2,-2,0,0,2,2]
    let dy = [-1,1,-2,2,-1,1]
    
    // visit
    var visit = Array(repeating: Array(repeating: false, count: n), count: n)
    visit[r1][c1] = true
    
    //bfs search
    while queue.count > idx {
        let cur = queue[idx]
        idx += 1
        
        // 종료조건
        if cur.0 == r2 && cur.1 == c2 {
            return cur.2
        }
        
        // 갈수있는 모든 곳 탐색
        for (x, y) in zip(dx,dy) {
            let nx = cur.0 + x
            let ny = cur.1 + y
            
            if (0..<n) ~= nx && (0..<n) ~= ny && !visit[nx][ny] {
                visit[nx][ny] = true
                queue.append((nx,ny,cur.2 + 1))
            }
        }
    }
    
    return -1
}

let n = Int(readLine()!)!
let t = readLine()!.components(separatedBy: " ").compactMap { Int($0) }
let (r1,c1,r2,c2) = (t[0], t[1], t[2], t[3])

print(bfs())
