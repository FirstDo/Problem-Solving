import Foundation

private func isPrime(_ n: Int) -> Bool {
    switch n {
    case 0, 1: return false
    case 2, 3: return true
    default: break
    }
    
    for i in 2...Int(sqrt(Double(n))) {
        if n % i == 0 { return false }
    }
    
    return true
}

func solution(_ n:Int, _ k:Int) -> Int {
    return String(n, radix: k)
        .components(separatedBy: "0")
        .compactMap { Int($0) }
        .filter(isPrime)
        .count
}