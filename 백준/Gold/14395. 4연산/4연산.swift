import Foundation

let l = readLine()!.split(separator: " ").map {Int($0)!}
let (s, t) = (Int(l[0]), Int(l[1]))

let limit = 1_000_000_000

func bfs() {
  var visit: Set<Int> = [s]
  
  var queue = [(s, "")]
  var index = 0
  
  while queue.count > index {
    let (x,path) = queue[index]
    index += 1
    
    if x == t {
      print(path.isEmpty ? 0 : path)
      return
    }
    
    if x * x <= limit && !visit.contains(x*x) {
      visit.insert(x*x)
      queue.append((x*x, path + "*"))
    }
    
    if x + x <= limit && !visit.contains(x+x) {
      visit.insert(x+x)
      queue.append((x+x, path + "+"))
    }
    
    if x - x <= limit && !visit.contains(x-x) {
      visit.insert(x-x)
      queue.append((x-x, path + "-"))
    }
    
    if x != 0 && !visit.contains(x/x) {
      visit.insert(x/x)
      queue.append((x/x, path + "/"))
    }
  }
  
  print(-1)
}

bfs()
