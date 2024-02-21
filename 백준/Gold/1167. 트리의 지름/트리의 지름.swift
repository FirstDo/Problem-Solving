import Foundation

struct Node {
  let n: Int
  let distance: Int
}

let v = Int(readLine()!)!

var graph = Array(repeating: [Node](), count: v+1)
var visit = Array(repeating: false, count: v+1)

var len = 0
var targetNode = 0

for i in 1...v {
  let edges = readLine()!.split(separator: " ").map {Int($0)!}.dropLast()
  for i in stride(from: 1, to: edges.count, by: 2) {
    graph[edges[0]].append(.init(n: edges[i], distance: edges[i+1]))
  }
}

dfs(node: 1, distance: 0)

len = 0
visit = Array(repeating: false, count: v+1)

dfs(node: targetNode, distance: 0)

func dfs(node: Int, distance: Int) {
  visit[node] = true
  
  if len <= distance {
    len = distance
    targetNode = node
  }
  
  for nx in graph[node] {
    if !visit[nx.n] {
      dfs(node: nx.n, distance: distance + nx.distance)
    }
  }
}

print(len)
