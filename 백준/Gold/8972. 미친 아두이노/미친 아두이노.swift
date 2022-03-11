import Foundation
//8972번 미친 아두이노

let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (R,C) = (t[0],t[1])
var graph = [[Character]]()
var crazy = [(Int,Int)]()

var me = (0,0)

for i in 0..<R {
	let t = Array(readLine()!)
	graph.append(t)
	for j in 0..<C {
		if t[j] == "I" {me = (i,j)}
		else if t[j] == "R" {crazy.append((i,j))}
	}
}

let cmd = Array(readLine()!).map{Int(String($0))!}

//direction 1 2 3 4 5 6 7 8 9
let dx = [0,1,1,1,0,0,0,-1,-1,-1]
let dy = [0,-1,0,1,-1,0,1,-1,0,1]


outer: for (idx,dir) in cmd.enumerated() {
	//1. 종수의 이동
	graph[me.0][me.1] = "."
	me = (me.0+dx[dir],me.1+dy[dir])
	//2. 종수의 아두이노가 미친아두이노와 만나면 게임 종료
	if graph[me.0][me.1] == "R" {
		print("kraj \(idx+1)")
		break 
	}
	graph[me.0][me.1] = "I"
	//3. 미친 아두이노는 종수와 가까워지는 방향으로 이동
	var visited = Array(repeating: Array(repeating: 0, count: C), count: R)
	for  (x,y) in crazy {
		//가장 가까워지는 방향을 찾자
		var dist = 200
		var nextDir = -1
		for i in [1,2,3,4,6,7,8,9] {
			let (nx,ny) = (x+dx[i],y+dy[i])
			let temp = abs(me.0-nx) + abs(me.1-ny)
			if dist >= temp {
				dist = temp
				nextDir = i
			}
		}
		//가장 가까워지는 방향으로 이동
		let (nx,ny) = (x+dx[nextDir],y+dy[nextDir])
		//4. 미친아두이노가 종수와 만나면 게임 종료
		if graph[nx][ny] == "I" {
			print("kraj \(idx+1)")
			break outer
		}

		graph[x][y] = "."
		visited[nx][ny] += 1
	}
	//5. 미친아두이노끼리 만나면 폭발
	crazy.removeAll()

	for i in 0..<R {
		for j in 0..<C {
			if visited[i][j] == 1 {
				graph[i][j] = "R"
				crazy.append((i,j))
			}
		}
	}

	if idx + 1 == cmd.count {
		for g in graph {
			print(g.map{String($0)}.joined())
		}
	}
}