import Foundation
//12869번 뮤탈리스크

let n = Int(readLine()!)!
var scv = Array(repeating: 0, count: 3)
let t = readLine()!.split(separator: " ").map{Int(String($0))!}
for i in 0..<t.count {
	scv[i] = t[i]
}

let INF = 987654321

var dp = Array(repeating: Array(repeating: Array(repeating: INF, count: 61), count: 61), count: 61)

func dfs(_ x: Int, _ y: Int, _ z: Int) -> Int{
	if x < 0 {return dfs(0,y,z)}
	if y < 0 {return dfs(x,0,z)}
	if z < 0 {return dfs(x,y,0)}

	if dp[x][y][z] != INF {return dp[x][y][z]}
	if x == 0 && y == 0 && z == 0 {return 0}

	dp[x][y][z] = min(dp[x][y][z], dfs(x-9,y-3,z-1) + 1)
	dp[x][y][z] = min(dp[x][y][z], dfs(x-9,y-1,z-3) + 1)
	dp[x][y][z] = min(dp[x][y][z], dfs(x-3,y-9,z-1) + 1)
	dp[x][y][z] = min(dp[x][y][z], dfs(x-1,y-9,z-3) + 1)
	dp[x][y][z] = min(dp[x][y][z], dfs(x-1,y-3,z-9) + 1)
	dp[x][y][z] = min(dp[x][y][z], dfs(x-3,y-1,z-9) + 1)

	return dp[x][y][z]
}

print(dfs(scv[0],scv[1],scv[2]))