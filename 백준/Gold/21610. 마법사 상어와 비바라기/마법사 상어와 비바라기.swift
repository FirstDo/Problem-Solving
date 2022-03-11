import Foundation
//백준 21610번: 마법사 상어와 비바라기

//input
var t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n,m) = (t[0],t[1])

var graph = [[Int]]()

for _ in 0..<n {
	graph.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}


//최초 구름 생성
var clouds = [(n-1,0), (n-1,1),(n-2,0),(n-2,1)]

//구름이동함수
func moveCloud(_ dx: Int, _ dy: Int) {
	for i in 0..<clouds.count {
		let (x,y) = (clouds[i].0, clouds[i].1)
		var (nx,ny) = ( (x+dx)%n, (y+dy)%n)

		nx = nx >= 0 ? nx : n+nx
		ny = ny >= 0 ? ny : n+ny
		
		clouds[i] = (nx,ny)
	}
}

//물뿌리기 함수
func rainy() {
	for cloud in clouds {
		let (x,y) = (cloud.0, cloud.1)
		graph[x][y] += 1
	}

	for cloud in clouds {
		let (x,y) = (cloud.0, cloud.1)
		//대각선 개수 판단
		let diagonal = [(x-1,y-1), (x-1,y+1), (x+1,y-1), (x+1,y+1)]

		graph[x][y] += diagonal.filter{
			(0..<n).contains($0.0) && (0..<n).contains($0.1) && graph[$0.0][$0.1] >= 1
		}.count
	}
}

func makeCloud() {
	var cloudExist = Array(repeating: Array(repeating: false, count: n), count: n)
	clouds.forEach{
		cloudExist[$0.0][$0.1] = true
	}

	clouds.removeAll()

	for i in 0..<n {
		for j in 0..<n {
			if graph[i][j] >= 2 && !cloudExist[i][j]{
				graph[i][j] -= 2
				clouds.append((i,j))
			}
		}
	}
}

let dirX = [0,0,-1,-1,-1,0,1,1,1]
let dirY = [0,-1,-1,0,1,1,1,0,-1]

for _ in 0..<m {
	t = readLine()!.split(separator: " ").map{Int(String($0))!}
	//이동정보 d, s
	let (d,s) = (t[0],t[1])
	//구름이 이동 좌표의 거리
	let (dx,dy) = (dirX[d] * s, dirY[d] * s)
	//구름의 이동
	moveCloud(dx,dy)
	//물뿌리기 함수
	rainy()
	//구름만들기 함수
	makeCloud()

}

print(graph.flatMap{$0}.reduce(0,+))