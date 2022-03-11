import Foundation
//2252번 줄세우기기

//토플로지 솔트

let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N,M) = (t[0],t[1])

var indegree = Array(repeating: 0, count: N+1)
var graph = Array(repeating: [Int](), count: N+1)
var visited = Array(repeating: false, count: N+1)

for _ in 0..<M {
	let t = readLine()!.split(separator: " ").map{Int(String($0))!}
	let (a,b) = (t[0],t[1])
	indegree[b] += 1
	graph[a].append(b)
}

var queue = [Int]()
var idx = 0
for i in 1...N {
	if indegree[i] == 0 {queue.append(i)}
}
var ans = [String]()

while queue.count > idx {
	let cur = queue[idx]
	idx += 1
	ans.append(String(cur))

	for next in graph[cur] {
		indegree[next] -= 1
		if indegree[next] == 0 {
			queue.append(next)
		}
	}
}

print(ans.joined(separator: " "))