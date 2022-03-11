import Foundation
//18430번 무기공학

let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N,M) = (t[0],t[1])

var graph = [[Int]]()

for _ in 0..<N {
	let t = readLine()!.split(separator: " ").map{Int(String($0))!}
	graph.append(t)
}

var visited = Array(repeating: Array(repeating: false, count: M), count: N)

func canMake(_ pos: (Int,Int,Int,Int)) -> Bool {
	return (0..<N).contains(pos.0) && (0..<M).contains(pos.1) && (0..<N).contains(pos.2) && (0..<M).contains(pos.3) && !visited[pos.0][pos.1] && !visited[pos.2][pos.3]
}

var ans = 0

func dfs(_ x: Int, _ y: Int, _ sum: Int) {
	var (x,y) = (x,y)
	if y == M {
		y = 0
		x += 1
	}

	if x == N {
		ans = max(ans,sum)
		return
	}

	if !visited[x][y] {
		for pos in [(x,y-1,x+1,y), (x,y-1,x-1,y), (x-1,y,x,y+1), (x+1,y,x,y+1)] {
			if canMake(pos) {
				visited[x][y] = true
				visited[pos.0][pos.1] = true
				visited[pos.2][pos.3] = true
				let nextSum = sum + graph[x][y]*2 + graph[pos.0][pos.1] + graph[pos.2][pos.3]
				dfs(x,y+1,nextSum)
				visited[x][y] = false
				visited[pos.0][pos.1] = false
				visited[pos.2][pos.3] = false
			}
		}
	}
	dfs(x,y+1,sum)
}

dfs(0,0,0)
print(ans)