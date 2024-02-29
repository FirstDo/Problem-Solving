let inputs: [Int] = readLine()!.split{$0 == " "}.map{Int($0)!}
let N = inputs[0]
let M = inputs[1]
var graph = [[Int]]()

for _ in 0..<N {
    graph.append(readLine()!.map{Int(String($0))!})
}

var dx = [1,-1,0,0]
var dy = [0,0,1,-1]

func bfs(_ map: inout [[Int]]) -> Int {
    var queue = [(0,0)]
    var queueStart: Int = 0
    
    while queueStart < queue.count {
        let (x,y) = queue[queueStart]
        queueStart += 1
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            if nx < 0 || ny < 0 || nx >= N || ny >= M { continue }
            if map[nx][ny] == 0 { continue }
            if map[nx][ny] == 1 {
                map[nx][ny] = map[x][y] + 1
                queue.append((nx,ny))
            }
        }
    }
    return map[N-1][M-1]
}

print(bfs(&graph))
