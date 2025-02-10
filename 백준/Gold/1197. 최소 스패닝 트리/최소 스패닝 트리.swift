import Foundation

struct Edge {
  let v1: Int
  let v2: Int
  let cost: Int
}

func find(_ x: Int, _ parents: inout [Int]) -> Int {
  if x != parents[x] {
    parents[x] = find(parents[x], &parents)
  }
  
  return parents[x]
}

func union(_ a: Int, _ b: Int, _ parents: inout [Int]) {
  let pa = find(a, &parents)
  let pb = find(b, &parents)
  
  parents[pa] = pb
}

func solution() {
  let ve = readLine()!.split(separator: " ").map {Int($0)!}
  let (v, e) = (ve[0], ve[1])
  
  var parents = Array(repeating: 0, count: v+1)
  
  for i in 1...v {
    parents[i] = i
  }
  
  var edges = [Edge]()
  var cost = 0
  
  for _ in 0..<e {
    let abc = readLine()!.split(separator: " ").map {Int($0)!}
    let (a,b,c) = (abc[0], abc[1], abc[2])
    
    edges.append(Edge(v1: a, v2: b, cost: c))
  }
  
  edges.sort { $0.cost < $1.cost }
  
  for edge in edges {
    if find(edge.v1, &parents) != find(edge.v2, &parents) {
      union(edge.v1, edge.v2, &parents)
      cost += edge.cost
    }
  }
  
  print(cost)
}

solution()
