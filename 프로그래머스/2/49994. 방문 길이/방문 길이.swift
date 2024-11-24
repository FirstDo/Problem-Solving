import Foundation

struct Point: Hashable {
  let x: Int
  let y: Int
}

extension Point {
  func move(dir: Character) -> Point {
    let point: Point
    
    switch dir {
    case "U": point = Point(x: x, y: y+1)
    case "D": point = Point(x: x, y: y-1)
    case "R": point = Point(x: x+1, y: y)
    case "L": point = Point(x: x-1, y: y)
    default: fatalError()
    }
    
    if (-5...5).contains(point.x),
       (-5...5).contains(point.y)
    {
      return point
    } else {
      return self
    }
  }
}

func solution(_ dirs:String) -> Int {
  var pos = Point(x: 0, y: 0)
  var visited = Set<[Point]>()
  
  for dir in dirs {
    let next = pos.move(dir: dir)
    
    if pos == next { continue }
    
    visited.insert([pos, next])
    visited.insert([next, pos])
    pos = next
  }
  
  return visited.count / 2
}