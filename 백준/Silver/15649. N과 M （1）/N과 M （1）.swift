import Foundation

// 순열
func permutation(arr: [Int], r: Int) -> [[Int]] {
  var result = [[Int]]()
  var visit = Array(repeating: false, count: arr.count)
  cycle([])
  
  func cycle(_ temp: [Int]) {
    if temp.count == r {
      result.append(temp)
      return
    }
    
    for i in 0..<arr.count {
      if visit[i] { continue }
      
      visit[i] = true
      cycle(temp + [arr[i]])
      visit[i] = false
    }
  }
  
  return result
}

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,m) = (nm[0], nm[1])

let results = permutation(arr: (1...n).map {Int($0)}, r: m)
for result in results {
  print(result.map { String($0) }.joined(separator: " "))
}
