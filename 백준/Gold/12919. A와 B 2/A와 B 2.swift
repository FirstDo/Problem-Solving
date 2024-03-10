let s = readLine()!
let t = readLine()!

/*
1. 문자열 뒤에 A를 추가한다
2. 문자열의 뒤에 B를 추가하고 문자열을 뒤집는다.
*/
var ans = 0

func backTracking(_ str: String) {
	if s.count == str.count {
		if s == str {
			ans = 1
		}
		return
	}

	if str.first! == "B" {
		var tempStr = String(str.reversed())
		tempStr.removeLast()
		backTracking(tempStr)
	}

	if str.last! == "A" {
		var tempStr = str
		tempStr.removeLast()
		backTracking(tempStr)
	}
}

backTracking(t)
print(ans)