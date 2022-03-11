//1976번 여행가자

let n = Int(readLine()!)!
let m = Int(readLine()!)!

var parent = Array(repeating: 0, count: n+1)

for i in 1...n {
	parent[i] = i
}

func findParent(_ x: Int) -> Int {
	if parent[x] != x {
		parent[x] = findParent(parent[x])
	}
	return parent[x]
}

func unionParent(_ a: Int, _ b: Int) {
	var (a,b) = (a,b)
	(a,b) = (findParent(a), findParent(b))

	if a >= b {
		parent[a] = b
	} else {
		parent[b] = a
	}
}

for i in 1...n {
	let t = readLine()!.split(separator: " ").map{Int(String($0))!}
	
	for j in 1...n where t[j-1] == 1{
		if findParent(i) != findParent(j) {
			//print("i: \(i) j: \(j) union")
			unionParent(i,j)
			//print("parent: \(parent)")
		}
	}
}

let p = readLine()!.split(separator: " ").map{Int(String($0))!}.map{parent[$0]}

if p.count == ( p.filter{$0 == p[0]}.count ){
	print("YES")
} else {
	print("NO")
}

