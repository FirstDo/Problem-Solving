import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
  
  // Method
  
  func canConvert(from start: String, to end: String) -> Bool {
    var len = start.count - 1
    
    for (s,e) in zip(start,end) where s == e {
        len -= 1
    }
    
    return len == 0
  }
  
  func bfs() -> Int {
    var visit = [String: Bool]()
    words.forEach { visit[$0] = false }
    
    var queue = [(str: begin, count: 0)]
    var index = 0
    
    while queue.count > index {
      let (str, count) = queue[index]
      index += 1
      
      if str == target {
        return count
      }
      
      for word in words where visit[word] == false && canConvert(from: str, to: word) {
        visit[word] = true
        queue.append((word, count + 1))
      }
    }
    
    return 0
  }
  
  // Logic
  
  
  guard words.contains(target) else {
    return 0
  }

  return bfs()
}