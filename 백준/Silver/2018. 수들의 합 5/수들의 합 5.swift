func solution() -> Int {
  let n = Int(readLine()!)!
  var cnt = 0
  
  var (i, j, sum) = (1, 1, 1)
  
  while i <= j {
    if sum == n {
      cnt += 1
      sum -= i
      i += 1
      j += 1
      sum += j
    } else if sum < n {
      j += 1
      sum += j
    } else if sum > n {
      sum -= i
      i += 1
    }
  }
  
  return cnt
}

let result = solution()
print(result)
