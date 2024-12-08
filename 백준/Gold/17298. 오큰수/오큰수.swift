func solution() -> String {
  let n = Int(readLine()!)!
  let numbers = readLine()!.split(separator: " ").map {Int($0)!}
  
  var stack = [(idx: Int, num: Int)]()
  var ngeArr = Array(repeating: -1, count: n)
  
  for (index, number) in numbers.enumerated() {
    if stack.isEmpty {
      stack.append((index, number))
      continue
    }
    
    while true {
      if stack.isEmpty == false, stack.last!.num < number {
        let target = stack.removeLast()
        ngeArr[target.idx] = number
      } else {
        stack.append((index, number))
        break
      }
    }
  }
  
  return ngeArr.map { String($0) }.joined(separator: " ")
}

let result = solution()
print(result)
