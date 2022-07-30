import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    let len = board.count
    
    var board = board
    var stack = [Int]()
    var boomCount = 0
    
    for line in moves {
        // 1. 최상단의 인형을 하나 뽑는다
        for row in 0..<len {
            if board[row][line-1] != 0 {
                let target = board[row][line-1]
                board[row][line-1] = 0
                
                // 2. stack으로 옮긴다 (이때 같은게 연속적이면 터트려서 없애줌)
                if stack.last == target {
                    stack.removeLast()
                    boomCount += 2
                } else {
                    stack.append(target)
                }
                
                break
            }
        }
    }

    return boomCount
}