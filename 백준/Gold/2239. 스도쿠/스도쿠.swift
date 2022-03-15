/*
 2239번 스도쿠
 */

var graph = [[Int]]()
var findSolution = false

for _ in 0..<9 {
    graph.append(readLine()!.map{Int(String($0))!})
}


func isPossiblePos(row: Int, col: Int, number: Int) -> Bool {
    let boxRow = row / 3 * 3
    let boxCol = col / 3 * 3

    for i in 0..<9 {
        if graph[row][i] == number {return false}
        if graph[i][col] == number {return false}
        let dx = i / 3
        let dy = i % 3

        if graph[boxRow + dx][boxCol + dy] == number {return false}
    }

    return true
}

func sudoku(index: Int) {
    if findSolution {return}

    for i in index..<81 {
        let row = i / 9
        let col = i % 9

        if graph[row][col] == 0 {
            for n in 1...9 where isPossiblePos(row: row, col: col, number: n) {
                graph[row][col] = n
                sudoku(index: i+1)
            }

            graph[row][col] = 0
            return
        }
    }

    findSolution = true
    for g in graph {
        print(g.map{String($0)}.joined())
    }
}

sudoku(index: 0)