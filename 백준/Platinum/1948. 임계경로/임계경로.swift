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

/**
 위상정렬 - 각 노드까지 걸리는 최대시간을 구하기 위함
 */
func topologySort(
  _ start: Int,
  _ end: Int,
  _ indegree: [Int],
  _ graph: [[(node: Int, cost: Int)]]
) -> [Int] {
  let n = graph.count - 1
  
  var indegree = indegree
  var dp = Array(repeating: 0, count: n + 1)
  // dp[i]: i번째 노드에 도달하기 까지 걸리는 시간의 최대값
  var queue = Queue<Int>([start])

  while queue.isEmpty == false {
    let cur = queue.dequeue()
    
    for next in graph[cur] {
      indegree[next.node] -= 1
      dp[next.node] = max(dp[next.node], dp[cur] + next.cost)
      
      if indegree[next.node] == 0 {
        queue.enqueue(next.node)
      }
    }
  }
  print(dp[end])
  return dp
}

/**
 bfs탐색: 최장경로의 경로수를 구하기 위함
 */
func bfs(
  _ start: Int,
  _ end: Int,
  _ timeList: [Int],
  _ graph: [[(node: Int, cost: Int)]]
) {
  let n = graph.count - 1
  
  var queue = Queue([start])
  var visited = Array(repeating: false, count: n+1)
  visited[start] = true

  var answer = 0

  while queue.isEmpty == false {
    let cur = queue.dequeue()
    
    for next in graph[cur] {
      // 현재노드걸린시간 - 다음노드 걸린시간 = 간선시간 일 경우에만 최장경로
      if timeList[cur] - timeList[next.node] == next.cost {
        if visited[next.node] == false {
          visited[next.node] = true
          queue.enqueue(next.node)
        }
        answer += 1
      }
    }
  }
  
  print(answer)
}

func solution() {
  let n = Int(readLine()!)!
  let m = Int(readLine()!)!
  
  var graph = Array(repeating: [(node: Int, cost: Int)](), count: n+1)
  var reverseGraph = Array(repeating: [(node: Int, cost: Int)](), count: n+1)
  var indegree = Array(repeating: 0, count: n+1)
  
  for _ in 0..<m {
    let uvc = readLine()!.split(separator: " ").map {Int($0)!}
    let (u, v, c) = (uvc[0], uvc[1], uvc[2])
    graph[u].append((v, c))
    reverseGraph[v].append((u, c))
    indegree[v] += 1
  }
  
  let se = readLine()!.split(separator: " ").map {Int($0)!}
  let (s, e) = (se[0], se[1])
  let timeList = topologySort(s, e, indegree, graph)
  bfs(e, s, timeList, reverseGraph)
  
}

solution()
