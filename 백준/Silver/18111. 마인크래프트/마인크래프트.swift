//18111번 마인크래프트

let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N,M,B) = (t[0],t[1],t[2])

var graph = [[Int]]()

for _ in 0..<N {
	let t = readLine()!.split(separator: " ").map{Int(String($0))!}
	graph.append(t)
}

let flatGraph = graph.flatMap{$0}

var low = flatGraph.min()!
var high = flatGraph.max()!

var ans = 0
var time = Int.max

for height in low...high {
	var subTime = 0
	var block = B

	flatGraph.forEach {
		let diff = height - $0
		//블록 추가
		if diff > 0 {
			block -= diff
			subTime += (diff)
		} 
		//블록 깍아내기
		else {
			block += (diff) * -1
			subTime += (diff) * -2
		}
	}
	
	if block >= 0 {
		if subTime <= time {
			ans = height
			time = subTime
		}
	}
}
print(time,ans)