import Foundation
//7562번 나이트의 이동
let t = Int(readLine()!)!

func dfs(_ n: Int, _ sx: Int, _ sy: Int, _ ex: Int, _ ey: Int) -> Int {
	let dx = [-1,-2,-2,-1,1,2,2,1]
	let dy = [-2,-1,1,2,-2,-1,1,2]

	var queue = [(sx,sy,0)]
	var idx = 0
	var visit = Array(repeating: Array(repeating: false, count: n), count: n)

	while queue.count > idx {
		let (cx,cy,cnt) = queue[idx]
		idx += 1

		if cx == ex && cy == ey {
			return cnt
		}

		for i in 0..<8 {
			let (nx,ny) = (cx+dx[i],cy+dy[i])
			if (0..<n).contains(nx) && (0..<n).contains(ny) && !visit[nx][ny] {
				visit[nx][ny] = true
				queue.append((nx,ny,cnt+1))
			}
		}
	}
	return -1
}

for _ in 0..<t {
	let n = Int(readLine()!)!
	var l = readLine()!.split(separator: " ").map{Int(String($0))!}
	let (a,b) = (l[0],l[1])
	l = readLine()!.split(separator: " ").map{Int(String($0))!}
	let (c,d) = (l[0],l[1])
	print(dfs(n,a,b,c,d))
}