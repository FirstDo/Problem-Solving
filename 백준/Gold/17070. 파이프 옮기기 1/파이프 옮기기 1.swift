import Foundation
//17070번 파이프 옮기기 1
let n = Int(readLine()!)!
var s = [[Int]]()
for _ in 0..<n {
	s.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

var cnt = 0

//0 -> 오른쪽, 대각선 하단
//1 -> 아래, 대각선 하단
// 2 ->

func moveDown(_ x: Int, _ y: Int) -> (Int,Int)? {
	if x+1 < n && s[x+1][y] == 0 {
		return (x+1,y)
	} else {return nil}

}

func crossDown(_ x: Int, _ y: Int) -> (Int,Int)? {
	if x+1 < n && y+1 < n && s[x+1][y] == 0 && s[x][y+1] == 0 && s[x+1][y+1] == 0{
		return (x+1,y+1)
	} else {
		return nil
	}
}
func moveRight(_ x: Int, _ y: Int) -> (Int,Int)? {
	if y+1 < n && s[x][y+1] == 0 {
		return (x,y+1)
	} else {
		return nil
	}
}

func dfs(_ x: Int, _ y: Int, _ dir: Int) {
	if x == n-1 && y == n-1 {
		cnt += 1
		return
	}

	switch dir {
	case 0:
		if let (nx,ny) = moveRight(x,y) { dfs(nx,ny,0)}
		if let (nx,ny) = crossDown(x,y) {dfs(nx,ny,2)}
	case 1:
		if let (nx,ny) = moveDown(x,y) { dfs(nx,ny,1)}
		if let (nx,ny) = crossDown(x,y) {dfs(nx,ny,2)}		
	case 2:
		if let (nx,ny) = moveRight(x,y) { dfs(nx,ny,0)}
		if let (nx,ny) = moveDown(x,y) {dfs(nx,ny,1)}
		if let (nx,ny) = crossDown(x,y) {dfs(nx,ny,2)}
	default:
		break
	}
}

dfs(0,1,0)

print(cnt)