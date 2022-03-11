import Foundation
//1037번 약수
let n = Int(readLine()!)!
var ans = 0
for i in 1...n {
	ans += (n/i) * i
}
print(ans)