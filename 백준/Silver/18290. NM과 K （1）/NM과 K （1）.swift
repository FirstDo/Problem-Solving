import Foundation
//18290번 NM과 K

let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N,M,K) = (t[0],t[1],t[2])

var graph = [[Int]]()

for _ in 0..<N {
	graph.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

var visit = Array(repeating: Array(repeating: false, count: M+1), count: N+1)

let dx = [1,-1,0,0]
let dy = [0,0,1,-1]

var ans = -10000000000

func dfs(_ bx: Int, _ by: Int, _ sum: Int, _ depth: Int) {
	if depth == K {
		//print("도달 : \(sum)\n")
		ans = max(ans,sum)
		return
	}

	for x in bx..<N {
		for y in 0..<M {
			if visit[x][y] {continue}

			var v = true

			for i in 0..<4 {
				let (nx,ny) = (x+dx[i],y+dy[i])
				//이미 방문했을 경우
				if (0..<N).contains(nx) && (0..<M).contains(ny) && visit[nx][ny] {
					v = false
					break					
				}
			}

			if v {
				//print(x,y,"방문")
				visit[x][y] = true
				dfs(x,y, sum+graph[x][y],depth+1)
				visit[x][y] = false
			}
		}
	}
}

dfs(0,0,0,0)
print(ans)