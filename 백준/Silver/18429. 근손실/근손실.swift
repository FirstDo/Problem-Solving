import Foundation
//18429 근손실실

let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N,K) = (t[0],t[1])

let arr = readLine()!.split(separator: " ").map{Int(String($0))!}

var visited = Array(repeating: false, count: N)
var ans = 0

func bfs(_ depth: Int, _ weight: Int) {
	if depth == N {
		ans += 1
		return
	}

	for i in 0..<N {
		if !visited[i] && weight - K + arr[i] >= 500 {
			visited[i] = true
			bfs(depth+1, weight-K+arr[i])
			visited[i] = false
		}
	}
}

bfs(0,500)

print(ans)