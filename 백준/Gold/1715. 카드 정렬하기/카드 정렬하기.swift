struct Heap<Element: Comparable> {
    //sort에 <,> 비교연산을 넣기위해 Comparable protocol을 채택
    private var elements: [Element] = []
    private let sort: (Element, Element) -> Bool
    
    init(sort: @escaping (Element, Element) -> Bool, elements: [Element] = []){
        self.sort = sort
        self.elements = elements
        if !elements.isEmpty {
            for i in stride(from: elements.count / 2 - 1, through: 0, by: -1) {
                siftDown(from: i)
            }
        }
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    var count: Int {
        return elements.count
    }
    func peek() -> Element? {
        return elements.first
    }
    func leftChildIndex(ofParentAt index: Int) -> Int {
        return 2*index + 1
    }
    func rightChildIndex(ofParentAt index: Int) -> Int {
        return 2*index + 2
    }
    func parentIndex(ofChildAt index: Int) -> Int {
        return (index - 1 ) / 2
    }
    mutating func remove() -> Element? {
        guard !isEmpty else {
            return nil
        }
        elements.swapAt(0, count - 1)
        defer {
            siftDown(from: 0)
        }
        return elements.removeLast()
    }
    
    mutating func siftDown(from index: Int) {
        var parent = index
        while true {
            let left = leftChildIndex(ofParentAt: parent)
            let right = rightChildIndex(ofParentAt: parent)
            
            var candidate = parent
            if left < count, sort(elements[left], elements[candidate]) {
                candidate = left
            }
            if right < count, sort(elements[right], elements[candidate]) {
                candidate = right
            }
            if candidate == parent {
                return
            }
            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }
    mutating func insert(_ element: Element){
        elements.append(element)
        siftUp(from: elements.count - 1)
    }
    
    mutating func siftUp(from index: Int) {
        var child = index
        while true {
            let parent = parentIndex(ofChildAt: child)
            if child > 0 && sort(elements[child], elements[parent]) {
                elements.swapAt(child,parent)
                child = parent
            } else {
                return
            }
        }
    }
    
    mutating func remove(at index: Int) -> Element? {
        guard index < elements.count else {
            return nil
        }
        
        if index == elements.count - 1 {
            return elements.removeLast()
        } else {
            elements.swapAt(index, elements.count - 1)
            siftDown(from: index)
            siftUp(from: index)
        }
        return elements.removeLast()
    }
    
    func index(of element: Element, startingAt i:Int) -> Int? {
        if i >= count {
            return nil
        }
        if sort(element, elements[i]) {
            return nil
        }
        if element == elements[i] {
            return i
        }
        if let j = index(of: element, startingAt: leftChildIndex(ofParentAt: i)) {
            return j
        }
        if let j = index(of: element, startingAt: rightChildIndex(ofParentAt: i)){
            return j
        }
        return nil
    }
}

let n: Int = Int(readLine()!)!
var arr: [Int] = []
for _ in 0..<n {
    arr.append(Int(readLine()!)!)
}

if n == 1 {
    print(0)
} else {
    var heap: Heap<Int> = Heap<Int>(sort: <,elements: arr)
    var sum: Int = 0
    while true {
        if let a = heap.remove(), let b = heap.remove() {
            let num = a + b
            sum += num
            if heap.isEmpty {
                break
            }
            heap.insert(num)
        } else {
            break
        }
    }
    print(sum)
}



