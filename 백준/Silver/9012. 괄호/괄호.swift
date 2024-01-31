import Foundation

let n = Int(readLine()!)!

for _ in 0..<n {
  let line = readLine()!

  if isCorrectParenthesis(line) {
    print("YES")
  } else {
    print("NO")
  }
}

func isCorrectParenthesis(_ input: String) -> Bool {
  let array = Array(input)

  var stack = [Character]()

  for ch in array {
    // ( 이면 스택에 push
    if ch == "(" {
      stack.append(ch)
    } 
    // ) 이면 -> 스택비어있으면 에러, 스택의 top에 (없으면 에러, 문제없으면 pop
    else {
      if stack.last != "(" { return false }
      _ = stack.removeLast()
    }
  }

  return stack.isEmpty
}