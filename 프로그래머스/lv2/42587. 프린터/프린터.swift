import Foundation

final class Queue<T> {
    var input = [T]()
    var output = [T]()
    
    var count: Int {
        return input.count + output.count
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

func solution(_ priorities:[Int], _ location:Int) -> Int {
    // key: 작업 우선순위, value: 해당 작업보다 우선순위가 높은 작업의 개수
    var dict = [Int:Int]()
    
    Set(priorities).forEach { num in
        dict[num] = priorities.filter { $0 > num }.count
    }
    
    var index = location
    var cnt = 0
    
    let queue = Queue<Int>()
    priorities.forEach { queue.enqueue($0) }
    
    while !queue.isEmpty {
        let now = queue.dequeue()
        
        // 더 중요한게 없다면 인쇄!
        if dict[now] == 0 {
            cnt += 1
            // 작업 하나가 빠졌으므로, 딕셔너리 - 1 해주기
            for key in dict.keys where key < now {
                dict[key]! -= 1
            }
            
            // 현재 인쇄한 작업이 타겟이라면..
            if index == 0 {
                return cnt
            }
        }
        // 더 중요한게 남아 있다면 queue의 맨끝에 다시 넣어주기
        else {
            queue.enqueue(now)
        }
        
        index = ((index - 1) + queue.count) % queue.count
    }
    
    return 0
}