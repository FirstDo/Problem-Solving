import Foundation

final class Queue<T> {
    var input = [T]()
    var output = [T]()
    
    var front: T {
        if output.isEmpty {
            output = input.reversed()
            input.removeAll()
        }
        
        return output.last!
    }
    
    var isEmpty: Bool {
        return input.isEmpty && output.isEmpty
    }
    
    func enqueue(_ element: T) {
        input.append(element)
    }
    
    @discardableResult
    func dequeue() -> T {
        if output.isEmpty {
            output = input.reversed()
            input.removeAll()
        }
        
        return output.removeLast()
    }
}

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    let queue = Queue<(Int,Int)>()
    zip(progresses, speeds).forEach { queue.enqueue(($0.0, $0.1)) }

    
    var result = [Int]()
    var day = 0
    
    while !queue.isEmpty {
        var doneTask = 0
        day += 1
        
        while !queue.isEmpty {
            let (progress, speed) =  queue.front
            
            if progress + speed * day >= 100 {
                queue.dequeue()
                doneTask += 1
            } else {
                break
            }
        }
        
        if doneTask != 0 {
            result.append(doneTask)
        }
    }
    
    return result
}