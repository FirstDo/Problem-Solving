//14466번 소가 길을 건너간 이유 6
import Foundation

let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N,K,R) = (t[0],t[1],t[2])
let INF = 10000000000

var visited = Array(repeating: Array(repeating: false, count: N), count: N)
var group = Array(repeating: Array(repeating: -1, count: N), count: N)
var disconnect = Array(repeating: Array(repeating: Array(repeating: Array(repeating: false, count: N), count: N), count: N), count: N)

//연결되어 있지 않은 목초지
for _ in 0..<R {
	let t = readLine()!.split(separator: " ").map{Int(String($0))!}
	let (r1,c1,r2,c2) = (t[0]-1,t[1]-1,t[2]-1,t[3]-1)
	disconnect[r1][c1][r2][c2] = true
	disconnect[r2][c2][r1][c1] = true
}

//bfs
func bfs(_ x: Int, _ y: Int, _ num: Int) {
	let dx = [1,-1,0,0]
	let dy = [0,0,-1,1]

	var queue = [(x,y)]
	var idx = 0

	while queue.count > idx {
		let cur = queue[idx]
		idx += 1

		for i in 0..<4 {
			let (nx,ny) = (cur.0+dx[i],cur.1+dy[i])
			if (0..<N).contains(nx) && (0..<N).contains(ny) && !visited[nx][ny] {
				if !disconnect[cur.0][cur.1][nx][ny] {
					visited[nx][ny] = true
					group[nx][ny] = cnt
					queue.append((nx,ny))
				}
			}
		}
	}
}

var cnt = 0

for i in 0..<N {
	for j in 0..<N {
		if !visited[i][j] {
			visited[i][j] = true
			group[i][j] = cnt
			bfs(i,j,cnt)
			cnt += 1
		}
	}
}
var cowGroup = [Int]()

for _ in 0..<K {
	let t = readLine()!.split(separator: " ").map{Int(String($0))!}
	let (x,y) = (t[0]-1,t[1]-1)	
	cowGroup.append(group[x][y])
}
var ans = 0

for i in 0..<(K-1) {
	for j in (i+1)..<K {
		if cowGroup[i] != cowGroup[j] {ans += 1}
	}
}


print(ans)