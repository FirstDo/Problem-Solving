import Foundation
//12886번 돌 그룹

let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (a,b,c) = (t[0],t[1],t[2])
let s = a+b+c

var answer = 0
var visited = Array(repeating: Array(repeating: false, count: 1501), count: 1501)

func dfs(_ a: Int, _ b: Int, _ c: Int) {
	if visited[a][b] { return }
	visited[a][b] = true

	if a == b && b == c {
		answer = 1
		return
	}
	var list = [a,b,c]
	for i in 0..<3 {
		for j in 0..<3 {
			if list[i] > list[j] {
				dfs(list[i]-list[j], list[j] * 2, s - list[i] - list[j])
			}
		}
	}
}

dfs(a,b,c)
print(answer)