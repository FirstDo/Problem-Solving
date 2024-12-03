import Foundation

let dx = [1, -1, 0, 0]
let dy = [0, 0, 1, -1]

var parent = [Int]()
var visited = [[Int]]()
var graph = [[Int]]()

// graph를 group으로 나누기 위한 bfs
func bfs(i: Int, j: Int, height: Int, groupNum: Int) {
  let n = graph.count

  var queue = [(i,j)]
  var index = 0
  visited[i][j] = groupNum

  while queue.count > index {
    let cur = queue[index]
    index += 1

    for i in 0..<4 {
      let (nx, ny) = (cur.0 + dx[i], cur.1 + dy[i])

      if (0..<n) ~= nx, (0..<n) ~= ny,
         visited[nx][ny] == -1,
         abs(graph[nx][ny] - graph[cur.0][cur.1]) <= height
      {
        visited[nx][ny] = groupNum
        queue.append((nx,ny))
      }
    }
  }
}

// group간의 연결부위를 찾기 위한 탐색
func findConnection() -> [(Int, Int, Int)] {
  var connectedInfo = [(no1: Int, no2: Int, diff: Int)]()
  let n = visited.count

  for i in 0..<n {
    for j in 0..<n {
      for k in 0..<4 {
        let (nx,ny) = (i+dx[k], j + dy[k])

        if (0..<n) ~= nx && (0..<n) ~= ny && visited[nx][ny] != visited[i][j] {
          connectedInfo.append((visited[i][j], visited[nx][ny], abs(graph[i][j] - graph[nx][ny])))
        }
      }
    }
  }

  return connectedInfo
}

func findParent(x: Int) -> Int {
  if x != parent[x] {
    parent[x] = findParent(x: parent[x])
  }

  return parent[x]
}

func union(a: Int, b: Int) {
  let _a = findParent(x: a)
  let _b = findParent(x: b)

  parent[_a] = _b
}

func setLadders() -> Int {
  let connection = findConnection().sorted { $0.2 < $1.2 }
  var ans = 0

  for (g1, g2, diff) in connection {
    if findParent(x: g1) != findParent(x: g2) {
      union(a: g1, b: g2)
      ans += diff
    }
  }

  return ans
}

func solution(_ land:[[Int]], _ height:Int) -> Int {
  let n = land.count

  graph = land
  visited = Array(repeating: Array(repeating: -1, count: n), count: n)

  var groupNum = 1

  for i in 0..<n {
    for j in 0..<n {
      if visited[i][j] == -1 {
        bfs(i: i, j: j, height: height, groupNum: groupNum)
        groupNum += 1
      }
    }
  }

  parent = Array(repeating: 0, count: groupNum)
  for i in 0..<groupNum {
    parent[i] = i
  }

  return setLadders()
}