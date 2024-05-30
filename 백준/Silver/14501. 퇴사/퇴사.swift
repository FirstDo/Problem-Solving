let n = Int(readLine()!)!

var time = Array(repeating: 0, count: n+1)
var price = Array(repeating: 0, count: n+1)
var dp = Array(repeating: 0, count: n+2)

for i in 1...n {
    let f = readLine()!.split(separator: " ").map{Int(String($0))!}
    time[i] = f[0]
    price[i] = f[1]
}

for i in 2 ... n+1 {
    for j in 1..<i {
        if j + time[j] <= i {
            dp[i] = max(dp[i], dp[j] + price[j])
        }
    }
}

print(dp.max()!)
