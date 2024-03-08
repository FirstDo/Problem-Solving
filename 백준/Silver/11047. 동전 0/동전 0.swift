let inputs: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}
let n: Int = inputs[0]
var k: Int = inputs[1]
var coins: [Int] = []
var cnt: Int = 0

for _ in 0..<n {
    coins.append(Int(readLine()!)!)
}

for coin in coins.reversed() {
    cnt += k/coin
    k %= coin
}
print(cnt)

