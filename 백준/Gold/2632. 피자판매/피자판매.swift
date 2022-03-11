//2632번 피자판매

let target = Int(readLine()!)!

let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (m,n) = (t[0],t[1])

var pizzaA = Array(repeating: 0, count: m)
var pizzaB = Array(repeating: 0, count: n)

var dpA = Array(repeating: 0, count: target + 1)
var dpB = Array(repeating: 0, count: target + 1)

for i in 0..<m {
	let t = Int(readLine()!)!
	if t <= target {
		dpA[t] += 1
	}
	pizzaA[i] = t
}
pizzaA += pizzaA

for i in 0..<n {
	let t = Int(readLine()!)!
	if t <= target {
		dpB[t] += 1
	}
	pizzaB[i] = t
}
pizzaB += pizzaB

//A조각들 + B조각들 = target을 하자!

//dp[i]: 피자조각 i를 만들수 있는 개수의 수

//caseA 2개 ~ m-1개
for len in 2..<m {
	for i in 0..<m {
		let t = pizzaA[i ..< i+len].reduce(0,+)
		if t <= target {
			dpA[t] += 1
		}
	}
}

let a = pizzaA.reduce(0,+) / 2
if a <= target {
	dpA[a] += 1
}


//caseB 2개 ~ n-1개
for len in 2..<n {
	for i in 0..<n {
		let t = pizzaB[i ..< i+len].reduce(0,+)
		if t <= target {
			dpB[t] += 1
		}
	}
}

let b = pizzaB.reduce(0,+) / 2
if b <= target {
	dpB[b] += 1
}

dpA[0] = 1
dpB[0] = 1

// print(pizzaA)
// print(pizzaB)

// print(dpA)
// print(dpB)

var ans = (0...target).map{dpA[$0] * dpB[target-$0]}.reduce(0,+)
print(ans)

// for i in 0...target {
// 	print(i)
// 	print(dpA[i])
// 	print(dpB[target-i])
// 	print()
// }