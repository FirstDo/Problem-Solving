func solution() -> Int {
  let n = Int(readLine()!)!
  let numbers = readLine()!.split(separator: " ").map {Int($0)!}.sorted()
  
  var result = 0
  
  for i in 0..<n {
    let target = numbers[i]
    var (l, r) = (0, n-1)
    
    while l < r {
      let sum = numbers[l] + numbers[r]
      
      if sum > target {
        r -= 1
      } else if sum < target {
        l += 1
      } else {
        if l == i {
          l += 1
        } else if r == i {
          r -= 1
        } else {
          result += 1
          break
        }
      }
    }
  }
  
  return result
}

let result = solution()
print(result)