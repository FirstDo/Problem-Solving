import Foundation
//16472번 고냥이
let n = Int(readLine()!)!
let str = Array(readLine()!)
let len = str.count
var dict : [Character: Int] = [:]

var cnt = 0

var start = 0, end = 0
var ans = 0

dict[str[0]] = 1

if n >= len {
	print(len)
} else {
	//two pointer
	while start <= end {
		if dict.count > n {
			let value = dict[str[start]]!
			dict[str[start]] = value == 1 ? nil : value - 1
			start += 1
		} else {
			ans = max(ans,end-start+1)
			end += 1
			if end == len { break }

			if let value = dict[str[end]] {
				dict[str[end]] = value + 1
			} else {
				dict[str[end]] = 1
			}
		}
	}
}

print(ans)