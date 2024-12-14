import Foundation

func solution() -> String {
  let n = Int(readLine()!)!
  
  var arr = Array(repeating: 0, count: 10_000 + 1)
  var ans = ""
  
  for _ in 0..<n {
    arr[Int(readLine()!)!] += 1
  }
  
  for i in 0...10_000 {
    ans += String(repeating: "\(i)\n", count: arr[i])
  }
  
  return ans
}

let result = solution()
print(result)
