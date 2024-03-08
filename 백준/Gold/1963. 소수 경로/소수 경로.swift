import Foundation

// 소수구하기
func primes() -> [Bool] {
  let limit = 10000
  var temps = Array(repeating: true, count: limit)
  
  temps[0] = false
  temps[1] = false
  
  for i in 2 ..< Int(sqrt(Double(limit))) + 1 {
    var j = 2
    
    while i * j < limit {
      temps[i * j] = false
      j += 1
    }
  }
  
  return temps
}

let prime = primes()

for _ in 0..<Int(readLine()!)! {
  let nums = readLine()!.split(separator: " ").map { Int($0)! }
  
  bfs(nums[0], nums[1])
}

func bfs(_ start: Int, _ end: Int) {
  var visit = Array(repeating: false, count: 10000)
  visit[start] = true
  
  var queue = [(start, 0)]
  var index = 0
  
  while queue.count > index {
    let (x, cnt) = queue[index]
    index += 1
    
    if x == end {
      print(cnt)
      return
    }
    
    for i in 1...9 {
      let nx = i * 1000 + x % 1000
      if !visit[nx] && prime[nx] {
        visit[nx] = true
        queue.append((nx,cnt+1))
      }
    }
    
    for i in 0...9 {
      let nx = i * 100 + x % 100 + x / 1000 * 1000
      if !visit[nx] && prime[nx] {
        visit[nx] = true
        queue.append((nx,cnt+1))
      }
    }
    
    for i in 0...9 {
      let nx = i * 10 + x/100 * 100 + x%10
      if !visit[nx] && prime[nx] {
        visit[nx] = true
        queue.append((nx,cnt+1))
      }
    }
    
    for i in 0...9 {
      let nx = i + x / 10 * 10
      if !visit[nx] && prime[nx] {
        visit[nx] = true
        queue.append((nx,cnt+1))
      }
    }
  }
  
  print("Impossible")
}
