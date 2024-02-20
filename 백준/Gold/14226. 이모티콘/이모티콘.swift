//14226번 이모티콘
let S = Int(readLine()!)!

func bfs(_ N: Int) -> Int {
	//화면, 클립보드, 걸린시간
	var queue = [(1,0,0)]
	var idx = 0

	var visited = Array(repeating: Array(repeating: false, count: N*2), count: N*2)

	visited[1][0] = true

	while queue.count > idx {
		let (s,c,t) = queue[idx]
		idx += 1

		if s == N { return t }
		//복사
		if !visited[s][s] {
			visited[s][s] = true
			queue.append((s,s,t+1))
		}
		//붙여넣기
		if (0..<N*2).contains(s+c) && !visited[s+c][c] {
			visited[s+c][c] = true
			queue.append((s+c,c,t+1))
		}
		//삭제
		if (0..<N*2).contains(s-1) && !visited[s-1][c] {
			visited[s-1][c] = true
			queue.append((s-1,c,t+1))
		}
	}
	return -1
}

print(bfs(S))