import Foundation
//13023번 ABCDE
let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n,m) = (t[0],t[1])

var arr = Array(repeating: [Int](), count: n)

for _ in 0..<m {
	let t = readLine()!.split(separator: " ").map{Int(String($0))!}
	let (a,b) = (t[0],t[1])
	arr[a].append(b)
	arr[b].append(a)
}

var visit = Array(repeating: false, count: n)

var ans = 0

func dfs(_ x: Int, _ depth: Int) {
	if depth == 4 {
		ans = 1
		return
	}

	for nx in arr[x] {
		if !visit[nx] {
			visit[nx] = true
			dfs(nx,depth+1)
			visit[nx] = false
		}
	}
}

visit[0] = true

for i in 0..<n {
	visit = Array(repeating: false, count: n)
	visit[i] = true
	dfs(i,0)
	if ans == 1 {
		break
	}
}
print(ans)