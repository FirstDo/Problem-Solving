func solution() -> String {
  let nm = readLine()!.split(separator: " ").map { Int($0)! }
  let (n, m) = (nm[0], nm[1])
  
  let numbers = readLine()!.split(separator: " ").map { Int($0)! }
  
  // 누적합 구하기
  var sum = [0] + numbers
  
  for i in 1...n {
    sum[i] += sum[i-1]
  }
  
  var ans = [Int]()
  
  for _ in 0..<m {
    let ij = readLine()!.split(separator: " ").map { Int($0)! }
    let (i, j) = (ij[0], ij[1])
    
    ans.append(sum[j] - sum[i-1])
  }
  
  return ans.map { String($0) }.joined(separator: "\n")
}

let result = solution()
print(result)
