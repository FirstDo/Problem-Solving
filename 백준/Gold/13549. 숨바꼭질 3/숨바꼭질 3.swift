//13549번 숨박꼭질3
let len = 100001
let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N,K) = (t[0],t[1])

var ans = Int.max

func bfs() {
	var time = Array(repeating: -1, count: len+1)
	time[N] = 0
	var queue = [N]
	var idx = 0

	while queue.count > idx {
		let now = queue[idx]
		idx += 1

		if time[now] >= ans {continue}

		if now == K {
			ans = min(ans,time[now])
			continue
		}
		for next in [now-1,now+1] {
			if (0...len).contains(next) {
				if time[next] == -1 {
					time[next] = time[now] + 1
					queue.append(next)
				} else if time[next] > time[now] + 1 {
					time[next] = time[now] + 1
					queue.append(next)
				}
			}
		}

		for next in [now*2] {
			if (0...len).contains(next) {
				if time[next] == -1 {
					time[next] = time[now]
					queue.append(next)
				} else if time[next] > time[now] {
					time[next] = time[now]
					queue.append(next)
				}
			}			
		}
	}
}

bfs()
print(ans)