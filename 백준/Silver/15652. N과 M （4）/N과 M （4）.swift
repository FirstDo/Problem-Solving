import Foundation

// 순열
func permutation(arr: [Int], r: Int) -> [[Int]] {
  var result = [[Int]]()
  cycle([])
  func cycle(_ temp: [Int]) {
    if temp.count == r {
      result.append(temp)
      return
    }
    
    for i in 0..<arr.count {
      if (temp.last ?? 0) <= arr[i] {
        cycle(temp + [arr[i]])
      }
    }
  }
  
  return result
}

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,m) = (nm[0], nm[1])

let results = permutation(arr: (1...n).map {Int($0)}, r: m)
print(results.map { $0.map{String($0)}.joined(separator: " ")}.joined(separator: "\n"))
