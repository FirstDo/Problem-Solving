let n = Int(readLine()!)!

var ans = 0
var len = 1
var start = 1

while start <= n {
	var end = start * 10 - 1

	if (end > n) {
		end = n
	}
	ans += (end-start+1) * len

	len += 1
	start *= 10
}

print(ans)