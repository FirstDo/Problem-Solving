import Foundation

let t = Int(readLine()!)!

func calculate(m: Int, n: Int, x: Int, y: Int) -> Int {
  var count = 1
  var (x, y) = (x-1, y-1)
  
  for k in stride(from: x, to: n*m, by: m) {
    if k % n == y {
      return k+1
    }
  }
  
  return -1
}

for _ in 0..<t {
  let mnxy = readLine()!.split(separator: " ").map {Int($0)!}
  let (m,n,x,y) = (mnxy[0], mnxy[1], mnxy[2], mnxy[3])
  print(calculate(m: m, n: n, x: x, y: y))
}