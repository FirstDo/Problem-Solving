import Foundation

final class Queue<Element> {
    var input = [Element]()
    var output = [Element]()
    
    var isEmpty: Bool {
        input.isEmpty && output.isEmpty
    }
    
    var front: Element {
        if output.isEmpty {
            output = input.reversed()
            input.removeAll()
        }
        
        return output.last!
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


func solution(_ priorities:[Int], _ location:Int) -> Int {
    var number = 0
    let queue = Queue<(id: Int, priority: Int)>()
    
    priorities.enumerated().forEach { queue.enQueue(($0.offset, $0.element)) }
    
    while !queue.isEmpty {
        let cur = queue.deQueue()!
        
        if (queue.input + queue.output).contains(where: { $0.priority > cur.priority }) {
            queue.enQueue(cur)
        } else {
            number += 1
            if cur.id == location { break }
        }
    }
    
    return number
}