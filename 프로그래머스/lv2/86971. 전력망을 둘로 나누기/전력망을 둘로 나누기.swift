import Foundation

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

var tree: [[Int]]!
var len: Int!
var visit: [Bool]!

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    // 전역변수 초기화
    tree = Array(repeating: [Int](), count: n)
    len = n
    visit = Array(repeating: false, count: n)
    
    var result = Int.max
    
    for wire in wires {
        tree[wire[0] - 1].append(wire[1] - 1)
        tree[wire[1] - 1].append(wire[0] - 1)
    }
    
    for target in wires {
        tree[target[0] - 1].removeAll { $0 == (target[1] - 1) }
        tree[target[1] - 1].removeAll { $0 == (target[0] - 1) }
        
        visit = Array(repeating: false, count: n)
        
        var diffs = [Int]()
        
        for i in 0..<n {
            if visit[i] == false {
                diffs.append(bfs(i))
            }
        }
        
        result = min(result, abs(diffs[0] - diffs[1]))
        
        tree[target[0] - 1].append(target[1] - 1)
        tree[target[1] - 1].append(target[0] - 1)
    }
    
    return result
}

func bfs(_ start: Int) -> Int {
    var totalLength = 1
    
    visit[start] = true
    let queue = Queue<Int>()
    queue.enqueue(start)
    
    while !queue.isEmpty {
        let cur = queue.dequeue()!
        
        for next in tree[cur] {
            if visit[next] == false {
                totalLength += 1
                visit[next] = true
                queue.enqueue(next)
            }
        }
    }
    
    return totalLength
}