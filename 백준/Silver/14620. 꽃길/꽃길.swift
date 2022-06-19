// 14620번 꽃길

import Foundation

let n = Int(readLine()!)!

var minValue = Int.max

let board = (0..<n).map { _ in
    return readLine()!.components(separatedBy: " ").map{Int($0)!}
}

func calculate(selects: [(Int,Int)]) {
    let result = selects.reduce(0) { partialResult, pos in
        partialResult + board[pos.0][pos.1] + board[pos.0 - 1][pos.1] + board[pos.0 + 1][pos.1]
        + board[pos.0][pos.1 - 1] + board[pos.0][pos.1 + 1]
    }
    
    minValue = min(minValue, result)
}

func dfs(selects: [(Int,Int)]) {
    if selects.count == 3 {
        calculate(selects: selects)
        return
    }

    for i in 1..<n-1 {
        for j in 1..<n-1 where !selects.contains(where: {(a,b) in a == i && b == j}){
            var flag = true
            
            for (x,y) in selects {
                if abs(x-i) + abs(y-j) < 3 {
                    flag = false
                }
            }
            
            if flag {
                dfs(selects: selects + [(i,j)])
            }
        }
    }
}

dfs(selects: [])
print(minValue)
