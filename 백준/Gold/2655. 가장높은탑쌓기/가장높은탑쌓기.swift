//2655번 가장높은탑쌓기
struct Block {
    let id: Int
    let area: Int
    let height: Int
    let weight: Int
}

let n = Int(readLine()!)!

var blockList = [Block(id: 0, area: 0, height: 0, weight: 0)]

for i in 1...n {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let (area, height, weight) = (input[0], input[1], input[2])
    
    blockList.append(Block(id: i, area: area, height: height, weight: weight))
}

blockList.sort { b1, b2 in
    return b1.weight < b2.weight
}

var dp = Array(repeating: 0, count: n+1)

for i in 1..<n+1 {
    for j in 0..<i {
        if blockList[i].area > blockList[j].area {
            dp[i] = max(dp[i], dp[j] + blockList[i].height)
        }
    }
}

var maxHeight = dp.max()!
var index = dp.firstIndex(of: maxHeight)!

var result = [Int]()

while index != 0 {
    if maxHeight == dp[index] {
        result.append(blockList[index].id)
        maxHeight -= blockList[index].height
    }
    index -= 1
}

print(result.count)
result.reversed().forEach { num in
    print(num)
}

