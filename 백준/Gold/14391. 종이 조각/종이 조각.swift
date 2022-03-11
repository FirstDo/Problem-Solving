//14391번 종이조각
let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N,M) = (t[0],t[1])

var arr = [[Int]]()

for _ in 0..<N {
	let t = Array(readLine()!).map{Int(String($0))!}
	arr.append(t)
}

var ans = 0

//가로종이일 경우 1, 세로종이일 경우 0 값을 가진다고 하자

func dfs() {
    //n*m 배열이 가질 수 있는 모든 경우의 수는 2^(n*m)..
	for i in 0..<(1 << (N*M)) {
		var total = 0
        //가로인 경우를 계산
		for row in 0..<N {
			var rowSum = 0
			for col in 0..<M {
				let idx = row * M + col

				if i & (1 << idx) != 0 {
					rowSum = rowSum * 10 + arr[row][col]
				} else {
					total += rowSum
					rowSum = 0
				}
			}
			total += rowSum
		}

        //세로인 경우를 계산
		for col in 0..<M {
			var colSum = 0
			for row in 0..<N {
				let idx = row * M + col
				if i & (1 << idx) == 0 {
					colSum = colSum * 10 + arr[row][col]
				} else {
					total += colSum
					colSum = 0
				}
			}
			total += colSum
		}
		ans = max(ans,total)
	}
}

dfs()
print(ans)