import Foundation

let (n, m) = (Int(readLine()!)!, Int(readLine()!)!)

let brokens: [Int]

if m == 0 {
  brokens = []
} else {
  brokens = readLine()!.split(separator: " ").map { Int($0)! }
}

var answer = abs(n - 100)

for i in 0...1_000_000 {
  let cnt = moveTo(channel: i)
  
  if cnt != -1 {
    answer = min(answer, abs(n-i) + cnt)
  }
  
  if answer == 0 { break }
}

// 특정 채널로 이동
func moveTo(channel: Int) -> Int {
  let arr = Array(String(channel)).map { Int(String($0))! }
  var cnt = 0
  
  for num in arr {
    if brokens.contains(num) { return -1}
    cnt += 1
  }
  
  return cnt
}

print(answer)
