//15683번 감시

//0 빈칸, 1-5 cctv, 6 벽

struct CCTV {
	var x: Int
	var y: Int
	var type: Int
}

let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n,m) = (t[0],t[1])

var graph = [[Int]]()
var cctv = [CCTV]()

var ans = Int.max

for i in 0..<n {
	let t = readLine()!.split(separator: " ").map{Int(String($0))!}
	for j in 0..<m {
		if (1...5).contains(t[j]) {
			cctv.append(CCTV(x: i, y: j, type: t[j]))
		}
	}
	graph.append(t)
}

let dx = [-1,0,1,0]
let dy = [0,1,0,-1]

let direction = [
	[],
	[[0],[1],[2],[3]],
	[[0,2], [1,3]],
	[[0,1], [1,2], [2,3],[3,0]],
	[[0,1,2], [1,2,3], [2,3,0], [3,0,1]],
	[[0,1,2,3]],
]

func watch(_ x: Int, _ y: Int, _ g: inout [[Int]], _ dir: [Int]) {
	for d in dir {
		var (nx,ny) = (x,y)
		while true {
			nx += dx[d]
			ny += dy[d]
			if (0..<n).contains(nx) && (0..<m).contains(ny) && g[nx][ny] != 6 {
				if g[nx][ny] == 0 {
					g[nx][ny] = -1
				}
			} else {
				break
			}
		}
	}
}

func dfs(_ depth: Int, _ g: [[Int]]) {
	var tmp = g

	//종료조건: 모든 cctv 다 설정했을때
	if depth == cctv.count {
		var subAns = 0
		for t in tmp {
			subAns += t.filter{$0 == 0}.count
		}
		ans = min(ans, subAns)
		return
	}

	//cctv 탐색
	let (x,y,type) = (cctv[depth].x, cctv[depth].y, cctv[depth].type)

	for dir in direction[type] {
		watch(x,y,&tmp, dir)
		dfs(depth+1, tmp)
		tmp = g
	}

}



dfs(0, graph)

print(ans)