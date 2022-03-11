import Foundation
//20291번 파일 정리

let n = Int(readLine()!)!

var file = [String: Int]()

for _ in 0..<n {
	let f = readLine()!.split(separator: ".").map{String($0)}
	
	if let value = file[f[1]] {
		file[f[1]] = value + 1
	} else {
		file[f[1]] = 1
	}
}


for (key,value) in file.sorted(by: {$0.key < $1.key}) {
	print(key,value)
}