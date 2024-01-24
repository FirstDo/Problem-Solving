import Foundation

var n = Int(readLine()!)!
var result = 1

while n >= 1 {
  result *= n
  n -= 1
}

print(result)
