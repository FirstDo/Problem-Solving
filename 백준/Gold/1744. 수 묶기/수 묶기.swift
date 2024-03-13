let n: Int = Int(readLine()!)!


var arrPlus: [Int] = []
var arrMinus: [Int] = []
var isZero: Bool = false
var total: Int = 0

/*
 풀이전략:
 1. 1보다큰 양수의 배열: 서로 곱하고 남은수 더해줌
 2. 0보다 작은 양수의 배열: 서로 곱하고 남은수 더해줌
 3. 1인경우: 무조건 total에 더해준다
 4. 0인경우: 아무것도 하지않는다. 다만 음수가 하나 남는다면 곱해준다
 */

for _ in 0..<n {
    let num: Int = Int(readLine()!)!
    if num > 1 {
        arrPlus.append(num)
    } else if num < 0 {
        arrMinus.append(num)
    } else if num == 1 {
        total += 1
    } else {
        isZero = true
    }
}
//만약 양수배열이 홀수개면 1을 추가하여 짝수개로 맞춰준다
if arrPlus.count % 2 != 0 {
    arrPlus.append(1)
}

arrPlus.sort()

arrMinus.sort(by: >)
//음수배열이 홀수개이고
if arrMinus.count % 2 != 0 {
    //0 이 존재한다면
    if isZero {
        arrMinus.removeFirst()
    } else {
        total += arrMinus.removeFirst()
    }
}

//두 배열 모두 짝수개로 맞춰지게된다.

while !arrPlus.isEmpty {
    if let a = arrPlus.popLast(), let b = arrPlus.popLast() {
        total += a*b
    }
}

while !arrMinus.isEmpty {
    if let a = arrMinus.popLast(), let b = arrMinus.popLast() {
        total += a*b
    }
}
print(total)






