//1303전투
import Foundation
let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N,M) = (t[0],t[1])

var graph = [[Character]]()

for _ in 0..<M {
	graph.append(Array(readLine()!))
}

var power: [Character: Int] = ["W": 0, "B": 0]

func bfs(_ x: Int, _ y: Int, _ ch: Character) {
	let dx = [1,-1,0,0]
	let dy = [0,0,1,-1]

	graph[x][y] = "-"
	var queue = [(x,y)]
	var idx = 0

	while queue.count > idx {
		let cur = queue[idx]
		idx += 1

		for i in 0..<4 {
			let (nx,ny) = (cur.0 + dx[i], cur.1 + dy[i])
			if (0..<M).contains(nx) && (0..<N).contains(ny) && graph[nx][ny] == ch {
				graph[nx][ny] = "-"
				queue.append((nx,ny))
			}
		}
	}
	power[ch]! += Int(pow(Double(idx), 2.0))
}


for i in 0..<M {
	for j in 0..<N {
		if graph[i][j] != "-" {
			bfs(i,j,graph[i][j])
		}
	}
}

print(power["W"]!, power["B"]!)