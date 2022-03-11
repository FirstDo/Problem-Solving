//1976번 여행가자

struct Point: Hashable{
	let x: Int
	let y: Int
}

let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n,m) = (t[0],t[1])

var graph = Array(repeating: Array(repeating: Array(repeating: 0, count: 4), count: n), count: m)

//서 - 북 - 동 - 남
let dx = [0,-1,0,1]
let dy = [-1,0,1,0]

for i in 0..<m {
	let t = readLine()!.split(separator: " ").map{Int(String($0))!}
	for j in 0..<n {
		let dirInfo = String(t[j],radix: 2).map{Int(String($0))!}
		let s = 4 - dirInfo.count
		graph[i][j][s..<4] = dirInfo[0...]
		graph[i][j].reverse()
	}
}


var field = 0
//방번호 : 방너비
var roomDict = [Int:Int]()
//방넘버 : 방번호
var roomNumber = [Point:Int]()

func dfs(_ x: Int, _ y: Int, _ area: inout Int, _ roomNum: Int,_ visited: inout [[Bool]]) {
	//기본적으로 4방향 탐색하는데, 벽이 없는 부분을 탐색한다!
	area += 1
	roomNumber[Point(x:x,y:y)] = roomNum

	for i in 0..<4 where graph[x][y][i] == 0{
		let nx = x + dx[i]
		let ny = y + dy[i]
		//범위 안이고(필요 없을듯..?) 방문하지 않은 곳이라면
		if (0..<m).contains(nx) && (0..<n).contains(ny) && !visited[nx][ny] {
			visited[nx][ny] = true
			dfs(nx,ny,&area,roomNum,&visited)
		}
	}
}

var visited = Array(repeating: Array(repeating: false, count: n), count: m)

var num = 1

for i in 0..<m {
	for j in 0..<n {
		if !visited[i][j] {
			field = 0
			visited[i][j] = true
			dfs(i,j,&field,num,&visited)
			roomDict[num] = field
			num += 1
		}
	}
}
//방의 개수
print(roomDict.keys.count)
//가장 넓은 방의 넓이
print(roomDict.values.max()!)
//하나의 벽을 제거하여 얻을 수 있는 가장 넓은 방의 크기
var ans = 0
for i in 0..<m {
	for j in 0..<n {
		let t1 = Point(x: i, y: j)

		//동 남 쪽에 벽이 있는지 확인
		for k in 2...3 where graph[i][j][k] == 1 {
			let (nx,ny) = (i + dx[k], j + dy[k])
			if (0..<m).contains(nx) && (0..<n).contains(ny) {
				let t2 = Point(x: nx, y: ny)
				//두 룸의 번호가 다르면
				if let r1 = roomNumber[t1], let r2 = roomNumber[t2], r1 != r2 {
					ans = max(ans, roomDict[r1]! + roomDict[r2]!)
				}
			}
		}
	}
}

print(ans)



