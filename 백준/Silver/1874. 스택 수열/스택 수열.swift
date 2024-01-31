import Foundation

let n = Int(readLine()!)!
var target = [Int]()

for _ in 0..<n {
  let line = Int(readLine()!)!
  target.append(line)
}

print(makeSequence())

func makeSequence() -> String {
  var temp = [String]()
  var stack = [Int]()

  // 1부터 n까지 반복
  for i in 1...n {
    // 무조건 push
    stack.append(i)
    temp.append("+")

    // stack의 top이 target이면 pop
    while stack.last == target.first && !stack.isEmpty {
      _ = stack.removeLast()
      _ = target.removeFirst()

      temp.append("-")
    }
  }


  if stack.isEmpty && target.isEmpty {
    return temp.joined(separator: "\n")
  } else {
    return "NO"
  }
}