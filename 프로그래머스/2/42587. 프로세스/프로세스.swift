import Foundation

class Queue<T> {
  private var input: [T]
  private var output: [T]
  
  init(_ elements: [T]) {
    self.input = elements
    self.output = []
  }
  
  var elements: [T] {
    return output.reversed() + input
  }
  
  var isEmpty: Bool {
    return input.isEmpty && output.isEmpty
  }
  
  var front: T? {
    if output.isEmpty {
      return input.first
    }
    
    return output.last
  }
  
  var rear: T? {
    if input.isEmpty {
      return output.first
    }
    
    return input.last
  }
  
  func enqueue(_ data: T) {
    input.append(data)
  }
  
  func dequeue() -> T {
    if output.isEmpty {
      output = input.reversed()
      input = []
    }
    
    return output.removeLast()
  }
}

struct Task {
  let id: Int
  let priority: Int
}

func solution(_ priorities:[Int], _ location:Int) -> Int {
  let tasks = priorities.enumerated().map {
    Task(id: $0.offset, priority: $0.element)
  }
  
  let queue = Queue<Task>(tasks)
  var sequence = 0
  
  while true {
    let task = queue.dequeue()
    
    // 우선순위가 더 높은 작업이 큐에 있다면 큐에 넣기
    if queue.elements.contains(where: { $0.priority > task.priority}) {
      queue.enqueue(task)
    } else {
      sequence += 1
      if task.id == location { break }
    }
  }
  
  return sequence
}
