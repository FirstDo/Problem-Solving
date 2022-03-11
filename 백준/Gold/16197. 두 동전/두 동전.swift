import Foundation
//16197번 두 동전
let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N,M) = (t[0],t[1])
var graph = [[Character]]()

var pos = [(Int,Int)]()

for i in 0..<N {
	let t = Array(readLine()!)
	graph.append(t)

	for j in 0..<M {
		if t[j] == "o" {
			pos.append((i,j))
		}
	}
}
//범위판단
func moveCoin(_ x1: Int, _ y1: Int, _ x2: Int, _ y2: Int) -> Int{
	let r1 = (0..<N).contains(x1) && (0..<M).contains(y1)
	let r2 = (0..<N).contains(x2) && (0..<M).contains(y2)
	//둘다 범위 안
	if r1 && r2 {return 1}
	//둘다 범위 밖
	else if !r1 && !r2 {return -1}
	//하나만 범위 밖
	else {return 0}
}

func bfs() {
	let dx = [1,-1,0,0]
	let dy = [0,0,1,-1]

	var queue = [(pos[0].0, pos[0].1, pos[1].0, pos[1].1,0)]
	var idx = 0
	var visited = Array(repeating: Array(repeating: Array(repeating: Array(repeating: false, count: M), count: N), count: M), count: N)
	visited[pos[0].0][pos[0].1][pos[1].0][pos[1].1] = true

	while queue.count > idx {
		let (x1,y1,x2,y2,cnt) = queue[idx]
		idx += 1

		if cnt >= 10 {
			print(-1)
			return
		}

		for i in 0..<4 {
			var (nx1,ny1,nx2,ny2) = (x1+dx[i],y1+dy[i],x2+dx[i],y2+dy[i])
			//print(nx1,ny1,nx2,ny2)
			switch moveCoin(nx1,ny1,nx2,ny2) {
			//하나만 아웃. 답!
			case 0:
				print(cnt+1)
				return
			//둘다 in 이동가능	
			case 1:
				if !visited[nx1][ny1][nx2][ny2]  {
					if graph[nx1][ny1] == "#" {(nx1,ny1) = (x1,y1)}
					if graph[nx2][ny2] == "#" {(nx2,ny2) = (x2,y2)}
					visited[nx1][ny1][nx2][ny2] = true
					queue.append((nx1,ny1,nx2,ny2,cnt+1))
				}
			//둘다 아웃 이동불가
			default:
				break
			}
		}
	}
}
bfs()