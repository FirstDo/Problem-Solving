func permutation(arr: [Int], r: Int) -> String {
  var result = ""
  cycle([])
  
  func cycle(_ temp: [String]) {
    if temp.count == r {
      result += temp.joined(separator: " ") + "\n"
      return
    }
    
    for num in arr {
      cycle(temp + ["\(num)"])
    }
  }
  
  return result
}

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n,m) = (nm[0], nm[1])
let arr = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

let results = permutation(arr: arr, r: m)
print(results)