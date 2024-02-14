// 조합
func combination(arr: [Int], r: Int) -> [[Int]] {
  var result = [[Int]]()
  cycle([], index: 0)
  
  func cycle(_ temp: [Int], index: Int) {
    if temp.count == r {
      result.append(temp)
      return
    }
    
    for i in index..<arr.count {
      cycle(temp + [arr[i]], index: i+1)
    }
  }
  
  return result
}

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,m) = (nm[0], nm[1])
let arr = readLine()!.split(separator: " ").map {Int(String($0))!}.sorted()

let results = combination(arr: arr, r: m)
print(results.map { $0.map{String($0)}.joined(separator: " ")}.joined(separator: "\n"))
