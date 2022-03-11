import Foundation

var add = [1,7,4,2,0,8]
var dp = Array(repeating: Int.max, count: 101)
dp[2...10] = [1,7,4,2,6,8,10,18,22]

for i in 9...100 {
    for j in 2...7 {
        let num = dp[i-j] * 10 + add[j-2]
        dp[i] = min(dp[i],num)
    }
}

func getMin(_ n: Int) -> Int {
    return dp[n]
}

func getMax(_ n: Int) -> String {
    
    var temp = ""
    
    if n % 2 == 0 {
        temp = String(repeating: "1", count: n/2)
    } else {
        temp = "7" + String(repeating: "1", count: (n-3)/2)
    }
    
    return temp
}

let t = Int(readLine()!)!

for _ in 0..<t {
    let n = Int(readLine()!)!
    
    print(getMin(n))
    print(getMax(n))
}
