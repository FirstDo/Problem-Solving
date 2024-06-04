import Foundation

func makeGroup(_ sx: Int, _ sy: Int, _ number: Int, group: inout [[Int]], map: [[Int]]) -> Int {
  let (n,m) = (group.count, group[0].count)
  
  var queue = [(sx, sy)]
  var index = 0
  var cnt = 1
  
  group[sx][sy] = number
  
  while queue.count > index {
    let (x,y) = queue[index]
    index += 1
    
    for (dx,dy) in [(1,0), (-1,0), (0,1), (0,-1)] {
      let (nx,ny) = (x + dx, y + dy)
      
      // 범위내이고, 벽이아니고, 현재 그룹에 속해있지 않은경우
      if (0..<n) ~= nx && (0..<m) ~= ny && map[nx][ny] == 0 && group[nx][ny] == 0 {
        group[nx][ny] = number
        cnt += 1
        queue.append((nx,ny))
      }
    }
  }
  
  return cnt
}

func makeResult(_ i: Int, _ j: Int, group: [[Int]], groupDicts: [Int: Int]) -> Int {
  guard group[i][j] == 0 else { return 0 }
  
  let (n, m) = (group.count, group[0].count)
  
  var groups = Set<Int>()
  
  for (dx, dy) in [(1,0), (-1,0), (0,1), (0,-1)] {
    let (nx,ny) = (i+dx, j+dy)
    if (0..<n) ~= nx && (0..<m) ~= ny && group[nx][ny] != 0 {
      groups.insert(group[nx][ny])
    }
  }
  
  return (groups.reduce(0) {
    $0 + groupDicts[$1]!
  } + 1) % 10
}

func start() {
  let nm = readLine()!.components(separatedBy: " ").map {Int($0)!}
  let (n, m) = (nm[0], nm[1])
  let maps = (0..<n).map { _ in Array(readLine()!).map {Int(String($0))! } }
  
  var groupDicts = [Int:Int]()
  var group = Array(repeating: Array(repeating: 0, count: m), count: n)
  
  var number = 1
  
  for i in 0..<n {
    for j in 0..<m {
      if group[i][j] == 0 && maps[i][j] == 0 {
        let cnt = makeGroup(i, j, number, group: &group, map: maps)
        groupDicts[number] = cnt
        number += 1
      }
    }
  }
  
  var answer = ""
  
  for i in 0..<n {
    for j in 0..<m {
      answer += "\(makeResult(i, j, group: group, groupDicts: groupDicts))"
    }
    answer += "\n"
  }
  
  _ = answer.removeLast()
  print(answer)
}

start()
