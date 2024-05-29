let n = Int(readLine()!)!
var dicAlpha: [Character:Int] = [:]
let alphaList = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

for alpha in alphaList {
    dicAlpha[alpha] = 0
}

for _ in 0..<n {
    let line = Array(readLine()!)
    var decimal = 1
    for l in line.reversed() {
        var temp = dicAlpha[l]!
        temp += decimal
        dicAlpha[l] = temp
        decimal *= 10
    }
}

var resultDic : [Int] = dicAlpha.values.filter {$0 > 0}
resultDic.sort{$0 > $1}

var cnt = 9
var ans = 0
for i in resultDic {
    ans += i*cnt
    cnt -= 1
}
print(ans)
