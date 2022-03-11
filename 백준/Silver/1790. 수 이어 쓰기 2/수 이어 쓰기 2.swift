//1790번 수 이어 쓰기2

let nk = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nk[0]
var k = nk[1]

var ans = 0
var digit = 1
var number = 9

//1의 자리 9개, 2의 자리 90개 .. 가능할때까지 계속뺀다
while k > digit * number {
    k -= digit * number
    ans += number
    digit += 1
    number *= 10
}

ans = ans + 1 + (k-1)/digit

if ans > n {
    print(-1)
} else {
    let idx = (k-1)%digit
    let str = String(ans)
    print(str[str.index(str.startIndex, offsetBy: idx)])
}
