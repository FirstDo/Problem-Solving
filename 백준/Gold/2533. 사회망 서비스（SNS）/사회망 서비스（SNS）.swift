import Foundation
//2533번 사회망 서비스(SNS)

let n = Int(readLine()!)!
var graph = Array(repeating: [Int](), count: n+1)
var visited = Array(repeating: false, count: n+1)
var dp = Array(repeating: Array(repeating: 0, count: 2), count: n+1)

func dfs(_ node: Int) {
	visited[node] = true
	dp[node] = [0,1]
	for next in graph[node] {
		if !visited[next] {
			dfs(next)
			dp[node][0] += dp[next][1]
			dp[node][1] += dp[next].min()!
		}
	}
}

for _ in 0..<(n-1) {
	let t = readLine()!.split(separator: " ").map{Int(String($0))!}
	let (u,v) = (t[0],t[1])
	graph[u].append(v)
	graph[v].append(u)
}

dfs(1)
print(dp[1].min()!)