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
    
    var previousNum = 0
    
    for i in 0..<arr.count {
      if visit[i] || previousNum == arr[i] {
        continue
      }
      
      previousNum = arr[i]
      visit[i] = true
      cycle(temp + [arr[i]])
      visit[i] = false
    }
  }
  
  return result
}

// 조합
func combination(arr: [Int], r: Int) -> [[Int]] {
  var result = [[Int]]()
  cycle([], index: 0)
  
  func cycle(_ temp: [Int], index: Int) {
    if temp.count == r {
      result.append(temp)
      return
    }
    
    var previousNum = 0
    
    for i in index..<arr.count {
      if previousNum == arr[i] { continue }
      
      previousNum = arr[i]
      cycle(temp + [arr[i]], index: i+1)
    }
  }
  
  return result
}

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,m) = (nm[0], nm[1])
let arr = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

let results = combination(arr: arr, r: m)
print(results.map { $0.map { String($0) }.joined(separator: " ")}.joined(separator: "\n"))
