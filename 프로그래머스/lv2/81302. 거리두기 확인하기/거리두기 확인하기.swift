import Foundation

final class Queue<T> {
    var input = [T]()
    var output = [T]()
    
    var isEmpty: Bool {
        return input.isEmpty && output.isEmpty
    }
    
    func append(_ element: T) {
        input.append(element)
    }
    
    func pop() -> T {
        if output.isEmpty {
            output = input.reversed()
            input.removeAll()
        }
        
        return output.removeLast()
    }
}

var graph = [[Character]]()
var visit = [[Bool]]()

// 그래프 만드는 함수,
func makeGraph(_ place: [String]) {
    graph = place.map { Array($0) }
    visit = Array(repeating: Array(repeating: false, count: 5), count: 5)
}

let dx = [1,-1,0,0]
let dy = [0,0,1,-1]

func bfs(_ i: Int, _ j: Int) -> Bool {
    graph[i][j] = "O"
    
    defer {
        graph[i][j] = "P"
    }
    
    visit[i][j] = true
    let queue = Queue<(x: Int, y: Int, cnt: Int)>()
    queue.append((i,j,0))
    
    
    while !queue.isEmpty {
        let cur = queue.pop()
        
        // 거리가 모두 3이상임
        if cur.cnt >= 3 { return true }
        
        // 2이하에서 응시자를 만났음
        if graph[cur.x][cur.y] == "P" { return false }
        
        for i in 0..<4 {
            let nx = cur.x + dx[i]
            let ny = cur.y + dy[i]
            
            if (0..<5) ~= nx && (0..<5) ~= ny && !visit[nx][ny] && graph[nx][ny] != "X" {
                visit[nx][ny] = true
                queue.append((nx,ny,cur.cnt + 1))
            }
        }
    }
    
    return true
}

func solution(_ places:[[String]]) -> [Int] {
    var result = [Int]()
    
    placeLoop: for place in places {
        makeGraph(place)
        
        for i in 0..<5 {
            for j in 0..<5 where graph[i][j] == "P" {
                if !bfs(i,j) {
                    result.append(0)
                    continue placeLoop
                }
            }
        }
        
        result.append(1)
    }
    
    return result
}