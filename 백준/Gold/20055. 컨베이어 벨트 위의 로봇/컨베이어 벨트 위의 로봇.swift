import Foundation

struct Belt {
  var up: [Int] // 내구도
  var down: [Int]
  
  var robots: [Bool] // 로봇여부
  
  init(arr: [Int]) {
    let len = arr.count / 2
    self.up = Array(arr[0..<len])
    self.down = Array(arr[len...].reversed())
    
    self.robots = Array(repeating: false, count: len)
  }
  
  var numberOfZero: Int {
    (up + down).filter { $0 == 0 }.count
  }
  
  mutating func rotate() {
    robots.insert(false, at: 0)
    robots.removeLast()
    
    let upTarget = up.removeLast()
    down.append(upTarget)
    
    let downTarget = down.removeFirst()
    up.insert(downTarget, at: 0)
    
    // 로봇이 내리는 위치에 있으면 바로 내림
    if robots.last == true {
      robots[robots.count - 1] = false
    }
  }
  
  mutating func moveRobot() {
    for index in stride(from: robots.count - 2, through: 0, by: -1) {
      // 현재칸에 로봇이 있고, 다음칸에 로봇이 없고, 다음칸에 내구도가 있을경우 이동
      if robots[index] && robots[index+1] == false && up[index+1] > 0 {
        robots[index] = false
        robots[index+1] = true
        up[index+1] -= 1
      }
    }
  }
  
  mutating func appendRobot() {
    if up[0] > 0 {
      robots[0] = true
      up[0] -= 1
    }
  }
}

let nk = readLine()!.split(separator: " ").map {Int($0)!}
let (n, k) = (nk[0], nk[1])

let arr = readLine()!.split(separator: " ").map {Int($0)!}

var belts = Belt(arr: arr)

var level = 1

while true {
  belts.rotate()
  belts.moveRobot()
  belts.appendRobot()
  
  if belts.numberOfZero >= k { break }
  level += 1
}

print(level)
