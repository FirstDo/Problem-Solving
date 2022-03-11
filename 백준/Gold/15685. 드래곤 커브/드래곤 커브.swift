//15658번 드래곤 커브

var graph = Array(repeating: Array(repeating: false, count: 101), count: 101)

let n = Int(readLine()!)!

func drawDragon(_ x: Int, _ y: Int, _ dir: Int, _ gen: Int) {
	let dx = [1,0,-1,0]
	let dy = [0,-1,0,1]

	var direction = [dir]

	for i in 0..<gen {
		var temp = direction
		for i in 0..<temp.count {
			temp[i] = temp[i] + 1 == 4 ? 0 : temp[i] + 1 
		}
		direction.append(contentsOf: Array(temp.reversed())) 
	}

	graph[x][y] = true
	var (x,y) = (x,y)
	for i in direction {
		(x,y) = (x+dx[i],y+dy[i])
		if (0...100).contains(x) && (0...100).contains(y) {
			graph[x][y] = true
		}
	}
}

func getAnswer() -> Int{
	var cnt = 0

	for i in 0..<100 {
		for j in 0..<100 {
			if graph[i][j] && graph[i+1][j] && graph[i][j+1] && graph[i+1][j+1] {
				cnt += 1
			}
		}
	}
	return cnt
}

for _ in 0..<n {
	let t = readLine()!.split(separator: " ").map{Int(String($0))!}
	let (x,y,dir,gen) = (t[0],t[1],t[2],t[3])
	drawDragon(x,y,dir,gen)
}

print(getAnswer())