//13549번 숨박꼭질3
let len = 100000
let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N,K) = (t[0],t[1])

var pathDict = [Int:Int]()

func bfs() {
	var queue = [(N,0)]
	var idx = 0

	var visited = Array(repeating: false, count: len+1)

	while queue.count > idx {
		let (now,time) = queue[idx]
		idx += 1

		if now == K {
			print(time)
			var ans = [Int]()
			var node = K
			while true {
				ans.append(node)
				if node == N {break}
				node = pathDict[node]!
			}
			
			let temp = ans.reversed().map{String($0)}.joined(separator: " ")
			print(temp)

			return
		}
		for next in [now-1,now+1,now*2] {
			if (0...len).contains(next) && !visited[next] {
				visited[next] = true
				queue.append((next,time+1))
				pathDict[next] = now
			}
		}
	}
}

bfs()