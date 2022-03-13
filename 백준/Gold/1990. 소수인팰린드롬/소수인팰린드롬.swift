/*
 1990번 소수인팰린드롬
 1트 에라토스테네스의 체를 이용한 후, 팰린드롬수를 구하면 시간초과
 2트 팰린드롬수인지 판별한 후, 소수인지 판별하면 시간초과.. ㅡㅡ
 3트 팰린드롬수를 구한후, 소수인지 판별하면?
 */

import Foundation

let ab = readLine()!.split(separator: " ").map{Int(String($0))!}
let (a,b) = (ab[0], ab[1])


func palindrome() -> [Int] {
    var tempList: [String] = ["2","3","5","7","11"]
    for i in 10...10000 {
        let str = String(i)
        let p1 = str + str.reversed()
        let p2 = str + str.dropLast().reversed()
        
        tempList.append(contentsOf: [p1,p2])
    }
    
    return tempList.compactMap {Int($0)}.filter{ (a...b) ~= $0 }
}

func isPrime(number: Int) -> Bool {
    if number <= 3 {
        return number == 1 ? false : true
    }
    
    let limit = Int(sqrt(Double(number)))
    
    for i in 2...limit {
        if number % i == 0 { return false }
    }
    
    return true
}

let palinList = palindrome()

var answer = ""

for number in palinList where isPrime(number: number){
    answer += "\(number)\n"
}

answer += "-1"
print(answer)