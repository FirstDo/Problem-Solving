import Foundation

func canConvert(from: String, to: String) -> Bool {
  let sum = zip(from, to)
    .reduce(0) {
      $0 + ($1.0 == $1.1 ? 1 : 0)
    }
  
  return sum == from.count - 1
}

func bfs(begin: String, target: String, words: [String]) -> Int {
  var visited = [String: Bool]()
  
  words.forEach {
    visited[$0] = false
  }
  
  var queue = [(word: begin, cnt: 0)]
  var index = 0
  
  while queue.count > index {
    var cur = queue[index]
    index += 1
    
    if cur.word == target {
      return cur.cnt
    }
    
    for word in words {
      if visited[word] == false && canConvert(from: cur.word, to: word) {
        visited[word] = true
        queue.append((word, cur.cnt + 1))
      }
    }
  }
  
  return 0
}

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
  return bfs(begin: begin, target: target, words: words)
}