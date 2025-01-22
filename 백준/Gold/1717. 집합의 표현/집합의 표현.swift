import Foundation

func union(_ a: Int, _ b: Int, _ parent: inout [Int]) {
  let pa = find(a, &parent)
  let pb = find(b, &parent)
  
  if pa >= pb {
    parent[pa] = pb
  } else {
    parent[pb] = pa
  }
}

func find(_ x: Int, _ parent: inout [Int]) -> Int {
  if x != parent[x] {
    parent[x] = find(parent[x], &parent)
  }
  
  return parent[x]
}

func solution() -> String {
  var result = [String]()
  
  let nm = readLine()!.split(separator: " ").map {Int($0)!}
  let (n, m) = (nm[0], nm[1])
  
  var parent = (0...n).map { return $0 }
  
  for _ in 0..<m {
    let t = readLine()!.split(separator: " ").map {Int($0)!}
    let (op, a, b) = (t[0], t[1], t[2])
    
    if op == 0 {
      union(a, b, &parent)
    }
    
    if op == 1 {
      let pa = find(a, &parent)
      let pb = find(b, &parent)
      
      result.append(pa == pb ? "YES" : "NO")
    }
  }
  
  return result.joined(separator: "\n")
}

print(solution())
