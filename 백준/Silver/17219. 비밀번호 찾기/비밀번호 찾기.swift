//17219번 비밀번호 찾기

var passwordDict = [String: String]()

let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N,M) = (t[0],t[1])

for _ in 0..<N {
	let t = readLine()!.split(separator: " ").map{String($0)}

	passwordDict[t[0]] = t[1]
}

for _ in 0..<M {
	let t = readLine()!
	print(passwordDict[t]!)
}