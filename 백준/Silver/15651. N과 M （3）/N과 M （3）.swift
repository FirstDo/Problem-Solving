import Foundation

// 순열
func permutation(arr: [String], r: Int) -> String {
  var result = ""
  cycle([])
  func cycle(_ temp: [String]) {
    if temp.count == r {
      result.append(temp.joined(separator: " ") + "\n")
      return
    }
    
    for i in 0..<arr.count {
      cycle(temp + [arr[i]])
    }
  }
  
  return result
}

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,m) = (nm[0], nm[1])

let results = permutation(arr: (1...n).map {String($0)}, r: m)
print(results.dropLast())
