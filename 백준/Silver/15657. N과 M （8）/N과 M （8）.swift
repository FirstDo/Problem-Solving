// 순열
func permutation(arr: [Int], r: Int) -> [[Int]] {
  var result = [[Int]]()
  cycle([])
  func cycle(_ temp: [Int]) {
    if temp.count == r {
      result.append(temp)
      return
    }
    
    for num in arr {
      if (temp.last ?? 0) <= num {
        cycle(temp + [num])
      }
    }
  }
  
  return result
}

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,m) = (nm[0], nm[1])
let arr = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

let results = permutation(arr: arr, r: m)
print(results.map { $0.map { String($0) }.joined(separator: " ")}.joined(separator: "\n"))