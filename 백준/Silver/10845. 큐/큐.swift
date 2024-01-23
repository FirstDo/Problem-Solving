struct Queue<T> {
    private var leftStack: [T] = []
    private var rightStack: [T] = []
    
    public init() {}
    public var isEmpty: Int {
        if leftStack.isEmpty && rightStack.isEmpty {
            return 1
        } else {
            return 0
        }
    }
    public var front: T? {
        return leftStack.isEmpty ? rightStack.first : leftStack.last
    }
    public var rear: T? {
        return rightStack.isEmpty ? leftStack.first : rightStack.last
    }
    
    public var size: Int {
        return leftStack.count + rightStack.count
    }
    
    public mutating func enqueue(_ element: T) {
        rightStack.append(element)
    }
    
    public mutating func dequeue() -> T? {
        if leftStack.isEmpty {
            leftStack = rightStack.reversed()
            rightStack.removeAll()
        }
        return leftStack.popLast()
    }

}


let n: Int = Int(readLine()!)!
var queue: Queue<Int> = Queue<Int>()

for _ in 0..<n {
    let inputs = readLine()!.split(separator: " ")
    let cmd = inputs[0]
    switch cmd {
    case "push":
        queue.enqueue(Int(inputs[1])!)
    case "pop":
        if let num = queue.dequeue() {
            print(num)
        } else {
            print(-1)
        }
    case "size":
        print(queue.size)
    case "empty":
        print(queue.isEmpty)
    case "front":
        if let num = queue.front {
            print(num)
        } else {
            print(-1)
        }
    case "back":
        if let num = queue.rear {
            print(num)
        } else {
            print(-1)
        }
    default:
        break
    }
}
