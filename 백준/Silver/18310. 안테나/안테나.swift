//18310번 안테나
import Foundation
let n = Int(readLine()!)!
let house = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted()

var l = 0, r = 0

house[1...].forEach{
	r += $0 - house[0]
}

var idx = 0
var res = r

for i in 1..<n {
	let diff = house[i] - house[i-1]

	l += i * diff
	r -= (n-i) * diff

	if res > (l+r) {
		res = l + r
		idx = i
	}
}

print(house[idx])