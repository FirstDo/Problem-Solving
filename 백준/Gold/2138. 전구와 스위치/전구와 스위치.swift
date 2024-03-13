//2138번 전구와 스위치

let n = Int(readLine()!)!
var start = Array(readLine()!)
let end = Array(readLine()!)
var cnt = 0

func toogleSwitch(_ arr: inout [Character], _ idx: Int) {
    if arr[idx] == "0" {
        arr[idx] = "1"
    } else {
        arr[idx] = "0"
    }
}

func isPossible(_ arr: [Character]) -> Bool{
    var temp = arr
    for i in 1..<n {
        //switch 클릭하기
        if temp[i-1] != end[i-1] {
            cnt += 1
            toogleSwitch(&temp, i-1)
            toogleSwitch(&temp, i)
            if i+1 < n {
                toogleSwitch(&temp, i+1)
            }
        }
    }
    return temp == end
}
//1번 스위치를 누르지 않은경우
if isPossible(start) {
    print(cnt)
} else {
    //1번 스위치를 누른 경우
    cnt = 1
    toogleSwitch(&start, 0)
    toogleSwitch(&start, 1)
    if isPossible(start) {
        print(cnt)
    } else {
        print(-1)
    }
}
