//14728번 벼락치기

import Foundation

let dx = [0,0,-1,1]
let dy = [1,-1,0,0]

// 불을 퍼트리는 함수
func bfsFire() {
    var index = 0
    
    while fires.count > index {
        let (x,y,cnt) = fires[index]
        index += 1
        
        for i in 0..<4 {
            let (nx, ny) = (x + dx[i], y + dy[i])
            
            guard (0..<r) ~= nx && (0..<c) ~= ny else { continue }
            guard graph[nx][ny] != "#" && fireGraph[nx][ny] > cnt + 1 else { continue }
            
            fireGraph[nx][ny] = cnt + 1
            fires.append((nx,ny,cnt+1))
        }
    }
}

func bfs() {
    var queue = [(sx,sy,0)]
    var index = 0
    visit[sx][sy] = true
    
    while queue.count > index {
        let (x,y,cnt) = queue[index]
        index += 1
        
        for i in 0..<4 {
            let (nx, ny) = (x + dx[i], y + dy[i])
            
            // 미로 탈출하면 결과 출력
            guard (0..<r) ~= nx && (0..<c) ~= ny else {
                print(cnt + 1)
                return
            }
            
            // 벽이 아니고, 불이 붙지 않은 곳이고, 방문하지 않은 곳이라면 이동 한다
            guard graph[nx][ny] != "#" && fireGraph[nx][ny] > cnt + 1 && !visit[nx][ny] else {
                continue
            }
            
            visit[nx][ny] = true
            queue.append((nx,ny,cnt+1))
        }
    }
    
    print("IMPOSSIBLE")
}

let T = readLine()!.components(separatedBy: " ").map {Int($0)!}
let (r, c) = (T[0], T[1])

var graph = [[Character]]()
var fireGraph = Array(repeating: Array(repeating: Int.max, count: c), count: r)
var visit = Array(repeating: Array(repeating: false, count: c), count: r)

// 시작위치
var sx: Int = 0, sy: Int = 0
var fires: [(x: Int, y: Int, cnt: Int)] = []

for i in 0..<r {
    let input = Array(readLine()!)
    graph.append(input)
    
    for j in 0..<c {
        if input[j] == "J" {
            (sx, sy) = (i, j)
            graph[i][j] = "."
        } else if input[j] == "F" {
            fires.append((i,j,0))
            fireGraph[i][j] = 0
        }
    }
}

bfsFire()
bfs()
