final class Queue<Element> {
    private var input = [Element]()
    private var output = [Element]()
    
    var isEmpty: Bool {
        input.isEmpty && output.isEmpty
    }
    
    func enQueue(_ element: Element) {
        input.append(element)
    }
    
    func deQueue() -> Element? {
        if output.isEmpty {
            output = input.reversed()
            input.removeAll()
        }
        
        return output.popLast()
    }
}

func bfs(x: Int, y: Int, n: Int) -> Int{
    var queue = Queue<(num: Int, cnt: Int)>()
    queue.enQueue((y, 0))
    
    while !queue.isEmpty {
        let (num ,cnt) = queue.deQueue()!
        
        if num == x { return cnt }
        
        if num.isMultiple(of: 2) && num / 2 >= x {
            queue.enQueue((num / 2, cnt + 1))
        }
        
        if num.isMultiple(of: 3) && num / 3 >= x {
            queue.enQueue((num / 3, cnt + 1))
        }
        
        if num - n >= x {
            queue.enQueue((num - n, cnt + 1))
        }
    }
    
    return -1
}

func solution(_ x:Int, _ y:Int, _ n:Int) -> Int {
    return bfs(x: x, y: y, n: n)
}