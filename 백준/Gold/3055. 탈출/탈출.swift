import Foundation

let rc = readLine()!.split(separator: " ").map {Int($0)!}
let (r,c) = (rc[0], rc[1])

var maps = [[Character]]()
var queue = [(x: Int, y: Int, t: Int)]()

for i in 0..<r {
  let row = Array(readLine()!)
  maps.append(row)
  
  for j in 0..<c {
    if row[j] == "*" || row[j] == "S" {
      queue.append((i,j,0))
    }
  }
}

let index = queue.firstIndex(where: { maps[$0.x][$0.y] == "S" })!
let target = queue.remove(at: index)
queue.insert(target, at: 0)
bfs(queue)

func bfs(_ queue: [(x: Int, y: Int, t: Int)]) {
  var queue = queue
  var index = 0
  
  var visit = Array(repeating: Array(repeating: false, count: c), count: r)
  visit[queue.first!.x][queue.first!.y] = true
  
  while queue.count > index {
    let (x,y,t) = queue[index]
    index += 1
    
    if maps[x][y] == "D" {
      print(t)
      return
    }
    
    // 물일떄
    if maps[x][y] == "*" {
      
      for (dx, dy) in [(1,0), (-1,0), (0,1), (0,-1)] {
        let (nx, ny) = (x+dx, y+dy)
        
        // 범위내이고, 비버랑 돌 아닐떄 이동가능
        if (0..<r).contains(nx) && (0..<c).contains(ny) &&
          maps[nx][ny] != "D" && maps[nx][ny] != "X" && maps[nx][ny] != "*"
        {
          maps[nx][ny] = "*"
          queue.append((nx,ny,t+1))
        }
      }
    }
    // 고슴도치일떄
    else if maps[x][y] == "S" {
      for (dx, dy) in [(1,0), (-1,0), (0,1), (0,-1)] {
        let (nx, ny) = (x+dx, y+dy)
        
        // 범위내이고, 물,돌 아닐때 이동가능
        if (0..<r).contains(nx) && (0..<c).contains(ny) &&
          maps[nx][ny] != "*" && maps[nx][ny] != "X" && !visit[nx][ny]
        {
          visit[nx][ny] = true
          
          if maps[nx][ny] != "D" {
            maps[nx][ny] = "S"
          }
          
          maps[x][y] = "X"
          queue.append((nx,ny,t+1))
        }
      }
    }
    else {
      fatalError()
    }
  }
  
  print("KAKTUS")
}
