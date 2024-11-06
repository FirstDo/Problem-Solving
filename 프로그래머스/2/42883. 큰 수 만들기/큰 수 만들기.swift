import Foundation

func solution(_ number:String, _ k:Int) -> String {
  var numbers = Array(number.map { Int(String($0))! }.reversed())
  var k = k
  var stack = [Int]()
  
  while numbers.isEmpty == false {
    let num = numbers.removeLast()
    
    while stack.isEmpty == false, stack.last! < num, k > 0 {
      stack.removeLast()
      k -= 1
    }
    
    stack.append(num)
  }
  
  let lastIndex = stack.count - k
  return stack[0..<lastIndex].map { String($0) }.joined()
}