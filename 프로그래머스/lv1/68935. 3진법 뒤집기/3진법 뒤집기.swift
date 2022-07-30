import Foundation

func solution(_ n:Int) -> Int {
    let number3 = String(String(n, radix: 3, uppercase: true).reversed())
    return Int(number3, radix: 3)!
}