//1302번 베스트셀러
import Foundation
let n = Int(readLine()!)!
var bookDB = [String:Int]()

for _ in 0..<n {
	let book = readLine()!
	if let value = bookDB[book] {
		bookDB[book] = value + 1
	} else {
		bookDB[book] = 1
	}
}

let ans = bookDB.sorted{ 
	if $0.1 == $1.1 {
		return $0.0 < $1.0
	} else {
		return $0.1 > $1.1
	}
}.first!.key

print(ans)