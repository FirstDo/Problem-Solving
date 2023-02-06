import Foundation

final class Queue<Element> {
    private var input = [Element]()
    private var output = [Element]()
    
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


func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    
    var time = 0
    var result = [Int]()
    
    let queue = Queue<(Int, Int)>()
    
    zip(progresses, speeds).forEach {
        queue.enQueue(($0, $1))
    }
    
    while !queue.isEmpty {
        var taskCount = 0
        time += 1
        
        let (progress, speed) = queue.front
            
        if progress + speed * time >= 100 {
            _ = queue.deQueue()!
            taskCount += 1
            
            while !queue.isEmpty {
                let (nextProgress, nextSpeed) = queue.front
                
                if nextProgress + nextSpeed * time >= 100 {
                    _ = queue.deQueue()!
                    taskCount += 1
                } else {
                    break
                }
            }
            
            result.append(taskCount)
        }
    }
    
    return result
}