import Foundation

let nmk = readLine()!.split(separator: " ").map {Int($0)!}
var (n, m, k) = (nmk[0], nmk[1], nmk[2])

while k > 0 {
  if n >= m * 2 {
    n -= 1
  }
  else if n < m * 2 {
    m -= 1
  }
  
  k -= 1
}

print(min(n/2, m))
