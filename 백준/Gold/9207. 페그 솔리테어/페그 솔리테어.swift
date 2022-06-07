// 9207번 페그 솔리테어
// 게임판은 5 * 9
import Foundation

let dx = [-1,1,0,0]
let dy = [0,0,1,-1]

var graph = [[Character]]()
var ansPinCnt = Int.max
var ansMoveCnt = Int.max

func dfs(_ x: Int, _ y: Int, _ pinCnt: Int, _ depth: Int) {
    if pinCnt <= ansPinCnt {
        if pinCnt == ansPinCnt {
            ansMoveCnt = ansMoveCnt > depth ? depth : ansMoveCnt
        } else {
            ansPinCnt = pinCnt
            ansMoveCnt = depth
        }
    }
    
    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        let nnx = nx + dx[i]
        let nny = ny + dy[i]
        
        if (0..<5) ~= nx && (0..<9) ~= ny && graph[nx][ny] == "o"
            && (0..<5) ~= nnx && (0..<9) ~= nny && graph[nnx][nny] == "." {
            graph[x][y] = "."
            graph[nx][ny] = "."
            graph[nnx][nny] = "o"
            
            for i in 0..<5 {
                for j in 0..<9 {
                    if graph[i][j] == "o" {
                        dfs(i, j, pinCnt - 1, depth + 1)
                    }
                }
            }
            
            graph[x][y] = "o"
            graph[nx][ny] = "o"
            graph[nnx][nny] = "."
        }
    }
}

for _ in 0..<Int(readLine()!)! {
    graph.removeAll()
    for _ in 0..<5 {
        graph.append(Array(readLine()!))
    }
    _ = readLine()
    
    let pinCnt = graph.flatMap{$0}.filter {$0 == "o"}.count
    
    ansPinCnt = Int.max
    ansMoveCnt = Int.max

    for i in 0..<5 {
        for j in 0..<9 {
            if graph[i][j] == "o" {
                dfs(i,j,pinCnt, 0)
            }
        }
    }
    
    print(ansPinCnt, ansMoveCnt)
}
