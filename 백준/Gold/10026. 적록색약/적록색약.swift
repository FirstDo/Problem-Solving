import Foundation
//10026번 적록색약
var normal = [[Character]]()
var abnormal = [[Character]]()

let n = Int(readLine()!)!
for _ in 0..<n {
	var line = Array(readLine()!)
	normal.append(line)
	for (idx,value) in line.enumerated() {
		if value == "G" {
			line[idx] = "R"
		}
	}
	abnormal.append(line)	
}

var v1 = Array(repeating: Array(repeating: false, count: n), count: n)
var v2 = Array(repeating: Array(repeating: false, count: n), count: n)

func bfs(_ x: Int, _ y: Int, _ arr: [[Character]], _ v: inout [[Bool]]) {
	let dx = [1,-1,0,0]
	let dy = [0,0,-1,1]
	
	v[x][y] = true
	let ch = arr[x][y]
	
	var queue = [(x,y)]
	var idx = 0

	while queue.count > idx {
		let (cx,cy) = queue[idx]
		idx += 1

		for i in 0..<4 {
			let (nx,ny) = (cx+dx[i], cy+dy[i])
			if (0..<n).contains(nx) && (0..<n).contains(ny) && ch == arr[nx][ny] && !v[nx][ny] {
				v[nx][ny] = true
				queue.append((nx,ny))
			}
		}

	}
}
var cnt1 = 0
var cnt2 = 0

for i in 0..<n {
	for j in 0..<n {
		if !v1[i][j] {
			bfs(i,j,normal,&v1)
			cnt1 += 1
		}

		if !v2[i][j] {
			bfs(i,j,abnormal,&v2)
			cnt2 += 1
		}
	}
}

print(cnt1,cnt2)