//14719번 빗물

var t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (H,W) = (t[0],t[1])

var block = readLine()!.split(separator: " ").map{Int(String($0))!}


if W <= 2 {
	print(0)
} else {
	let len = block.count

	var waterSum = 0

	for i in 1 ..< len - 1 {
		let leftMax = block[0..<i].max()!
		let rightMax = block[(i+1)...].max()!

		let water = min(leftMax,rightMax) - block[i]
		if water > 0 {
			//print("i: \(i) water: \(water)")
			waterSum += water
		}
	}

	print(waterSum)

}