let t = Int(readLine()!)!
let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
let m = Int(readLine()!)!
let brr = readLine()!.split(separator: " ").map{Int(String($0))!}


var arrDic = [Int:Int]()
var brrDic = [Int:Int]()

for i in 0..<n {
    for j in i+1..<n+1 {
        let cnt = arr[i..<j].reduce(0,+)
        if arrDic[cnt] != nil {
            arrDic[cnt] = arrDic[cnt]!+1
        } else {
            arrDic[cnt] = 1
        }
    }
}

for i in 0..<m {
    for j in i+1..<m+1 {
        let cnt = brr[i..<j].reduce(0,+)
        if brrDic[cnt] != nil {
            brrDic[cnt] = brrDic[cnt]!+1
        } else {
            brrDic[cnt] = 1
        }
    }
}


var ans = 0
for i in arrDic.keys {
    if brrDic[t-i] != nil {
        ans += brrDic[t-i]! * arrDic[i]!
    }
}

print(ans)