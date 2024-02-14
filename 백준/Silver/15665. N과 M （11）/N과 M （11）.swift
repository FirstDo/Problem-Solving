// 순열
func permutation(arr: [Int], r: Int) -> [[Int]] {
  var result = [[Int]]()
  var previous: [Int]?
  cycle([])
  
  func cycle(_ temp: [Int]) {
    if previous == temp { return }
    
    if temp.count == r {
      result.append(temp)
      previous = temp
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
let arr = Set(readLine()!.split(separator: " ").map { Int($0)! }).sorted()

let results = permutation(arr: arr, r: m)
print(results.map { $0.map { String($0) }.joined(separator: " ")}.joined(separator: "\n"))
