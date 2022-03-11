//input
let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n,m) = (t[0],t[1])

var graph = [[Int]]()

for _ in 0..<n {
	let t = readLine()!.split(separator: " ").map{Int(String($0))!}
	graph.append(t)
}

//상어의 초기위치
var (sx,sy) = ((n+1)/2-1, (n+1)/2-1)

//숫자 -> 좌표 매칭 하기
func getDict() -> [Int: (Int,Int)] {
	var pos : [Int: (Int,Int)] = [:]
	var (key,len) = (1,1)
	var (row,col) = (sx,sy)
	//4방향 탐색
	while true {
		//좌
		for c in stride(from: col, to: col - len, by: -1) {
			if !(row == sx && c == sy) {
				pos[key] = (row,c)
				key += 1
			}
		}
		col -= len
		//종료조건
		if key >= n*n { break }
		//아래
		for r in row ..< row+len {
			pos[key] = (r,col)
			key += 1
		}
		row += len
		len += 1
		//우
		for c in col ..< col + len {
			pos[key] = (row,c)
			key += 1
		}
		col += len
		//위
		for r in stride(from: row, to: row - len, by: -1) {
			pos[key] = (r,col)
			key += 1
		}
		row -= len
		len += 1
	}
	return pos
}

//1차원 인덱스 -> 배열 인덱스 매치
var pos = getDict()

// 상 하 좌 우
let dx = [0,-1,1,0,0]
let dy = [0,0,0,-1,1]

//디버그용 그래프
func debugGraph() {
	print("\ngraph")
	for g in graph {
		print(g)
	}
}

//블리자드 마법 시전
func castBlizzard(_ d: Int, _ s: Int) {
	var (nx,ny) = (sx,sy)
	//s 영역 이하의 구슬은 전부 파괴
	for _ in 0..<s {
		nx += dx[d]
		ny += dy[d]

		graph[nx][ny] = 0
	}
}

//구슬을 움직이는 함수
func moveMarble() {
	var (start, end) = (1,1)

	while true {
		//처음으로 비어있는 곳을 찾는다.
		while start < n*n {
			let (x,y) = pos[start]!
			if graph[x][y] == 0 {
				break
			} else {
				start += 1
			}
		}
		if start >= n*n {return}

		if end <= start { end = start + 1}
		//start이후 구술이 있는곳을 찾는다.
		while end < n*n {
			let (x,y) = pos[end]!
			if graph[x][y] != 0 {
				break
			} else {
				end += 1
			}
		}
		if end >= n*n {return}

		let (startX, startY) = pos[start]!
		let (endX, endY) = pos[end]!
		graph[startX][startY] = graph[endX][endY]
		graph[endX][endY] = 0
	}
}

func values(_ idx: Int) -> Int {
	let (x,y) = pos[idx]!
	return graph[x][y]
}


//구슬을 폭발시키는 함수
func explodeMarble(_ cnt: inout [Int]) -> Bool {
	var (start, end) = (1,1)

	var flag = false

	while start < n*n && end < n*n && values(start) != 0 {
		//아직 4개구슬을 못찾았을때
		if end - start < 3 {
			end += 1
			if end >= n*n {
				return flag
			}

			if values(end) != values(start) {
				start = end
			}
		} 
		//4개이상 구슬을 찾았을때
		else {
			flag = true
			//최대 end값을 찾는다.
			while (end < n*n - 1) && (values(end) == values(end+1)) {
				end += 1
			}

			//start - end 구슬을을 다 터트리기
			let target = values(start)
			cnt[target] += (end - start + 1)

			for i in start...end {
				let (x,y) = pos[i]!
				graph[x][y] = 0
			}
			end += 1
			start = end
		}
	}
	return flag
}

//구슬의 변화
func changeMarble() {
	var (start, end) = (1,1)

	var temp = Array(repeating: Array(repeating: 0, count: n), count: n)
	var idx = 1

	while end < n*n && start < n*n && values(start) != 0 {
		//1. 그룹을 찾는다. start - end
		while end < n*n - 1 && values(end) == values(end+1) {
			end += 1
		}

		//2. 구슬 그룹을 A, B로 나눈다.
		let (A,B) = (end-start + 1, values(start))

		//3. 구슬을 새로운 배열에 채워 넣는다.
		var (x,y) = pos[idx]!
		temp[x][y] = A
		idx += 1

		(x,y) = pos[idx]!
		temp[x][y] = B
		idx += 1


		if idx >= n*n {
			break
		}

		end += 1
		start = end
	}
	graph = temp
}


var cnt = [0,0,0,0]
//작업 수행 반복문
for _ in 0..<m {
	let t = readLine()!.split(separator: " ").map{Int(String($0))!}
	let (d,s) = (t[0],t[1])
	//블리자드 시전 &구슬 파괴
	castBlizzard(d,s)

	while true {
		//구슬의 이동: 파괴된 부분을 채움
		moveMarble()
		//debugGraph()
		//구슬의 폭발: 4개가 모였으면 동시에 터트려야함. 폭발하지 않았으면 break
		if !explodeMarble(&cnt) {
			//print("구슬이 안 터졌다.")
			//debugGraph()
			break
		}
	}
	//print("\n이동")

	//구슬의 변화
	//print("구슬의 변화")
	changeMarble()

}

print(cnt.enumerated().reduce(0,{
	return $0 + $1.element * $1.offset
}))