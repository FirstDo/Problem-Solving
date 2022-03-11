import Foundation
//2206번 벽 부수고 이동하기

let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N,M) = (t[0],t[1])

var graph = [[Int]]()

for _ in 0..<N {
	let t = Array(readLine()!).map{Int(String($0))!}
	graph.append(t)
}

let dx = [1,-1,0,0]
let dy = [0,0,1,-1]

func bfs() -> Int {
	var queue = [(0,0,1)]
	var visit = Array(repeating: Array(repeating: [0,0], count: M), count: N)
	visit[0][0][1] = 1
	var idx = 0

	while queue.count > idx {
		let (x,y,w) = queue[idx]
		idx += 1

		if x == N-1 && y == M-1 {
			return visit[x][y][w]
		}

		for i in 0..<4 {
			let (nx,ny) = (dx[i]+x, dy[i]+y)
			if (0..<N).contains(nx) && (0..<M).contains(ny) {
				if graph[nx][ny] == 1 && w == 1 {
					visit[nx][ny][0] = visit[x][y][1] + 1
					queue.append((nx,ny,0))
				} else if graph[nx][ny] == 0 && visit[nx][ny][w] == 0 {
					visit[nx][ny][w] = visit[x][y][w] + 1
					queue.append((nx,ny,w))
				}
			}
		}
	}
	return -1
}
print(bfs())