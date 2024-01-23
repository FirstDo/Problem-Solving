import Foundation

let line = readLine()!.components(separatedBy: " ").map { Int($0)! }
let (n, k) = (line[0], line[1])

let queue = Queue<Int>()
(1...n).forEach { queue.enqueue($0) }

var result = [Int]()
var index = 1

while !queue.isEmpty {
  let num = queue.dequeue()!
  
  // k번째 사람이면 제거
  if index % k == 0 {
    result.append(num)
  } else {
    queue.enqueue(num)
  }
  
  index += 1
}

print("<" + result.map { String($0) }.joined(separator: ", ") + ">")

final class Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    var isEmpty: Bool {
        return input.isEmpty && output.isEmpty
    }
    
    var peek: T? {
        if output.isEmpty {
            output = input.reversed()
            input.removeAll()
        }
        
        return output.last
    }
    
    func enqueue(_ element: T) {
        input.append(element)
    }
    
    @discardableResult
    func dequeue() -> T? {
        if output.isEmpty {
            output = input.reversed()
            input.removeAll()
        }
        
        return output.popLast()
    }
}
