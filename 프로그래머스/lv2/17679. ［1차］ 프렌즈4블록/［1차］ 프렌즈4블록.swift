import Foundation

struct Point: Hashable {
    let x: Int
    let y: Int
    
    var fourPoints: [Point] {
        return [
            Point(x: x, y: y),
            Point(x: x+1, y: y),
            Point(x: x, y: y+1),
            Point(x: x+1, y: y+1),
        ]
    }
}

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    
    var boomList = [Point]()
    var board: [[Character]] = board.map { Array($0) }
    var isBoom = true
    var answer = 0
    
    while isBoom {
        isBoom = false
        // 배열의 순회 & 폭파배열 준비
        for i in 0..<m-1 {
            for j in 0..<n-1 {
                let p = Point(x: i, y: j)
                
                let numberOfValues = p.fourPoints
                    .filter { board[$0.x][$0.y] == board[p.x][p.y] && board[p.x][p.y] != "-" }
                    .count
                
                // 중복 값이 있다면 폭파 배열로 이동
                if numberOfValues == 4 {
                    boomList.append(contentsOf: p.fourPoints)
                }
            }
        }
            
        // 배열 폭파 & "-"로 대체
        isBoom = !boomList.isEmpty
        
        boomList.forEach {
            if board[$0.x][$0.y] != "-" {
                board[$0.x][$0.y] = "-"
                answer += 1
            }
        }
        
        boomList.removeAll()
        
        // 빈칸 채우기
        for i in 1..<m {
            for j in 0..<n where board[i][j] == "-" {
                for k in stride(from: i, to: 0, by: -1) {
                    board[k][j] = board[k-1][j]
                    board[k-1][j] = "-"
                }
            }
        }
    }
    
    return answer
}