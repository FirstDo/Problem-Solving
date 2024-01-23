struct Stack<T> {
    private var stack: [T] = [T]()
    init() {}
    var size: Int {
        return stack.count
    }
    var top: T? {
        return stack.last
    }
    var isEmpty: Int {
        return stack.isEmpty ? 1: 0
    }
    mutating func push(_ element: T) {
        stack.append(element)
    }
    mutating func pop() -> T? {
        return stack.popLast()
    }
    
    
}
let n: Int = Int(readLine()!)!
var stack: Stack<Int> = Stack<Int>()

for _ in 0..<n {
    let inputs = readLine()!.split(separator: " ")
    let cmd = inputs[0]
    switch cmd {
    case "push":
        stack.push(Int(inputs[1])!)
    case "pop":
        if let num = stack.pop() {
            print(num)
        } else {
            print(-1)
        }
    case "size":
        print(stack.size)
    case "empty":
        print(stack.isEmpty)
    case "top":
        if let num = stack.top {
            print(num)
        } else {
            print(-1)
        }
    default:
        break
    }
}
