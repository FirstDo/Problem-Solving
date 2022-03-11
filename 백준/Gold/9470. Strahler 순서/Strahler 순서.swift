import Foundation
//9470번 Strahler 순서: 토플로지 sort?

let T = Int(readLine()!)!

for _ in 0..<T {
	let t = readLine()!.split(separator: " ").map{Int(String($0))!}
	let (K,M,P) = (t[0],t[1],t[2])

	var indegree = Array(repeating: 0, count: M+1)
	var graph = Array(repeating: [Int](), count: M+1)
	var order = Array(repeating: 0, count: M+1)
	var parents = Array(repeating: [Int](), count: M+1)

	//입력받기
	for _ in 0..<P {
		let t = readLine()!.split(separator: " ").map{Int(String($0))!}
		let (A,B) = (t[0],t[1])
		indegree[B] += 1
		graph[A].append(B)
	}
	var queue = [Int]()
	for (i,value) in indegree[1...].enumerated() {
		if value == 0 {
			queue.append(i+1)
			order[i+1] = 1
		}
	}
	var idx = 0
	while queue.count > idx {
		let cur = queue[idx]
		idx += 1

		for next in graph[cur] {
			indegree[next] -= 1
			parents[next].append(order[cur])
			if indegree[next] == 0 {
				parents[next].sort(by: >)

				if parents[next].count == 1 {
					order[next] = parents[next][0]
				} else {
					let p1 = parents[next][0]
					let p2 = parents[next][1]
					if p1 == p2 {
						order[next] = p1 + 1
					} else {
						order[next] = p1
					}
				}
				queue.append(next)
			}
		}
	}
	print(K, order[M])
}