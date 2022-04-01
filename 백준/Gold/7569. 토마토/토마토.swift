import Foundation

//7569번 토마토

//3차원 bfs

let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (M,N,H) = (t[0],t[1],t[2])

var tomato = [[[Int]]]()
var queue = [(Int,Int,Int,Int)]()

for h in 0..<H {
	var temp = [[Int]]()
	for n in 0..<N {
		let sub = readLine()!.split(separator: " ").map{Int(String($0))!}
		for (m,value) in sub.enumerated() where value == 1 {
			queue.append((h,n,m,0))
		}
		temp.append(sub)
	}
	tomato.append(temp)
}

func bfs(_ queue: inout [(Int,Int,Int,Int)], _ graph: inout [[[Int]]], _ M: Int, _ N: Int, _ H: Int) {

	let dr = [0,0,1,-1,0,0]
	let dc = [0,0,0,0,1,-1]
	let dh = [-1,1,0,0,0,0] 

	var idx = 0
	var ans = 0
	//탐색
	while queue.count > idx {
		let (h,r,c,day) = queue[idx]
		idx += 1
		ans = day

		for i in 0..<6 {
			let (nh,nr,nc) = (h+dh[i],r+dr[i],c+dc[i])
			if (0..<H).contains(nh) && (0..<N).contains(nr) && (0..<M).contains(nc) && graph[nh][nr][nc] == 0 {
				graph[nh][nr][nc] = 1
				queue.append((nh,nr,nc,day+1))
			}
		}
	}

	for h in 0..<H {
		for n in 0..<N {
			for m in 0..<M {
				if graph[h][n][m] == 0 {
					print(-1)
					return
				}
			}
		}
	}
	print(ans)
}

if queue.isEmpty {
	print(-1)
} else {
	bfs(&queue,&tomato,M,N,H)
}