import Foundation

func solution() -> String {
  let n = Int(readLine()!)!
  let numbers = Set(readLine()!.split(separator: " ").map {Int($0)!})
  let m = Int(readLine()!)!
  
  var ans = [Int]()
  
  for num in readLine()!.split(separator: " ").map({ Int($0)! }) {
    if numbers.contains(num) {
      ans.append(1)
    } else {
      ans.append(0)
    }
  }
  
  return ans.map { String($0) }.joined(separator: "\n")
}

print(solution())
