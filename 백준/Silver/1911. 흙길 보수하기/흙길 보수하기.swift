// 1911번 흙길 보수하기

import Foundation

let t = readLine()!.components(separatedBy: " ").map { Int($0)! }
let (n,l) = (t[0], t[1])

var waters: [(start: Int, low: Int)] = []

for _ in 0..<n {
  let t = readLine()!.components(separatedBy: " ").map { Int($0)! }
  waters.append((t[0], t[1]))
}

waters.sort { $0.start < $1.start }

var result = 0
var index = 0

for (start, end) in waters {
  if index >= end { continue }
  
  index = max(index, start)
  
  var cnt: Int
  
  if (end - index) % l == 0 {
    cnt = (end - index) / l
  } else {
    cnt = (end - index) / l + 1
  }
  
  result += cnt
  index += l * cnt
}

print(result)
