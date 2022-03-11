import Foundation
//10159번 저울


let N = Int(readLine()!)!
let M = Int(readLine()!)!

var arr = Array(repeating: Array(repeating: false, count: N+1), count: N+1)

for _ in 0..<M {
	let t = readLine()!.split(separator: " ").map{Int(String($0))!}
	let (a,b) = (t[0],t[1])
	arr[a][b] = true
}

for k in 1...N {
	for i in 1...N {
		for j in 1...N {
			if arr[i][k] && arr[k][j] {
				arr[i][j] = true
			}
		} 
	}
}


for i in 1...N {
	var cnt = -1
	for j in 1...N {
		if !arr[i][j] && !arr[j][i] {
			cnt += 1
		}
	}
	print(cnt)
}