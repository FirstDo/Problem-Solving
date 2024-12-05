func combination(n: Int) -> Int {
  if n < 2 { return 0 }
  return n * (n-1) / 2
}

func solution() -> Int {
  let nm = readLine()!.split(separator: " ").map { Int($0)! }
  let (n,m) = (nm[0], nm[1])
  
  let a = readLine()!.split(separator: " ").map { Int($0)! }
  var sumA = a // 누적합
  var modA = Array(repeating: 0, count: n) // sumA[i] % M 배열
  var cnt = 0
  
  for i in 0..<n {
    if i != 0 {
      sumA[i] += sumA[i-1]
    }
    
    modA[i] = sumA[i] % m
  }
  
  var modCountArr = Array(repeating: 0, count: m)
  
  for mod in modA {
    if mod == 0 { cnt += 1 }
    modCountArr[mod] += 1
  }
  
  return cnt + modCountArr.map(combination).reduce(0, +)
}

let result = solution()
print(result)
