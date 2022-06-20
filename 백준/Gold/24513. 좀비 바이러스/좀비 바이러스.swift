// 24513번 좀비 바이러스

import Foundation

func bfs() {
    repeat {
        virus = spreadVirus()
    } while !virus.isEmpty
}

func spreadVirus() -> [(Int, Int, Int)] {
    let dx = [1,-1,0,0]
    let dy = [0,0,1,-1]
    
    var temp = [(Int, Int, Int)]()
    
    // 기존 바이러스들은 완전 감염 처리
    for (x,y,_) in virus {
        infect[x][y] = true
    }
    
    // 새로운 바이러스들을 퍼트림
    for (x,y,v) in virus where graph[x][y] != 3 {
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            // 범위 내만 가능
            guard (0..<n) ~= nx && (0..<m) ~= ny else { continue }
            // 약 x, 3번 바이러스 x, 1,2번 바이러스 완료 x
            guard graph[nx][ny] != -1 && graph[nx][ny] != 3 && !infect[nx][ny] else { continue }
            
            // 만약 빈 마을이면
            if graph[nx][ny] == 0 {
                graph[nx][ny] = v
                temp.append((nx,ny,v))
            // 1번 감염중이고 2번 바이러스가 침입했다면
            } else if graph[nx][ny] == 1 && v == 2 {
                graph[nx][ny] = 3
                infect[nx][ny] = true
            } else if graph[nx][ny] == 2 && v == 1 {
                graph[nx][ny] = 3
                infect[nx][ny] = true
            }
        }
    }
    
    return temp
}

let T = readLine()!.components(separatedBy: " ").map{Int($0)!}
let (n,m) = (T[0], T[1])

var graph = Array(repeating: Array(repeating: 0, count: m), count: n)
var infect = Array(repeating: Array(repeating: false, count: m), count: n)

var virus = [(Int, Int, Int)]()

for i in 0..<n {
    for (j, value) in readLine()!.components(separatedBy: " ").map({Int($0)!}).enumerated() {
        graph[i][j] = value
        
        if graph[i][j] == 1 || graph[i][j] == 2 {
            virus.append((i,j,graph[i][j]))
        }
    }
}

bfs()

var (one, two, three) = (0, 0, 0)

for line in graph {
    for l in line {
        if l == 1 {
            one += 1
        } else if l == 2 {
            two += 1
        } else if l == 3 {
            three += 1
        }
    }
}

print(one, two, three)
