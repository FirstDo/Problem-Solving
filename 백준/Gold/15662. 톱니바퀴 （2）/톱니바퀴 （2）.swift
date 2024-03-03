import Foundation

struct Gear {
  var elements: [Int]
  
  // 2, 6
  mutating func rotate(dir: Int) {
    if dir == 1 {
      rotateRight()
    } else {
      rotateLeft()
    }
  }
  
  // 반시계방향, <-
  mutating private func rotateLeft() {
    let target = elements.removeFirst()
    elements.append(target)
  }
  
  // 시계방향, ->
  mutating private func rotateRight() {
    let target = elements.removeLast()
    elements.insert(target, at: 0)
  }
}

var gears = [Gear]()

let t = Int(readLine()!)!

for _ in 0..<t {
  let input = Array(readLine()!).map {Int(String($0))!}
  gears.append(.init(elements: input))
}

let k = Int(readLine()!)!

for _ in 0..<k {
  let input = readLine()!.split(separator: " ").map {Int($0)!}
  let (num, dir) = (input[0] - 1, input[1])
  
  var rotate = [Bool]()
  
  for i in 0..<gears.count - 1 {
    if gears[i].elements[2] != gears[i+1].elements[6] {
      rotate.append(true)
    } else {
      rotate.append(false)
    }
  }
  
  gears[num].rotate(dir: dir)
  
  var currentDir = dir
  
  for i in stride(from: num-1, through: 0, by: -1) {
    if rotate[i] == false {
      break
    }
    
    currentDir *= -1
    gears[i].rotate(dir: currentDir)
  }
  
  currentDir = dir
  
  for i in num+1..<t {
    if rotate[i-1] == false {
      break
    }
    
    currentDir *= -1
    gears[i].rotate(dir: currentDir)
  }
}

let res = gears.reduce(0) { $0 + $1.elements[0] }
print(res)
