let inputs: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}
let n: Int = inputs[0]
let m: Int = inputs[1]
// n>=3 이여야 상하 이동이 가능함. n>=3, m>=7이야 모두 한번씩 이동할 수 있음
// 생각해보면, 세로높이는 큰 의미가 없다는것을 알 수 있음. 위아래로는 복구가 가능하지만, 어떤경우에도
// 나이트는 무조건 오른쪽으로 이동한다.
var count: Int = 0
if n>=3, m>=7 {
    count = (m - 2)
    print(count)
}else if n<=1 || m<=1 {
    print(1)
} else if n>=3 {
    count = m >= 5 ? 4 : m
    print(count)
} else {
    count = m >= 7 ? 4 : (m+1)/2
    print(count)
}

//상하 이동하려면 n>=3 이어야 한다

