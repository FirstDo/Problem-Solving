func solution() -> Int {
  let limit = 10_000_000
  let n = Int(readLine()!)!
  let m = Int(readLine()!)!
  
  var state = Array(repeating: 0, count: limit + 1)
  
  let numbers = readLine()!.split(separator: " ").map {Int($0)!}
  numbers.forEach { state[$0] += 1 }
  
  var cnt = 0
  
  for number in numbers {
    let number2 = m - number
    
    if number * 2 == m || number2 <= 0 { continue }
    
    if state[number] > 0 && state[number2] > 0 {
      state[number] -= 1
      state[number2] -= 1
      cnt += 1
    }
  }

  return cnt
}

let result = solution()
print(result)
