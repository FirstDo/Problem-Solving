import Foundation

let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map {Int($0)!}.sorted()

var target = 0

for num in numbers {
  if target + 1 < num {
    break
  }
  
  target += num
}

print(target + 1)