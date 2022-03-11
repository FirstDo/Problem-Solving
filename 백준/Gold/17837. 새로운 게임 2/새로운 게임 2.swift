//17837번 새로운 게임2

let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n,k) = (t[0],t[1])

var colorInfo = [[Int]]()

var pieces = [(x: Int, y: Int, dir: Int)]()
var stack = Array(repeating: Array(repeating: [Int](), count: n), count: n)

//체스판의 정보
for _ in 0..<n {
	colorInfo.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

//말의 정보
for i in 0..<k {
	let t = readLine()!.split(separator: " ").map{Int(String($0))!}
	let (row,col,dir) = (t[0] - 1,t[1] - 1,t[2])
	stack[row][col].append(i+1)
	pieces.append((x: row, y: col, dir: dir))
}

func debugStack() {
	print("stack")
	for i in 0..<n {
		print(stack[i])
	}
}

// print(pieces)
// debugStack()

func movePieces() -> Bool {
	let dx = [-10,0,0,-1,1]
	let dy = [-10,1,-1,0,0]

	let rDir = [-10,2,1,4,3]

	//1~K번 말의 이동
	for idx in 0..<k {
		let (x,y,dir) = pieces[idx]
		let num = idx + 1

		//print("\(num) 번 말의 이동. 현재좌표는 ",x,y,dir)

		//이동하려는 다음좌표 설명
		let (nx,ny) = (x+dx[dir],y+dy[dir])

		//체스판을 벗어나지 않고, white red 인경우
		if (0..<n).contains(nx) && (0..<n).contains(ny) && (0..<2).contains(colorInfo[nx][ny]){
			//print("red white")
			let targetIdx = stack[x][y].firstIndex(of: num)!

			var target = Array(stack[x][y][targetIdx...])
			if colorInfo[nx][ny] == 1 {
				target = Array(target.reversed())
			}
			stack[nx][ny].append(contentsOf: target)
			if stack[nx][ny].count >= 4 {
				return false
			}
			stack[x][y] = Array(stack[x][y][0..<targetIdx])			//blue

			for i in target {
				//print("\(i)번 말의 이동!")
				(pieces[i-1].x, pieces[i-1].y) = (nx,ny)
			}
			//print("이동후: \(pieces)")
		} 
		//체스판을 벗어나는 경우나 파란색인 경우
		else {
			//print("out, blue")
			//방향을 바꾼다.
			let (bx,by) = (x+dx[rDir[dir]],y+dy[rDir[dir]])
			pieces[idx].dir = rDir[dir]
			//print("bx by",bx,by)
			//뒤로 이동할 칸이 범위 내에 있고 파란색이 아닐때에만 이동!
			if (0..<n).contains(bx) && (0..<n).contains(by) && colorInfo[bx][by] != 2 {
				let targetIdx = stack[x][y].firstIndex(of: num)!
				var target = Array(stack[x][y][targetIdx...])
				//빨간색이면 반전
				if colorInfo[bx][by] == 1 {
					target = Array(target.reversed())
				}
				stack[bx][by].append(contentsOf: target)
				if stack[bx][by].count >= 4 {
					return false
				}
				stack[x][y] = Array(stack[x][y][0..<targetIdx])

				for i in target {
					//print("\(i)번 말의 이동!")
					(pieces[i-1].x, pieces[i-1].y) = (bx,by)
				}
			}
			//print("이동후: \(pieces)")
		}
		//print("이동후 말의 좌표: ",pieces[idx])
	}
	return true
}

var turn = 0

while true {
	turn += 1
	//1000턴보다 크면 종료
	if turn > 1000 {
		print(-1)
		break
	}
	// 말을 이동하고 4개보다 더 쌓였으면 종료
	if !movePieces() {
		print(turn)
		break
	}

	// print("turn: \(turn)")
	// debugStack()
	// for i in 0..<k {
	// 	var str = ""
	// 	let (x,y,dir) = pieces[i]
	// 	if dir == 1 {
	// 		str = "right"
	// 	} else if dir == 2 {
	// 		str = "left"
	// 	} else if dir == 3 {
	// 		str = "up"
	// 	} else {
	// 		str = "down"
	// 	}
	// 	print(i+1," 는 ",x,y,str)
	// }


	//print(pieces)
}