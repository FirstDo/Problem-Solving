import Foundation

struct Point {
  let x: Int
  let y: Int
}

extension Point: Equatable, Comparable {
  static func < (lhs: Point, rhs: Point) -> Bool {
    return lhs.x == rhs.x ? lhs.y < rhs.y : lhs.x < rhs.x
  }
}

// 퍼즐 or 빈칸 하나를 좌표로 전환하는 함수
func bfs(i: Int, j: Int, visited: inout [[Int]]) -> [Point] {
  let n = visited.count
  let dx = [1, -1, 0, 0]
  let dy = [0, 0, 1, -1]
  
  var answer = [Point(x: i, y: j)]
  
  var queue = [Point(x: i, y: j)]
  var index = 0
  
  while queue.count > index {
    let cur = queue[index]
    index += 1
    
    for index in 0..<4 {
      let (nx, ny) = (cur.x + dx[index], cur.y + dy[index])
      
      if (0..<n) ~= nx && (0..<n) ~= ny && visited[nx][ny] == 1{
        visited[nx][ny] = 0
        answer.append(Point(x: nx, y: ny))
        queue.append(Point(x: nx, y: ny))
      }
    }
  }
  
  let minX = answer.map { $0.x }.min()!
  let minY = answer.map { $0.y }.min()!
  
  return answer.map {
    Point(x: $0.x - minX, y: $0.y - minY)
  }.sorted()
}

// 퍼즐 or 빈칸을 만드는 함수
func makePuzzles(graph: [[Int]]) -> [[Point]] {
  let n = graph.count
  var visited = graph
  
  var puzzles = [[Point]]()
  
  for i in 0..<n {
    for j in 0..<n {
      if visited[i][j] == 1 {
        visited[i][j] = 0
        let res = bfs(i: i, j: j, visited: &visited)
        puzzles.append(res)
      }
    }
  }
  
  return puzzles
}

// 퍼즐을 90도 회전하는 함수
func rotatePuzzle(puzzle: [Point]) -> [Point] {
  let row = puzzle.map { $0.x }.max()!
  let newPuzzle = puzzle.map { Point(x: $0.y, y: row - $0.x) }
  
  let minX = puzzle.map { $0.x }.min()!
  let minY = puzzle.map { $0.y }.min()!
  
  return newPuzzle.map { Point(x: $0.x-minX, y: $0.y-minY) }.sorted()
}

func match(blanks: inout [[Point]], puzzle: [Point]) -> Int {
  var puzzle = puzzle
  
  for (index, blank) in blanks.enumerated() {
    for _ in 0..<4 {
      // 퍼즐이 빈칸이랑 매칭된다면, 해당 빈칸 제거하고 매칭칸수를 return
      if blank == puzzle {
        blanks.remove(at: index)
        return puzzle.count
      }
      // 90도 회전시키기
      puzzle = rotatePuzzle(puzzle: puzzle)
    }
  }
  
  // 매칭 못시켰으면 0
  return 0
}

func solution(_ game_board:[[Int]], _ table:[[Int]]) -> Int {
  var answer = 0
  let reverseGameBoard = game_board.map {
    $0.map { $0 == 1 ? 0 : 1}
  }
  
  let puzzles = makePuzzles(graph: table)
  var blanks = makePuzzles(graph: reverseGameBoard)
  
  for puzzle in puzzles {
    let res = match(blanks: &blanks, puzzle: puzzle)
    answer += res
  }
  
  return answer
}