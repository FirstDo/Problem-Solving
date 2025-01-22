import Foundation

struct Queue<T> {
  var elements: [T]
  var index = 0
  
  init(_ elements: [T] = []) {
    self.elements = elements
  }
  
  var isEmpty: Bool {
    !(elements.count > index)
  }
  
  mutating func enqueue(_ element: T) {
    elements.append(element)
  }
  
  mutating func dequeue() -> T {
    index += 1
    return elements[index - 1]
  }
}

func bfs(_ a: Int, _ b: Int, _ c: Int) {
  var result = Set<Int>()
  var visit = Array(repeating: Array(repeating: false, count: 201), count: 201)
  visit[0][0] = true
  var queue = Queue([(a: 0, b: 0, c: c)])
  
  while queue.isEmpty == false {
    let cur = queue.dequeue()
    
    if cur.a == 0 {
      result.insert(cur.c)
    }
    
    var news = [(a: Int, b: Int, c: Int)]()
    
    //A -> B
    if (cur.a + cur.b) >= b {
      news.append((cur.a + cur.b - b, b, cur.c))
    } else {
      news.append((0, cur.a + cur.b, cur.c))
    }
    //A -> C
    if (cur.a + cur.c) >= c {
      news.append((cur.a + cur.c - c, cur.b, c))
    } else {
      news.append((0, cur.b, cur.a + cur.c))
    }
    //B -> A
    if (cur.b + cur.a) >= a {
      news.append((a, cur.b + cur.a - a, cur.c))
    } else {
      news.append((cur.b + cur.a, 0, cur.c))
    }
    //B -> C
    if (cur.c + cur.b) >= c {
      news.append((cur.a, cur.b + cur.c - c, c))
    } else {
      news.append((cur.a, 0, cur.b + cur.c))
    }
    //C -> A
    if (cur.a + cur.c) >= a {
      news.append((a, cur.b, cur.a + cur.c - a))
    } else {
      news.append((cur.a + cur.c, cur.b, 0))
    }
    //C -> B
    if (cur.c + cur.b) >= b {
      news.append((cur.a, b, cur.b + cur.c - b))
    } else {
      news.append((cur.a, cur.b + cur.c, 0))
    }
    
    for new in news {
      if visit[new.a][new.b] == false {
        visit[new.a][new.b] = true
        queue.enqueue(new)
      }
    }
  }
  
  print(result.sorted().map {String($0)}.joined(separator: " "))
}

func solution() {
  let abc = readLine()!.split(separator: " ").map {Int($0)!}
  let (a,b,c) = (abc[0], abc[1], abc[2])
  bfs(a, b, c)
}

solution()