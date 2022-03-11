struct Heap<T: Comparable> {
    var nodes: [T] = []
    private let sort: (T,T) -> Bool
    
    init(sort: @escaping (T,T) -> Bool) {
        self.sort = sort
    }
    
    var isEmpty: Bool {
        return nodes.isEmpty
    }
    
    private func leftChild(_ parent: Int) -> Int {
        return parent * 2 + 1
    }
    private func parent(_ child: Int) -> Int {
        return (child-1) / 2
    }
    
    mutating func insert(_ element: T) {
        var index = nodes.count
        nodes.append(element)
        
        while index > 0, sort(nodes[index], nodes[parent(index)]) {
            nodes.swapAt(index, parent(index))
            index = parent(index)
        }
    }
    
    mutating func delete() -> T? {
        //1. 첫번째 원소 삭제
        if nodes.count == 1 {
            return nodes.removeLast()
        }
        
        let result = nodes.first
        nodes.swapAt(0, nodes.count - 1)
        _ = nodes.popLast()
        
        var index = 0
        
        while index < nodes.count {
            let left = leftChild(index)
            let right = left + 1

			let twoChild = [left,right].filter{$0 < nodes.count && sort(nodes[$0], nodes[index])}.sorted{ sort(nodes[$0], nodes[$1])}


			if twoChild.isEmpty {
				break
			} else {
				nodes.swapAt(index, twoChild[0])
				index = twoChild.first!
			}
            
        }
        return result
    }
}
var ans = ""

var heap = Heap<Int>(sort: >)
let t = Int(readLine()!)!
for _ in 0..<t {
    let n = Int(readLine()!)!
    if n == 0 {
        if heap.isEmpty {
            ans += "0\n"
        } else {
            ans += "\(heap.delete()!)\n"
        }
    } else {
        heap.insert(n)
    }
}
print(ans.dropLast())