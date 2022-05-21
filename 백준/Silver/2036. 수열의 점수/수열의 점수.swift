// 2036번 수열의 점수

func multiSum(_ arr: inout [Int]) {
    while !arr.isEmpty {
        let num1 = arr.removeLast()
        let num2 = arr.removeLast()
        
        answer += num1 * num2
    }
}

func inputData() {
    for _ in 0..<n {
        let number = Int(readLine()!)!
        
        switch number {
        case 0:
            zero = true
        case 1:
            one += 1
        case 2...:
            plus.append(number)
        default:
            minus.append(number)
        }
    }
}

// MARK: - 문제풀이

let n = Int(readLine()!)!

var minus = [Int]()
var plus = [Int]()
var one = 0
var zero = false
var answer = 0

// 입력
inputData()

// 정렬
minus.sort(by: >)
plus.sort(by: <)

// plus, minus 를 2의 배수로 맞춰줌
if plus.count % 2 != 0 {
    plus.insert(1, at: 0)
}

if minus.count % 2 != 0 {
    let number = minus.removeFirst()
    answer += zero ? 0 : number
}

// 합을 더해줌
multiSum(&plus)
multiSum(&minus)

print(answer + one)
