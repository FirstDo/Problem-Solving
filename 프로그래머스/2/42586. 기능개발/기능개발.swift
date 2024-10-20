class Queue<T> {
  private var input: [T]
  private var output: [T]
  
  init(_ elements: [T]) {
    self.input = elements
    self.output = []
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
  let progress: Int
  let speeds: Int
}

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
  let queue = Queue<Task>([])
  var distributionList = [Int]()
  
  for (progress, speed) in zip(progresses, speeds) {
    queue.enqueue(Task(progress: progress, speeds: speed))
  }
  
  var time = 0
  
  while !queue.isEmpty {
    time += 1
    var cnt = 0
    
    while !queue.isEmpty {
      let job = queue.front!

      if job.progress + job.speeds * time < 100 { break }
      
      _ = queue.dequeue()
      cnt += 1
    }
    
    if cnt != 0 {
      distributionList.append(cnt)
    }
  }

  return distributionList
}