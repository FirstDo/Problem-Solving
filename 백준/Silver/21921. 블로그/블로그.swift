//1025번 제곱수 찾기
let t = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n,x) = (t[0],t[1])

let visitor = readLine()!.split(separator: " ").map{Int(String($0))!}

var start = 0, end = x - 1
var sum = visitor[start...end].reduce(0, +)

var cnt = 0
var maxmiumVisitor = 0

while true {
    if maxmiumVisitor < sum {
        maxmiumVisitor = sum
        cnt = 1
    } else if maxmiumVisitor == sum {
        cnt += 1
    }
    
    start += 1
    end += 1
    if end >= n {break}
    
    sum -= visitor[start-1]
    sum += visitor[end]
    
    
}

if maxmiumVisitor == 0 {
    print("SAD")
} else {
    print(maxmiumVisitor)
    print(cnt)
}


