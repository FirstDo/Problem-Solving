let n = Int(readLine()!)!
let k = Int(readLine()!)!

var low = 1, high = n*n
var answer = 0
var a1 = 0, a2 = 0, a3 = 0
//total: k보다작은 수의 개수, mid: k
while low <= high {
    let mid = (low+high)/2
    a1 = low
    a2 = high
    a3 = mid

    var total = 0
    for i in 1...n {
        total += min(mid/i,n)
    }
    if total >= k {
        answer = mid
        high = mid - 1
    } else {
        low = mid + 1
    }
}

print(answer)
