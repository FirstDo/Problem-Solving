import Foundation

class Queue<T> {
  private var input: [T]
  private var output: [T]
  
  init(_ elements: [T] = []) {
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

import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
  
  let queue = Queue<(time: Int, weight: Int)>()
  var trucks = Array(truck_weights.reversed())
  
  var currentWeight = 0 // 현재 다리위의 트럭의 무게
  var time = 0
  
  while true {
    // 다리를 다 건넌 트럭이 있다면 빼주기
    if queue.isEmpty == false &&
       time - queue.front!.time >= bridge_length
    {
      let target = queue.dequeue()
      currentWeight -= target.weight
    }
    
    // 트럭이 더 들어갈 수 있다면 트럭 올려주기
    if trucks.isEmpty == false &&
       queue.elements.count < bridge_length &&
      currentWeight + trucks.last! <= weight
    {
      let target = trucks.removeLast()
      currentWeight += target
      queue.enqueue((time: time, weight: target))
    }
    
    time += 1
        
    if queue.isEmpty { break }
  }
  
  return time
}

