import Foundation
//1189번 컴백홈

let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (R,C,K) = (t[0],t[1],t[2])

var graph = [[Character]]()

for _ in 0..<R {
	let t = Array(readLine()!)
	graph.append(t)
}

var ans = 0

let dx = [1,-1,0,0]
let dy = [0,0,1,-1]

func dfs(_ x: Int, _ y: Int, _ cnt: Int) {
	//종료조건
	if x == 0 && y == C-1 && cnt == K {
		ans += 1
		return
	}

	for i in 0..<4 {
		let (nx,ny) = (x+dx[i],y+dy[i])
		if (0..<R).contains(nx) && (0..<C).contains(ny) {
			if graph[nx][ny] == "." {
				graph[nx][ny] = "T"
				dfs(nx,ny,cnt+1)
				graph[nx][ny] = "."
			}
		}
	}
}
graph[R-1][0] = "T"
dfs(R-1,0,1)
print(ans)