import Foundation

final class Deque {
  var frontStack = [Int]()
  var backStack = [Int]()

  func pushFront(x: Int) {
    frontStack.append(x)
  }

  func pushBack(x: Int) {
    backStack.append(x)
  }

  func popFront() -> Int {
    if frontStack.isEmpty {
      frontStack = backStack.reversed()
      backStack = []
    }

    return frontStack.popLast() ?? -1
  }

  func popBack() -> Int {
    if backStack.isEmpty {
      backStack = frontStack.reversed()
      frontStack = []
    }

    return backStack.popLast() ?? -1
  }

  var size: Int {
    return frontStack.count + backStack.count
  }

  var empty: Int {
    return (frontStack.isEmpty && backStack.isEmpty) ? 1 : 0
  }

  var front: Int {
    if frontStack.isEmpty {
      frontStack = backStack.reversed()
      backStack = []
    }

    return frontStack.last ?? -1
  }

  var back: Int {
    if backStack.isEmpty {
      backStack = frontStack.reversed()
      frontStack = []
    }

    return backStack.last ?? -1
  }
}

let deque = Deque()

let n = Int(readLine()!)!

for _ in 0..<n {
  let command = readLine()!
  switch command {
  case "front":
    print(deque.front)
  case "back":
    print(deque.back)
  case "size":
    print(deque.size)
  case "empty":
    print(deque.empty)
  case "pop_front":
    print(deque.popFront())
  case "pop_back":
    print(deque.popBack())
  default:
    let splitCommand = command.split(separator: " ").map { String($0) }

    switch splitCommand[0] {
    case "push_back":
      deque.pushBack(x: Int(splitCommand[1])!)
    case "push_front":
      deque.pushFront(x: Int(splitCommand[1])!)
    default:
      fatalError()
    }
  }
}