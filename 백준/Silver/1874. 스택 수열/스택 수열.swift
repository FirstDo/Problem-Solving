func solution() -> String {
  let n = Int(readLine()!)!
  let numbers = (0..<n).map { _ in Int(readLine()!)! }
  
  var remainNumbers = Array((1...n).reversed())
  
  var stack = [Int]()
  var ans = [String]()
  
//  print("numbers: \(numbers)")
  
  for number in numbers {
    if stack.isEmpty {
      let num = remainNumbers.removeLast()
      stack.append(num)
      ans.append("+")
    }

//    print("num: \(number)")
//    print("stack: \(stack)")
    
    while true {
      if stack.last! < number {
        stack.append(remainNumbers.removeLast())
        ans.append("+")
      } else if stack.last! > number {
        return "NO"
      } else {
        stack.removeLast()
        ans.append("-")
        break
      }
    }
  }
  
  return ans.joined(separator: "\n")
}

let result = solution()
print(result)
