//1700번 멀티탭 스케줄링
var t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N,K) = (t[0],t[1])

var sequence = readLine()!.split(separator: " ").map{Int(String($0))!}
var devices = Set(sequence)
var multiTap = Set<Int>()
var cnt = 0

for i in 0..<K {
	//print("case: \(sequence[i])")
	//print("multiTap: \(multiTap)")
	//멀티탭에 이미 꽃혀있다면..
	if multiTap.contains(sequence[i]) {
		continue
	}
	//멀티탭에 여유 공간이 있다면..
	if multiTap.count < N {
		multiTap.insert(sequence[i])
		continue
	}
	//멀티탭에 자리가 없을경우 가장 늦게쓸 (혹은 안쓸 기기를 제거해야한다!)
	//1. 안쓸기기를 제거하자..
	let remainDevice = Array(sequence[(i+1)...])
	let remainSet = Set(remainDevice)

	let unusedDevice = devices.subtracting(remainSet)

	let targetSet = unusedDevice.intersection(multiTap)
	if let target = targetSet.first {
		//print("안쓸 target: \(target)")
		multiTap.remove(target)
		multiTap.insert(sequence[i])
		cnt += 1
		continue
	}

	//2. 가장 늦게 쓸 기기를 제거하자
	//print("가장 늦게 쓸 기기 제거")

	var temp = Array(repeating: 100, count: 100)

	for i in 0..<remainDevice.count {
		let d = remainDevice[i]
		if temp[d] == 100 {
			temp[d] = i
		}
	}

	let arr = multiTap.sorted {
		temp[$0] > temp[$1]
	}
	//가장 늦게 쓸 기기..
	let target = arr[0]
	multiTap.remove(target)
	multiTap.insert(sequence[i])
	cnt += 1

}

print(cnt)


