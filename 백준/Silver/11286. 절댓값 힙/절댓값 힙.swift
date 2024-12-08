import Foundation

class Heap<T> {
  private var nodes: [T] = []
  private let compare: (T, T) -> Bool
  
  init(sort: @escaping (T, T) -> Bool) {
    self.compare = sort
  }
  
  var isEmpty: Bool {
    nodes.isEmpty
  }
  
  func insert(_ element: T) {
    // 맨끝에 새로운 노드를 추가
    var index = nodes.count
    nodes.append(element)
    
    // 부모와 비교하면서, 정렬기준에 맞다면 부모랑 바꿔주기
    while index > 0, compare(nodes[index], nodes[(index-1)/2]) {
      nodes.swapAt(index, (index-1)/2)
      index = (index-1)/2
    }
  }
  
  func delete() -> T? {
    if nodes.isEmpty { return nil } // 힙이 비어있다면 nil
    if nodes.count == 1 { return nodes.removeLast() } // 힙에 원소가 하나라면 그 원소 return
    
    let target = nodes.first // return 할 값
    nodes.swapAt(0, nodes.count - 1) // 가장 밑바닥에 있던 원소를 탑으로 가져오기
    _ = nodes.popLast()
    
    var index = 0
    let limit = nodes.count
    
    while index < limit {
      // 노드의 왼쪽 오른쪽 자식들중, 범위내이고 정렬기준에 맞는 자식중, 더 적합한 자식 찾기
      let (lChild, rChild) = (index * 2 + 1, index * 2 + 1 + 1)
      
      let child = [lChild, rChild]
        .filter { $0 < limit && compare(nodes[$0], nodes[index])}
        .sorted { compare(nodes[$0], nodes[$1]) }
        .first
      
      if let child = child {
        nodes.swapAt(index, child)
        index = child
      } else {
        break
      }
    }
    
    return target
  }
}

func solution() -> String {
  let n = Int(readLine()!)!
  let cmds = (0..<n).map { _ in Int(readLine()!)! }
  
  var result = [Int]()
  
  let heap = Heap<Int>(sort: {
    abs($0) == abs($1) ? $0 < $1 : abs($0) < abs($1)
  })
  
  for cmd in cmds {
    if cmd == 0 {
      let num = heap.delete()
      result.append(num ?? 0)
    } else {
      heap.insert(cmd)
    }
  }
  
  return result.map { String($0) }.joined(separator: "\n")
}

let result = solution()
print(result)