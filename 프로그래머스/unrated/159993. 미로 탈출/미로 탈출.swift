import Foundation

final class Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    var isEmpty: Bool {
        return input.isEmpty && output.isEmpty
    }
    
    var peek: T? {
        if output.isEmpty {
            output = input.reversed()
            input.removeAll()
        }
        
        return output.last
    }
    
    func enqueue(_ element: T) {
        input.append(element)
    }
    
    @discardableResult
    func dequeue() -> T? {
        if output.isEmpty {
            output = input.reversed()
            input.removeAll()
        }
        
        return output.popLast()
    }
}


struct Point: Equatable {
    let x: Int
    let y: Int
}

var visit: [[Bool]] = []
var graph: [[Character]] = []

func solution(_ maps:[String]) -> Int {
    let row = maps.count
    let col = maps[0].count
    
    visit = Array(repeating: Array(repeating: false, count: col), count: row)
    graph = maps.map { Array($0) }
    
    var start: Point!
    var lever: Point!
    var end: Point!
    
    for i in 0..<row {
        for j in 0..<col {
            switch graph[i][j] {
            case "S":
                start = Point(x: i, y: j)
            case "E":
                end = Point(x: i, y: j)
            case "L":
                lever = Point(x: i, y: j)
            default:
                break
            }
        }
    }
    
    // 시작점 -> 래버 탐색
    let result1 = bfs(start: start, end: lever)
    if result1 == -1 { return -1 }
    
    // 래버 -> 출구 탐색
    visit = Array(repeating: Array(repeating: false, count: col), count: row)
    
    let result2 = bfs(start: lever, end: end)
    if result2 == -1 { return -1 }
    
    return result1 + result2
}

/*
 S : 시작 지점
 E : 출구
 L : 레버
 O : 통로
 X : 벽
 */

func bfs(start: Point, end: Point) -> Int {
    let row = graph.count
    let col = graph[0].count
    
    let dx = [1,-1,0,0]
    let dy = [0,0,1,-1]
    
    let queue = Queue<(Point, dist: Int)>()
    queue.enqueue((start, 0))
    visit[start.x][start.y] = true
    
    while !queue.isEmpty {
        let (curPoint, curDist) = queue.dequeue()!
        
        if curPoint == end {
            return curDist
        }
        
        for i in 0..<4 {
            let nx = curPoint.x + dx[i]
            let ny = curPoint.y + dy[i]
            
            if (0..<row) ~= nx && (0..<col) ~= ny {
                if visit[nx][ny] == false && graph[nx][ny] != "X" {
                    visit[nx][ny] = true
                    queue.enqueue((Point(x: nx, y: ny), curDist + 1))
                }
            }
        }
    }
    
    return -1
}