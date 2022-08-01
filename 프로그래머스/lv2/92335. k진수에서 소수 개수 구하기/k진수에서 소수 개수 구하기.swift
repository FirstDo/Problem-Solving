import Foundation

func isPrime(_ num: Int) -> Bool {
    switch num {
    case 0,1:
        return false
    case 2,3:
        return true
    default:
        break
    }
    
    for i in 2...Int(sqrt(Double(num))) {
        if num % i == 0 { return false }
    }
    
    return true
}

func solution(_ n:Int, _ k:Int) -> Int {
    let number = String(n, radix: k, uppercase: true).components(separatedBy: "0").compactMap { num -> Int? in
        if num.isEmpty { return nil }
        return Int(num)
    }

    return number.filter(isPrime(_:)).count
}