//2146번 다리 만들기
import Foundation

var graph = [[Int]]()

let dx = [1,-1,0,0]
let dy = [0,0,1,-1]

let n = Int(readLine()!)!
for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map{Int(String($0))!}
    graph.append(line)
}

var dict: [Int: [(Int,Int)]] = [:]

func numberingContinent() -> Int{
    var number = 2
    
    for i in 0..<n {
        for j in 0..<n {
            if graph[i][j] == 1 {
                bfs(i, j, number: number)
                number += 1
            }
        }
    }
    
    return number
}

func bfs(_ sx: Int, _ sy: Int, number: Int) {
    graph[sx][sy] = number
    dict[number] = [(sx,sy)]

    var queue = [(sx,sy)]
    var idx = 0
    
    while queue.count > idx {
        let (cx,cy) = queue[idx]
        idx += 1
        
        for i in 0..<4 {
            let (nx,ny) = (cx+dx[i], cy+dy[i])
            
            if (0..<n) ~= nx && (0..<n) ~= ny && graph[nx][ny] == 1 {
                graph[nx][ny] = number
                queue.append((nx,ny))
                dict[number]!.append((nx,ny))
            }
        }
    }
}

let cnt = numberingContinent()

func bfs2(number: Int) -> Int {
    var queue = dict[number]!
    var idx = 0
    
    let INF = Int.max
    var dist = Array(repeating: Array(repeating: INF, count: n), count: n)
    queue.forEach {dist[$0][$1] = 0}
    
    while queue.count > idx {
        let (cx,cy) = queue[idx]
        idx += 1
        
        //다른 대륙에 도착했다면 리턴
        if graph[cx][cy] != 0 && graph[cx][cy] != number {
            return dist[cx][cy]
        }
        
        for i in 0..<4 {
            let (nx,ny) = (cx+dx[i], cy+dy[i])
            
            if (0..<n) ~= nx && (0..<n) ~= ny && dist[nx][ny] > dist[cx][cy] + 1 {
                dist[nx][ny] = dist[cx][cy] + 1
                queue.append((nx,ny))
            }
        }
    }
    
    return Int.max
}

var minDist = Int.max

for k in 2..<cnt {
    let dist = bfs2(number: k)
    minDist = min(minDist, dist)
}

print(minDist-1)
