import Foundation

// 전역변수
var ticketArray = [[String]]()
var visited = [Bool]()
var results = [[String]]()

func dfs(node: String, path: [String]) {
  
  // 종료 조건
  if path.count == ticketArray.count + 1 {
    results.append(path)
    return
  }
  
  for i in 0..<ticketArray.count {
    let (from, to) = (ticketArray[i][0], ticketArray[i][1])
    if visited[i] == false, from == node {
      visited[i] = true
      dfs(node: to, path: path + [to])
      visited[i] = false
    }
  }
}

func solution(_ tickets:[[String]]) -> [String] {
  ticketArray = tickets.sorted { $0[1] < $1[1] }
  visited = Array(repeating: false, count: tickets.count)
  
  dfs(node: "ICN", path: ["ICN"])
  
  return results.first!
}