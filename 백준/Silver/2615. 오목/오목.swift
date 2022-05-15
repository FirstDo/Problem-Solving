// 2615번 오목

let dx = [0, 1, 1, 1]
let dy = [1, 1, 0, -1]

typealias Pos = (x: Int, y: Int)

func result(target: Int, dir: Int, start: Pos) -> (Result: Bool, Pos) {
    
    var list = [Pos]()
    var pos = start
    
    // 5개의 점 만들기
    
    (1...5).forEach { _ in
        list.append((pos.x, pos.y))
        pos.x += dx[dir]
        pos.y += dy[dir]
    }
    
    // 모두 범위 내이고 동일한 값인지 확인
    
    for (x,y) in list {
        guard (0..<19) ~= x && (0..<19) ~= y && graph[x][y] == target else {
            return (false, (-1,-1))
        }
    }
    
    // 6목 인지 아닌지를 확인하는 로직!
    
    let endPoint1: Pos = (start.x - dx[dir], start.y - dy[dir])
    let endPoint2: Pos = pos
    
    
    for end in [endPoint1, endPoint2] {
        if (0..<19) ~= end.x && (0..<19) ~= end.y && graph[end.x][end.y] == target {
            return (false, (-1,-1))
        }
    }
    
    let answer = list.sorted { lhs, rhs in
        if lhs.y == rhs.y {
            return lhs.x < rhs.x
        } else {
            return lhs.y < rhs.y
        }
        
    }.first!
    
    return (true, answer)
}

func search() {
    for i in 0..<19 {
        for j in 0..<19 where graph[i][j] != 0 {
            for dir in 0..<4 {
                let answer = result(target: graph[i][j], dir: dir, start: (i,j))
                if answer.Result {
                    print(graph[i][j])
                    print(answer.1.x + 1, answer.1.y + 1)
                    return
                }
            }
        }
    }
    
    print(0)
}

var graph = [[Int]]()
var visit = Array(repeating: Array(repeating: false, count: 19), count: 19)

for _ in 0..<19 {
    graph.append(readLine()!.split(separator: " ").map{Int($0)!})
}

search()
