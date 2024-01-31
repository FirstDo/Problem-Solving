import Foundation

let n = Int(readLine()!)!

for _ in 0..<n {
  let words = readLine()!.components(separatedBy: " ")
  print(words.map { String($0.reversed()) }.joined(separator: " "))
}