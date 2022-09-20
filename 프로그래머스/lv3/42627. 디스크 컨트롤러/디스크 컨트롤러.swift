import Foundation

// 현재 실행 가능한 작업중, 가장 수행시간이 짧은 작업을 수행하면 된다

// MARK: - Heap

struct Heap<T: Comparable> {
  var nodes = [T]()
  let compare: (T, T) -> Bool
  
  var isEmpty: Bool {
    return nodes.isEmpty
  }
  
  mutating func insert(_ element: T) {
    nodes.append(element)
    var index = nodes.count - 1
    
    while index > 0 && compare(nodes[index], nodes[(index - 1) / 2]) {
      nodes.swapAt(index, (index - 1) / 2)
      index = (index - 1) / 2
    }
  }
  
  mutating func delete() -> T {
    if nodes.count == 1 {
      return nodes.removeLast()
    }
    
    // 첫번째 값 return
    let result = nodes.first!
    nodes.swapAt(0, nodes.count - 1)
    _ = nodes.removeLast()
    
    var index = 0
    
    while index < nodes.count {
      let children = [index * 2 + 1, index * 2 + 1 + 1]
        .filter { $0 < nodes.count && compare(nodes[$0], nodes[index])}
        .sorted { compare(nodes[$0], nodes[$1]) }
      
      guard let target = children.first else {
        break
      }

      nodes.swapAt(index, target)
      index = target
    }
    
    return result
  }
}

struct Node: Comparable {
  let requestTime: Int
  let requiredTime: Int
  
  static func < (lhs: Node, rhs: Node) -> Bool {
    lhs.requiredTime < rhs.requiredTime
  }
}

// MARK: - Solution

func solution(_ jobs:[[Int]]) -> Int {
  
  let jobCount = jobs.count
  var jobs = jobs
    .sorted { $0[0] > $1[0] }
    .map { Node(requestTime: $0[0], requiredTime: $0[1]) }
  
  var resultTime = 0
  var currentTime = 0
  var heap = Heap<Node>(compare: <)
  
  while !(jobs.isEmpty && heap.isEmpty) {
    
    // 현재 시간보다 작은 job들 모두 heap에 넣기
    
    //debug()
    
    while !jobs.isEmpty && jobs.last!.requestTime <= currentTime {
      let job = jobs.removeLast()
      heap.insert(job)
    }
    
    if heap.isEmpty {
      currentTime = jobs.last!.requestTime
      continue
    }
    
    // 힙에서 가장 짧은 작업 꺼내서 처리
    if !heap.isEmpty {
      let job = heap.delete()
      currentTime += job.requiredTime
      resultTime += currentTime - job.requestTime
    }
    
    //debug()
  }
  
  func debug() {
    print("현재시간: \(currentTime)")
    print("전체시간: \(resultTime)")
    print("heap: \(heap.nodes)")
  }
  
  return resultTime / jobCount
}