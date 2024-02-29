import Foundation
//15611번 링크와 스타드
let n = Int(readLine()!)!

var ans = Int.max
var arr = [[Int]]()
var visit = Array(repeating: false, count: n)

func getSum(_ list : [Int]) -> Int {
	let len = list.count
	var sum = 0
	for i in 0..<len {
		for j in 0..<len {
			sum += arr[list[i]][list[j]]
		}
	}
	return sum
}

func combi(_ idx: Int, _ depth: Int, _ limit: Int) {
	if limit == depth {
		var teamA = [Int]()
		var teamB = [Int]()

		for (i,value) in visit.enumerated() {
			if value {
				teamA.append(i)
			} else {
				teamB.append(i)
			}
		}

		let a = getSum(teamA)
		let b = getSum(teamB)
		ans = min(ans,abs(a-b))
		return
	}

	for i in idx..<n {
		if !visit[i] {
			visit[i] = true
			combi(i+1,depth+1,limit)
			visit[i] = false
		}
	}
}


for _ in 0..<n {
	arr.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

for i in 1..<(n/2+1) {
	visit = Array(repeating: false, count: n)
	ans = Int.max
	combi(0,0,i)

	if ans == 0 { break }
}
print(ans)