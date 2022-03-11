//11657번 타임머신

let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N,M) = (t[0],t[1])

let INF = 9876543210

var edges = [(Int,Int,Int)]()
var dist = Array(repeating: INF, count: N+1)

for _ in 0..<M {
	let t = readLine()!.split(separator: " ").map{Int(String($0))!}
	let (a,b,c) = (t[0],t[1],t[2])
	edges.append((a,b,c))
}

func bellmanFord(_ start: Int) -> Bool{
	dist[start] = 0
	for i in 0..<N {
		for j in 0..<M {
			let (node, nxNode, cost) = edges[j]

			if dist[node] != INF && dist[nxNode] > dist[node] + cost {
				dist[nxNode] = dist[node] + cost

				if i == N-1 {
					return true
				}
			}
		}
	}
	return false
}

if bellmanFord(1) {
	print(-1)
} else {
	for i in 2...N {
		if dist[i] == INF {
			print(-1)
		} else {
			print(dist[i])
		}
	}
}